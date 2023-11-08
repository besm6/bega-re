(*=p-,д+*)_program СТАТ;
_label 10543, 10553, 10562, 10602, 10667, 10673;
_const НУ66=66В; c1005=1005В; c1007=1007В; СТАТЗОНА=1011В; c1013=1013В;
ПУСК=5661000b; МОСТ=4661034b; РЕДАК=6400140b; ВОПРОС=6661015b; АДМИН=5400146b;
ШКОЛА=5400132b;  ИГРА=1660730b; СВЯЗЬ=5400162b;
c2=2;ГНУС=736В; ca=401064b; c30=30b; влэвм1='0  итм'; влэвм2=' и вт ';
c76=76b;c32768=32768;c27432=65450b;blank='{146{146{146{146{146{146';
numter='{146(00){172';
sp2='  ';etx='{377';sp=' ';
dot='.';comma=',';cpar=')';minus='-';eq='=';gt='>';star='*';plus='+';
quot='"'; perc='%';
б1='a';б2='б';б3='в';б4='д';б5='и';б6='н';б7='к';б8='о';б9='п';бq='р';бw='с';бe='у';
eol='{175';sp6='      ';prompt=' =-> {172';c8=8; z545=545В;
(*=t-,m-*)
_type 
letter ='a'..'z';
digit=0..9;
bitset=_set _of 0..47;
word=_record _case integer _of 0:(i:integer); 1:(a:alfa); 2:(s:bitset) _end;
page=_array [0..1023] _of word;
unp6=_array [1..6] _of char;
screen=_array [1..212] _of alfa;
area=_array [0..55] _of integer;
twoset=_array[0..1] _of bitset;
mode=(m0, m1, m2, m3);
rec1 = _array [0..2, 1..63] _of word;
struc=_record
g37z, g38z, volNU66:integer;
g40z:boolean;
curVol, g42z:integer;
g43z:boolean;
g44z, remTime:integer;
birthDate:alfa; g47z:integer;
userID:alfa;
gender:integer;
g50z:bitset;
g51z:integer;
g52z:bitset;
sysVol:integer;
g54z, hardCopy:boolean;
awake, echo, g58z:boolean;
statAr:_array[0..39] _of integer
_end;
_var g10z, g11z, g12z:integer;
cmd, g13z:alfa;  g14z:alfa;
x1: alfa;
g15z:boolean;
g16z:boolean;
g17z:boolean;
g18z:integer;
g19z:integer;
x3:integer;
g20z:integer;
g21z, g22z, g23z, g24z, g25z, g26z, g27z, g28z, g29z, g30z:integer;
g31z:@page;
g32z:integer;
g33z, g35z:twoset;
str:struc;
INP, F:text;

_procedure statis(arg:integer);
_var i, l2v2z:integer;
_(
  l2v2z := 1;
  i := str.statAr[arg]; code(2цс5=);  str.statAr[arg] := ; 
  i := str.statAr[0]; code(2цс5=);  str.statAr[0] := ;
  _if (i = 62) _then _(
  writeln('ПРИКАЗЫ КОНЧИЛИСЬ');
  rewrite(INP);
  write(INP,'КОН  {377');
  _GOTO 10673;
  _)
_);

_proced skipsp; _( code(=14ПВ76255,) _);

_proced putInp(a:alfa); _(  rewrite(INP);  write(INP, a); _);

_proced TTIN(lev:integer; fin:boolean); _label 1405;
_var i, j:integer;
_(
  _select
  lev = 1: BIND(' ==> {172');
  lev = 0: (b) BIND;
  lev = 2: (b) BIND(' =-> {172')
  _end;
  _if str.hardCopy _then _(
  code(СЧ76013=УИ7,); i := 2; code(ЗЧ76013=,);
  _select
  lev = 1: гг(' ==> ');
  lev = 2: гг(' =-> ')
  _end
  _);
  rewrite(INP);
  j := 0;
 
 (a) _while input@ <> etx _do _(
  _if str.hardCopy  _then write(input@ );
  j := j + 1;
  _if j > 1200 _then _(
  putInp('SLЕ  {377');
  g17z := true;
  str.g52z := str.g52z + [47];
  _goto 1405
  _);
  INP@ := input@;
  put(INP);
  get(input);
 _);
  _if fin _then _(  INP@ := etx; put(INP); 1405: reset(INP) _);
  _if str.hardCopy _then _(  writeLN; code(ВИ7=ЗЧ76013,) _)
_);


_proced L1413(a:integer);
_var i:integer;
_(
 a := a _div 4;
 _while a > 0 _do _(
 _if a > 2044 _then i := 2044 _else  i := a;
 a := a - i;
 code(2сч4=э0507700,)
  _);
 _);

_proced L1431;
_var i:integer;
_(
 code(Э0634=,);
 i := ;
  _if str.remTime - i < 50 _then _( 
 writeln('ВАШЕ ВРЕМЯ ИСТЕКЛО');
 putInp( 'КОН  {377' );
 _GOTO 10673;
  _)
 _);

_proced more;
_var a:alfa;
_(
  writeLN; L1431; code(СЧ77015=);
 a := ;
 _if a = 'Н{3770000' _then  _GOTO 10543;
_);

_function getNum(base:integer):integer;
 _(
   code(=14пв77463,);
 _);

_proced L1461(a:alfa);
_var l2v1z:unp6; l2v7z:integer;
_(
 unpck( l2v1z[1], a );
  write(sp);
  _for l2v7z := 1 _to 4 _do write(l2v1z[l2v7z]);
 _);

_proced toScreen(_var F:text; _var S:screen);
_var i, j:integer;
u:unp6; c:char;
_(
  reset( F );
  j := 1;
  (loop) _(
  _for i := 1 _to 6 _do _(
  c := F@;
  u[i] := ;
  _if c = etx _then _exit loop;
  get( F );
  _);
  pck(u[1], S[j]);
  j := j + 1;
  _goto loop;
  _);
  _for i := i + 1 _to 6 _do u[i] := sp;
  pck(u[1], S[j]);
_);

_function toHex(i:integer):alfa;
_var a:_array[1..9] _of integer;
_(
  code(=ПБ76324,);
_);

_function date:integer;
_var d:integer;
_(
  code(Э050114=,); d := ;
  date := ((((sel(d, 16, 4)  * 10
            + sel(d, 20, 4)) * 10
            + sel(d, 28, 1)) * 10
            + sel(d, 24, 4)) * 10
            + sel(d, 33, 2)) * 10
            + sel(d, 29, 4);
_);

_proced двецифры(i:integer);
_var j:integer;
_(
  j := i _div 10;
  write(j:1, chr(i - j * 10));
_);

_proced wrOctal(v, l:integer);
_var a:alfa; u:unp6;
_(
  mapia( v, a ); unpck( u[1], a );
  _for v := 7 - l _to 6 _do write( u[v] );
_);

_proced L1634(d:integer);
_var m, y:integer;
_(
  y := trunc(d / 10000);
  d := d - y * 10000;
  m := d _DIV 100;
  d := d - m * 100;
  write(sp);
  двецифры( d );
  write(dot);
  двецифры( m );
  write(dot);
  двецифры( y );
_);

_proced rdpg32(l2a1z, l2a2z:integer);
_( code(=14пв77451,) _);

_proced L1672(l2a1z:boolean; _var l2a2z:page; l2a3z, l2a4z:integer);
 _(
 rdpg32( l2a3z, l2a4z );
 _if l2a1z _then l2a2z := g31z@;
 _);

_proced rdZone(vol, l2a2z:integer);
_var l2v1z:integer; l2v2z, l2v3z, l2v4z:alfa; l2v5z:integer;
_(
  _if (str.curVol <> vol) _then _(
  _if (str.curVol <> 0) _then _(  l2v1z := 205277T;  code(2Э0725=,)  _);
 l2v4z :=   toHex( vol );
  l2v1z := 5277T;
 l2v2z := '00    ';
 l2v3z := '0000{377{377';
 code(2СЧ10=2СБ6,2РБ7=2ЗЧ10,2ЛС5=Э050131,);
 l2v1z := ;
  _if l2v1z = 0 _then str.curVol := vol _else _(
  writeln('РАБОТАТЬ НЕЛЬЗЯ КО=', l2v1z:3);
 _GOTO 10543;
  _)
  _);
 l2a2z := 10320000520000C + l2a2z;
 code(=Э062124,);
_);

_proced L1753;
_const key = 7070700000000в;
_var l2v1z:integer; l2v2z:integer; l2v3z, l2v4z, l2v5z:integer;
_(
  _if g16z _then _(
  g16z := false;
  g12z := ;
  x1 := ;
  l2v2z := ord(ref(x1));
  code(уи15=); l2v2z := key; code(э050165=,ви16=сд/-44/,); l2v2z := ;
  _for l2v3z := 1 _to 3 _do _( code(2сч4=сд/-4/,2зч4=мр,); l2v4z := ;
  g12z := g12z * 10 + l2v4z;
  _);
  rdZone( str.sysVol, ГНУС );
  l2v1z := 32767;
  l2v5z := ord(ref(g19z));
  code(уи7=16па64000,16сч13=сд/30/,7зч=16сч3,2лу3=7зч1,16сч4=сд/30/,7зч2=16сч12,2лу3=7зч3,16сч12=сд/30/,7зч4=16сч11,сд/30/=7зч5,16сч11=2лу3,7зч6=);
  code(16сч=2лу3,7зч7=16сч10,2лу3=7зч10,16сч3=сд/30/,7зч11=16сч35,сд/30/=7зч12,16сч2=2лу3,7зч13=16сч3,2лу3=7зч14,);
  _); 
_);

_proced L2013(_var l2a1z, l2a2z:alfa);
_var l2v1z:unp6;
l2v7z:boolean; l2v8z:integer; 
_(
 cmd := l2a1z;
  code(7памаска=,7сб=сд/40/,7зч1=7са1,ви7=э050104,7сч=7пб2,а;маска:    00,000000,000000,к;);
  g13z := ;
  unpck(l2v1z[1], g13z);
  l2v7z := false;
  _for l2v8z := 1 _to 6 _do _if l2v1z[l2v8z] = comma _then  l2v7z := true;
  _if (g13z = '000000') _or l2v7z _then _(
  l2a1z := 'НЕТ ТА';
  l2a2z := 'КОГО  ';
  EXIT;
  _);
 l2a1z := g13z;
  code(7сч1=); l2a2z := ;
_);

