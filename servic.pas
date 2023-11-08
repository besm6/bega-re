(*=p-,t-,l-*)_program SERVIC(F=270000В 16); _label 5322, 5324, 5333;
_const sp=' ';dot='.';lf='{214';eot='{172';etx='{377';
_type letter ='A'..'Z'; bitset=_set _of 0..47; hund=0..100;
unp6=_array [1..6] _of char; digit='0'..'9';
a15 = _array[1..15] _of integer;
_var g10z, g11z, g12z, g13z, g14z, g15z:integer;
g16z:@integer;
g17z, g18z, g19z:boolean;
g20z:char;
g21z, g22z:@a15;
cmd:alfa;
g24z:_array[hund] _of integer;
F:text;
_proced L1102(a:integer); _( a := a; code(зч75205=зч75224,) _);
_proced L1107(a:integer); _( a := a; code(зч75207=) _);
_proced L1113;
 _(
   code(=16пае,pr:ви16=зчD1162,`переопределение writeln`);
   write('{172      ');
   code(ви7=зчD1164,сч75205=уи7,сч76013=луD1163,у0L1124=э064D1160,L1124:сч76013=лу13,);
   code(у0L1154=cч76401,лсD1157=17зч1,17э0711=,э07176402=,сд/-26/=сд/-2/,мр=ср13,у0L1222=сч76422,);
   code(уи7=7са-1,ви7=зч76422,у1L1154=сч76421,зч76422=16пвL1166,);
   L1107(28672);
   code(15паD1165=12пвL1213,сч70000=ср76727,у1L1151=);
   L1107(4096);
   code(16пвL1171=,пбL1154=,L1151:);
   rewrite(output);
   _GOTO 5324;
   code(L1154:); rewrite(output);
   code(счD1164=уи7,икD1162=пб,c;D1157:3000000024000321,D1160:3400000034000000,40000000,);
   code(D1162:0,D1163:2,D1164:0,D1165:2746337700000000,к;);
   code(L1166:сч74220=зчD1211,сч75225=зчD1212,16пб=,L1171:счD1211=зч74220,счD1212=зч75225,);
   code(ик75225=сч,зч74217=сч74215,17зч1=ср74220,у1L1202=сч75225,уи15=15сч-1,луD1210=1зч7,16пб=,);
   code(L1202:сч74217=сд/-10/,зч74217=мр,1зч7=17сч1,сд/1/=17зч1,ср74220=у1L1202,16пб=,c;);
   code(D1210:377,D1211:0,D1212:0,к;L1213:ви12=зчD1221,12пвф=,);
   code(сч76424=сд/-26/,сд/-2/=мр,ср13=у0L1222,икD1221=пб,);
   code(c;D1221:0,к;L1222:);
   rewrite(output);
   _GOTO 5322;
_);

_proced skipsp; _( _while input@ = sp _do get(input) _);

_function getcmd(_var l2a1z:alfa):boolean;
_var l2v1z:unp6; l2v7z:integer;
_(
 skipsp;
 l2v7z := 1;
 l2a1z := '      ';
 unpck(l2v1z[1], l2a1z );
  _while (input@ _in letter) & (l2v7z < 4) _do _(
  l2v1z[l2v7z] := input@;
  get(input);
  l2v7z := l2v7z + 1;
  _);
  _while input@ _in letter _do  get(input);
  skipsp;
  pck(l2v1z[1], l2a1z);
  getcmd := l2v7z <> 1;
 _);

_function getnum:integer;
_var l2v1z:integer;
_(
 l2v1z := 0;
 skipsp;
 _while input@ <= '9' _do _( l2v1z := 10 * l2v1z + ord(input@); get(input) _);
 getnum := l2v1z;
 _);
_proced L1553(l2a1z:integer);
_const eol='{175';
_var l2v1z, l2v2z, l2v3z, l2v4z, l2v5z, l2v6z, l2v7z:integer; l2v8z, l2v9z:boolean;

 _function L1312(l3a1z:integer):boolean;
_var l3v1z, l3v2z, l3v3z, l3v4z, l3v5z, l3v6z, l3v7z:integer; l3v8z, l3v9z:boolean;
_(
  code(=3сч4,уи5=5са70000,7па1=6па6,5сч=); l3v1z := ;
  _if l3a1z = 0 _then _(
  l3v2z := sel(l3v1z, 0, 12);
  l2v8z := l3v2z <> 0;
  _if l2v8z _then _(
  l3v3z := sel(l3v1z, 12, 15);
  code(зчD1462=);
  _if l3v3z <> 0 _then  l3v3z := trunc((32768 - l3v3z) / 8);
  l3v3z := l3v3z;
  code(зчD1463=);
  _)_); (* 1343 *)
  l3v8z := l2v8z & (l3a1z + 256 >= l3v2z);
  L1312 := ;
  code(зчD1460=);
  _if l3v8z _then _( l3v2z := l3v2z - l3a1z - 1; code(=зчD1461,) _);
  code(16пвL1435=,); (b) _(code(16пвL1435=,);
  l2v1z := ;
  _select
  l2v1z = 0: _goto b;
  l2v1z = 124: _exit b;
  l2v1z = 175В: _( L1312 := true; exit _);
  l2v1z = 97: _goto b;
  l2v1z < 97: l2v1z := (l2v1z - 1);
  (l2v1z > (128)): _(
  l3v6z := ((l2v1z - (128)) - l2v3z);
  _for l3v7z := 1 _to l3v6z _do code(15па17=ви15,16пвL1470=,);
  _goto b
  _);
  l2v1z <> 127: _( code(счD1466=16пвL1470,); _goto b _);
  true: _( code(16пвL1435=,); l3v6z := ;
  _for l3v7z := 1 _to l3v6z _do _( l2v2z := l2v2z; code(=16пвL1470,) _);
  _goto b
  _)
  _end;
  l2v2z := l2v1z; code(16пвL1470=,); _goto b
  _);
  code(L1434:); exit;
  code(L1435:ви6=срD1465,у1L1455=7са1,ви7=овD1467,у1L1434=счD1460,у0L1453=ви7,овD1461=у0L1445,);
  code(счD1466=16пвL1470,пбL1434=,);
  code(L1445:ви7=срD1461,у1L1453=5иа,7сч=икD1462,сд/0/=зчD1464,счD1463=уи6,пбL1455=,);
  code(L1453:6па=5иа,7сч=зчD1464,);
  code(L1455:6са1=счD1464,сд/-10/=зчD1464,мр=16пб,с;);
  code(D1460:0,D1461:0,D1462:0,D1463:0,D1464:0,D1465:6,D1466:175,D1467:377,к;);
  code(L1470:);
  output@ := ; code(=ви16,зчD1506=1сч10,срD1466=у1L1501,);
  _if l3v9z _then code(икD1506=пб,);code(16пвOWL=,); 
  l3v9z := true;
  l2v3z := 0;
  code(икD1506=пб,);
  code(L1501:); l3v9z := false; l2v3z := (l2v3z + 1); (q) put(output);
  code(икD1506=пб,c;D1506:0,к;);
_);

