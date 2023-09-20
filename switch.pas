(*=p-*)_program ДЖИН;
_label 2613, 2634,2552, 2566, 2577, 2567, 2602, 3024;
_const НУ66=66В; c517=517; c519=519; z1011=1011В; c1012=1012b;
ПУСК=5661000b; nu2=1661014b; ВОПРОС=5661015b; АДМИН=5400150b; СВЯЗЬ=5400162b;
ПЛАН=3661035b; СТАТ=5400120b; ИГРА=5400125b; ШКОЛА=5400132b; РЕДАК=5400140b;
КАДРЫ=6661200b; СИСТ=4400155b; БИБЛ=3660640b; c545=545b;
v2054=2054;c56=56;sp2='  ';etx='{377';sp=' ';
dot='.';minus='-';eq='=';gt='>';c36=36;eol='{175';comma=',';sp6='      ';
_type 
letter ='a'..'z';
digit=0..9;
bitset=_set _of 0..47;
page=_array [0..1023] _of integer;
zone=_array [0..1023] _of integer;
unp6=_array [1..6] _of char;
area=_array [1..56] _of integer;
_var g10z, g11z, g12z, g13z, g14z:integer;
g15z, g16z, g17z:alfa;
g18z:integer;
g19z, g20z:boolean;
g21z, g22z, g23z, g24z, g25z, g26z, g27z, g28z, g29z, g30z, g31z, g32z, g33z, g34z, g35z, g36z, g37z, g38z, g39z:integer;
g40z:boolean;
g41z, g42z:integer;
g43z:boolean;
statAr:_array[0..33] _of integer;
INP:text;
(*=t-*)

_procedure statis(arg:integer);
_(
 statAr[arg] := (statAr[arg] + (1));
 statAr[0] := (statAr[0] + (1));
_);
_proced skipsp;
 _(
 _while _not (INP@ <> ' ') _do get(INP);
 _);

_proced TTIN;
_var l2v1z, l2v2z:integer;
_(
  (a) BIND(' ==> {172');                             
  _if g40z _then _( code(СЧ76013=УИ7,);l2v1z := 2; code(ЗЧ76013=); write(' ==> ')  _);
 rewrite(INP);
 l2v2z := (0);
 
 (a) _while (input@ <> etx) _do _(
  _if g40z  _then write(input@:1 );
  l2v2z := l2v2z + 1;
  _if l2v2z > 448 _then _(  rewrite(INP); write(INP,'SLЕ   ':6); _exit a  _);
  INP@ := input@;
  put(INP);
  get(input);
 _); 
 INP@ := etx;
 put(INP);
 reset(INP);
 _if g40z _then _(  writeLN; code(ВИ7=ЗЧ76013,) _)
_);
_proced P0472;
_var l2v1z:alfa;
_(
 writeLN; code(СЧ77015=);
 l2v1z := ;
 _if l2v1z = 'Н{3770000' _then  _GOTO 2552;
_);

_function L0501(l2a1z:integer):integer;
_var l2v1z:integer;
_(
 l2v1z := (0);
 skipsp;
  _while INP@ _in digit _do _(
   l2v1z := (l2v1z * l2a1z) + ord(INP@);
   get(INP);
 _);
  skipsp;
 L0501 := l2v1z;
 _);

_function mysel(l2a1z, l2a2z, l2a3z:integer):integer;
_var l2v1z:integer;
_(
  l2v1z := 77B - l2a2z;
  code(2АС6=СД/7/,МР=17ЗЧ,);
  l2v1z := 16;
  code(2АС5=СД/7/,МР=17ЗЧ,);
  code(2СЧ4=17СК,17СК=МР,);
 mysel := ;
 _);

 _function time:integer;
_var l2v1z:integer;
_(
 code(Э05310=,);
  l2v1z := ; code(CД/1/=);
 time := ;
 _);

_proced L0544(l2a1z:integer);
_var l2v1z:integer;
_(
 l2v1z := trunc(l2a1z / 10);
  write(l2v1z:1, l2a1z - l2v1z * 10:1);
_);