_function getCmd(_var l2a1z:alfa; l2a2z:integer):boolean;
_var a:_array[1..7]_of alfa;
_(
  code(=14пв77400,);
 _);

_proced БЭСМ; _label 2116, 2351;
_var l2v1z:integer; cmd, x3:alfa; x4: integer;
l2v2z, l2v3z, l2v4z, l2v5z: integer;
l2v6z:boolean;
l2v7z:bitset; u:unp6;

_proced L2066(l3a1z:integer);
 _(
 wrOctal( l3a1z, 4 );
 more;
 _);

_( (* L2076 *)
 statis( 5 );
 L1753;
 l2v6z := true;
 g32z := 2T;
 l2v7z := ;
  _if (card(l2v7z) > 1) _then _( ГГ('МАШИНА'); writeln(g18z:2) _);
  _if INP@ = etx _then _goto 2351;
  2116: _if getCmd(cmd, 3) _then _(
  _select
  'РЕС   ' = cmd: _(
   l2v6z := false;
 l2v4z := 0;
 l2v5z := ;
 write('  СВОБОДНЫЕ РЕСУРСЫ (8){175ЛИСТЫ ОЗУ = ');
 l2v3z := (128);
 _for l2v1z := 0 _to 3 _do _(
  l2v2z := (g24z + l2v1z);
  code(УИ7=7Э065,);  l2v7z := ;
  l2v3z := (l2v3z - card(l2v7z));
  _);
  wrOctal( l2v3z, 4 );
  write('  ДЛЯ ЗАК = ');
 l2v2z := g29z;
  code(УИ7=7Э065,); l2v2z := ;
 L2066( l2v2z );
 l2v2z := g27z;
  code(УИ7=7Э065,); l2v4z := ;
 write('ТРАКТЫ МБ = '); wrOctal( l2v4z, 4 );
   write('  ДЛЯ ЗАК = ');
 l2v2z := g30z;
  code(УИ7=7Э065,); l2v2z := ;
 L2066( l2v2z );
 l2v2z := g28z;
  code(УИ7=7Э065,); l2v5z := ;
 write('ТРАКТЫ МД = '); L2066( l2v5z );
 l2v3z := g19z;
  code(УИ7=7Э065,); l2v7z := ;
  write('КУСКИ  МД = ');  L2066( card(l2v7z) );
  _); (* 2203 *)
  'РЕЖ   ' = cmd: _(
   l2v6z := false;
 write('  УСТАНОВЛЕНЫ РЕЖИМЫ{175');
 l2v3z := g20z;
  code(УИ7=7Э065,);
 cmd := ;
 _if sel(cmd, 15, 1) = 1 _then write('ОТЛАДОЧНЫЙ ') _else write('СЧЕТНЫЙ ');
 ГГ( 'РЕЖИМ{175' );
 ГГ( 'РЕЖИМ ' );
 _if sel(cmd, 16, 1) = 1 _then ГГ( '"МИН"' ) _else  ГГ( '"ПРТ"' );
 more;
  _if sel(cmd, 20, 1) = 1 _then _(  write('ИСПОЛНЕН "СТОП"'); more _);
  _); (* 2242 *)
  'ВВО   ' = cmd: _(
  l2v6z := false;
  write('  СОСТОЯНИЕ ВВОДА');  more;
  rdZone (str.sysVol, 545В);
  l2v3z := 0;
  _for l2v2z := 1040В _to 1077В _do _(
  cmd := g31z@[l2v2z].a;
  _if cmd <> '000000' _then _(
  x3 := shift(cmd, 24); code(мр=); cmd := ;
  _if cmd <> '000000' _then l2v3z := l2v3z + 1;
  _if x3 <> '000000' _then l2v3z := l2v3z + 1;
  _)_);
  write('ЗАНЯТО ');  wrOctal(l2v3z, 4);  write(' ЗОН');  more;
  _);
  'ВЫВ   ' = cmd: _(
   l2v6z := false;
 write('  СОСТОЯНИЕ ВЫВОДА');
 more;
 l2v3z := g20z;
  code(УИ7=7Э065,сд/-53/=);
 l2v7z := ;
 _if (card(l2v7z) > 0) _then _(
  _if (4 _IN l2v7z) _then ГГ( 'НЕТ А0', sp6 );
  _if (2 _IN l2v7z) _then ГГ( 'НЕТ А1', sp6 );
  _if (3 _IN l2v7z) _then ГГ( 'НЕТ ПИ', sp6 );
  _if (1 _IN l2v7z) _then ГГ( 'НЕТ ПЛ', sp6 );
  more;
  _);
  l2v3z := g23z;
  code(УИ7=7Э065,);
  cmd := ;
  write('НАКОПЛЕНО ');  wrOctal( sel(cmd, 12, 10), 4 ); write(' ЗОН ДЛЯ ВЫВОДА');
 more;
 cmd := cmd;
  code(сд/-53/=);
 l2v7z := ;
  _if (card(l2v7z) > 0) _then _(
   write('ИДЕТ ВЫВОД НА ');
  _if (4 _IN l2v7z) _then write( 'А0 ' );
  _if (2 _IN l2v7z) _then write( 'А1 ' );
  _if (3 _IN l2v7z) _then write( 'ПИ ' );
  _if (1 _IN l2v7z) _then write( 'ПЛ ' );
  more;
  _);
  _); (* 2347 *)
  'ВСЕ   ' = cmd: _(
  2351:
  write('ВЕРСИЯ ОС - ', g12z:1);
  _if (g12z > 100) _and (x1 <> '000000') _then _(
  unpck(u[1], x1);
  write(' ОТ ', u[1], u[2], dot, u[3], u[4], dot, u[5], u[6]);
  _);
  more;
  putInp( 'РЕС,РЕ' );
  write(INP,'Ж,ВВО,ВЫВ{377');
  reset(INP);
  _goto 2116;
  _);
  true: _(
  writeln('НЕВЕРНЫЙ ПАРАМЕТР = ', cmd);
  writeln('МОГУТ БЫТЬ: РЕС, РЕЖ, ВВО, ВЫВ, ВСЕ');
  exit
  _)
  _end;
  _) _else _( writeln('НЕПОНЯТНО'); exit _);
  _if INP@ = comma _then _( get(INP); _goto 2116 _);
_);

_proced sort(_var a1, a2:area; L:integer; b: boolean);
_var i, a, j, l2v4z:integer; l2v5z: boolean;
_(
  _for i := 1 _to L _do a1[i] := i;
  l2v4z := 1;
  _if b _then (loop) _(
  l2v5z := false;
  L := L - 1;
  _for i := l2v4z _to L _do _(
  j := i + 1;
  _if a2[i] < a2[j] _then _(
  a := a2[j];  a2[j] := a2[i];  a2[i] := a;
  l2v5z := true;
  a := a1[j];  a1[j] := a1[i];  a1[i] := a;
  _);
  _);
  l2v4z := l2v4z + 1;
  _for  i := L _downto l2v4z _do _(
  j := i - 1;
  _if a2[j] < a2[i] _then _(
  a := a2[j];  a2[j] := a2[i];  a2[i] := a;
  l2v5z := true;
  a := a1[j];  a1[j] := a1[i];  a1[i] := a;
  _);
  _);
  _if l2v5z _then _goto loop;
  _);
_);

_proced L2741(l2a1z, l2a2z:integer);
_var l2v1z:integer; l2v2z:real;
_(
  _if (l2a2z = 0) _then _(  write( '-00-':5 ); EXIT  _);
  l2v2z := l2a1z * 100 / l2a2z;
  l2v1z := trunc(l2v2z);
  write( l2v1z:3, dot, chr(trunc((l2v2z-l2v1z)*10)));
_);

_procedure СТАТЕР;
_var
l2v1z, l2v2z, l2v3z, l2v4z, l2v5z, l2v6z, l2v7z, l2v8z, l2v9z, l2v10z: integer;
l2v11z, l2v12z, l2v13z, l2v14z, l2v15z:integer; p:@page;
l2v16z:boolean;
l2v18z:boolean; l2v19z: boolean; l2v20z:@rec1; bs1, bs2: bitset;
a1, a2:_array[0..7] _of integer; 
pg:page;

_function L2563(l3a1z:integer):alfa; _label 2604, 2625;
_var l3v1z, l3v2z:integer; l3v3z: bitset; l3v4z: alfa;
_(
 l3v4z := ' - ';
  _for l3v1z := l2v12z _to l2v11z _do _(
  l3v2z := shift(l2v20z@[0, l3v1z].i, 40);
  _if l2v18z _and (l3v2z < l3a1z) _then _( l2v12z := l3v1z;  l2v18z := false _) _else _(
  _select
  (l3v2z = l3a1z): _(
  _if l2v16z _then _(
 2604:
  l3v4z := shift(l2v20z@[2, l3v1z].a, 24);
  _goto 2625
  _) _else _(
  l3v3z := l2v20z@[1, l3v1z].s;
 _if (l2v10z _IN l3v3z) _then  _goto 2604;
  _);
  _);
  (l3v2z > l3a1z) : _goto 2625
  _end
  _);
  _);
  2625:
 L2563 := l3v4z;
 _);

_proced L2627(l3a1z:integer);
_const foo = 77777777В;
_var l3v1z, l3v2z, l3v3z:integer;
 _(
 write('*  ');
 l2v18z := true;
 _for l3v1z := 0 _to 2 _do _(
 l3v2z := l3v1z * 8 + l2v7z + l3a1z;
 _if (l3v2z <= 24) _then _(
   wrOctal( l3v2z, 2 );
 ГГ( '-(' );
 ГГ(   L2563( l3v2z) );
   l3v3z := p@[l3v2z].i;
   l2v6z := shift(l3v3z, 15);
   l2v14z :=l2v14z + l2v6z;
   write(cpar);
   l3v3z := l3v3z _mod 32768;
   _if l2v19z _then L2741(l3v3z, l2v15z) _else write(l3v3z: 5 );
   write( l2v6z :4  );
 ГГ( '  *  ' );
   _);
   _);
 more;
 _);