_proced L1510;
_var l3v1z, l3v2z:integer;
_(
  reset(input);
  L1102( (4096) );
  (loop) _for l3v1z := (1340000C) _to (1340020C) _do _(
  l3v2z := ((l2a1z * 100000000В) + l3v1z);
  code(э06241=,);
  l3v2z := ;
  _if (l3v2z = 0) _then _exit loop;
  _for l3v2z := 0 _to 3 _do  _( 
  _if (L1312(256*l3v2z)) _then _exit loop;
  _);
  _);
  write(eot, ' ':5);
  L1102( (29696) );
  rewrite(output);
_);

_( (* L1553 *)
  
  l2v4z := 1;
 l2v3z := 0;
 l2v9z := false;
 rewrite(output);
  _if (input@ = etx) _then l2v5z := 1 _else _(
  l2v5z :=   getnum;
  _if (l2v5z = 0) _then _( writeln('ОШ. В НОМЕРЕ СТРОКИ'); EXIT _);
  _);
  _if g19z _then _(  L1510;  g19z := false _);
  L1107( (4096) );
  reset(input);
  l2v4z := 1;
  l2v3z := 0;
  _while input@ <> eot _do _(
  _if (l2v4z >= l2v5z) _then _(
  _if (input@ = eol) _then _(
  l2v4z := (l2v4z + 1);
  _if _not (l2v3z >= (g15z + (79))) _then writeln;
  l2v3z := 0;
  _) _else _(
 l2v3z := l2v3z + 1;
 _if (l2v3z >= g15z) _and (l2v3z <= g15z + 79) _then _(
  _if (l2v3z > g15z + 78) _then writeln _else write(input@);
  _);
  _);
  _) _else _if input@ = eol _then  l2v4z := (l2v4z + 1);
  get(input);
  _); (* 1637 *)
  l2v4z := l2v4z - 1;
  _if l2v4z = 0 _then  rewrite(output);
  write(' ДЛИНА БУФЕРА ', l2v4z:0, ' СТРОК');
  l2v6z := l2v4z _MOD 10;
  l2v7z := l2v4z _MOD 100;
 _if ((l2v7z < 5) _or (l2v7z > 20)) _and (l2v6z <> 0) _then _(
  _if l2v6z = 1 _then write('А')
  _else _if l2v6z < 5 _then  write('И');
  _);
  writeln
_);

_proced L1674(l2a1z, l2a2z:integer);
_var l2v1z, l2v2z:integer;
_(
  _if l2a1z < 0 _then  write('-');
  l2a1z := abs(l2a1z);
  _if l2a2z < 1 _then  l2a2z := 1;
  l2v2z := 1;
  _for l2v1z := 1 _to (l2a2z - 1) _do  l2v2z := (l2v2z * (10));
  _for l2v1z := 1 _to (l2a2z - 1) _do _(
  _if _not (l2a1z >= l2v2z) _then  write('0');
  l2v2z := round(l2v2z / 10);
  _);
  write( l2a1z:0 );
_);

_proced L1742(l2a1z:integer);
_var l2v1z:integer;
_(
  write(trunc(l2a1z / 50):0, '.');
  l2v1z := l2a1z _MOD 50 * 2;
  L1674(l2v1z, 2);
  write('  ');
_);

_proced ВРЕ;
_var l2v1z:integer; l2v2z:real;
_(
  write('ВЦП '); code(э0634=,); l2v1z := ; L1742( l2v1z );
  write('ОСТ '); code(э0630=,); l2v2z := ; writeln(trunc(l2v2z):0 );
 _);
_proced L2045(_var l2a1z:_array[hund] _of integer; _var l2a2z:char);
_const c96=96;
_type rec=_record a, b:integer _end;
_var l2v1z, l2v2z, l2v3z, l2v4z, l2v5z, l2v6z, l2v7z, l2v8z, l2v9z:integer;
l2v10z:@integer;
l2v11z:alfa;
l2v12z, l2v212z:_array[1..100] _of rec;
l2v412z:char;
l2v413z:boolean;
l2v414z:@rec;
_proced L2004;
_(
   _if g18z _then code(пб76002=,);
   writeln('{175ВСЕГО ', l2v8z:0, ' СТРОК.');
   L1107( (28672) );
   _GOTO 5322;
_);

_proced L2023;
_(
 writeln('ПУСТОЙ СПИСОК СТРОК');
 _GOTO 5322;
_);

_proced L2031(_var l3a1z:integer);
 _(
   _if (l3a1z > 200000) _or (l2v10z@ = 0) _then _(
   l2v10z@ := 1;
   _GOTO 5322;
   _);
   l3a1z := l3a1z + 1;
 _);