_proced L0566(_var l2a1z:integer);
(*=t+*)_type t = 1..12; (*=t-*)
_var l2v1z, l2v2z, l2v3z:integer; l2v4z:_array[1..12] _of char;
_(
 l2v3z := l2a1z;
 _for l2v1z := (1) _to 12 _do _(
 l2v3z := l2v3z;
  code(СД/-4/=);
 l2v3z := ;
  code(МР=);
 l2v2z := ;
 l2v4z[l2v1z] := ;
  _if _not (l2v2z _in digit) _then  _( l2a1z := (0); exit _);
  _); 
 _for l2v1z := (1) _to 12 _do write( l2v4z[l2v1z]:1+0 );
  гг(sp2);
 _);

_proced P0621(l2a1z, l2a2z:integer);
_var l2v1z:alfa; l2v2z:unp6;
_(
 mapia( l2a1z, l2v1z );
 unpck( l2v2z[1], l2v1z );
 _for l2a1z := ((7) - l2a2z) _to 6 _do write( l2v2z[l2a1z]:1+0 );
 _);

_proced L0644(l2a1z:integer);
_var l2v1z, l2v2z, l2v3z, l2v4z:integer;
_(
  l2v1z := 180000;
 l2a1z := l2a1z + 25;
 l2v2z := trunc(l2a1z / l2v1z);
 l2a1z := (l2a1z - (l2v2z * l2v1z));
 l2v3z := trunc(l2a1z / 3000);
 l2a1z := (l2a1z - (l2v3z * 3000));
 l2v4z := trunc(l2a1z / 50);
 _if (l2v2z <> (0)) _then _(
    _if (l2v3z > (9)) _then write( l2v2z:3, dot:1+0, l2v3z:2, dot:1+0 )
    _else _(  write( l2v2z:3, dot:1+0, '0', l2v3z:1, dot:1+0 ); (q) _exit q _)
  _) _else write( l2v3z:6, dot:1+0 );
  L0544( l2v4z )
 _);

_function L0737(l2a1z:integer):alfa;
_var l2v1z, l2v2z, l2v3z:integer; l2v4z:unp6; l2v10z:alfa;
_(
  l2v3z := 100000;
 _for l2v1z := 1 _to 6 _do _(
 l2v2z := trunc(l2a1z / l2v3z);
 l2a1z := (l2a1z - (l2v2z * l2v3z));
 l2v3z := trunc(l2v3z / 10);
 l2v4z[l2v1z] := chr(l2v2z);
  _);
 pck(l2v4z[1], l2v10z);
 L0737 := l2v10z;
 _);

_proced rdPage(l2a1z:boolean; _var l2a2z:page; l2a3z:integer);
_var l2v1z:integer;
_(
 l2v1z := НУ66;
  code(СД/-14/=7ПАИС,2ЦС5=7ЛС,2ЗЧ5=2Э0705,7ПБ1=,С;ИС:10320000000000,К;);
 _if l2a1z  _then _for l2v1z := 0 _to 1023 _do _(
  code(2ИК6=ИА64000,СЧ=17ЗЧ,2СЧ6=2АС4,17ЗЧ=17ИК,ИА=15ПА,17СЧ=15ЗЧ,);
  _);
 _);

_proced P1020(l2a1z, l2a2z:integer);
 _(
   code(7ПАИС2=2СЧ3,СД/-14/=7ЦС,2ЦС4=2ЗЧ4,2Э0704=,7ПБ1=,С;ИС2:10320000000000,К;);
 _);

_function F1034(l2a1z, l2a2z:integer):integer;
_var l2v1z, l2v2z, l2v3z:integer;
_(
  code(2СЧ4=СД/-3/,2ЛС5=СД/-14/,Э050105=,);
 l2a1z := ;
 l2a2z := 0;
 l2v2z := 4096;
 _for l2v1z := 1 _to 4 _do _(
 l2v3z := trunc(l2a1z / l2v2z);
 l2a1z := l2a1z - l2v3z * l2v2z;
 l2v2z := trunc(l2v2z / 16);
 l2a2z := l2a2z * 10 + l2v3z;
  _);
 F1034 := l2a2z;
_);

_proced L1075(l2a1z:integer);
_var l2v1z:integer;
_(
  _if F1034( (0), l2a1z) = 0 _then exit;
  l2v1z := 200077T;
  code(2СЧ3=СД/-44/,2ЛС4=2ЗЧ4,2Э0724=,);
 _);