_( (* СТАТЕР *)
  l2v16z := true;
 bs1 := [1];
 bs2 := ;
 l2v14z := 0;
  l2v15z := ;
 _if INP@ _in digit _then _(
  l2v9z :=   getNum( 10 );
  l2v16z := false;
 _if _not (l2v9z _IN bs2) _then _( 
  writeln('НЕТ МАШИНЫ ', l2v9z:1 );
  exit
  _)
 _);
  skipsp;
  l2v19z := INP@ = perc;
  L1672( false, pg, НУ66, СТАТЗОНА );
  l2v4z := g31z@[1].i;
  l2v11z := g31z@[8].i;
 write('{175СТАТИСТИКА ПО ТЕРМИНАЛАМ{175С');
 L1634( l2v4z );
 ГГ( ' ПО ' );
 L1634(   date  );
 writeLN;
 p := ptr(65000В);
 l2v20z := ptr(65500В);
 l2v3z := 0;
 l2v1z := ;
 _while bs2 <> [] _do _(
  l2v2z := minel(bs2);
  bs2 := bs2 - [l2v2z];
  a1[l2v2z] := l2v3z;
  l2v3z := (l2v3z + 64);
  l2v1z := (l2v1z + 1);
  a2[l2v2z] := l2v1z;
  _);
  _if _not l2v16z _then _(
  ГГ( 'МАШИНА' );
  writeln( l2v9z:2 );
  l2v10z := a2[l2v9z];
  _) _else  _if (card(bs1) > 1) _then writeln('ВСЕ МАШИНЫ');
  l2v12z := 1;
  l2v13z := a1[l2v9z];
  _for l2v1z := 1 _to 24 _do _(
  _if l2v16z _then 
  p@[l2v1z].i := p@[l2v1z].i + p@[l2v1z + 64].i + p@[l2v1z+128].i
  _else
  p@[l2v1z].i := p@[l2v1z + l2v13z].i;
  _if l2v19z _then _(
  l2v3z := p@[l2v1z].i _mod 32768;
  _if _not (l2v3z <= l2v15z) _then  l2v15z := l2v3z;
  _);
  _);
  l2v8z := 24 _div 24;
  _if 24 - l2v8z * 24 > 0 _then l2v8z := l2v8z + 1;
  _for l2v2z := 1 _to l2v8z _do _(
  l2v7z := (l2v2z-1) * 24;
  _for l2v3z := 1 _to 8 _do L2627(l2v3z);
  more;
  _);
  writeln('ВСЕГО ВЫЗОВОВ ДЖИНА ', l2v14z:1);
_);

_proced L3071(l2a1z:integer);
_var l2v1z, l2v2z:integer;
_(
 l2v1z := trunc(l2a1z / 3600);
  l2a1z := l2a1z - l2v1z * 3600;
  l2v2z := l2a1z _div 60;
 l2a1z := l2a1z - l2v2z * 60;
 двецифры( l2v1z );
  write(dot);
 двецифры( l2v2z );
  write(dot);
 двецифры( l2a1z );
 _);

_proced СТАПРИ; _label 3275, 3255;
_const foo = 3774T;
_var l2v1z:@area; l2v2z:area;
l2v58z:page; l2k82z:char;
l2k83z:bitset;
l2k84z, l2k85z, l2k86z:integer;
l2k87z:integer;
l2k88z, l2k89z:integer;
l2k90z, l2k91z, l2k92z:integer;
l2k93z, l2k94z:alfa;
sorted:boolean;
l2k96z:_record f1, f2, f3, f4: _array[1..9] _of bitset _end;

_proced L3352(l3a1z:alfa; l3a2z:integer);
_var l3v1z:integer;
_(
  l3v1z := l2v1z@[l3a2z]*64 + l2v1z@[l3a2z+1];
  write(sp:3); ГГ(l3a1z); write(eq, l3v1z:5);
_);

_proced L3130(l3a1z:integer);
_var l3v1z:integer; l3v2z, l3v3z:bitset;
_(
 l2k85z := l2v1z@[l3a1z];
 l2k86z := l2k86z + l2k85z;
  write( l3a1z:4 );
  write( l2k85z:5 );
  write( sp );
 l3a1z := l2v2z[l3a1z];
 l3a1z := l3a1z + 1;
 code(сд/1/=); l3a1z := ;
 code(мр=сд/10/,); l3v1z := ;
  l3v2z := l2k96z.f1[l3a1z];
 l3v3z := ;
 _if l3v1z = 0 _then  l3v3z := shift(l3v3z, 24);
  l3v2z := l3v3z * [24..47];
 ГГ( l3v2z );
  write( sp:3 );
 _);

_( (* 3166 *)
  L1672( false, l2v58z, НУ66, СТАТЗОНА );
 sorted := false;
 l2k83z := [];
  _while INP@ <> etx _do _(
   l2k82z := INP@;
   l2k87z := 0;
   _if getCmd( l2k93z, 3) _then _(
  _if l2k93z = 'ВСЕ   ' _then _( l2k83z := [1..9]; _goto 3275 _);
  _select
  (l2k82z = 'Д') :  l2k87z := 1;
  (l2k82z = 'В') :  l2k87z := 2;
  (l2k82z = 'Р') :  l2k87z := 3;
  (l2k93z = 'СИС   '):  l2k87z := 8;
  (l2k82z = 'И') :  l2k87z := 5;
  (l2k82z = 'Б') :  l2k87z := 6;
  (l2k82z = 'А') :  l2k87z := 7;
  (l2k82z = 'С') :  l2k87z := 4;
  (l2k82z = 'П') :  l2k87z := 9;
  (l2k82z = 'У') :  sorted := true;
   true: _(
  l2k93z := shift(l2k93z, 24);
  ГГ( l2k93z );
 3255:
 writeln(' - ОШИБКА'); exit
   _)
  _end;
  l2k83z := [l2k87z] | l2k83z;
  _) _else (* 3265 *)
  _if (INP@ = comma) _then _(  get(INP); skipsp _) _else _(  write(INP@);  _goto 3255 _);
  3275:; _); (* 3276 *)
  
  l2k83z := (l2k83z - [0]);
  _if l2k83z = [] _then  l2k83z := [1];
  l2k84z := 18;
  code(зч76422=);
  _while l2k83z <> [] _do _(
  l2k87z := minel(l2k83z);
  l2k83z := l2k83z - [l2k87z];
  l2k90z := 1;
  _if l2k87z = 1 _then l2k88z := 12 _else l2k88z := 7;
  _case l2k87z _of
  1: _(
  l2k88z := 12;
  l2k90z := 0;
  l2k94z := 'ДЖИН  ';
  l2k96z := [ 'ИНФШКО','ПОЧНОВ','БЭСТЕР','ЛЕНДИС','КТОГДЕ','ШИФПАР','ВЦПВРЕ','ДАТКАЛ','ПЕЧЭКР',
  'ИДИПАУ','ВЫЗСЕТ','ПАКСТА','БЮДВОП','БИБГРА','АРИАДМ','ИГРРЕД','СВЯЖУР','СИСКОН'];
  _);
  2: _(
  l2k94z := 'ВОПР  ';
  l2k96z := [ 'ИНФШКО', 'ВОПФРА', 'ЗАПАНК', 'ВЫПБЕС', 'ПОГ - ', ' -  - ', ' - ЗАМ', 'ОБДОСК',
  'НОТДЕЛ', 'НЕПСЛЖ', 'КРА - '];
  _);
  3: _(
  l2k94z := 'РЕДАК ';
  l2k96z := [ 'ИНФШКО', 'УСТСЧИ', 'ПОКНАЙ', 'ЗАМЗАП', 'СРАПЕР','РЕЖСКИ',  'ЕЛОТИП', 'ПОЛМАГ',
  'ВЦП - ', 'ПЕЧЭКР', 'ИДИ - ' ];
  _);
  4: _(
  l2k94z := 'СВЯЗЬ ';
  l2k96z := [ 'ИНФШКО', 'АРХПЕР', 'ПОКИКА', 'ГРАА-Д', 'Д-АД-Б', 'Б-ДА-Б', 'Б-А - ', ' -  - ',
  ' -  - ', 'ПЕЧЭКР', ' -  - '];
  _);
  5: _(
  l2k94z := 'ИГРА  ';
  l2k96z := [ 'ИНФШКО', 'LАNШАШ', 'КРЕКАЛ', 'УЗОБЕГ', 'ЛОТПОС', 'ТУРКУБ', 'ГЛИИНС', 'ПЕЩ - ',
  ' -  - ', 'ПЕЧЭКР', ' -  - ' ];
  _);
  6: _(
  l2k94z := 'БИБЛ  ';
  l2k96z := ['ИНФШКО', 'ОБЗВЫС', 'ЖУРРОМ', 'ПРЕАВТ', 'ЮМОДОЛ', 'РУБНОВ', 'СПРСИГ', 'СФ1СФ2',
  'СФ3*!*', 'ПЕЧЭКР', 'ИДИ - '  ];
  _);
  7: _(
  l2k94z := 'АДМИН ';
  l2k96z := ['ИНФНОВ', 'ИСКПАР', 'УНИУПО', 'КОРШИФ', 'ИГРРЕГ', 'ПРОФЛА', 'АНКДЕЛ', 'СЕТДИМ',
  'СТО - ', 'ПЕЧЭКР', ' -  - ' ];
  _);
  8: _(
  l2k94z := 'СИСТ  ';
  l2k96z := [ 'ИНФШКО',  'АДРИПЗ', 'КАЧПОТ', 'ПАМОЗУ', 'ОБМЗАХ', 'НЕРВЦП', 'ТИПФОР', 'ЛИСПОК',
   ' -  - ', 'ПЕЧЭКР', 'ИДИ - ' ];
  _);
  9: _(
  l2k94z := 'ПЛАН  ';
  l2k96z := [ 'ИНФШКО', 'УСТПРО', 'НАЙФОР', 'КАТСЛУ', 'СЧИЗАП', 'ИСКВВЕ', 'ЗАГПОК', 'УПОКАТ',
 'ИСПРАЗ', 'ТИПДОК','ЛИС - '];
  _)
  _end;
  l2k89z := l2k88z * 3;
  l2k90z := (l2k89z + l2k90z);
  write('СТАТИСТИКА ПО ПРИКАЗАМ БЛОКА ', l2k94z);
  code(иа64001=сч,); l2k92z := ;
  l2v1z := ptr(l2k87z * 40 + 64000в);
  l2k91z := l2v1z@[l2k90z];
  sort( l2v2z, l2v1z@, l2k89z, sorted );
  write('{175С ');
  L1634( l2k92z );
  write(' ПО ');
  L1634(   date  );
  more;
  l2k86z := 0;
  _for l2k84z := 1 _to l2k88z _do _(
  L3130( l2k84z );
  L3130( l2k84z + l2k88z );
  L3130(2 * l2k88z + l2k84z);
  more;
  _);
  write('ВСЕГО ВЫХОДОВ', l2k91z:7, sp:5, 'ВСЕГО ПРИКАЗОВ', l2k86z:6);
  more;
  _if l2k87z = 3 _then _(
  L3352( 'СЧИЗОН', 24 );
  more;
  L3352( 'СЧИЗОН', 26 );
  ГГ( '(ТЕСТ)' );
  more;
  L3352( 'ЗАПЗОН', 28 );
  more;
  _);
  _if l2k87z = 6 _then _(
  L3352 ('ПУНК', 24);
  L3352 ('  КАРТ', 26);
  L3352 ('  ТРЕБ', 28);
  more
  _);
  _if l2k83z <> []  _then  more;
  _);
_);