_( (* L2045 *)
  l2v10z := ptr(4);
  l2v10z@ := 1;
 _if g18z _then  l2v9z := 10000 _else l2v9z := 70;
  l2v413z := input@ = 'Н';
  _if l2v413z _then _(
  _if getcmd( l2v11z) _then ;
  l2v4z := l2a1z[0];
  _if _not (l2v4z >= 1) _then  L2023;
  _); (* 2076 *)
  l2v12z[1].a := 1;
  l2v12z[1].b := 100000;
  l2v1z := 1;
  skipsp;
  (a) _select
  input@ = etx: _exit a;
  input@ = lf: _( get(input); skipsp; _goto a _);
  input@ > ':': l2a2z := input@;
  input@ > '9': _(  writeln('ОШ В СПИСКЕ'); _GOTO 5322 _);
  true: _(
  l2v414z := ref(l2v12z[l2v1z]);
  l2v414z@.a := getnum;
  skipsp;
  _if input@ = ':' _then _(  get(input); l2v414z@.b :=   getnum _)
  _else  l2v414z@.b := l2v414z@.a;
  l2v1z := l2v1z + 1;
  skipsp;
  _if l2v1z < 30 _then _goto a;
  _)
  _end;
  _if l2v1z > 1 _then  l2v5z := l2v1z - 1 _else  l2v5z := 1;
  _if _not l2v413z _then l2v212z := l2v12z _else _(
  l2v3z := 1;
  _for l2v1z := 1 _to l2v5z _do _(
  l2v2z := 1;
  (L2175) _( _select
  (l2v2z <> 1) _and (l2a1z[l2v2z] = l2a1z[l2v2z - 1]): _(
  l2v2z := l2v2z + 1;
  _goto L2175
  _);
  l2a1z[l2v2z] > l2v12z[l2v1z].b: _exit L2175;
  l2a1z[l2v2z] >= l2v12z[l2v1z].a: _(
  l2v414z := ref(l2v212z[l2v3z]);
  l2v414z@.a:= l2a1z[l2v2z];
  l2v414z@.b := l2v414z@.a;
  l2v3z := (l2v3z + 1);
  _)
  _end; (* 2243 *)
  l2v2z := l2v2z + 1;
  _if l2v2z <= l2v4z _then _goto L2175;
  _)
  _); (* 2251 *)
  l2v5z := l2v3z - 1;
  _if l2v5z < 1 _then  L2023;
  _); (* 2255 *)
  L1107( g11z );
  reset(input);
  l2v8z := 1;
  l2v6z := 0;
  l2v7z := 0;
  _for l2v2z := 1 _to l2v5z _do _(
  _while l2v8z < l2v212z[l2v2z].a _do _(
  _select
  (input@ = eot) _or (input@ = '{140'): L2004;
  input@ = l2a2z: l2v8z := l2v8z + 1
  _end;
  get(input)
  _); (* 2305 *)
  _while l2v8z <= l2v212z[l2v2z].b _do _(
  l2v412z := input@;
  _select
  (l2v412z = eot) _or (l2v412z = '{140'): L2004;
  l2v412z <> l2a2z: _(
  _select (l2v6z = 0) : _if _not g18z _then write( l2v8z:4, ': ');
  (l2v6z > l2v9z): _(
  writeln;
  _if _not g18z _then write(' ':6);
  l2v6z := 0;
  L2031( l2v7z );
  _) (* 2344 *)
  _end;
  write(l2v412z);
  l2v6z := l2v6z + 1;
  _);
  (l2v412z = l2a2z): _(
  _if (l2v6z = 0) _and _not g18z _then write( l2v8z:4, ':');
  writeln;
  l2v6z := 0;
  l2v8z := l2v8z + 1;
  L2031( l2v7z );
  _)
  _end;
  get(input);
  _); (* 2372*)
  _) (* 2374 *)
_);