_function F1111(l2a1z, l2a2z:integer):boolean;
_var l2v1z:integer; l2v2z, l2v3z, l2v4z: alfa;
_(
 F1111 := true;
  _if l2a1z <= 0 _then exit;
 l2v4z :=   L0737( l2a1z );
 l2v1z := ((l2a2z * 64) + 63);
  code(СД/-44/=);
 l2v1z := ;
 l2v2z := '00    ';
 l2v3z := '0000{377{377';
  code(2СЧ11=2СБ7,2РБ10=2ЗЧ11,2ЛС6=Э050131,);
 l2v1z := ;
  code(15ПА=2СЧ11,Э050121=,15ПА40000=2СЧ11,Э050121=,);
  _if l2v1z = 0 _then exit;
 F1111 := false;  
_);

_proced rdZone(_var l2a1z:page; l2a2z, l2a3z:integer);
_var l2v1z:integer; l2v2z, l2v3z, l2v4z: alfa;
_(
 _if (g26z <> l2a2z) _then _(
 _if g26z <> 0 _then  L1075( 47 );
 l2v4z :=   L0737( l2a2z );
 l2v1z := 5777T;
 l2v2z := '00    ';
 l2v3z := '0000{377{377';
 code(2СЧ11=2СБ7,2РБ10=2ЗЧ11,2ЛС6=Э050131,);
 l2v1z := ;
 code(15ПА=2СЧ11,Э050121=,15ПА40000=2СЧ11,Э050121=,);
  _if l2v1z = 0 _then g26z := l2a2z _else _(
  writeln('РАБОТАТЬ НЕЛЬЗЯ КО=', l2v1z:3);
  _GOTO 2552;
  _);
  _);
  P1020( 47, l2a3z );
 _if g20z  _then _for l2v1z := 0 _to 1023 _do _(
  code(2ИК6=ИА64000,СЧ=17ЗЧ,2СЧ6=2АС3,17ЗЧ=17ИК,ИА=15ПА,17СЧ=15ЗЧ,);
  _);
_);

_proced wrZone(l2a1z:boolean; _var l2a2z:page; l2a3z:integer);
_var l2v1z, l2v2z:integer;
_(
 _if l2a1z _then _for  l2v2z := (0) _to 1023 _do _(
  l2v1z := l2a2z[l2v2z];
  code(2ИК7=ИА64000,ЗЧ=);
  _);
  l2v2z := НУ66;
  code(СД/-14/=7ПАИС3,2ЦС5=7ЛС,2ЗЧ5=2Э0705,7ПБ1=,С;ИС3:320000000000,К;);
_);

_procedure enq66;
_var i:integer;
_(
  i := 66B;
  code(СД/-14/=Э050105,Э050115=,)
_);
_procedure deq66;
_var i:integer;
_(
  i := 66B;
  code(СД/-14/=Э050105,Э050116=,)
_);

_procedure P1273; _label 1373;
_var l2v1z, l2v2z, l2v3z:integer; l2v4z:page; l2k28z:@page;
_(
 enq66;
 rdPage( false, l2v4z, z1011 );
 l2k28z := ptr(64031В);
 l2v2z := 0;
 _for l2v3z := 1 _to 33 _do _(
   l2v1z := statAr[l2v3z];
   l2v2z := l2v2z + l2v1z;
  (q) _( l2v1z := shift(l2v1z, 5);  _if l2v1z > 0 _then _goto 1373; _);
 _);
 _if l2v2z <> statAr[0] _then _goto 1373;
 _for l2v3z := 1 _to 33 _do _(
   l2k28z@[l2v3z] := l2k28z@[l2v3z] + statAr[l2v3z];
  _);
 code(Э0634=,); l2v3z := ;
 g29z := g29z;
  code(СД/-30/=17ЗЧ1,МР=);
 l2v2z := ;
 l2v3z := (l2v3z - l2v2z);
  code(17СЧ1=СД/30/,);
 g29z := ;
 l2k28z@[46] := l2k28z@[46] + l2v3z;
 code(Э05310=,);
 l2v1z := ;
 _if l2v1z < g29z _then  l2v1z := l2v3z * 100
  _else _(
 l2v1z := l2v1z - g29z;
  _if l2v1z > l2v3z * 3600 _then  l2v1z := 0001Т;
  _);
 l2k28z@[45] := (l2k28z@[45] + l2v1z);

 wrZone( false, l2v4z, z1011 );
 1373: deq66;
_);