_proced СТАСУМ;
_var l2v1z:page;l2k25z:@page;
l2k26z, l2k27z, l2k28z, insert, l2k29z, l2k30z, l2k31z, l2k32z, l2k33z, l2k34z, l2k35z:integer;
l2k36z:_array [2..9] _of integer; l2k44z, l2k45z:integer;
l2k46z:_array [2..9] _of integer; l2k54z:integer;
l2k55z : _record f: _array [1..10] _of alfa _end;
_(
  L1672( false, l2v1z, НУ66, СТАТЗОНА );
  l2k25z := ptr(64000В);
  write('СУММАРНАЯ СТАТИСТИКА{175      С ');
  L1634( l2k25z@[1].i );
 ГГ( '  ПО ' );
 L1634(   date  );
 writeLN;
 writeln(' БЛОК   СУМ ВЦП  ВРЕМ СЕАНСОВ  СЕАН/ВЦП');
  l2k33z := l2k25z@[2].i;
 l2k44z := ;
  l2k34z := l2k25z@[3].i;
  l2k54z := ;
  l2k30z := l2k25z@[4].i;
  l2k29z := l2k25z@[13].i;
  l2k31z := 0;
  l2k32z := ;
  _for  l2k26z := 2 _to 9 _do _(
 l2k25z := ptr(l2k26z*40 + 64000В);
  l2k27z := l2k25z@[30].i * 64 + l2k25z@[31].i;
  code(сд/-2/=); l2k36z[l2k26z] := ;
 l2k27z := ;
 l2k31z := (l2k31z + l2k27z);
  l2k27z := l2k25z@[32].i * 64 + l2k25z@[33].i;
  code(сд/-11/=); l2k46z[l2k26z] := ;
 l2k27z := ;
 l2k32z := (l2k32z + l2k27z);
  _);
  l2k35z := (l2k33z - l2k31z);
  l2k45z := (l2k34z - l2k32z);
  l2k55z := [ 'ДЖИН  ', 'ВОПР  ', 'РЕДАК ', 'СВЯЗЬ ', 'ИГРА  ', 'БИБЛ  ', 'АДМИН ', 'СИСТ  ',
  'ПЛАН  ', 'ВСЕГО ' ];
  _for l2k26z := 1 _to 10 _do _(
  _if l2k26z = 10 _then _(  _for l2k27z := 1 _to 39 _do write(minus); more  _); (* 4010 *)
  write(l2k55z.f[l2k26z], sp);
  l2k28z := l2k36z[l2k26z];
 insert := l2k46z[l2k26z];
 L3071( (l2k28z _DIV 50) );
 l2k27z := (insert _DIV 50);
  _if (l2k27z >= 360000) _then write( sp:5 ) _else write(sp6);
  L3071( l2k27z );
  _if (l2k28z = 0) _then write('xx': 10) _else
  write( trunc(insert / l2k28z) : 10 );
  more;
  _); (* 4055 *)
  _if (str.userID = '417700') _then _(
  writeln('ЧИСЛО ЧП ', l2k30z:2 );
  l2k30z := shift(l2k29z, 24);
  insert := sel(l2k29z, 0, 24);
  writeln('СТОРОЖ: ПРОВ=', insert:1, 'ИСПР=':7, l2k30z:1);
  _);
  l2k25z := ptr(64000В);
  l2k26z := l2k25z@[76].i;
  write('ВЫЗОВОВ', l2k25z@[37].i:5);
  l2k29z := 0;
  rdpg32(НУ66, 1005В);
  insert := l2k25z@[0].i;
  _for l2k27z := 1 _to insert _do _(
  l2k28z := l2k27z;
  _if (l2k28z >= (128)) _then _(
  _if _not (l2k28z <> (128)) _then  rdpg32( НУ66, 1005В + 1);
  l2k28z := (l2k28z - (128));
  _);
  l2k28z := l2k28z * 8 + 2;
  l2k29z := sel(l2k25z@[l2k28z], 15, 12) + l2k29z;
  _);
  write('  ВХОДОВ', l2k29z:5, '  ВЫХОДОВ', l2k26z:5);
  more
_);

_proced СТАПОЧ; _label 4176, 4202, 4305;
_var l2v1z, l2v2z, l2v3z, l2v4z, l2v5z, l2v6z, l2v7z, l2v8z, l2v9z, l2v10z:integer;
l2v11z:page;
l2k35z, l2k36z:integer; l2k37z: alfa;
l2k38z, l2k39z, l2k40z:boolean;
_(
  l2v2z := 0;
 l2v8z := ;
 l2k38z := true;
 l2v9z :=   date;
 _if INP@ _in digit _then _(
  l2k37z := toHex(getNum(10));
  code(сд/-20/=); l2k37z := ;
  l2k38z := false;
  _if INP@ = etx _then _( l2k39z := true; l2k40z := true _);
  _while INP@ <> etx _do _(
  _select INP@ = 'A': l2k39z := true; INP@ = 'O': l2k40z := true _end;
  get(INP)
  _)
  _); (*4126*)
  _if l2k38z _then _( write('СТАТИСТИКА ПО ПОЧТЕ НА ');  L1634( l2v9z ); writeLN _);  
 ГГ( 'ЯЩИК' );
  _if (str.userID = '417700') _then  ГГ( ' РАЗ' );
  writeln(' НОМЕР СЛОВ ШАДР ШОТП  ВРЕМ     ОТПР     ХРАН  ПРОЧТ');
  l2v5z := 0;
  _for l2v6z := 0 _to g10z _do _(
   L1672(true, l2v11z, НУ66, 1007В + l2v6z );
  _for l2v3z := 0 _to 15 _do _(
  l2v7z := (l2v3z * 64);
  l2v2z := l2v2z + 1;
  l2k35z := l2v11z[l2v7z + 1].i;
  l2v10z := ;
  _if ((l2k39z _and (l2v11z[l2v7z+2].a = l2k37z)) _or (l2k40z _and (l2v11z[l2v7z+3].a = l2k37z)))
  _then _( 4176: _if l2v10z > 0 _then _goto 4202 _);
  _if _not l2k38z _then _goto 4305;
  4202:
  l2k36z := l2v11z[l2v7z].i;
  l2v4z := ;
  l2v5z := (l2v5z + l2v4z);
  write( l2v2z:3 );
  _if str.userID = '417700' _then  write( l2v4z:4 );
  _if (l2v10z < 1) _then _(
  write('П  У  С  Т  О':26); more;
  _) _else _(
  write( sel(l2k35z, 6, 15) :7 );
  _if sel(l2k35z, 21, 1) > 0 _then output@ := '*' _else  output@ := ' ';
  put(output);
  write(sel(l2k35z, 0, 6) : 4 );
  _for l2v1z := 2 _to 3 _do  L1461( l2v11z[(l2v7z + l2v1z)].a );
  write(l2v11z[(l2v7z + 4)].a);
  l2v8z := (l2v8z + 1);
  _for l2v1z := 5 _to 6 _do _(
  l2k36z := l2v11z[(l2v7z + l2v1z)].i;
  l2v4z := ;
  L1634( l2v4z );
  _);
  _if (l2v9z > l2v4z) _then output@ := '"' _else  output@ := ' ';
  put(output);
  _if sel(l2k35z, 24, 1) > 0 _then  ГГ( '    ДА' ) _else ГГ( '   НЕТ' );
  more;
  _);
  4305:;
  _); (* 4307 *)
  _); (* 4311 *)
  _if l2k38z _then 
     writeln('ВСЕГО ПИСЕМ ОТПРАВЛЕНО -', l2v5z:4, '{175ВСЕГО ПИСЕМ ХРАНИТСЯ   -', l2v8z:4)
  _else _if l2v8z = 0 _then _(
  write('ПИСЕМ, СВЯЗАННЫХ С '); L1461( l2k37z );  ГГ( ', НЕТ' ); writeln
  _)
_);

