#!/usr/bin/env perl
undef $/;

$prog = <>;
$prog =~ s/\n /;/g;

$/=chr(10);

# Normalizing offsets

$prog =~ s/,;/,0;/g;

# Removing word alignment artifacts

$prog =~ s/; *:/;/g;

# Recognizing "convert to Boolean" sequences (before normalizing labels)
# Does not work correctly in case of AND/OR of Boolean expressions
# $prog =~ s@,UZA,([^;]+);,XTA,0;,UJ,([^;]+);\1:1,XTA,8;\2:@isUZACond;@g;
# $prog =~ s@,U1A,([^;]+);,XTA,0;,UJ,([^;]+);\1:1,XTA,8;\2:@isU1ACond;@g;
# $prog =~ s@,UZA,([^;]+);1,XTA,8;,UJ,([^;]+);\1:,XTA,0;\2:@isU1ACond;@g;
# $prog =~ s@,U1A,([^;]+);1,XTA,8;,UJ,([^;]+);\1:,XTA,0;\2:@isUZACond;@g;


# Normalizing references to addresses of globals

$prog =~ s@;1,UTC,0;(\d+),VTM,(\d+)@;1,UTC,\2;\1,VTM,0@g;
$prog =~ s@;,UTC,(\d+);1,(...),0@;1,\2,\1@g;

# Converting global variables addressed via index register 1
# avoiding register-register intructions.

$prog =~ s@([:;])1,([^M][^M][^M]),(\d+)@\1,\2,gl\3z@g;

# Normalizing again

$prog =~ s@;,UTC,([^;]+);(\d+),VTM,0@;\2,VTM,\1@g;

# Normalising labels