_function L1375(_var l2a1z:alfa):boolean;
_var l2v1z:unp6; l2v7z:integer;
_(
  skipsp;
 _if (INP@ = eq) _then
    _for  l2v7z := 1 _to 4 _do  get(INP);
 l2v7z := (1);
 l2a1z := '      ';
 unpck( l2v1z[1], l2a1z );
 _while (INP@ _in letter) & (l2v7z < (4)) _do
  _( l2v1z[l2v7z] := INP@;  get(INP); l2v7z := l2v7z + 1; _);
  _while (INP@ _in letter) _or (INP@ = minus) _do get(INP);
  skipsp;
  pck(l2v1z[1], l2a1z);
   L1375 := l2v7z > 1;
 _);

_procedure budget; _label 1661;
_var l2v1z, l2v2z, l2v3z, l2v4z, l2v5z, ОТ, ДО: integer;
l2v8z:page;
l2k32z, l2k33z:boolean; l2k34z: integer;
_(
  statis(25);
  l2k33z := false;
  _if INP@ _in digit _then _(
 ОТ :=   L0501( 10 );
 ДО := ;
 l2k33z := true;
  _) _else _if (INP@ = 'В') _then _(
 ОТ := 0;
 ДО := 99;
 _) _else _(
  ОТ :=  mysel( g33z, 48, 41) * 10 + mysel( g33z, 40, 33 );
  ДО := ;
  l2k33z := true;
  _);
 g20z := true;
 rdZone( l2v8z, 2053, 710В );
  writeln(sp:12, '* * *  ОСТАЛОСЬ  * * *
ЛАБ      ЭКСПР      ЛИМИТ      ДЕЖУР     БУМАГА');
 l2k32z := true;
 _for l2v1z := ОТ _to ДО _do _(
  l2v2z := ((l2v1z * (4)) + 12);
  _if (mysel( l2v8z[l2v2z], 25, 25) > (0)) _then _(
  l2k32z := false;
  write( l2v1z:3 ); ГГ(sp2);
  _for l2v3z := (3) _downto 1 _do _(
  l2k34z := l2v8z[(l2v2z + l2v3z)];
  l2v5z := ;
  L0644( l2v5z ); ГГ(sp2);
  _);
  l2v5z :=   mysel( l2v8z[l2v2z], 24, (1) );
  l2v4z := trunc(l2v5z / 100);
  ГГ(sp2); write( l2v4z:4, dot:1+0 );
  L0544( (l2v5z - (l2v4z * (100))) );
  P0472;
  _);
  _);
  _if l2k32z _then _( writeln('БЮДЖЕТ ОТКЛЮЧЕН'); exit _);
  ГГ(sp6);
  l2v3z := 1105В;
  writeln('ЭКСПРЕССНЫЕ ЗАДАЧИ');
 l2v4z := (0);
 (loop) _for l2v1z := (0) _to 255 _do _(
  l2k34z := l2v8z[(l2v3z + l2v1z)];
  _if (l2k34z = (0)) _then _exit loop;
 _if (l2k33z _and (mysel(l2k34z, 48, 45) * 10 +  mysel(l2k34z, 44, 41) = ОТ))
  _or _not l2k33z _then  _(
    L0566( l2k34z );
    _if l2k34z <> 0 _then l2v4z := l2v4z + 1 _else _goto 1661;
  _if l2v4z _MOD 4 = 0 _then  P0472; 1661:
   _)
   _);
   _if l2v4z _MOD 4 <> 0 _then  P0472;
  _if l2v4z = 0 _then  writeln('ТАКИХ НЕТ');
_);

_procedure batch; _label 1715, 1775, 2025, 2203;
_var l2v1z, l2v2z, l2v3z, l2v4z, l2v5z:integer; l2v6z:page;
l2k30z:@page;
l2k31z, l2k32z, l2k33z:integer;
l2k34z, l2k35z:bitset;
 l2k36z, l2k37z:boolean;
 l2k38z, l2k39z:integer; 
_(
  statis(32);
  l2k30z := ptr(64000В);
  g20z := true;
  rdZone( l2v6z, g38z, 545В );
  g20z := false;
  rdZone( l2v6z, g38z, 545В + 1 );
  1715: _while (INP@ = etx) _do _(
   rewrite(INP);
   write(INP,'ОЧЕ,ЖД', 'У,РЕШ {377');
   reset(INP);
  _);
  _if L1375( g15z) _then _select
  g15z = 'ОЧЕ   ': _(  l2k39z := 0;  writeln(sp:6, '=-< ОЧЕРЕДНЫЕ >-=') _);
  g15z = 'ЖДУ   ': _(  l2k39z := 2;  writeln(sp:6, '=-<  ЖДУЩИЕ   >-=') _);
  g15z = 'РЕШ   ': _(  l2k39z := 3;  writeln(sp:6, '=-< РЕШАЮТСЯ  >-=') _);
  g15z = 'ВСЕ   ': _goto 1715;
  true: 1775: _( writeln('НЕПОНЯТНО'); exit _)
  _end _else _goto 1775;
  write('  ШИФР':17, '  НОМ  БЮД  ПОР  ПРИ  ЗАКВРЕМ');
  l2v5z := (0);
  _select
   l2k39z = 0: write('  ПРИЧ');
   l2k39z = 2:write (' ЖДЕТ' : 14)
  _end;
 P0472;
 l2v3z := (0);
  2025:
   l2v1z :=  mysel( l2k30z@[7], 10, (1) );
   _while (l2v1z <> (0)) _do _(
    l2k33z := l2k30z@[l2v1z];
    l2v2z :=  mysel( l2k33z, (48), (41) );
    l2k31z := l2v6z[l2v2z];
  _if (l2k31z = (0)) _then _goto 2203;
  l2k32z := l2k30z@[l2v1z + 6];
  l2k34z := ;
  l2k36z := _not (21 _IN l2k34z);
  l2k37z := 16 _IN l2k34z;
  _select
  l2k36z:  l2k38z := (0);
  l2k37z: l2k38z := 2;
  true: l2k38z := (1)
  _end;
  _if (l2k39z <> l2k38z) _then _goto 2203;
 l2v3z := (l2v3z + (1));
  write(l2v3z:3);
  ГГ(sp2);
 l2v6z[l2v2z] := (0);
 L0566( l2k31z );
 P0621( l2v2z, (3) );
  ГГ(sp2);
 l2k32z := l2k32z;
  code(СД/-4/=);
 l2k35z := ;
  l2v4z := minel(l2k35z);
  _select
  l2v4z = 0:  write('ДЕЖ');
  l2v4z = 1:  write('ЛИМ');
  l2v4z = 2:  write('ЭКС');
  true:  write(' - ')
  _end;
  ГГ(sp2);
_if (l2k38z = (0)) _then _( 
 l2v5z := (l2v5z + (1));
 P0621( l2v5z, (3) );
  _) _else  write( sp:3 );
  ГГ(sp2);
  l2v4z :=   mysel(l2k30z@[l2v1z + 7], 45, 39);
 P0621( l2v4z, (3) );
 L0644( mysel( l2k33z, 25, 6) * 32 );
 _if (l2k38z = 2) _then _(
  ГГ(sp2);
  L0566( l2v6z[(l2v2z + (128))] );
 _);
 P0472;
 2203:
 _if (l2k39z = (3)) _then  l2v6z[l2v2z] := (0);
 l2v1z :=   mysel( l2k30z@[l2v1z + 7], 10, (1) );
  _); (* while *)
 _if (l2k39z = (3)) _then 
 _for l2v2z := (0) _to 127 _do _(
 l2k32z := l2v6z[l2v2z];
 _if (l2k32z <> (0)) _then _(
 l2v3z := (l2v3z + (1));
  write( l2v3z:3 );
  ГГ(sp2);
  L0566( l2k32z );
  P0472;
  _)
  _);
  _if l2k39z = 0 _then _(  l2k39z := 1;  _goto 2025  _);
  _if (INP@ = comma) _then _( get(INP); _goto 1715 _);
_);

_proced exec(l2a1z:integer);
_var l2v1z:alfa;
l2v2z, l2v3z, l2v4z:integer;
l2v5z, l2v6z:@area; l2v7z: boolean; l2v8z: char; l2v9z:unp6;
_(
  code(2СЧ3=СД/22/,);
  l2v4z := ;
  code(=МР,СД/36/=);
 l2a1z := ;
 l2v5z := ref(g22z);
 l2v6z := ptr(8128);
 _for l2v2z := (1) _to 56 _do l2v6z@[l2v2z] := l2v5z@[l2v2z];
  reset(INP);
 l2v6z := ptr(8112);
 l2v7z := false;
 (loop) _for l2v2z := (1) _to 16 _do _(
  l2v1z := '      ';
 unpck( l2v9z[1], l2v1z );
 (loop) _for l2v3z := (1) _to 6 _do _(
  l2v8z := INP@;
 get(INP);
 l2v9z[l2v3z] := l2v8z;
 _if (l2v8z = etx) _then _( l2v7z := true; _exit loop _)
  _);
  pck(l2v9z[1], l2v1z);
  l2v1z := l2v1z;
  l2v6z@[l2v2z] := ;
  _if l2v7z _then _exit loop;
  _); (* 2334 *)
   l2v1z := 'ТАМБОВ';
  code(ИА17777=ЗЧ,2СЧ3=7ПАХХ,7ЛС4=5ПА17770,5ЗЧ6=);
  l2v4z := 1 - l2v4z;
  code(УИ4=15ПА77773,ХХ:15ИА=7СЧ12,15ИА=5Э0755,7ИА=15КЦ,5ПБ=,СЧ=,5Э0706=,5СЧ6=5ЦС5,5ЗЧ6=5ИА,4КЦ=СЧ,УИ5=ПБ7,ЗЧ100=ЗЧ1,);
_);

_proced P2357;
_var l2v1z, l2v2z:@area;
 l2v3z, l2v4z:integer; l2v5z:char; l2v6z:alfa; l2v7z:unp6;
_(
 l2v1z := ref(g22z);
 l2v2z := ptr(8128);
 _for l2v3z := (1) _to 56 _do l2v1z@[l2v3z] := l2v2z@[l2v3z];
 l2v2z := ptr(8112);
 (loop) _for l2v3z := (1) _to 16 _do _(
 l2v4z := l2v2z@[l2v3z];
 l2v6z := ;
 unpck( l2v7z[1], l2v6z );
 _for l2v4z := (1) _to 6 _do _(
 l2v5z := l2v7z[l2v4z];
 INP@ := l2v5z;
 put(INP);
  _if (l2v5z = etx) _then _exit loop;
  _)
  _);
 reset(INP);
 _GOTO 2566;
_);
_proced ФФФ; _label 2475;
_var l2v1z:integer;
_(
  _if (mysel( g34z, 32, (1)) = (0)) _then _goto 2475;
  _for l2v1z := (1) _to 3 _do
    _if mysel( g31z, 16 * l2v1z, 16 * l2v1z - 15) = 0 _then _goto 2475;
 _for l2v1z := (1) _to 3 _do 
  _if mysel( g34z, 50 - l2v1z * 2, 49 - l2v1z * 2) = 0 _then _goto 2475;
  exit;
  2475:
  rewrite(INP);
  write(INP,'RЕQ  {377':6);
  exec( (5661015C) );
_);
(* main *)
_(
  code(ИА17777=СЧ,);
  g17z := ;
  _if (g17z <> 'ТАМБОВ') _then _(
 _if 1 = 1 _then _(
   g16z := 'Н{3770000';
  code(ЗЧ76517=);
  _);
 g26z :=   F1034( (5), (7) );
 g38z := (2053);
 g39z :=   F1034( (0), НУ66 );
 _if g39z <> 2054 _then _(
 L1075( НУ66 );
 _if _not F1111( 2054, 54) _then _(
  writeln('НЕТ БОБИНЫ', 2054:5);
 _goto 3024;
  _);
  _);
 g40z := false;
 g41z := 1;
 g42z := ;
  _) _else  P2357;
2552:
  _if (statAr[0] > 2) _and
      (time  _MOD 11 < 3) _and
      (g24z > 3) _and
      (g32z <> 0) _and
      g43z _then _( g43z := false; ФФФ _);
  TTIN;
 2566:
  g19z := false;
  2567: _if L1375( g15z)  _then _(
  _if g15z <> 'SLЕ   ' _then  g14z := 0;
  _select
  ('КОН   ' = g15z) : _(
  2577: writeln('ДО СВИДАНИЯ !');
  2602: statis(33);
  P1273; code(Э062=,);  
  _);
  ('ПОЧ   ' = g15z): _goto 2613;
  ('ЛЕН   ' = g15z):  2613: exec( ПУСК );
  ('НОВ   ' = g15z): _goto 2613;
  ('КТО   ' = g15z): _goto 2613;
  ('ИГР   ' = g15z):  exec( ИГРА );
  ('КАЛ   ' = g15z): _goto 2634;
  ('СТА   ' = g15z): 2634: exec( СТАТ );
  ('ШИФ   ' = g15z): _goto 2613;
  ('ПАУ   ' = g15z): _goto 2634;
  ('ВРЕ   ' = g15z): _goto 2634;
  ('ВЦП   ' = g15z): _goto 2634;
  ('ПАР   ' = g15z): _goto 2613;
  ('ИНФ   ' = g15z): _goto 2613;
  ('ВИД   ' = g15z): _goto 2613;
  ('СВЯ   ' = g15z): _(  statis( 9 );  exec( СВЯЗЬ ) _);
  ('БЮД   ' = g15z): budget;
  ('ПАК   ' = g15z): batch;
  ('КАД   ' = g15z): _( statis( 28 ); exec( КАДРЫ ) _);
  ('ПЛА   ' = g15z): _( statis( 29 ); exec( ПЛАН ) _);
  ('ДАТ   ' = g15z): _goto 2634;
  ('ДИС   ' = g15z): _goto 2613;
  ('СЕТ   ' = g15z): _goto 2634;
  ('ВЫЗ   ' = g15z): _goto 2634;
  ('ПЕЧ   ' = g15z): _goto 2634;
  ('ЭКР   ' = g15z): _goto 2634;
  ('БЭС   ' = g15z): _goto 2634;
  ('СИС   ' = g15z):  exec( СИСТ );
  ('РЕД   ' = g15z): _( statis( 23 ); exec( РЕДАК ) _);
  ('ИДИ   ' = g15z): _goto 2634;
  ('ШКО   ' = g15z):  exec( ШКОЛА );
  ('АДМ   ' = g15z): _(  statis( 30 ); exec( АДМИН ) _);
  ('БИБ   ' = g15z): _(  statis( 27 ); exec( БИБЛ ) _);
  ('ДАЙ   ' = g15z): _(  g19z := true; _goto 2567 _);
  ('СОN   ' = g15z): _goto 2602;
  ('RЕQ   ' = g15z): _goto 2552;
  ('ВЫХ   ' = g15z): _goto 2552;
  ('SLЕ   ' = g15z): _( writeln('СПАТЬ НЕЛЬЗЯ'); g14z := g14z+1; _if g14z > 1 _then _goto 2577  _);
  ('ФФФ   ' = g15z):  ФФФ;
  ('ПУЛ   ' = g15z): _( statis( 33 );  P1273;
  3024:
 _if (g39z <> 2054) _then _(
   L1075( НУ66 );
  _if _not F1111( g39z, НУ66) _then _( writeln('НЕТ БОБИНЫ', g39z:5); code(Э0620=,) _);
  _);
   writeln('ВЫХОД В ПУЛЬТ');
  _if ((1) = (1)) _then _(
  g12z := 071Т;
  code(ЗЧ76104=);
 g12z := (36006401156117C);
  code(Э07576106=,);
 g17z := 'И{3770000';
  code(ЗЧ76517=);
  _);
  code(СЧ=ИА17777,ЗЧ=ПБ76002,);
  _);
  ('ВОП   ' = g15z): _(  statis(26); exec( ВОПРОС )  _);
  true: writeln('НЕТ ТАКОГО ПРИКАЗА')
  _end;
  _) _else
 writeln('НЕ ПОНИМАЮ');
  _goto 2552;
_).