_proced СТАВАХ;
_type a=_array [0..6] _of word;
_var l2v1z, l2v2z:alfa;
l2v3z:integer;
l2v4z:alfa;
l2v5z, l2v6z, l2v7z, i, l2v9z, l2v10z, l2v11z, l2v12z, l2v13z, l2v14z: integer;
l2v15z:page;
l2k39z: char;
l2k40z, l2k46z, l2k52z,l2k58z:unp6;
l2k64z, l2k65z, l2k66z:boolean;
l2k67z:_record f:_array [1..6] _of alfa _end;
l2k73z:a; l2k80z:@a;
_(
  l2k67z := [ '.МЖС', '.ХСР', '.НКБ', '.МСБ', '.123', '.123'];
  write('СТАТИСТИКА ПО ВАХТЕ НА ');
  L1634(   date  );
  rdpg32( НУ66, СТАТЗОНА);
  l2k80z := ptr(64020В);
  l2k73z := l2k80z@;
  L1672( true, l2v15z, НУ66, 1005В );
  l2v5z := 0;
  l2v14z := ;
  l2v9z := l2v15z[0].i;
  l2k64z := str.userID = '417700';
  (loop) _for i := 1 _to 6 _do _(
  _if (i < 5) _and (INP@ <> etx) _then _(
  _if (INP@ = sp) _or (INP@ = '>') _or (INP@ _in letter) _then _exit loop;
  l2v5z := (l2v5z + 1);
  l2k52z[i] := INP@;
  get(INP);
  _);
  _); (* 4432 *)
  skipsp;
  _if (INP@ = '>') _then get(INP);
  l2v14z :=   getNum( 10 );
  l2k65z := INP@ = 'О';
  l2k66z := INP@ = 'Н';
  _if l2k64z _then  write( l2v9z : 5);
  write('{175НОМ ШИФР   ФАМИЛИЯ  ЗАХОДЫ ТЕК ПОЧ НОВ  ПОСЕТИЛ');
  _if l2k64z  _then _(
  write('   ПАР П С К О Р R ДРУГ ДЕНРОЖ'); 
  _if _not str.echo _and str.hardCopy _then ГГ( ' НОТЫ' );
  _);
  writeln;
  l2v12z := 0;
  l2v11z := ;
  l2v13z := ;
  _if (l2v5z = 0) _then _(
  l2v10z := l2v15z[2].i;
  writeln('  0  ИСКЛЮЧЕННЫЕ ЛИЦА', l2v10z:5);
  _) _else  l2v10z := 0;
  _for l2v7z := 1 _to l2v9z _do (it) _(
  _if l2v7z = 128 _then L1672( true, l2v15z, НУ66, 1005В + 1);
  _if l2v7z <= l2v14z _then _exit it;
  _if l2v7z > 127 _then  i := l2v7z - 128 _else i := l2v7z;
  l2v6z := i * 8 - 1;
  _if l2k65z _and (sel(l2v15z[l2v6z + 8], 40, 2) = 0) _then _exit it;
  l2v4z := l2v15z[l2v6z + 1].a;
  l2v1z := ;
  unpck(l2k40z[1], l2v1z);
  _for i := 1 _to l2v5z _do _if (l2k40z[i] <> l2k52z[i]) _then _exit it;
   L2013( l2v1z, l2v2z );
  _if l2k66z _and(l2v1z <> 'НЕТ ТА') _then _exit it;
  write( l2v7z : 3 ); L1461( l2v4z );  write(sp); ГГ( l2v1z, l2v2z );
  l2v1z := l2v15z[(l2v6z + 3)].a;
  i := sel(l2v1z, 0, 15);
  write(i : 5);
  l2v10z := (l2v10z + i);
  i := sel(l2v1z, 15, 12);
  l2v11z := (l2v11z + i);
  write(i : 4);
  i := sel(l2v15z[(l2v6z + 4)].i, 0, 6);
  l2v12z := (l2v12z + i);
  _if (i = 0) _then  ГГ( ' НЕТ ' ) _else  write(i : 4, sp);
  _if (l2v7z _MOD 48) _IN l2k73z[trunc(l2v7z / 48)].s _then write(sp) _else _(
  write(star);
  l2v13z := (l2v13z + 1);
  _);
  write( l2v15z[l2v6z + 6].a );
  i := sel(l2v15z[l2v6z+5].i, 0, 21);
  L1634( i );
  _if l2k64z _then _(
  l2v1z := l2v15z[(l2v6z + 2)].a;
 _if (l2v1z = '000000') _then  l2k39z := sp _else l2k39z := plus;
  write(l2k39z:2, sp);
  l2v1z := l2v15z[(l2v6z + 8)].a;
  l2v3z := ;
  unpck(l2k40z[1], l2v1z);
  l2v2z := '333333';
  code(2сч3=2рб4,);
  l2v1z := ;
  unpck( l2k46z[1], l2v1z );
  _for i := 1 _to 6 _do _(
  unpck( l2k58z[1], l2k67z.f[i] );
 ГГ( l2k58z[ord(l2k46z[i]) + 3] );
  write(sp);
  _);
  _for i := 3 _to 6 _do write(l2k40z[i]);
  write(sp, l2v15z[l2v6z + 7].a );
  _if _not str.echo _and str.hardCopy _then _(
  write(sp);
  _for i := 35 _downto 32 _do _(
  l2k39z := chr(sel(l2v3z, i, 1));
  _if l2k39z = chr(0) _then  l2k39z := ' ';
  write(l2k39z);
  _)_)_); (* 4754 *)
  more
  _); (* 4760 *)  
  writeln(sp:17, 'НОВОСТЬ ПРОЧЛИ =', l2v13z:3, eol,
          sp:21, l2v10z:5, l2v11z:4, l2v12z:4, eol);
_);

_proced СТАДЕЛ;
_var i, l2v2z:integer; l2v3z:@integer;
l2v4z:_record f:_array[1..8] _of alfa _end;
_(
  l2v2z := 0;
  write('СТАТИСТИКА ДЕЛ ');
  L1634(   date  );
  writeLN;
  l2v4z := [ '  ПОЗД', '  УВЕД', '  СООБ', '  ВОПР', '  СПРА', '  ХЛОП', '  КАЛА', '  ПОГО'];
  rdpg32( НУ66, 1013В );
  _for i := 1 _to 8 _do _(
  l2v3z := ptr(65777В - i);
  l2v2z := l2v2z + l2v3z@;
  write( i : 2);
  ГГ( l2v4z.f[i] );
  writeln( l2v3z@:4 );
  _);
  l2v3z := ptr(65777В);
  writeln('СУММА':8, l2v3z@ : 4 );
 _if l2v3z@ <> l2v2z _then writeln('ИСПОРЧЕНО');
 _);

 _proced СТАТИС;
 _(
 statis( 24 );
 _if getCmd( cmd, 3)  _then _select
   (cmd = 'ПОЧ   ') :  СТАПОЧ;
   (cmd = 'ПРИ   ') :  СТАПРИ;
   (cmd = 'ТЕР   ') _or
   (cmd = 'ВИД   ') :  СТАТЕР;
   (cmd = 'ВАХ   ') :  СТАВАХ;
   (cmd = 'СУМ   ') :  СТАСУМ;
   (cmd = 'ДЕЛ   ') :  СТАДЕЛ;
   true: writeln('НЕВЕРНЫЙ ВИД СТАТИСТИКИ')
   _end _else 
 writeln('НЕ УКАЗАН ВИД СТАТИСТИКИ{175ЕСТЬ ВИДЫ: ПОЧ, ВАХ, ТЕР, ПРИК, ДЕЛ, СУМ');
 _);

_function L5137(l2a1z:integer):integer;
_var i:integer;
_(
  соde(2сч4=,7паис1=7лс,17зч1=17э0711,7пб1=,ис1:сб70001=зч,);
 i := ;
 L5137 := sel(i, 24, 2);
 _);

_proced L5504(l2a1z:integer);
_(
  соde(7паис2=2сч3,7лс=,2зч3=2э0713,7пб1=,ис2:сб70002=зч,);
 _);

_proced L5161(l2a1z:integer);
_var i:integer;
_(
  code(2сч3=э062102,);
 i := ;
 _if i = 0 _then  _GOTO 10667;
  _if i > 1 _then _repeat
  L1413( 4 );
  i :=   L5137( l2a1z );
  _until i <> 0;
 _);

_function L5201(l2a1z:integer):boolean;
_var l2v1z:bitset; l2v2z:integer;
_(
 l2v1z := [l2a1z - 1];
 code(Э06257=,сд/6/=мр,сд/-6/=мр,);
 l2v2z := ;
 L5201 := l2v2z = 77В;
 _);

_function HMS:integer;
_var l2v1z:integer;
_(
 l2v1z := 0;
 skipsp;
 _if INP@ = etx _then  l2v1z := 60 _else (loop) _(
  l2v1z := l2v1z * 60 + getNum(10);
  _if INP@ =  dot _then _( get(INP); _goto loop _);
  _);
 HMS := l2v1z;
 _);

_proced L5240(_var l2a1z:text);
_var l2v1z:char;
_(
 _while (l2a1z@ <> etx) _do _(
  l2v1z := l2a1z@;
  _if l2v1z = '{214' _then  l2v1z := '{175';
 write(l2v1z);
 get( l2a1z );
  _);
 reset( l2a1z );
 writeLN;
 _);

_function L5261(l2a1z:integer):integer;
_var l2v1z, l2v2z, l2v3z:integer;
_(
  l2v1z := 77В;
  code(2сч4=сд/5/,2зч7=мр,сд/-5/=мр,);
  l2v2z := ;
  _if (l2v2z _IN g35z[l2v3z]) _then _(  code(2сч4=э062103,2лу5=); L5261 := ;  _)
  _else _if (l2v2z _IN g33z[l2v3z]) _then  L5261 := l2a1z _else L5261 := 0;
 _);

_function L5614(l2a1z:integer):integer;
_(
   code(2сч4=э050135,); 
   L5614 := ;
_);

_function L5644:integer;
_var l2v1z:bitset;
_(
  code(э07177013=,);
  l2v1z := ;
  L5644 := minel(l2v1z)+1;
_);

_proced L5653(l2a1z:integer);
_var l2v1z:integer;  l2v2z:@twoset;
_(
  l2v1z := l2a1z * 6 + 65450В;
  l2v2z := ptr(l2v1z);
  g33z := l2v2z@;
  l2v2z := ptr(l2v1z + 2);
  g35z := l2v2z@;
_);

_function L5676:integer;
_var l2v1z, l2v2z:integer; l2v3z, l2v4z: bitset;
_(
  l2v2z := 0;
  l2v4z := [1];
  l2v3z := ;
  _while l2v3z <> [] _do _(
  l2v2z := l2v2z + 1;
  l2v1z := minel(l2v3z);
  _if (l2v1z = g18z) _then  L5676 := l2v2z;
  l2v3z := l2v3z - [l2v1z];
  _);
_);

_function L5423(_var l2a1z:twoset; _var l2a2z:boolean):boolean; _label 5451;
_var l2v1z:integer;
l2v2z:alfa;
l2v3z, l2v4z, l2v5z:integer; l2v6z: alfa;
l2v7z:twoset;
l2v9z:@rec1;
l2v10z:bitset;
l2v11z:boolean;

_proced error;
_(
  writeln(' -  ОШИБКА');
  _GOTO 10543;
_);

_proced L5374(a:integer); _label 5405;
_var l3v1z, l3v2z:integer;
_(
  _if (a < 32) _then _(
  l3v1z := 0;
  l3v2z := a;
  _goto 5405;
  _)_else _(  
  l3v2z := a - 32;
  l3v1z := 1;
  5405: _if (l3v2z _IN g33z[l3v1z]) _then  l2v7z[l3v1z] := [l3v2z] | l2v7z[l3v1z]
  _else _(  wrOctal( a, 2 );  error;  _)
  _);
_);