_proced НАЙ(_var l2a1z:_array[hund] _of integer; _var l2a2z:char); _label 2556;
_var l2v1z, l2v2z, l2v3z, l2v4z, l2v5z, l2v6z: integer; 
l2v7z:_array[1..100] _of char; l2v107z:char;
_proced L2375;
 _(
 _if (input@ = '''') _then _(
 l2v2z := 0;
 get(input);
 (L2402) _(
   _select (input@ = eot) _or (input@ = '{140'): _(
   writeln('НЕТ ВТОРОЙ КАВЫЧКИ');  _GOTO 5322;
   _);
   (input@ = ''''): _(
   get(input);
   _if (input@ = '''') _then _(
   l2v2z := (l2v2z + 1);
   l2v7z[l2v2z] := input@;
   get(input);
   _) _else _exit L2402;
   _);
   true:_( l2v2z := (l2v2z + 1); l2v7z[l2v2z] := input@; get(input) _)
   _end;
 _goto L2402;
   _);
 _if (l2v2z = 0) _then _( writeln('ДЛ=0'); _GOTO 5322 _)
   _) _else _( writeln('НЕТ СТРОКИ В КАВЫЧКАХ'); _GOTO 5322 _)
 _);
_proced L2450;
_(
  l2v107z := input@;
  get(input);
  _select (l2v107z = l2a2z): l2v1z := (l2v1z + 1);
  (l2v107z = eot) _or (l2v107z = '{140') _or (l2v1z > l2v6z) : _(
  _if (l2v4z > (100)) _then l2a1z[0] := (100) _else l2a1z[0] := l2v4z;
  _if _not (l2v6z <= l2v1z) _then  l2v6z := l2v1z;
  writeln('{175ПРОСМОТРЕНЫ СТРОКИ С ', l2v5z:0, ' ПО ', l2v6z:0, '. ВСЕГО ', l2v4z:0, ' ВХОЖДЕНИЙ');
  L1107( (28672) );
  _GOTO 5322;
  _) _end
_);

_( (* НАЙ *)
  l2v5z :=   getnum;
  _if _not (l2v5z <> 0) _then  l2v5z := 1;
  skipsp;
  _if _not (input@ <> ':') _then  get(input);
  l2v6z :=   getnum;
  _if _not (l2v6z >= l2v5z) _then  l2v6z := 100000;
  skipsp;
  L2375;
  skipsp;
  _if _not (input@ = etx) _then  l2a2z := input@;
  l2v1z := 1;
  L1107( g11z );
  reset(input);
  l2v4z := 0;
  2556:
  L2450;
  _if (l2v107z = l2v7z[1]) _and (l2v1z >= l2v5z) _then (a) _(
  l2v107z := input@;
  _if (l2v107z <> l2v7z[1]) _or (l2v2z <= 1) _or (l2v107z = l2v7z[2]) _then _(
 _for l2v3z := 2 _to l2v2z_do _(
  L2450;
  _if (l2v107z <> l2v7z[l2v3z]) _then _exit a
  _);
  l2v4z := (l2v4z + 1);
  write(l2v1z:5);
  _if _not (l2v4z > (100)) _then  l2a1z[l2v4z] := l2v1z;
  _if l2v4z _MOD 10 = 0 _then writeln
  _)
  _);
  _goto 2556
_);

_proced ВСТ(_var l2a1z:char);
_var l2v1z, l2v2z, l2v3z, l2v4z, l2v5z, l2v6z, l2v7z, l2v8z:integer;
l2v9z:char;
l2v10z:boolean;
_(
 l2v5z :=   getnum;
 _if (l2v5z < 1) _then _( writeln('НЕТ НОМЕРА СТРОКИ'); EXIT _);
 l2v3z := 0;
 l2v4z := ;
 l2v1z := ;
 l2v2z := ;
 l2v10z := true;
 L1107( g11z );
 reset(input);
 rewrite(output);

_repeat
l2v9z := input@;
_if _not (l2v9z <> l2a1z) _then  l2v1z := (l2v1z + 1);
l2v3z := (l2v3z + 1);
 output@ := l2v9z;
 put(output);
 get(input);
_until (l2v1z = l2v5z) _or (l2v9z = '{140') _or (l2v9z = eot);
  _if (l2v1z <> l2v5z) _then l2v10z := false _else _(
 reset(F);
  _while (F@ <> '{140') _and (F@ <> eot) _and (l2v4z < (60000)) _do _(
  output@ := F@;
  _if _not (F@  <> l2a1z) _then  l2v2z := (l2v2z + 1);
 l2v4z := (l2v4z + 1);
 put(output);
 get(F);
  _);
  l2v3z := (l2v3z + l2v4z);
  l2v1z := (l2v1z + l2v2z);
   _while (input@ <> '{140') _and (input@ <> eot) _do _(
  output@ := input@;
  _if _not (input@ <> l2a1z) _then  l2v1z := (l2v1z + 1);
  put(output);
  get(input);
  l2v3z := (l2v3z + 1);
  _);
  write('{172{175', ' ':6);
  l2v3z := (l2v3z + 2);
  l2v7z := trunc((l2v3z + 6143) / 6144);
  code(сч75205=ср75224,у0L2735=э07075223,L2735:);
  l2v8z := (10040000260000C);
  _for l2v6z := 0 _to l2v7z-1 _do _(
  l2v8z := l2v8z;
  code(17зч1=17э0701,);
  l2v8z := (l2v8z + 10000000001В);
  _)
  _); (* 2750 *)
  L1102( (29696) );
  rewrite(output);
  L1107( (28672) );
  _if l2v10z _then
  writeln('ВСТАВЛЕНО ', l2v4z:0, ' СИМВОЛОВ (', l2v2z:0, ' СТРОК) ПОСЛЕ СТРОКИ N ', 
  l2v5z:0, ' .{214ВСЕГО СТРОК ', l2v1z:0, ', СИМВОЛОВ ', l2v3z:0, ' (', l2v7z:0, ' ЗОН)')
  _else  writeln('НЕТ СТРОКИ N ', l2v5z:0 );
_);

_function getoct:integer;
_var l2v1z:integer;
_(
 l2v1z := 0;
 skipsp;
  _while input@ < '8' _do _( l2v1z := l2v1z * 8 + ord(input@); get(input) _);
 skipsp;
 getoct := l2v1z;
 _);

_proced ТРА;
_var l2v1z, l2v2z:integer;
_(
  _if input@ = etx _then _(
  l2v2z := 0;
  _for l2v1z := 8 _to 22 _do code(2сч3=э062130,2цс4=2зч4,);
  _) _else _(
  l2v1z :=   getoct;
  _if (l2v1z < 8) _or (l2v1z > 23) _then _( writeln('БОЛЬШОЙ РАЗМАХ !'); EXIT _);
  _if (l2v1z = 27В) _then _( writeln('НЕ РУБИ СУК !'); EXIT _);
  code(2сч3=э062130,2зч4=);
  _);
  writeln('ОСВОБОЖДЕНО ', l2v2z:0, ' ТРАКТОВ');
_);

_proced L3101(l2a1z:integer);
_var l2v1z:integer; l2v2z:alfa;
_(
  _if (l2a1z < 30В) _or (l2a1z > 67В) _then _(
  mapia( l2a1z, l2v2z );
  write('ОТКАЗ ОТ НУ=');
  ГГ( l2v2z , ' !!!' );
  writeln;
  _GOTO 5322;
  _);
  l2v1z := (2000770000000000C);
  (* l2a1z := ((l2a1z << 36) | l2v1z); *)
  code(2сч3=сд/-44/,2лс4=2зч3,2э0723=,);
 _);
(*=m-*)
_function L3123(l2a1z:integer):alfa;
_var l2v1z, l2v2z, l2v3z:integer;
l2v4z:unp6; l2v10z:alfa;
_(
 l2v3z := (303240C);
 _for l2v1z := 1 _to 6 _do _(
 l2v2z := trunc(l2a1z / l2v3z);
 l2v4z[l2v1z] := ;
 l2a1z := l2a1z - l2v2z * l2v3z;
 l2v3z := l2v3z _DIV 10;
  _);
 pck(l2v4z[1], l2v10z);
 L3123 := l2v10z;
_);

_proced L3151(l2a1z, l2a2z, l2a3z:integer);
_var l2v1z, l2v2z:alfa; l2v3z:bitset; l2v4z:alfa;
_(
 _if l2a3z = 0 _then  EXIT;
 l2v2z := '    ';
 l2v1z :=   L3123( l2a3z );
  code(2сб7=сд/40/,);
 l2v1z := ;
 _if l2a2z = 0 _then _(
  code(2сч6=э050127,сд/2/=мр,);
 l2v3z := ;
 _if l2a1z _IN l2v3z _then _(
  write('ИМЕЕТСЯ ПАРОЛЬ ');
  _if l2a1z = 0 _then  l2v4z := 'ЗП' _else l2v4z := 'СЧ';
  ГГ( l2v4z );
  writeln(' НА БОБ ', l2a3z:0 );
  EXIT;
  _)
  _);
  code(2сч3=сд/-16/,2зч3=);
  l2a1z := (l2a1z + l2a2z);
  code(уи15=2сч6,э050121=,);
_);

_function L3216(l2a1z, l2a2z, l2a3z:integer):integer;
_var l2v1z, l2v2z, l2v3z:integer; l2v4z:alfa;
_(
  L3216 := 1;
  _if l2a1z <= 0 _then  EXIT;
  l2v4z := L3123( l2a1z );
  l2v2z := 1703607417В;
  l2v3z := 177777В;
  code(2сч12=2сб10,2рб11=);
  l2v1z := ;
  l2v2z := 77В;
  code(2сч5=сд/-6/,2лс10=сд/-44/,2лс7=э050131,); l2v2z := ;
  code(ви16=); l2v3z := ;
 _if (l2v2z = 0) _then _(
  write('БОБИНА ', l2a1z:0, ' ПРИНЯТА');
  _if l2a3z <> 0 _then _(
  l2a3z := l2a2z * 4096 + l2a3z;
  code(э050112=,);
  l2a3z := l2a2z * 4096;
  code(э050113=,сд/30/=);
  l2a3z := ;
  l2a3z := l2a3z * 32;
  write(' (СДВИГ=', l2a3z:0в, ')');
  _);
  writeln;
  L3151( 1, 0, l2a1z );
  L3151( 0, 0, l2a1z );
  _);
 _if l2v2z = 2 _then _(
  _if l2v3z = 0 _then _(
  writeln('БОБИНА ', l2a1z:0, ' ЗАНЯТА');
 _GOTO 5322;
  _);
 L3101( l2v3z );
  _);
 L3216 := l2v2z;
_);

_function L3322(l2a1z:integer):integer;
_var l2v1z, l2v2z, l2v3z:integer;
_(
  l2v1z := 0;
  g14z := ;
  code(2сч4=сд/-14/,э050105=,);
  l2a1z := ;
 _if (l2a1z > 9999) _then _(
  _if _not (l2a1z <> (32767)) _then  _( code(ви16=); g14z := ; _);
  L3322 := l2a1z;
  EXIT;
  _);
  code(=2сч4,сд/-40/=); l2a1z := ;
 _for l2v2z := 1 _to 4 _do _(
  (* l2a1z := (l2a1z * 16); *) code(2сч4=сд/-4/,2зч4=мр,);
  l2v3z := ;
  (*=m+*) l2v1z := l2v1z * 10 + l2v3z;
  _);
  L3322 := l2v1z;
_);

_function L3355(l2a1z:integer):integer;
_var l2v1z, l2v2z:integer;
_(
  L3355 := 0;
  _for l2v2z := 30В _to 67В _do _(
  l2v1z :=   L3322( l2v2z );
  _if (l2v1z = l2a1z) _then _( L3355 := l2v2z; EXIT _)
  _);
_);

_proced L3374(l2a1z, l2a2z, l2a3z:integer);
_var l2v1z:integer;
_(
 _if l2a1z = 0 _then _( writeln('НЕВЕРНЫЙ НОМЕР БОБИНЫ'); _GOTO 5322 _);
  l2v1z :=   L3322( l2a2z );
  _if l2v1z = l2a1z _then _(  writeln('УЖЕ ЕСТЬ'); EXIT  _);
 _if l2v1z <> 0 _then  L3101( l2a2z );
 (L3423) _case L3216( l2a1z, l2a2z, l2a3z ) _of
  0: EXIT;
  1: writeln('НЕТ БОБИНЫ ', l2a1z:0 );
  2: _goto L3423;
  7: writeln('ЧИСЛО ЛЕНТ = 12')
  _end;
  _GOTO 5322;
_);
_proced L3454(l2a1z:integer);
_var l2v1z:_array[1..3] _of alfa; l2v4z:bitset;
_(
  code(=2иа4,15па=ви15,2зч7=уи15,);
  l2v4z := [0];
  code(2лс3=э050202,);
  writeln(l2v1z[1], l2v1z[2], l2v1z[3]);
  _GOTO 5322;
_);

_proced ОБЛ;
_var l2v1z:alfa; l2v2z, l2v3z:integer; l2v4z:bitset;

_proced L3476; _label 3533;
_var l3v1z:integer;
_(
  _while input@ _in letter _do _(
  _while (input@ _in letter) _or (input@ _in digit) _do _( write(input@); get(input) _);
  skipsp;
  _if input@ = dot _then _( write(input@);  get(input); skipsp _);
  _);
  _if (input@ <> '/') _then 3533: _( 
  rewrite(output);
  writeln('НЕТ ХОЗЯИНА');
  _GOTO 5322;
  _);
  write('/');
  get(input);
  skipsp;
  _if _not (input@ _in digit) _and _not (input@ = '.') _then _goto 3533;
  _for l3v1z := 1 _to 6 _do _(
  _if (input@ _in digit) _or (input@ = '.') _then _( write(input@); get(input) _) _else write(dot);
  _);
 write(';000000');
 skipsp;

_);

_( (* ОБЛ *)
  l2v2z := (1200000000004010C);
  code(=зч71777,);
  _if _not (input@ _in letter) _then _(
  writeln('ДАЙ ИМЯ ОБЛ.');
  EXIT
  _);
  L3476;
  l2v3z :=   getoct;
  _if (l2v3z < 30В) _or (l2v3z > 67В) _then _(
  rewrite(output);
  writeln('ОШ. В <НУ>');
  EXIT _);
  code(7па71777=);
  _if (input@ = 'З') _then _(
  l2v2z := (7777777777773777C);  code(7лу=7зч,);
  _);
  l2v4z := [l2v3z-30В];
  code(=сд/60/,);
  l2v1z := 'КЛЮЧАР';
  code(7э063=,ви16=);
  l2v2z := ;
  rewrite(output);
  L3454( l2v2z );
_);

_proced L3643(l2a1z:integer);
_var l2v1z:_array [0..10] _of alfa;
l2v12z:unp6;
l2v18z, l2v19z:integer; l2v20z:alfa;
_(
  code(=2иа4,15па=ви15,2зч25=уи7,);
  (*=c-*)
  l2v1z[1] := l2a1z;
  l2v18z := 13T;
  l2v1z[0] := l2v18z;
  (*=c+*)
  code(ви7=сд/60/,);
  l2v20z := 'КЛЮЧАР';
  code(7э063=,ви16=);
 l2v18z :=;
 _if l2v18z <> 0 _then  L3454( l2v18z );
 l2v19z := 0;
 _for l2v18z := 0 _to 10 _do _(
  unpck( l2v12z[1], l2v1z[l2v18z]);
  _for l2a1z := 1 _to 6 _do _(
  _if (l2v12z[l2a1z] <> '{143') _and (l2v12z[l2a1z] <> ' ') _then  write(l2v12z[l2a1z]);
  _if l2v19z = 6 _then EXIT _else 
  _if l2v19z <> 0 _then l2v19z := l2v19z + 1 _else
  _if l2v12z[l2a1z] = '/' _then  l2v19z := 1;
  _)
  _)
_);

_proced БОБ;
_var l2v1z, l2v2z, l2v3z, l2v4z, l2v5z:integer;
l2v6z:alfa; l2v7z:boolean;
_(
  l2v7z := false;
  _if input@ = etx _then _(
  writeln('ВАШИ БОБИНЫ -');
  l2v3z := 1;
 _for l2v1z := 30В _to 67В _do _(
  l2v2z :=   L3322( l2v1z );
  _if l2v2z <> 0 _then _(
 mapia( l2v1z, l2v6z );
 ГГ( l2v6z );
 write(' - ');
 _if l2v2z = 32767 _then  write('БУФ', g14z:0 )
 _else _if l2v2z > 9999 _then L3643( l2v2z ) _else write( l2v2z:0 );
  write(' ':3);
  _if l2v3z _MOD 5 = 0 _then writeln; 
  l2v3z := l2v3z + 1;
  _);
  _);  
  writeln;
 exit;
  _);
  _if getcmd( l2v6z) _then _(
  l2v7z := l2v6z = 'БУФ   ';
  _if _not l2v7z  _then _(  writeln(l2v6z, ' - ОШИБКА'); EXIT _);
  l2v1z :=   getnum;
  _if l2v1z = 0 _then _(  writeln('ОШИБКА В ЧИСЛЕ КУСКОВ'); EXIT _);
  _) _else _( (* 4025 *)
  l2v1z :=   getnum;
 _if (l2v1z = 0) _or (l2v1z > (2999)) _then _( 
  writeln('НЕТ БОБИНЫ С ТАКИМ НОМЕРОМ'); EXIT _);
  _); (* 4037 *)
  l2v2z :=   getoct;
  l2v5z :=   getoct;
  _if (l2v2z = 0) _and _not l2v7z _then _(
  l2v2z :=   L3355( l2v1z );
  _if l2v2z <> 0 _then _(
  mapia( l2v2z, l2v6z );
  write('БОБИНА ', l2v1z:0, ' ИМЕЕТ НУ='); ГГ( l2v6z );
  writeln; EXIT
  _);
  writeln('БОБИНЫ ', l2v1z:0, ' В ЗАДАЧЕ НЕТ');
  EXIT
  _);
  _if (l2v2z < 30В) _or (l2v2z > 67В) _then _( writeln('ОШИБКА В <НУ>'); EXIT _);
  _if l2v2z = 40В _then _( writeln('А ВОТ ЭТОГО НЕЛЬЗЯ !'); EXIT _);
  _if l2v7z _then _(
  l2v2z := l2v2z * 4096 + 2000000В;
  l2v1z := l2v1z * 37В;
  code(2лс4=э050177,);
  l2v1z := ; code(мр=);
  l2v4z := ;
 _if l2v1z > 4 _then _(  writeln('ОШ. В ЭКС.'); EXIT _);
  l2v4z := trunc((l2v4z + 31)/32);
  _case l2v1z _of
  0: writeln('ЕСТЬ');
  1: _( writeln('НЕТ РЕСУРСА У ОС');
  writeln('ИМЕЮЩИЙСЯ РЕСУРС = ', l2v4z:0 );
  _);
  2: _(  writeln('ЗАКАЗ > МАХ');  writeln('МАХ ЗАКАЗ = ', l2v4z:0 ) _);
  3: writeln('УЖЕ ЗАНЯТО 12 НУ');
  4: writeln('ТАКОЙ НУ ЗАНЯТ')
  _end
  _) _else L3374( l2v1z, l2v2z, l2v5z );
_);

_proced РЕС;
_var l2v1z:alfa; l2v2z, l2v3z:integer;
_(
 _if getcmd( l2v1z) _then _(
 _select
  (l2v1z = 'ТРА   '): l2v2z := 1000000В;
  (l2v1z = 'ПАМ   '):  l2v2z := 0;
  true: _( writeln(l2v1z, ' - ОШИБКА'); EXIT _)
  _end;
 l2v2z := sel(getnum, 0, 18) + l2v2z;
 code(=э050177,);
 l2v2z := ;
 code(мр=);
 l2v3z := ;
  _if (l2v2z > 2) _then _(  writeln('ОШ. В ЭКС.'); EXIT _);
  _case l2v2z _of
  0: writeln('СДЕЛАНО');
  1: _( writeln('НЕТ РЕСУРСА У ОС'); writeln('ИМЕЮЩИЙСЯ РЕСУРС : ', l2v3z:0 ) _);
  2: _( writeln('ЗАКАЗ > МАХ'); writeln('МАХ ЗАКАЗ : ', l2v3z:0 ) _)
  _end;
  exit
  _); (* 4303 *)
  writeln('МОЖНО "ТРАК" ИЛИ "ПАМ"');
_);

_proced ОТК;
_var l2v1z:integer;
_(
 l2v1z :=   getoct;
  _if l2v1z = 40В _then _(  writeln('ЭТОГО ДЕЛАТЬ НЕЛЬЗЯ !'); EXIT _);
 L3101( l2v1z );
 writeln('СДЕЛАНО');
_);

_proced ПАР;
_var l2v1z, l2v2z:integer; l2v3z: alfa;
_(
 _if _not getcmd(l2v3z)  _then _(  writeln('НЕТ ПРИЗНАКА'); _GOTO 5322 _);
 l2v1z :=   getnum;
 l2v2z :=   getoct;
 _if (l2v1z = 0) _or (l2v1z > (2999)) _then _(
  writeln('ОШИБКА В НОМЕРЕ БОБИНЫ');
 _GOTO 5322
  _);
 _select
  (l2v3z = 'С     '): L3151( 1, l2v2z, l2v1z );
  (l2v3z = 'З     '): L3151( 0, l2v2z, l2v1z );
  true: _( writeln(l2v3z, '- ОШИБКА'); _GOTO 5322 _)
  _end;
  writeln('ЕСТЬ');
_);

_proced МОТ;
_var l2v1z, l2v2z:integer;l2v3z:alfa; l2v4z:integer;
_(
 l2v4z :=   getnum;
 l2v2z :=   getoct;
  _if (l2v4z = 0) _or (l2v4z > 2047) _then _( writeln('ОШИБКА В НОМЕРЕ БОБИНЫ'); EXIT _);
  l2v1z :=   L3355( l2v4z );
  _if (l2v1z = 0) _then _( writeln('БОБИНЫ ', l2v4z:0, ' В ЗАДАЧЕ НЕТ'); EXIT _);
  l2v3z := '.0';
  code(2лс3=сд/-14/,2лс4=сд/-30/,2зч5=2э0725,);
  writeln('СДЕЛАНО');
 _);
(*=m-*)
_proced НАП;
_var l2v1z, l2v2z:integer;
_(
 l2v2z :=   getoct;
 _if (l2v2z < 10В) _or (l2v2z > 67В) _then _( writeln('ОШИБКА В <НУ>');  exit _);
 l2v1z :=   L3322( l2v2z );
 write('БОБИНА ');
  _if l2v1z = 32767 _then  write('БУФ', g14z:0) _else _(
  write( l2v1z:0 );
 l2v2z := l2v2z * 4096;
  code(э050113=,сд/30/=);
  l2v1z := ;
  write(' (', l2v1z*32:0в, ')');
  _);
  writeln
_);

_proced L4507;
_var l2v1z:integer; l2v2z:bitset;
_(
  code(э0650=,уи7=7э06540,);
 l2v2z := ;
  l2v2z := l2v2z _mod [0..47];
 l2v1z := sel(l2v2z, 0, 16) * 192 _DIV 460;
  writeln('ОСТАЛОСЬ ', trunc(l2v1z / 100):0, '.', l2v1z _MOD 100:0, ' М. БУМАГИ');
 _);

_proced SYS; _label 4613;
_const rdpg32 =  001032Т; rdpg34 =  001034Т;
_var l2v1z, l2v2z:integer;
l2v3z, l2v4z:alfa;

_proced L4541(l3a1z:integer); _( l3a1z := l3a1z + rdpg32; code(3э0703=,) _);

_function L4546:alfa;
_(
   code(иа64000=сч1532,иа64000=ср1375,);
   L4546 := ;
_);

_proced L4553(l3a1z:integer; l3a2z: boolean);
_var l3v1z:integer;
_(
  l3v1z := rdpg34;
  code(3цс3=зч75211,3сч4=у076002,ав13=зч75212,);
 _);
(*=m+*)
_function L4565:alfa;
_var l3v1z:alfa; l3v2z, l3v3z:integer;
_(
 l3v2z := 1;
 l3v1z := '      ';
  _while (input@ _in letter) _and (l3v2z < 7) _do _(
  l3v3z := (6 - l3v2z) * 8;
  l3v2z := l3v2z + 1;
  ins(l3v1z, input@, l3v3z, 8);
  get(input);
  _);
 L4565 := l3v1z;
_);

_( (* SYS *)
  4613: code(в;ф=L1213,к;); bind('? {377'); code(е;к;);
  _if input@ = etx _then code(пб76002=,);
  _if input@ _in digit _then _(
  l2v1z :=   getoct;
  _if (l2v1z < 270000C) _or (l2v1z > 677777C) _then _(
  writeln('ОШИБКА В <НУ>');
  _goto 4613
  _);
  L4541( l2v1z );
  l2v3z :=   L4546;
  writeln(l2v3z);
  _) _else _if input@ _in letter _then _(
   l2v3z :=   L4565;
  _if (l2v3z = 'КОНЕЦ ') _then _(  writeln('НЕЛЬЗЯ'); _goto 4613 _);
  code(сч76012=); l2v1z := ;
  L4553( sel(l2v1z, 0, 18), true );
  reset(input);
  _while input@ <> eot _do _(
  l2v4z :=   L4565;
  _if l2v3z = l2v4z _then _(
   get(input);
  write(l2v4z, ' - ');
  l2v1z :=   getoct;
  get(input);
  l2v2z :=   getoct;
  mapia( l2v1z, l2v4z );
  l2v4z := l2v4z;
  code(сд/-40/=);
  l2v4z := ;
  mapia( l2v2z, l2v3z );
  ins(l2v4z, l2v3z, 0, 32);
   write(l2v4z, ' (');
  get(input);
  l2v2z :=   getoct;
  mapia( l2v2z, l2v4z );
  ГГ( l2v4z, ')' );
  writeln;
  _goto 4613
  _) _else _while input@ <> '^' _do get(input);
  get(input)
  _); (* 4736 *)
  writeln('ИМЯ ', l2v3z, ' НЕ НАЙДЕНО');
  _) _else _( writeln(input@, ' - ОШИБКА'); _goto 4613 _);
  _goto 4613
_);
(*=m-*)
_proced L4756(l2a1z, l2a2z, l2a3z:integer);
_const c = 435;
_var l2v1z, l2v2z, l2v3z:integer;
_(
  _for l2v1z := l2a2z _to  l2a3z _do write( l2a1z:4, '-', l2v1z:1, ' ');
  writeln;
  _for l2v1z := l2a2z _to l2a3z _do _(
  l2v2z := l2a1z * 8 + l2v1z + c;
  code(уи7=7э065,);
  l2v3z := ;
  l2v2z := sel(l2v3z,0, 12);
  _if (l2v2z < 1) _then write('  СВОБ ') _else write( l2v2z:6, ' ');
  _);
  writeln
_);

_proced ДИС;
_(
  L4756( 0, 0, 3 ); writeln;
  L4756( 5, 0, 7 ); writeln;
  L4756( 6, 4, 7 );
_);

_proced L5042(l2a1z, l2a2z, l2a3z:integer);
_const c = 403;
_var l2v1z, l2v2z, l2v3z:integer;
_(
 _for l2v1z := l2a2z _to  l2a3z _do write( l2a1z:4, '-', l2v1z:1, ' ');
  writeln;
  _for l2v1z := l2a2z _to l2a3z _do _(
  l2v3z := (l2a1z - 3)*8 + l2v1z + c;
  code(уи7=7э065,);
  l2v2z := ;
  l2v3z := sel(l2v2z,0, 12);
  _if (l2v3z < 1) _then write('  СВОБ ') _else write( l2v3z:6, ' ');
  _);
  writeln
_);

_proced МАГ;
_(
  L5042( 3, 0, 3 );  writeln;
  L5042( 4, 0, 3 );
_);

_proced ВЫБ;
_var l2v1z:integer;
_(
  l2v1z :=   getoct;
  code(=уи15,);
  l2v1z := (77700000C);
  code(э062100=,);
  writeln('ЕСТЬ');
_);

_proced ИНФ;
_(
  
 writeln('ИСПОЛНЯЮТСЯ ПРИКАЗЫ :', lf, 
 ' 1. БОБ  [<НБОБ> [<НУ>]]      - ВЫДАЧА <НУ> БОБИН И ИХ ПРИЕМ', lf,
 ' 2. ОТК  <НУ>                 - ОТКАЗ ОТ <НУ>', lf,
 ' 3. ПАР  С/З <НБОБ> <ПАР>     - ПОДТВЕРЖДЕНИЕ ПАРОЛЯ НА БОБИНУ', lf,
 ' 4. МОТ  <НБОБ>  <НЗОН>       - ПОДВОД МЛ К ЗАДАННОЙ ЗОНЕ', lf,
 ' 5. НАП  <НУ>                 - ОПРОС <НУ>', lf,
 ' 6. ТРАК  [ <НУ> ]            - ОСВОБОЖДЕНИЕ ЗАНЯТЫХ ТРАКТОВ', lf,
 ' 7. РЕС  ТРАК/ПАМ  <РЕС>      - ДОЗАКАЗ ТРАКТОВ И ПАМЯТИ', lf,
 ' 8. ОБЛ <ИМЯ>/<ШИФР> <НУ> [З] - ПРИНЯТИЕ ОБЛАСТИ АРХИВА', lf,
 ' 9. ВСТ   <НСТР>              - ВСТАВКА ТЕКСТА ПОСЛЕ ЗАДАННОЙ СТРОКИ', lf,
 '10. НАЙ [N1:N2] ''<ОБРАЗЕЦ>''   - ПОИСК ОБРАЗЦА В ТЕКСТЕ', lf,
 '11. СПИС  [НАЙ]/<N1:N2>       - СПИСОК НАЙДЕННЫХ СТРОК/ДИАПАЗОНА СТРОК', lf,
 '12. АЦПУ  [ОСТ]               - СЧИТЫВАНИЕ БУФЕРА/ОСТАВШИЙСЯ РЕСУРС', lf,
 '13. МАГ                       - ЗАНЯТОСТЬ МАГНИТОФОНОВ', lf,
 '14. ДИС                       - ЗАНЯТОСТЬ ДИСКОВОДОВ', lf,
 '15. ВЫБ  <НОМ. КАНАЛА>        - ВЫБРОС ЗАДАЧИ ИЗ КАТАЛОГА');
_);

_(
 g11z := 4096;
 g15z := 1;
 g19z := true;
 g24z[0] := 0;
 g16z := ptr(57756В);
 g13z := g16z@;
 g16z := ptr(57757В);
 g12z := g16z@;
  _if (g12z = 0) _then  g20z := '{175' _else g20z := chr(g12z);
  g12z := (350000260000C);
  code(зч75203=зч75223,);
  rewrite(output);
  g21z := ptr(57640В);
  g22z := ptr(70001В);
  g22z@ := g21z@;
  _for g12z := 1 _to 6 _do get(input);
  g17z := getcmd(cmd);
  g18z := cmd = 'A     ';
  _if g18z _then _goto 5333;
  writeln('ПАСКАЛЬ-СЕРВИС');
  _if getcmd(cmd) _then _goto 5333;
  5322: L1107( 70000В );
  code(в;ф=L1213,к;); bind('::{146{146{172'); code(е;к;);
  5324: _if _not getcmd( cmd) _then _( writeln('ВЫХОД В ПУЛЬТ'); code(пб76002=,) _);
  5333: _select
  ('ВРЕ   ' = cmd): ВРЕ;
  ('Н     ' = cmd) _or
  ('НАЙ   ' = cmd): НАЙ( g24z, g20z );
  ('С     ' = cmd): L2045( g24z, g20z );
  ('ВСТ   ' = cmd) _or
  ('В     ' = cmd): ВСТ( g20z );
  ('КОН   ' = cmd) _or
  ('F     ' = cmd): code(э062=);
  (cmd = 'ПОЛ   ') _or
  (cmd = 'П     '): _(
  g15z :=   getnum;
  write('ПОЛЕ ВЫДАЧИ: ');
  _if g15z = 0 _then  g15z := 1;
  writeln(g15z:0, ' - ', g15z + 78:0 );
  _);
  ('АЦП   ' = cmd) _or
  ('А     ' = cmd):_if (input@ = 'О') _then L4507 _else  L1553( 0 );
  ('ТРА   ' = cmd): ТРА;
  ('БОБ   ' = cmd): БОБ;
  ('РЕС   ' = cmd): РЕС;
  ('ОТК   ' = cmd): ОТК;
  ('ПАР   ' = cmd): ПАР;
  ('МОТ   ' = cmd): МОТ;
  ('НАП   ' = cmd): НАП;
  ('SУS   ' = cmd): SYS;
  ('ОБЛ   ' = cmd): ОБЛ;
  ('МАГ   ' = cmd): МАГ;
  ('ВЫБ   ' = cmd): ВЫБ;
  ('ДИС   ' = cmd): ДИС;
  ('ПУЛ   ' = cmd):
  code(пбL5500=,c;D5476:10000000400040,D5477:7777,к;L5500:э070D5476=,счD5477=зч37,пб40=,);
  ('ИНФ   ' = cmd): ИНФ;
  ('ППН   ' = cmd): _( g12z := 1; code(зч76013=) _);
  ('ПП    ' = cmd): _( g12z := 3; code(зч76013=) _);
  ('ПА    ' = cmd): _( g12z := 2; code(зч76013=) _);
  ('НП    ' = cmd): _( g12z := 0; code(зч76013=) _);
  true:  writeln('НЕТ ПРИКАЗА ', cmd)
  _end; _goto 5322
_).