$prog =~ s/;([^:']+:)/;\1,BSS,;/g;

# Now BSS is the only case with no "offset"

# Recognizing subroutines

if (open(ROUTINES, "routines.txt")) {
    while (<ROUTINES>) {
        chop;
        my ($offset, $name, $rt) = split;
        $routines{$offset} = $name;
        $rtype{$offset} = $rt;
    }
    close(ROUTINES);
} else {
    print STDERR "File routines.txt not found, no labels will be replaced\n";
}

# Dropping frame restoration calls after scope-crossing

$prog =~ s@;14,VJM,P/\d\d;@;@g;
$prog =~ s@;11,MTJ,\d;@;@g;

sub noargs {
    my ($off, $l, $n) = @_;
    $knargs{$off} = 0;
return $n==1 ? 
    "==========;L$off: Level $l procedure with 0 arguments and 0 locals;" :
    $rtype{$off} eq 'f' ? "==========;L$off: Level $l function with 0 arguments and ".($n-2)." locals;" :
    $rtype{$off} eq 'p' ? "==========;L$off: Level $l procedure with 0 arguments and ".($n-1)." locals;" :
    "==========;L$off: Level $l procedure with 0 arguments and ".($n-1)." (or a func with ".($n-2).") locals;";
}

sub manyargs {
    my ($off, $l, $n,$m) = @_;
    $knargs{$off} = $rtype{$off} eq 'f' ? $n-4 : $n-3;
return
    $rtype{$off} eq 'f' ? "==========;L$off: Level $l function with ".($n-4)." arguments and ".($m-$n+2)." locals;" :
    $rtype{$off} eq 'p' ? "==========;L$off: Level $l procedure with ".($n-3)." arguments and ".($m-$n+2)." locals;" :
    "==========;L$off: Level $l procedure with ".($n-3)." (or a func with ".($n-4).") arguments and ".($m-$n+2)." locals;";   
}

sub rec1arg {
    $knargs{$_[0]} = 1;
    return '';
}

$prog =~ s@,ITS,11;15,UTM,-(\d+);,NTR,3;15,MTJ,11;15,MTJ,(\d);,ITS,14;,ITS,.;11,ATX,2;15,UTM,(\d+)@15,ATX,0;15,UTM,-\1;12,VJM,P/\2;15,UTM,\3@g;


$prog =~ s@L([^:,]+):,BSS,;12,VJM,P/(\d) *;15,UTM,(\d+);@noargs($1,$2,$3)@eg;

$prog =~ s@L([^:,]+):,BSS,;15,ATX,3;12,VJM,P/(\d) *;15,UTM,(\d+);@"==========;L$1: Level $2 procedure with 1 argument and ".($3-2)." locals;".rec1arg($1)@eg;

$prog =~ s@L([^:,]+):,BSS,;15,ATX,4;12,VJM,P/(\d) *;15,UTM,(\d+);@"==========;L$1: Level $2 function with 1 argument and ".($3-3)." locals;".rec1arg($1)@eg;

$prog =~ s@L([^:,]+):,BSS,;15,ATX,0;15,UTM,-(\d+);12,VJM,P/(\d) *;15,UTM,(\d+);@manyargs($1,$3,$2,$4)@eg;

$prog =~ s@L([^:,]+):,BSS,;,NTR,7; :,BSS,;13,MTJ,(\d);@"==========;L$1: Level ".($2-1)." procedure with no frame;"@eg;

# $prog =~ s@L([^:,]+):,BSS,;12,VJM,P/(\d);@noargs($1,$2,"xx")@eg;

# Converting shortcuts to standard subroutine calls

$prog =~ s@13,VTM,([^;]+);,UJ,([^;]+);@13,VJM,\2;,UJ,\1;@g;



# Converting local variables avoiding insns accessing registers
# (with M in their names)
# This should be recognized and conversion suppressed.

my @isfunc, @nargs, @nlocs;

sub renameLocRef {
    my ($lev, $idx) = @_;
    if ($isfunc[$lev]) {
        return $procname[$lev] if $idx == 0;
        return "l${lev}a${idx}z" if $idx <= $nargs[$lev];
        return "l${lev}v".($idx-$nargs[$lev])."z";
    } else {
        return "l${lev}a".($idx+1)."z" if $idx < $nargs[$lev];
        return "l${lev}v".($idx-$nargs[$lev]+1)."z";
    }
}

sub processprocs {
    
my @ops = split /;/, $prog;
my @regs;
my $curlev = -1;
my $funcname = '';
my $args = 0;
my $unkn = 0;
for ($i = 0; $i <= $#ops; ++$i) {
    $line = $ops[$i];
    if ($line =~ m/^(.*?): Level (\d) ([a-z]+) with (\d+) argument/) {
        $funcname = $1;
        $curlev = $2;
        $args = $4;
        $funcname = '' unless $3 eq 'function';
        $unkn = 1 if $line =~ m/ or /;
        @regs = ();
        next;
    }
    if ($curlev != -1 && $line =~ m@^([2-$curlev]),([^M][^M][^M]),(\d+)$@) {
        my $idx = $3-3;
        if ($unkn || $1 ne $curlev) {
            $ops[$i] = ",$2,l$1loc${idx}z";
            $ops[$i] =~ s/l${curlev}loc0z/$funcname/ if $funcname ne '';
        } elsif ($funcname ne '') {
            if ($idx <= $args) {
                $ops[$i] = ",$2,l$1a${idx}z";
            } else {
                $ops[$i] = ",$2,l$1v".($idx-$args)."z";
            }
            $ops[$i] =~ s/l${curlev}a0z/$funcname/;
        } else {
            if ($idx < $args) {
                $ops[$i] = ",$2,l$1a".($idx+1)."z";
            } else {
                $ops[$i] = ",$2,l$1v".($idx-$args+1)."z";
            }
        }
        next;
    }

    # Faking assignment to a register "variable"
#    if ($line =~ m/^([$curlev-69]|13),VTM,(.*)/) {
#        $regs[$1] = $2;
#        next;
#    }
    # Replacing known references via registers
    if ($line =~ m@^([$curlev-69]|13),([^M][^M][^M]),(\d+)$@
# && $regs[$1] ne ''
        ) {
#        $ops[$i] = ",$2,$regs[$1]->$3";
        $ops[$i] = ",$2,R$1->$3";
        next;
    }

# Faking reading of a register "variable"
#    if ($line =~ m/,IT([AS]),([$curlev-69]|13)$/ && $regs[$2] ne '') {
#        $ops[$i] = ",XT$1,$regs[$2]";
#        next;
#    }
    
    # Recognizing return from frameless procedures
    $avail = $curlev+1;
    $ops[$i] =~ s@$avail,UJ,0@RETURN@;
}

# Bringing procedure headers up
my $curlev = 2;

for ($i = 0; $i <= $#ops; ++$i) {
    my $line = $ops[$i];
    next if $line !~ /Level (\d)/;
    $level = $1;
    next if $curlev == $level;
    if ($curlev > $level) {
        $ops[$i] .= ' (body)';
        $curlev = $level;
        next;
    }
    # The current line starts a subroutine at a greater nesting
    # level; find the header of the routine at the current level
    # and bring it up.
    for ($k = $level-1; $k >= $curlev; --$k) {
        for ($j = $i+1; $j <= $#ops; ++$j) {
            $l2 = $ops[$j];
            last if $l2 =~ /Level $k/;
        }
         splice(@ops, $i, 0, "$l2 (header)");
    }
    $i += $level-$curlev;
    $curlev = $level;
}

# Rename references to variables of upper level routines

for ($i = 0; $i <= $#ops; ++$i) {
    if ($ops[$i] =~ /([^:]+): Level (\d) ([^ ]+) with (\d+).* and (\d+)/) {
        # printf STDERR "Recording $1 $2 $3 $4 $5\n";
        $procname[$2] = $1;
        $isfunc[$2] = $3 eq "function";
        $nargs[$2] = $4;
        $nlocs[$2] = $5;
    } else {
        $ops[$i] =~ s@l(\d)loc(\d+)z@renameLocRef($1, $2)@ge;
    }
}

$prog = join ';', @ops;

}

processprocs();


# Recognizing known pre-seeded constants in the global area

$prog =~ s/gl8z/output@/g;
$prog =~ s/gl7z/input@/g;
#$prog =~ s@gl9z@00@g;
#$prog =~ s@gl10z@multmask@g; # 640... -> 400... 
#$prog =~ s@gl12z@mantissa@g;
#$prog =~ s@gl15z@-1@g;
#$prog =~ s@gl17z@+1@g;
#$prog =~ s@gl18z@p77777@g;
#$prog =~ s@gl19z@real0_5@g;
$prog =~ s@C/0000@allones@g;

# Also
# Handle multiplication in the (*=M-*) mode
$prog =~ s@,AOX,C/0022;([^;]+);,YTA,\(31C\)@\1@g;

# Handle multiplication in the (*=M+*) mode
$prog =~ s@,AOX,C/0022;(,NTR,3;)?([^;]+);14,VJM,P/0060@\2@g;
$prog =~ s@\(74000C\)@NIL@g;

# Handle multiplication for indexing
$prog =~ s@,A\*X,\(6400000000(\d+)C\);,YTA,\(255\)@,A*X,(\1)@g;
if (open(LOCALS, "locals.txt")) {
    while (<LOCALS>) {
        chop;
        my ($var, $name) = split;
        $prog =~ s@${var}@$name@g || print STDERR "Local $var not found\n";
    }
    close(LOCALS);
}

# Recognizing known subroutine names

if (%routines) {
    $pattern = join '|', keys %routines;
    $prog =~ s@L($pattern)@$routines{$1}@ge;
    map { 
        $knargs{$routines{$_}} = $knargs{$_};
#        print STDERR "Setting nargs of $routines{$_} to $knargs{$_}\n";
    } (keys %routines);
}

# Converting indirect addressing
while ($prog =~ s@;,WTC,([^;]+);([^;]+)@;\2\[\1\]@g) { }

# Known globals

if (open(GLOBALS, "globals.txt")) {
    while (<GLOBALS>) {
        chop;
        my ($offset, $name, $len) = split;
        if ($len) {
            print STDERR "Looking for global array $name at offset $offset with length $len\n";
            # This is an array (with base 1) of length len
            # Therefore only indirect addressing with that name must be converted
            $prog =~ s@gl${offset}z\[@$name\[@g || print STDERR "Global $offset not found\n";
            # And the following len globals must be renamed to name[index]
            for ($i = 1; $i <= $len; ++$i) {
                $look = 'gl'.($offset+$i).'z';
                $prog =~ s@$look@$name\[$i\]@g; # Not all offsets must be present
            }
        } else {
            $prog =~ s@gl${offset}z@$name@g || print STDERR "Global $offset not found\n";
        }
    }
    close(GLOBALS);
} else {
    print STDERR "File globals.txt not found, no names replaced\n";
}

$prog =~ s@;,UTC,([^;]+);([^;]*?),([^,;]+);@;\2,*(&\1+\3);@g;
# $prog =~ s@;14,UTC,([^;]+);([^;]*?),([^,;]+);@;\2,\3[R14+\1];@g;

# Reading the address of a variable
# $prog =~ s@(\d+),VTM,([^;]+);,IT([AS]),\1@,XT\3,&\2@g;

# Setting a register in an indirect way
# $prog =~ s@,XTA,int\((\d+)\);,ATI,(\d+)@\2,VTM,\1@g;

# Recognizing a variety of write routines

$prog =~ s@14,VJM,P/6A *@CALL writeAlfa@g;
$prog =~ s@12,VJM,P/7A *@writeString@g;
$prog =~ s@14,VJM,P/WI *@CALL writeInt@g;
$prog =~ s@14,VJM,P/WL *@writeLN@g;
$prog =~ s@14,VJM,P/CW *@writeChar@g;
$prog =~ s@14,VJM,P/SS *@CALL P/SS@g;
$prog =~ s@14,VJM,P/WC *@CALL writeCharWide@g;
$prog =~ s@14,VJM,P/0026 *@get(input)@g;
$prog =~ s@14,VJM,P/0030 *@put(output)@g;
$prog =~ s@14,VJM,P/0033 *@CALL unpck@g;
# $prog =~ s@14,VJM,P/0040 *@CALL put@g;
$prog =~ s@14,VJM,P/0041 *@CALL get@g;
$prog =~ s@14,VJM,P/0042 *@CALL reset@g;
$prog =~ s@14,VJM,P/0064 *@CALL rewrite@g;
$prog =~ s@14,VJM,P/0075 *@CALL writeInt@g;
$prog =~ s@14,VJM,P/0105 *@CALL writeReal@g;
$prog =~ s@14,VJM,P/0112 *@CALL P/PI@g;
$prog =~ s@14,VJM,P/WOLN *@writeLN@g;

$prog =~ s@13,VTM,([^;]+);14,VJM,P/EO *@eof(\1)@g;
$prog =~ s@13,VTM,([^;]+);14,VJM,P/EL *@eoln(\1)@g;
$prog =~ s@13,VTM,([^;]+);14,VJM,P/GF *@get(\1)@g;
$prog =~ s@13,VTM,([^;]+);14,VJM,P/0040 *@put(\1)@g;
$prog =~ s@13,VTM,([^;]+);14,VJM,P/RF *@reset(\1)@g;
$prog =~ s@13,VTM,([^;]+);14,VJM,P/TF *@rewrite(\1)@g;

$prog =~ s@10,VJM,P/0061 *@realEQ@g;
$prog =~ s@10,VJM,P/0062 *@realLT@g;
$prog =~ s@10,VJM,P/0063 *@realGT@g;

# Converting NEW

$prog =~ s@14,VTM,(\d+);13,VJM,P/NW *;,ATX,([^;]+)@new(\2=\1)@g;

# Converting calls (including scope-crossing calls)

# $prog =~ s@14,VJM,([^;]+);14,VJM,P/\d\d@CALL \1@g;
$prog =~ s@14,VJM,([^;]+)(;15,MTJ,\d)?@CALL \1@g;

# Removing base register resetting after external calls
$prog =~ s@8,BASE,([^;]+);@@g;

# Converting non-local GOTO

$prog =~ s@\d,MTJ,13;14,VTM,([^;]+);,UJ,P/RC *@sprintf("GOTO L%04o", $1)@ge;

# Recognizing casts and conversions 
$prog =~ s@,NTR,0(;,AVX,0)?@toReal@g;
$prog =~ s@,APX,p77777;,ASN,64\+33;,AEX,int\(0\)@mapAI@g;
$prog =~ s@,A\+X,half;,NTR,7;,A\+X,int\(0\)@round@g;
$prog =~ s@CALL L12674@round@g;
$prog =~ s@,\*50,5;@LN;@g;
$prog =~ s@,\*50,0;@SQRT;@g;

# Simplifying code for case statements

$prog =~ s@15,ATX,1;,UJ,@caseto @g;

$prog =~ s@,BSS,;15,XTA,1;,A-X,([^;]+);,U1A,([^;]+);,X-A,([^;]+);,U1A,\2;15,XTA,1;,ATI,14@Case decoder from \1 to \1+\3, otherwise goto \2@g;

# Converting common conditional branches

$prog =~ s@;(\d+)?,AAX,([^;]+);,UZA,@;\1,AAX,\2;ifnot @g;
$prog =~ s@;(\d+)?,AEX,([^;]+);,UZA,@;\1,CEQ,\2;ifgoto @g;
$prog =~ s@;(\d+)?,A-X,([^;]+);,UZA,@;\1,CGE,\2;ifgoto @g;
$prog =~ s@;(\d+)?,X-A,([^;]+);,UZA,@;\1,CLE,\2;ifgoto @g;

$prog =~ s@;(\d+)?,AAX,([^;]+);,U1A,@;\1,AAX,\2;ifgoto @g;
$prog =~ s@;(\d+)?,AEX,([^;]+);,U1A,@;\1,CNE,\2;ifgoto @g;
$prog =~ s@;(\d+)?,A-X,([^;]+);,U1A,@;\1,CLT,\2;ifgoto @g;
$prog =~ s@;(\d+)?,X-A,([^;]+);,U1A,@;\1,CGT,\2;ifgoto @g;

$prog =~ s@;(\d+)?,AAX,([^;]+);isUZACond@;\1,AAX,\2;invBool@g;
$prog =~ s@;(\d+)?,AEX,([^;]+);isUZACond@;\1,CEQ,\2;toBool@g;
$prog =~ s@;(\d+)?,A-X,([^;]+);isUZACond@;\1,CGE,\2;toBool@g;
$prog =~ s@;(\d+)?,X-A,([^;]+);isUZACond@;\1,CLE,\2;toBool@g;

$prog =~ s@;(\d+)?,AAX,([^;]+);isU1ACond@;\1,AAX,\2;toBool@g;
$prog =~ s@;(\d+)?,AEX,([^;]+);isU1ACond@;\1,CNE,\2;toBool@g;
$prog =~ s@;(\d+)?,A-X,([^;]+);isU1ACond@;\1,CLT,\2;toBool@g;
$prog =~ s@;(\d+)?,X-A,([^;]+);isU1ACond@;\1,CGT,\2;toBool@g;

$prog =~ s@;(\d+)?,XTA,([^;]+);,UZA,@;\1,XTA,\2;,CEQ,0;ifgoto @g;
$prog =~ s@;(\d+)?,XTA,([^;]+);,U1A,@;\1,XTA,\2;,CNE,0;ifgoto @g;

$prog =~ s@;CALL P/IN *;,UZA,@;CALL P/IN;ifnot @g;
$prog =~ s@;CALL P/IN *;,U1A,@;CALL P/IN;ifgoto @g;

$prog =~ s@;(eo[^;]+);,UZA,@;\1;ifnot @g;
$prog =~ s@;(eo[^;]+);,U1A,@;\1;ifgoto @g;

$prog =~ s@;(\d+)?,XTA,([^;]+);isUZACond@;\1,XTA,\2;,CEQ,0;toBool@g;
$prog =~ s@;(\d+)?,XTA,([^;]+);isU1ACond@;\1,XTA,\2;,CNE,0;toBool@g;


@ops = split /;/, $prog;

print "Got $#ops lines\n";


# Emulating a simple stack machine starting with XTA
# and ending with a non-recognized operation or a label. At that point the stack is
# dumped and reset.


$from = 0;
@stack = ();

@to = ();

sub dumpStack {
    push @to, '#' . join(' % ', @stack) if @stack;
    @stack = ();
}


while ($from <= $#ops) {
    my $line = $ops[$from];
    @stack = () if $line =~ /:,/;
    @regs = () if $line =~ /:,/;

    if ($line =~ m@(\d+),VTM,([^;]+)@) {
        $regs[$1] = "&$2";
        push @to, "R$1 := &$2";
        ++$from;
        next;
    }
    if ($line =~ m@,ITA,([^;]+)@) {
        if (@stack) {
            $stack[$#stack] = defined($regs[$1]) ? $regs[$1] : "R($1)";
        } else { push @stack, defined($regs[$1]) ? $regs[$1] : "R($1)"; }
        ++$from;
        next;
    }

        if ($line =~ m@,ITS,([^;]+)@) {
            push @stack, defined($regs[$1]) ? $regs[$1] : "R($1)";
        ++$from;
        next;
    }

    if (@stack && $line =~ m@CALL P/MI@) {
        $stack[$#stack] = "mulFix($stack[$#stack])";
        ++$from;
        next;
    }
    if (@stack && $line eq ',YTA,(31C)') {
        $stack[$#stack] = "nonNeg($stack[$#stack])";
        ++$from;
        next;
    }
    if (@stack && $line eq ',NTR,3') {
        $stack[$#stack] = "disNorm($stack[$#stack])";
        ++$from;
        next;
    }
    if (@stack && $line =~ m@CALL P/SS@) {
        $stack[$#stack] = "toSet($stack[$#stack])";
        ++$from;
        next;
    }
    if (@stack && $line =~ m@CALL P/TR@) {
        $stack[$#stack] = "trunc($stack[$#stack])";
        ++$from;
        next;
    }
    if (@stack && $line =~ m/^(toBool|toReal|invBool|mapAI|round|LN|SQRT)$/) {
        $stack[$#stack] = "$1($stack[$#stack])";
        ++$from;
        next;
    }
    if ($line =~ /^eo[lf]/) {
        if (@stack) { $stack[$#stack] = $line; }
        else { $stack[0] = $line; }
        ++$from;
        next;
    }
    if (@stack >= 2 && $line =~ m@CALL P/IN@) {
        $stack[$#stack-1] = "($stack[$#stack-1] IN $stack[$#stack])";
        --$#stack;
        ++$from;
        next;
    }
    if (@stack >= 2 && $line =~ m@realLT@) {
        $stack[$#stack-1] = "($stack[$#stack-1] < $stack[$#stack])";
        --$#stack;
        ++$from;
        next;
    }
    if (@stack >= 2 && $line =~ m@realGT@) {
        $stack[$#stack-1] = "($stack[$#stack-1] > $stack[$#stack])";
        --$#stack;
        ++$from;
        next;
    }
    if (@stack >= 2 && $line =~ m@realEQ@) {
        $stack[$#stack-1] = "($stack[$#stack-1] = $stack[$#stack])";
        --$#stack;
        ++$from;
        next;
    }
    if (@stack >= 2 && $line =~ m@CALL P/PI@) {
        $stack[$#stack-1] = "toRange($stack[$#stack-1]..$stack[$#stack])";
        --$#stack;
        ++$from;
        next;
    }
    if (@stack >= 2 && $line =~ m@CALL P/DI@) {
        $stack[$#stack-1] = "($stack[$#stack-1] DIV $stack[$#stack])";
        --$#stack;
        ++$from;
        next;
    }
    if (@stack >= 2 && $line =~ m@CALL P/IS@) {
        $stack[$#stack-1] = "($stack[$#stack-1] /int/ $stack[$#stack])";
        --$#stack;
        ++$from;
        next;
    }
    if (@stack >= 2 && $line =~ m@12,VJM,P/MD@) {
        $stack[$#stack-1] = "($stack[$#stack-1] MOD $stack[$#stack])";
        --$#stack;
        ++$from;
        next;
    }
    if (@stack && $line =~ m@,ASN,64([-+])(\d+)@) {
        if ($1 eq '-') {
            $stack[$#stack] = "($stack[$#stack] << $2)";
        } else {
            $stack[$#stack] = "($stack[$#stack] >> $2)";
        }
        ++$from;
        next;
    }
    if (@stack && $line =~ m@,ASN,64\[(.+)\]@) {
        $stack[$#stack] = "($stack[$#stack] >> $1)";
        ++$from;
        next;
    }
    if (@stack && $line =~ m@,AVX,C/0043@) {
        $stack[$#stack] = "neg($stack[$#stack])";
        ++$from;
        next;
    }
    if (@stack && $line =~ m@,AMX,0@) {
        $stack[$#stack] = "abs($stack[$#stack])";
        ++$from;
        next;
    }
    if (@stack && $line =~ m@CALL P/0024@) {
        $stack[$#stack] = "intToReal($stack[$#stack])";
        ++$from;
        next;
    }
    if ($line =~ m@CALL P/0023@) {
        push @stack, "pck";
        ++$from;
        next;
    }
    if (@stack && $line =~ m@,AEX,(1C)@) {
        $stack[$#stack] = "_not ($stack[$#stack])";
        ++$from;
        next;
    }
    if (@stack && $line =~ m@,ACX,0@) {
        $stack[$#stack] = "card($stack[$#stack])";
        ++$from;
        next;
    }
    if (@stack && $line =~ m@,ANX,0@) {
        $stack[$#stack] = "ffs($stack[$#stack])";
        ++$from;
        next;
    }
    if (@stack && $line =~ m@15,WTC,0@) {
        $ops[++$from] .= "[$stack[$#stack-1]]";
        $stack[$#stack-1] = $stack[$#stack];
        --$#stack;
        next;
    }
    if (@stack && $line =~ m@,ATI,(\d+)@) {
        $regs[$1] = $stack[$#stack];
        if ($#stack == 0) { @stack = () ; }
        ++$from;
        next;
    }

    if (@stack && ($line =~ /CALL ([^;]+)/) ) {
        # This is not always correct; some values are put on the stack
        # to be consumed after the return from a subroutine.
        if (defined($knargs{$1}) && scalar(@stack) != $knargs{$1}) {
            print STDERR "Calling $1 when stack is ", scalar(@stack), 
                " deep; while it has $knargs{$1} args\n";
        }
        if (defined($1) && defined($knargs{$1})) {
            if ($knargs{$1}) { push @to, "$line( ".join(', ', @stack[-$knargs{$1}..-1])." )"; } else { push @to, "$line()"; }
            $#stack -= $knargs{$1};
        } else {
            push @to, "$line( ".join(', ', @stack)." )";
            @stack = ();
        }
        ++$from;
        next;
    }
    if (@stack >= 2 && $line =~ m@15,A([-/EROA+*])X,0?$@) {
        $op = $1;
        $op =~ tr/EROA/^$|&/;
        $stack[$#stack-1] = "($stack[$#stack] $op $stack[$#stack-1])";
        --$#stack;
        ++$from;
        next;
    }

    if (@stack >= 2 && $line =~ m@15,C(..),0?$@) {
        $op = $1;
        $stack[$#stack-1] = "($stack[$#stack] $op $stack[$#stack-1])";
        --$#stack;
        ++$from;
        next;
    } elsif (@stack && $line =~ m@^,C(..),(.*)@) {
        $op = $1;
        $stack[$#stack] = "($stack[$#stack] $op $2)";
        ++$from;
        next;
    } elsif (@stack && $line =~/^ifgoto (.*)/) {
        push @to, "_if $stack[$#stack] _then goto $1";
        # If there was just one element on the stack, consider it consumed
        @stack = (); #  if @stack == 1;
        ++$from;
        next;
    } elsif (@stack && $line =~/^ifnot (.*)/) {
        push @to, "_if $stack[$#stack] _then below _else goto $1";
        # If there was just one element on the stack, consider it consumed
        @stack = (); # if @stack == 1;
        ++$from;
        next;
    } elsif (@stack && $line =~/^caseto (.*)/) {
        push @to, "case $stack[$#stack] at $1";
        # If there was just one element on the stack, consider it consumed
        @stack = () if @stack == 1;
        ++$from;
        next;
    }
    
    if ($line !~ /,[ASX].[ASX],/ || (@stack && $line =~ /:/)) {
        dumpStack() if @stack;
        push @to, $ops[$from++];
        next;
    }
    if ($line eq '15,XTA,3') {
        if (@stack) { $stack[$#stack] = 'FUNCRET'; }
        else { $stack[0] = 'FUNCRET'; }
        ++$from;
    } elsif ($line =~ /^,XTA,(.*)/) {
        if (@stack) { $stack[$#stack] = $1; }
        else { $stack[0] = $1; }
        ++$from;
    } elsif ($line =~ /^,ITA,(.*)/) {
        if (@stack) { $stack[$#stack] = R$1; }
        else { $stack[0] = $1; }
        ++$from;
    } elsif ($line =~ /15,XTA,0?$/) {
        ++$from;
        if (@stack) { --$#stack; }
        else { push @to, "!!! Popping empty stack at $from"; }
    } elsif (@stack && $line =~ m@^,A([-+*/EROA])X,(.*)@) {
        $op = $1;
        $op =~ tr/EROA/^$|&/;
        $stack[$#stack] = "($stack[$#stack] $op $2)";
        ++$from;
    } elsif (@stack && $line =~ m@^,X-A,(.*)@) {
        $stack[$#stack] = "($1 - $stack[$#stack])";
        ++$from;
    } elsif ($line =~/^,XTS,(.*)/) {
#        print STDERR "$line\n";
        $val = $1;
        if ($#stack >= 0) { $stack[++$#stack] = $val; } else { push @stack, $val; }
        ++$from;
    } elsif (@stack && $line eq '15,ATX,0') {
        push @stack, $stack[$#stack];
        ++$from;
    } elsif (@stack && $line =~ /^,ATX,(.*)/) {
        push @to, "$1 := $stack[$#stack]";
        # If there was just one element on the stack, consider it consumed
        @stack = () if @stack == 1;
        ++$from;
    } elsif (@stack && $line =~ /^,STX,(.*)/) {
        push @to, "$1 :=  $stack[$#stack--]";
        ++$from;
    } else {
        dumpStack() if @stack;
        push @to, $ops[$from++];
        next;
    }             
}

$prog = join ';', @to;

# Converting simple ops

$prog =~ s@,UJ,P/E *;@RETURN;@g;
# $prog =~ s@;([^;:]+) := glob23z@;setup(\1)@g;
# $prog =~ s@;glob23z := ([^;]+)@;rollup(\1)@g;

# Removing stack corrections after calls
$prog =~ s@15,UTM,[34];@@g;


# Converting small literals to enums based on context
$context = 'SY |checkSymAndRead|requiredSymErr|ifWhileStatement';

sub convertEnumSet {
    my $bitset = $_[0];
    my $enum = $_[1];
    $bitset =~ s/0/OOO/g;
    $bitset =~ s/1/OOI/g;
    $bitset =~ s/2/OIO/g;
    $bitset =~ s/3/OII/g;
    $bitset =~ s/4/IOO/g;
    $bitset =~ s/5/IOI/g;
    $bitset =~ s/6/IIO/g;
    $bitset =~ s/7/III/g;
    $bitset = 'O'x(48-length($bitset)) . $bitset;
    my @bits = split //, $bitset;
    my @set = ();
    for ($i = 0; $i < 48; ++$i) { push @set, ${$enum}[$i] if $bits[$i] eq 'I'; }
    return '['.join(',', @set).']';
}

sub convertIntSet {
    my $bitset = $_[0];
    my $orig = $bitset;
    $bitset =~ s/0/OOO/g;
    $bitset =~ s/1/OOI/g;
    $bitset =~ s/2/OIO/g;
    $bitset =~ s/3/OII/g;
    $bitset =~ s/4/IOO/g;
    $bitset =~ s/5/IOI/g;
    $bitset =~ s/6/IIO/g;
    $bitset =~ s/7/III/g;
    $bitset = 'O'x(48-length($bitset)) . $bitset;
    my @bits = split //, $bitset;
    my @set = ();
    for ($i = 0; $i < 48; ++$i) { push @set, $i if $bits[$i] eq 'I'; }
    $bitset = '['.join(',', @set).']';
    # printf STDERR "Converting $orig to $bitset\n";
    return $bitset;
}

# Converting chars based on context
$prog =~ s@(CH [^;]+)\(([0-7][0-7][0-7]?)C\)@"$1'".chr(oct($2))."'"@ge;

# Converting sets based on context
$prog =~ s@ IN \(([0-7]+)C\)@" IN ".convertIntSet($1)@ge;
$prog =~ s@ \| \(([0-7]+)C\)@" + ".convertIntSet($1)@ge;
$prog =~ s@ \& \(([0-7]+)C\)@" * ".convertIntSet($1)@ge;

$prog =~ s@(if[^;]*)\(\(\(([0-7]+)C\) \^ allones\) \& ([^()]+)\)@"$1 not ($3 <= ".convertIntSet($2).')'@ge;
$prog =~ s@\(\(\(([0-7]+)C\) \^ allones\) \& ([^()]+)\)@"($2 - ".convertIntSet($1).')'@ge;

# Convert if/then/else (nesting not handled due to label reuse)

# while ($prog =~ s@;if ([^;]+)goto ([^;]+);(.*),UJ,([^;]+);\2:(.*)\4:@;if \1 {;\2:\5;\4:;} else {;\3};@g) { }

# Marking up for loops
# $prog =~ s@,UJ,([^;]+);([^:]+):(.*)\1:(.*);ifgoto \2@loop {;\3 } while (;\4;)@g;

# Finding case statements (kinda slow)

# $prog =~ s@,UJ,([^;]+);(.*?)\1:,BSS,;15,ATX,1;,CLT,([^;]+);ifgoto ([^;]+);,CGT,([^;]+);ifgoto \4;15,XTA,1;,ATI,14;14,UJ,([^;]+)@case in [\3 .. \5] else \6; { \2 };@g;

# Finding only bounds (faster)
# $prog =~ s@:,BSS,;15,ATX,1;,CLT,([^;]+);ifgoto ([^;]+);,CGT,([^;]+);ifgoto \2@:bounds [\1 .. \3] else \2@g;

# Simplifying function call/returns

$prog =~ s@CALL([^;]+);([^;]+)FUNCRET([^;]*);@\2 \1 \3;@g;
$prog =~ s@CALL @@g;

# Converting structure field access

$prog =~ s/(\d+)\[([^][]+)\]/\2@.f[\1]/g;

$relop{' EQ '} = ' = ';
$relop{' NE '} = ' <> ';
$relop{' LT '} = ' < ';
$relop{' LE '} = ' <= ';
$relop{' GT '} = ' > ';
$relop{' GE '} = ' >= ';
# Converting relational ops
$prog =~ s/( EQ | NE | LT | LE | GT | GE )/$relop{$1}/ge;

# Removing extra spaces

$prog =~ s/ +;/;/g;
$prog =~ s/ +\( +/ (/g;
$prog =~ s/ +\) +/) /g;

# Recognizing loops

while ($prog =~
#   var1   := start2   loop3               cond4  end5            exit6 body7
 s@([^;]+) := ([^;]+);L(\d+):,BSS,;_if \(\1 ([<>]) ([^;]+)\) _then goto L(\d+);(.*);\1 := .\1 [-+] .1C..;,UJ,L\3;L\6@
       "_for $1 := $2 ". ($4 eq '>' ? '_to ' : '_downto ') . "$5 _do _(;$7;_);L$6"@ge) { }

       
sub getstring {
    my ($addr, $len) = @_;
    my $s = "";
    for (; $len > 0; ) {
        if ($prog =~ m@;/$addr:,BSS,;,GOST, *\|([^|]+)\|@) {
            $s .= $1;
            ++$addr; $len -= 6;
        } else { return "string($_[0], $_[1])"; }
    }
    return $len ? substr($s, 0, $len) : $s;
}
    
my @gosttab = (
'0', '1', '2', '3', '4', '5', '6', '7', 
'8', '9', '+', '-', '/', ',', '.', ' ',
'⏨', '@', '(', ')', '×', '=', ';', '[', 
']', '*', '`', "'", '#', '<', '>', ':', 
'A', 'Б', 'В', 'Г', 'Д', 'Е', 'Ж', 'З', 
'И', 'Й', 'К', 'Л', 'М', 'Н', 'О', 'П', 
'Р', 'С', 'Т', 'У', 'Ф', 'Х', 'Ц', 'Ч', 
'Ш', 'Щ', 'Ы', 'Ь', 'Э', 'Ю', 'Я', 'D', 
'F', 'G', 'I', 'J', 'L', 'N', 'Q', 'R', 
'S', 'U', 'V', 'W', 'Z', '^', '?', '?', 
'?', '&', '?', '~', '?', '?', '%', '$', 
'|', '?', '_', '!', '"', 'Ъ', '?', '\\' 
);

sub gost {
    return $_[0] < 0140 ? $gosttab[$_[0]] : sprintf("_%03o", $_[0]);
}

$prog =~ s@R13 := &(\d+);10,VJM,P/0066@"BIND('".getstring($1,6)."')"@ge;
$prog =~ s/R10 := &-(\d+);R13 := &(\d+);writeString/"write('".getstring($2, $1)."')"/ge;

$prog =~ s@R10 := &(\d+);R9 := \&(\d+);P/A7\( \((\d+)C\), \(\3C\) \)@"write('".getstring($2,$1)."':".oct($3).")"@ge;

$prog =~ s@writeCharWide\( \((\d+)C\), \((\d+)C\) \)@ "write('" .gost(oct($2)). "':" .oct($1) .")" @ge;

$prog =~ s@writeInt\( \((\d+)C\), ([^;]+) \)@ "write($2" . ($1 == 1 ? '' : ":$1") .")" @ge;

$prog =~ s@R10 := &(\d+);R9 := \&(\d+);R13 := \&([^;]+);P/0071\( \&(\d+), \&\4 \)@"write($3,'".getstring($2,$1)."':".oct($4).")"@ge;

$prog =~ s@R13 := &6;writeAlfa\( &6, ([^;]+) \)@write(\1)@g;

$prog =~ s@R13 := &6;writeAlfa\( &6, ([^;]+) \)@write(\1)@g;

$prog =~ s/output@ := \((\d+)C\);put.output./"write('".gost(oct($1))."')"/ge;

# Converting remaining stray ATX to assignments
$prog =~ s@,ATX,([^;]+)@\1 := @g;
#Restoring line feeds

$prog =~ s/;/;\n /g;


print $prog;