_( (* L5423 *)
  rdpg32(НУ66, СТАТЗОНА); 
  l2v10z := g31z@[8].s;
  l2v4z := ord(l2v10z) _mod 64;
  l2v9z := ptr(65500В);
  l2v5z := L5676;
  L5653( l2v5z );
  l2a2z := false;
  L5423 := ;
  l2v7z[0] := [];
  l2v7z[1] := ;
  5451: _select
  INP@ = etx : _( l2a1z[0] := l2v7z[0]; l2a1z[1] := l2v7z[1]; EXIT _);
  INP@ _in digit:  L5374(   getNum(8) );
  INP@ = '/': _( get(INP); L5423 := true; EXIT _);
  INP@ _in letter: _(
  _if getCmd(l2v6z, 3) _then _(
  l2v2z := shift(l2v6z, 24);
  _select
  ('ОПЕ   ' = l2v6z): _( l2a2z := true; L5374 (g11z) _);
  ('ВСЕ   ' = l2v6z): _( l2v7z[0] := g33z[0]; l2v7z[1] := g33z[1] _);
  ('К     ' = l2v6z): _(
  l2v1z := getNum (10);
  l2v11z := true;
  _for l2v3z := 1 _to l2v4z _do _(
  _if sel(l2v9z@[2, l2v3z].i, 0, 23) = l2v1z _then _(
  l2v10z := l2v9z@[1, l2v3z].s;
  _if (l2v5z _IN l2v10z) _then _(   L5374( shift(l2v9z@[0, l2v3z].i, 40) );  l2v11z := false _);
  _)
  _);
  _if l2v11z _then _( write(б7, l2v1z:1); error _);
  _);
  true: _(
  l2v11z := true;
  _for l2v3z := 1 _to l2v4z _do _(
  _if shift(l2v9z@[2, l2v3z].a, 24) = l2v2z _then _(
  l2v10z := l2v9z@[1, l2v3z].s;
  _if (l2v5z _IN l2v10z) _then _(   L5374( shift(l2v9z@[0, l2v3z].i, 40) );  l2v11z := false _);
  _)
  _);
  _if l2v11z _then _(  ГГ( l2v2z ); error _);
  _)
  _end;
  _)
  _);
  INP@ = comma: get(INP);
  true: _( write(INP@); error _)
  _end; _goto 5451
_);

_function minel2(_var s:twoset):integer;
_var i:integer;
_(
 _for i := 0 _to 1 _do 
  _if s[i] <> [] _then _(
  minel2 := minel(s[i]) + i*32;
  EXIT
  _);
 minel2 := -1;
_);

_proced ПАУЗА; _label 5777, 6321, 6370;
_var l2v1z, l2v2z, l2v3z, l2v4z, l2v5z, l2v6z, l2v7z, l2v8z, l2v9z:integer;
l2v10z: alfa;
l2v11z, l2v12z:boolean;
l2v13z:twoset;

_function time:integer;
_(
 code(Э05310=,);
 time := ;
_);

_function L6170:alfa;
_(
  _if g12z > 100 _then _(
  l2v2z := L5644;
  _if (L5261( l2v8z) = l2v2z) _then _GOTO 6370 _else
  _if l2v2z > 0 _then _( L5504(l2v2z); _GOTO 6321 _) _else L6170 := '000000';
  _) _else _(
  l2v2z :=   L5261( l2v8z );
  code(э050153=,уи7=7са11,7э0650=,);
  L6170 := ;
  _)
_);

_( (* ПАУЗА *)
  _if (40 _in str.g52z) _and (40 _in str.g50z) _then _( writeln('НА ПАУЗЕ ВЫ УЖЕ БЫЛИ'); EXIT _);
  L1753;
  statis (20);
  _if INP@ _in letter _then l2v5z := 60 _else l2v5z := HMS;
  l2v2z :=   L5644;
  l2v8z :=   L5614( l2v2z );
  _if INP@ <> etx _then _(
  l2v12z :=   L5423( l2v13z, l2v11z );
  l2v8z :=   minel2( l2v13z );
  _) _else rdpg32( НУ66, СТАТЗОНА );
  write('УШЕЛ НА ВРЕМЯ = ');
  _if l2v5z > 300 _then  l2v5z := 300;
  L3071( l2v5z );
  writeLN;
  l2v5z := l2v5z * 50;
  l2v4z := time  + l2v5z;
  l2v7z := 750;
  L5504( l2v2z );
  l2v9z :=   L5676;
  L5653( l2v9z );
  l2v10z := L6170;
  6321:
  l2v3z := 0;
  (loop) _while (time < l2v4z) _and (l2v5z > 0) _do _(
  L1413( 20 );
  l2v5z := (l2v5z - (20));
  l2v3z := (l2v3z + 1);
  _if (l2v3z = 5) _then _(  l2v3z := 0; l2v10z := L6170 _) _else _( code(7э065=,); l2v10z := ; _);
  _if l2v10z = 'ДЖИН!!' _then _exit loop;
  _); (* 5765 *)
  l2v6z := 0;
  (loop) _(
  _if sel(l2v6z, 0, 2) = 0 _then  l2v10z := L6170;
  _if l2v2z = 0 _then _goto 5777;
  (i) _if L5201( l2v2z) _then _exit i _else 5777: _(
  l2v6z := l2v6z + 1;
  L1413(20);
  _if l2v6z > l2v7z _then _GOTO 10667 _else _goto loop;
  _);
  _);
  6370:
  l2v1z := 10320000000000C + 401064C;
  code(7па64000=2э0703,7сч402=2лс4,зч76402=7сч404,2лс4=зч76404,);
  code(2сч4=сд/-14/,2зч4=7лс401,зч76401=7сч403,2лс4=зч76403,);
  writeln('-=+=- ДЖИН ВЕРНУЛСЯ -=+=-':32);
  str.g50z := str.g50z + [40];
_);

_proced termio(l2a1z, l2a2z:integer; _var scr:screen);
_var l2v1z:integer; p:@screen;
_(
  l2v1z := trunc(l2a2z / 10);
  l2a2z := l2a2z - l2v1z * 2;
  l2v1z := l2a1z;
  code(7паис3=сд/-14/,7лс0=17зч,);
  l2a2z := l2a2z;
  code(сд/-53/=7рб2,17лс=7зч1,);
  p := ref(scr);
  code(уи7=иаис3,э0711=,иаис3=пб3,c;ис3:3420000035000323,0,217000000000000,к;);
_);

_proced invoke;
_var l2v1z:integer; l2v2z:unp6;
_(
  g17z := false;
  TTIN( 0, false );
  _if g17z _then _GOTO 10673;
  write(INP,'{214     ');
  unpck( l2v2z[1], str.userID );
  _for l2v1z := 1 _to 4 _do write(INP, l2v2z[l2v1z]);
  cmd := str.userID;
  L2013( cmd, g13z );
  write(INP,' - ', cmd, g13z, '  ТЕР=');
  l2v1z :=  L5614(   L5644  );
  mapia( l2v1z, cmd );
  unpck( l2v2z[1], cmd );
  write(INP, l2v2z[5], l2v2z[6], etx); 
  reset(INP);
_);

_proced L6160(_var l2a1z:twoset; l2a2z:integer);
_var l2v1z:integer;
_(
  l2v1z := shift(l2a2z, 5);
  code(мр=сд/-5/,мр=);
  l2a2z := ;
  l2a1z[l2v1z] := l2a1z[l2v1z] -[l2a2z];
_);

_function empty(_var s:twoset):boolean;
_(
  empty := (s[0] = []) _and (s[1] = []);
_);

_procedure СЕТЬ; _label 6400, 6411, 6466, 6511, 6565, 6571;
_var l2v1z:alfa;
Nterm, l2v3z, interval, l2v5z, l2v6z, l2v7z, l2v8z, done:integer;
timed:boolean; l2v11z, l2v12z, l2v13z, срочно, l2v15z: boolean; l2v16z:char;
scr1, scr2:screen; l2v441z:unp6;
set1, set2:twoset; 

_proced result(l3a1z:integer);
 _(
 _if ((l3a1z = 3) _and _not timed) _or (l3a1z < 3)  _then _(
   write('ТЕРМИНАЛ '); wrOctal(Nterm, 2);
   _);
   _case l3a1z _of
   1: _( writeln(' ОПОВЕЩЕН');done := done + 1 _);
   2: writeln(' ОТСОЕДИНЕН');
   3: _if _not timed  _then  writeln(' ЗАНЯТ')
   _end
_);

_( (* СЕТЬ *)
  l2v1z := sp6;
  timed :=   L5423( set1, l2v11z );
  _if empty( set1) _then _( writeln('ПУСТОЙ СПИСОК ТЕРМИНАЛОВ - НЕЧЕГО ДЕЛАТЬ'); EXIT _);
  interval :=   HMS;
  statis( 22 );
  writeln('НАБЕРИТЕ СООБЩЕНИЕ');
  invoke;
  writeln('ПРИНЯТО К ПЕРЕДАЧЕ:');
  L5240( INP );
  toScreen( INP, scr1 );
  срочно := false;
  reset(INP);
  rewrite(F);
  _while INP@ <> etx _do _( write(F, INP@); get(INP) _);
  write(F, etx);
  writeln('ПОДТВЕРДИТЕ ПРАВИЛЬНОСТЬ  <ДА,НЕТ>');
  TTIN( 2, true );
  _if INP@ = 'Д' _then writeln('ПОПЫТАЮСЬ ПЕРЕДАТЬ')
  _else _( writeln('КАК ХОТИТЕ'); EXIT _);
  done := 0;
  l2v7z :=   L5644;
  L6160 (set1, L5614(l2v7z));
  6400: _if timed _then _(
  write('УХОЖУ И БУДУ РАБОТАТЬ ЧАС.МИН.СЕК = ');
  L3071( interval );
  writeLN;
  l2v3z := 2;
  code(лу76013=зч76013,);
  L5504( l2v7z );
  _);
  6411: set2 := set1;
  _while _not empty( set2) _do _(
  Nterm :=   minel2( set2 );
  L6160( set2, Nterm );
  l2v12z := (Nterm = g11z) _and l2v11z;
  l2v8z :=   L5261( Nterm );
  _if (l2v8z > 0) _then  l2v15z :=   L5201( l2v8z ) _else _goto 6571;
  _if l2v15z _or l2v12z _or срочно _then _(
   L6160( set1, Nterm );
  _if (срочно _or l2v12z) _and _not l2v15z _then _(
  reset(F);
  l2v13z := false;
  6466: _if l2v12z  _then l2v441z[1] := '5' _else  l2v441z[1] := chr(127 + l2v8z);
  l2v6z := 2;
  _if l2v13z _then _( l2v3z := 2; _goto 6565 _);
  _for l2v5z := 1 _to 8 _do _(
  _for l2v3z := l2v6z _to 6 _do _(
  _if (l2v5z = 8) _and (l2v3z = 6) _then _(
  l2v441z[l2v3z] := etx;
  6511:
  pck(l2v441z[1], scr2[l2v5z]);
  termio( l2v8z, 20, scr2 );
  L1413( 12 );
 _goto 6466;
  _); (* 6523 *)
  l2v16z := F@;
  l2v441z[l2v3z] := ;
  _if (l2v16z = etx) _then _( l2v13z := true; _goto 6511 _);
  get(F);
  _if (l2v16z = '{214') _then _( l2v441z[l2v3z] := etx; _goto 6511 _);
  _if (l2v3z = 6) _then _( pck(l2v441z[1], scr2[l2v5z]); l2v6z := 1
  _);
  _)
  _)_); (* 6550 *)
  termio( l2v8z, 0, scr1 );
  (a) _( l2v3z :=   L5137( l2v8z ); _if l2v3z = 0 _then _( L1413(8); _goto a _) _);
  L5504(l2v8z);
  6565: _if l2v3z = 2 _then result (1) _else 6571: result (2);
  _) _else result (3);
  _); (* 6575 *)
  _if timed _then _(
  interval := (interval - 2);
 _if (interval < 0) _or  empty( set1)  _then _(
  _if empty( set1) _then  writeln('ВСЕ СДЕЛАНО');
  _if (interval < 0) _then  writeln('ЗАДАННОЕ ВРЕМЯ ИСТЕКЛО');
  _GOTO 10667;
  _);
  L1413( (100) );
  _goto 6411;
  _);
  _if empty( set1) _then _(
  _if done > 1 _then writeln('ВСЕ ТЕРМИНАЛЫ ОПОВЕЩЕНЫ');
  EXIT
  _);
  writeln('ПРОБОВАТЬ ЕЩЕ ? <ДА,НЕТ,СРОЧ, ЧАС.МИН.СЕК>');
  TTIN( 2, true );
  skipsp;
  _if INP@ _in digit _then _( timed := true; interval := HMS; _goto 6400 _);
  _if INP@ = 'Д' _then _goto 6411;
  _if INP@ = 'C' _then _( срочно := true; _goto 6411 _);
_);

_procedure ВЫЗОВ; _label 7425;
_var l2v1z, l2v2z, l2v3z, cur, l2v5z, l2v6z:integer;
l2v7z, l2v8z:integer;
u:unp6;
l2v15z, l2v16z, l2v17z:alfa;
l2v18z, l2v19z, l2v20z, stop, l2v22z, l2v23z:boolean;
scr1, scr2:screen; (* 24, 236 *)
set1, set2:twoset;

_proced ttystat(s, t:integer);
 _(
   write('ТЕРМИНАЛ '); wrOctal( t, 2 );
   _case s _of
   2: writeln(' ОТСОЕДИНИЛСЯ');
   3: writeln(' ЗАНЯТ')
   _end
 _);

_proced L6710(l3a1z:integer);
 _(
   (loop) _(
   L1413( 8 );
   l2v6z :=   L5137( l3a1z );
   _if (l2v6z = 3) _then _(
   _if (l3a1z = l2v1z) _then  _GOTO 10667 _else _( ttystat( 2, cur ); _GOTO 7425 _);
   _);
   _if (l2v6z = 0) _then _goto loop;
   _)
 _);
_proced L6733;
_(
  l2v22z := false;
  l2v7z := l2v8z;
  (L6737) _(
  L1413( 8 );
  l2v6z :=   L5137( l2v1z );
  _if l2v6z = 3 _then  _GOTO 10667;
  l2v7z := l2v7z - 8;
  l2v5z :=   L5137( l2v3z );
  _if l2v5z = 3 _then _(  ttystat( 2, cur );  _GOTO 7425 _);
  _if (l2v5z = 0) _and (l2v6z = 0) _then _(
  _if (l2v7z < 0) _then _(
  _if l2v20z _then _(  L5161( l2v3z ); l2v5z := 1 _) _else L5161( l2v1z );
  l2v6z := 1;
  _) _else _goto L6737;
  _);
  _);
  _if l2v20z _then _(
  _if (l2v5z <> 0) _then _(
  L5161( l2v1z );
 _if (l2v5z = 1) _then _( 
 scr2[1] := '    =<';
 scr2[2] := ' АБОНЕ';
 scr2[3] := 'НТ НЕ ';
 scr2[4] := 'ОТВЕЧА';
 scr2[5] := 'ЕТ >={172';
  _);
 _if _not (l2v5z <> 2) _then  l2v23z := true;
  EXIT
  _);
  L5161( l2v3z );
  scr1[1] := '    =<';
  scr1[2] := ' ПРИЕМ';
  scr1[3] := ' ПРЕРВ';
  scr1[4] := 'АН >={172';
  l2v22z := true;
  _) _else _( _if l2v6z <> 0 _then _(
  L5161( l2v3z );
  _if (l2v6z = 1) _then _(
  scr1[1] := '    =<';
  scr1[2] := ' АБОНЕ';
  scr1[3] := 'НТ НЕ ';
  scr1[4] := 'ОТВЕЧА';
  scr1[5] := 'ЕТ >={172';
  _);
  EXIT
  _);
  L5161( l2v1z );
  scr2[1] := '    =<';
  scr2[2] := ' ПРИЕМ';
  scr2[3] := ' ПРЕРВ';
  scr2[4] := 'АН >={172';
  l2v22z := true;
  _)
_);
_proced chkend(_var a:alfa);
_(
  unpck( u[1], a);
  _if u[1] = '$' _then _(   stop := true;   u[1] := sp   _);
  pck(u[1], a);
_);

_proced Nterm(n:integer; _var a:alfa);
_(
  l2v17z := numter;
  code(17зч=);
  mapia( n, a );
  a := a;
  code(сд/-20/=17лс,);
  a := ;
_);

_( (* ВЫЗОВ *)
  statis( 21 );
  l2v18z :=   L5423( set1, l2v19z );
  stop := false;
  l2v23z := ;
  _if empty(set1) _then _( writeln('ПУСТОЙ СПИСОК ТЕРМИНАЛОВ - НЕЧЕГО ДЕЛАТЬ'); EXIT _);
  l2v8z := HMS * 50;
  writeln('НАБЕРИТЕ ВЫЗОВ');
  invoke;
  l2v1z :=   L5644;
  l2v2z :=   L5614( l2v1z );
  Nterm( l2v2z, l2v15z );
  writeln('ПОПЫТАЮСЬ УСТАНОВИТЬ СВЯЗЬ');
  toScreen( INP, scr1 );
  L6160(set1, l2v2z );
  (try) _(
  set2 := set1;
  _if _not empty(set2) _then _repeat
  cur :=   minel2(set2 );
  L6160( set2, cur);
  l2v3z :=   L5261(cur);
  Nterm( cur, l2v16z );
  l2v18z := (cur = g11z) _and l2v19z;
  l2v20z :=   L5201( l2v3z );
  _if l2v20z _or l2v18z _then (talk) _(
  _if l2v18z _and _not l2v20z _then _(
  scr2[1] := '5{214    ';
  scr2[2] := '   =--';
  scr2[3] := '-> ЭТО';
  scr2[4] := ' ДЖИН ';
  scr2[5] := '- СДЕЛ';
  scr2[6] := 'АЙТЕ "';
  scr2[7] := 'ВОТ" <';
  scr2[8] := '---={214{172';
  termio( l2v3z, (20), scr2 );
  l2v6z := 0;
  (invite) _(
  L1413(8);
  _if L5201( l2v3z) _then _exit invite _else _(
  l2v6z := l2v6z + 1;
  _if (l2v6z > 50) _then _(  writeln('ОПЕРАТОР НЕ РЕАГИРУЕТ'); _exit talk _);
  _goto invite;
  _)
  _);
  _);
  (chat) _(
  termio( l2v3z, 0, scr1 );
  l2v20z := true;
  _if stop _then _exit chat;
  L6710( l2v3z );
  scr2[1] := prompt;
  termio( l2v3z, 14, scr2 );
  scr1[1] := blank;
  scr1[2] := l2v16z;
  termio( l2v1z, 14, scr1 );
  L6733;
  _if l2v22z _then _(
  termio( l2v3z, 0, scr1 );
  L6710( l2v3z );
  _for l2v6z := 1 _to 5 _do scr2[l2v6z] := scr1[l2v6z];
  _) _else chkend( scr2[1] );
  termio( l2v1z, 0, scr2 );
  l2v20z := false;
  _if stop _then _exit chat;
  L6710( l2v1z );
  scr1[1] := prompt;
  termio( l2v1z, 14, scr1 );
  scr2[1] := blank;
  scr2[2] := l2v15z;
  termio( l2v3z, 14, scr2 );
  L6733;
  _if l2v22z _then _(
  termio( l2v1z, 0, scr2 );
  L6710( l2v1z );
  _for l2v6z := 1 _to 5 _do  scr1[l2v6z] := scr2[l2v6z];
  _) _else  chkend( scr1[1] );
  _goto chat
  _) (* chat *);
  _if l2v20z _then L6710( l2v3z ) _else  L6710( l2v1z );
  scr2[1] := '      ';
  scr2[2] := '=< РАЗ';
  scr2[3] := 'ГОВОР ';
  scr2[4] := 'ОКОНЧЕ';
  scr2[5] := 'Н >={172 ';
  termio( l2v3z, 0, scr2 );
  l2v20z := true;
  L6710( l2v3z );
  _if l2v23z _then _goto 7425 _else _exit talk;
  7425:
  L5504( l2v3z );
  writeln(sp6, '=< РАЗГОВОР ОКОНЧЕН >='); EXIT;
  _) (* talk *)
  _else ttystat( 3, cur );
  _until empty(set2) ;
  writeln('ПРОБОВАТЬ ЕЩЕ ? <ДА,НЕТ>');
  TTIN( 2, true );
  _if INP@ = 'Д' _then _goto try
  _)
_); 

_proced errdat; _( writeln('ОШИБКА В ДАТЕ'); _);

_function YMD:integer; _label 7522;
_var d:integer;

_proced getDot;
_(
  (L7464) _(
  skipsp;
  _if INP@ = dot _then _( get(INP); _goto L7464 _)
  _);
  _if _not (INP@ _in digit) _then _( d := 0; errdat; _GOTO 7522 _)
 _);

_( (* 7503 *)
  getDot;
  d := getNum(10);
  getDot;
  d := getNum(10) * 100 + d;
  getDot;
  d := getNum(10)*10000 + d;
  7522:
  YMD := d;
_);

_function zeller(d, m, y:integer):integer;
_(
  _if (d = 0) _or (m = 0) _or (y = 0)
  _or (d > 31) _or (m > 12) _or (y > 99) _then _(  errdat; _GOTO 10543 _);
  _if m < 3 _then y := y - 1;
  m := m + 9;
  _if m > 11 _then m := m - 12;
  m := m + 1;
  zeller := ((d + y + y _div 4 + (13 * m - 1) _DIV 5) - 28) _MOD 7;
_);

_proced ДАТА;
_var d, m, y:integer;
_(
  statis(15);
  _if (INP@ = etx) _then _( write('СЕГОДНЯ '); d :=   date _)
  _else  d :=   YMD;
  y := (d _DIV 10000);
  d := d - y * 10000;
  m := (d _DIV 100);
  d := d - m * 100;
  двецифры( d );
  write(sp);
  _case m _of
  1: ГГ( 'ЯНВАРЯ' );
  2: write('ФЕВРАЛЯ');
  3: ГГ( 'МАРТА' );
  4: ГГ( 'АПРЕЛЯ' );
  5: ГГ( 'МАЯ' );
  6: ГГ( 'ИЮНЯ' );
  7: ГГ( 'ИЮЛЯ' );
  8: write('АВГУСТА');
  9: write('СЕНТЯБРЯ');
  10: write('ОКТЯБРЯ');
  11: ГГ( 'НОЯБРЯ' );
  12: write('ДЕКАБРЯ')
  _end;
  write(sp);  двецифры(19); двецифры(y);  ГГ( ' - ' );
  _case zeller(d, m, y) _of
  0: write('ПОНЕДЕЛЬНИК');
  1: write('ВТОРНИК');
  2: ГГ('СРЕДА');
  3: write('ЧЕТВЕРГ');
  4: write('ПЯТНИЦА');
  5: write('СУББОТА');
  6: write('ВОСКРЕСЕНЬЕ')
  _end;
  writeln
_);

_proced КАЛЕНД;
_type table=_array[0..6, 1..18] _of integer;
_var день:alfa;
y, d, год, n:integer;
m, i, j, мес, cur, число, base, l2v13z: integer;
T:table;
unused:_array[1..34] _of integer;
dummy:_array[1..28] _of integer;
ДНИ:_record s:_array[0..6] _of alfa _end;
МЕСЯЦЫ:_record s:_array[2..25] _of alfa _end;

_proced печмес(m:integer);_( m := m*2; ГГ( МЕСЯЦЫ.s[m] ); ГГ( МЕСЯЦЫ.s[m+1] )_);               

(* Should be replaced by 
_function monlen(y, m:integer):integer;
_(
 _if m = 2 _then _( _if y _mod 4 = 0 _then monlen := 29 _else monlen := 28 _) 
 _else monlen := 30 + (m _mod 2 + m _div 8) _mod 2;
_);
*)
_function monlen(y, m:integer):integer;
_var res:integer;
_(
  _if m = 2 _then _(
  _if y _mod 4 < 1 _then  res := 29 _else res := 28;
  _) _else _(
  res := m _mod 2;
  _if (res = 1) _and (m < 8) _or (res < 1) _and (m >= 8) _then res := 31 _else res := 30;
  _);
  monlen := res;
_);
                  
_( (* КАЛЕНД *)   
  statis (16);
  ДНИ := [ 'ПН', 'ВТ', 'СР', 'ЧТ', 'ПТ', 'СБ', 'ВС' ];
  МЕСЯЦЫ := [
  '   ЯНВ','АРЬ   ', '  ФЕВР','АЛЬ   ', '    МА','РТ    ', '   АПР','ЕЛЬ   ',
  '    МА','Й     ', '    ИЮ','НЬ    ', '    ИЮ','ЛЬ    ', '   АВГ','УСТ   ', 
  '  СЕНТ','ЯБРЬ  ', '  ОКТЯ','БРЬ   ', '   НОЯ','БРЬ   ', '  ДЕКА','БРЬ   '];
  _if INP@ = etx _then  n := date _else _( n :=   YMD; _if n = 0 _then EXIT _);
  y := n _DIV 10000;
  мес := n - y * 10000;
  m := мес _DIV 100;
  d := мес - m * 100;
  _if (y > 99) _or (y = 0) _or (m > 12) _or (m = 0)
  _or (d > monlen(y, m) ) _then _( errdat; EXIT _);
  _for i := 1 _to 34 _do _if i _MOD 5 >= 1 _then unused[i - i _DIV 5] := i - i _DIV 7 * 7;
  _for i := 1 _to 18 _do _(
  base := (i - 1) _DIV 6;
  мес := base + m - 1;
  _if мес = 0 _then _(  мес := 12; год := y - 1  _)
  _else  _if мес = 13 _then _( мес := 1; год := y + 1  _)
  _else год := y;
  _for j := 0 _to 6 _do _(
   T[j, i] := 0;
   l2v13z := i + 5;
  _if l2v13z _DIV 6 * 6 = l2v13z _then _(
  cur := zeller( 1, мес, год );
  _if j >= cur _then _( T[j, i] := j - cur + 1;  n := ; _);
  _) _else _(
  число := (i - base * 6 - 2) * 7 + n + j + 1;
  _if число <=  monlen(год, мес) _then  T[j, i] := число;
  _)
  _)
  _);
  write(19:6); _if m = 1 _then  двецифры(y-1) _else  двецифры(y); write(sp);

  _if m = 1 _then  печмес(12) _else печмес(m - 1);
  ГГ(sp6);  печмес( m );  write( sp:5 );
  _if m = 12 _then  печмес(1) _else печмес(m + 1);

  _for i := 1 _to 18 _do _if (i _DIV 6 * 6 = i) _and (T[0,i] <> 0) _then  write( sp:3 );

  двецифры(19); _if m = 12 _then  двецифры(y+1) _else двецифры(y); writeLN;

  _for j := 0 _to 6 _do _(
  write( sp:5); день := ДНИ.s[j];  ГГ( день ); write(sp);
  _for i := 1 _to 18 _do _(
  cur := T[j, i];
  base := T[0, i];
  _if cur = 0 _then _(
  _if ((i = 6) _or (i = 12)) _and (base = 0) _then write('!') _else
  _if (i <> 18) _or (i <> 0) _then  ГГ( sp2 );
  _) _else  двецифры( cur );
  _if ((i = 6) _or (i = 12)) _and (base <> 0) _then
  _if (cur = d) _and (i = 12) _then  ГГ( ')!' ) _else ГГ( ' !' );
  _if ((i = 6) _and (T[j, 7] = d)) _or
  ((i = 7) _and (cur = 0) _and (T[j, 8] = d)) _or
  ((i _IN [7..11]) _and (cur <> 0) _and (d - 7 = cur)) _then write('(')
  _else _if (i _IN [7..11]) _and (cur = d) _then write(')') _else
  _if (i <> 18) _or (base <> 0) _then write(sp);
  _); (* 10440 *)
  ГГ( день );
  more;
  _); (* 10445 *)
_);
_proced exec(loc:integer);
_proced L10446(_var F:text; _var str: struc; len:integer);_( code(пб76022=,) _);
_(
  L10446( INP, str, 62 );
_);

_proced enter;
_proced L10464(_var F:text; _var str: struc; len:integer);_( code(пб76021=) _);
_(
  L10464( INP, str, 62 );
  g11z := 1;
  _GOTO 10553;
_);

_proced L10505;
 _(
 write('ПРИКАЗА ');
 ГГ( cmd );
 ГГ( 'В ' );
 ГГ( влэвм1 );
 ГГ( влэвм2 );
 ГГ( ' НЕТ' );
 writeLN;
_);

(* main *)
_(
  code(сч76233=); g14z := ;
  g10z := 2 - 1;
  g16z := true;
  g31z := ptr(64000В);
  code(Э050114=,сд/3/=мр,сд/-3/=мр,); g18z := ;
  _if (g14z <> 'ТАМБОВ') _then code(сч=э062,) _else enter;
  10543: L1431;
  _if (12 _IN str.g52z) _then _( putInp( 'ВОП  {377' ); _goto 10602 _);
  TTIN( 1, true );
  10553: g15z := false;
  (again) _if getCmd(cmd, 3) _then _(
  _select
  ('ПОЧ   ' = cmd): 10562: exec( ПУСК );
  ('СТА   ' = cmd): СТАТИС;
  ('БЭС   ' = cmd): БЭСМ;
  ('ДЖИ   ' = cmd) _or
  ('ВОП   ' = cmd): _( _if 43 _IN str.g52z _then _goto 10543; statis(26); 10602: exec( ВОПРОС )  _);
  ('ИГР   ' = cmd):  exec( ИГРА );
  ('СВЯ   ' = cmd): _(  statis( 33 );  exec( СВЯЗЬ ) _);
  ('КАЛ   ' = cmd): КАЛЕНД;
  ('ПАУ   ' = cmd): ПАУЗА;
  ('СЕТ   ' = cmd): СЕТЬ;
  ('ДАТ   ' = cmd): ДАТА;
  ('ВЫЗ   ' = cmd): ВЫЗОВ;
  ('ГДЕ   ' = cmd): _goto 10562;
  ('ВЫХ   ' = cmd): _( str.g52z := str.g52z + [16]; _goto 10673 _);
  ('ШКО   ' = cmd): exec( ШКОЛА );
  ('АДМ   ' = cmd): _( statis( 30 ); exec( АДМИН ) _);
  ('РЕД   ' = cmd): _( statis( 32 ); exec( РЕДАК ) _);
  ('ДАЙ   ' = cmd): _(  g15z := true; _goto again _);
  ('КОН   ' = cmd): _( _goto 10673;
  10667:  putInp( 'СОN  {377' ); str.g52z := str.g52z + [47]; _goto 10673
  _);
  true: 10673: exec( МОСТ )
  _end;
  _) _else   writeln('НЕ ПОНИМАЮ'); 
  _goto 10543; L10505;
_).
