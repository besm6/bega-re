(*=p-,t-,m-*)
_program ГОРОСК;
_label 2261;
_const sp=' '; etx='{377'; 
_type bitset = _set _of 0..47;
_var g10z:@integer; g11z, g12z:integer; g13v: integer;
g13z:_array [1..63] _of integer;
g77z,g78z,g79z,g80z,g81z:integer;
g82z:boolean;
g83z, g84z, g85z, g86z, g87z, g88z, g89z, g90z, g91z,g92z,g93z:integer;
g94z, g95z,g96z:boolean;
_proced L0116(err:integer);
_(
  writeln('ОШИБКА = ', err:5, sp, input@);
  _GOTO 2261;
_);

_proced L0132(l2a1z:integer);
_var l2v1z:integer;
_(
  l2a1z := l2a1z _div 4;
 _while _not (l2a1z <= (0)) _do _(;
   _if (l2a1z > (2044)) _then l2v1z := (2044) 
   _else l2v1z := l2a1z;
    l2a1z := (l2a1z - l2v1z);
  code(2СЧ4=Э0507700,);
 _);
_);

_function ttyNum:integer;
_var l2v1z,l2v2z:bitset;
_(
 l2v1z := [0..47];
  code(17ЗЧ1=17Э0711,);
 l2v2z := ;
 ttyNum := minel(l2v2z) + 1;
_);

_proced L0160(l2a1z:integer);
_(
   code(7ПАЬИС=2СЧ3,7ЛС=,2ЗЧ3=2Э0713,7ПБ1=,C;ЬИС:0120000200000000,К;);
_);

_function L0170(l2a1z:integer):boolean;
_var l2v1z:bitset;
l2v2z:integer;
_(
  l2v1z := [l2a1z-1];
  code(Э06257=,СД/6/=МР,СД/-6/=МР,);
  l2v2z := ;
  L0170 := l2v2z = 77C;
_);

_proced L0205;
_( code(L0207:ЗЧ1=1ИК14,1СЧ15=СД/-6/,ЛС1=1ИК14,1ЗЧ15=);
  code(=1СЧ13,ЦС13=1ЗЧ13,); (* g11z := succ(g11z); *)
  code(СД/3/=У0L0232,);
  g11z := 0;
  code(1СЧ14=ЦС13,1ЗЧ14=); (* g12z := succ(g12z); *)
  code(=СД/6/,У0L0232=);
(L0221) _(
  g12z := 1;
  code(ВИ3=17ЗЧ,ВИ16=17ЗЧ,3ПА71717=1СЧ12,Э0501211=,17СЧ=УИ16,17СЧ=УИ3,16ПБ=,);
  code(C;54,К;L0232:СЧ1=ИАL0232(-1),СР=16У1,1ИК14=1СЧ15,ЗЧ1=1СЧ13,);
  code(L0236:СД/3/=У1L0243,СЧ1=СД/-6/,ЗЧ1=1СЧ13,ЦС13=1ЗЧ13,ПБL0236=,);
  code(L0243:СЧ1=1ИК14,1ЗЧ15=СЧ12,1ЗЧ13=);
  _goto L0221
_)
_);

 _proced L0247(l2a1z:integer);
_var l2v1z:integer;
_(
 _if g82z & (l2a1z = 1) _then  EXIT;
 _if _not g82z & (l2a1z = 0) _then  EXIT;
 g82z := l2a1z = 1;
 l2v1z := 1;
 _while _not (l2v1z > g77z) _do _(
  code(2СЧ3=ИАдевять,ЦС=16ПВL0207,ПБL0273=,С;девять:11,К;L0273:);
  l2v1z := l2v1z + 1;
 _);
_);

_proced L0276(l2a1z:integer; _var l2a2z:integer);
 _(
 _if (l2a1z = (0)) _then g77z := abs(l2a2z)
 _else _if (l2a1z = (1)) _then l2a2z := g77z
 _else  L0116( 3 );
_);

_proced L0316(l2a1z: integer; _var l2a2z:integer);
 _(
 _if (l2a1z = (0)) _then g79z := l2a2z
 _else _if (l2a1z = (1)) _then l2a2z := g79z
 _else L0116( 1 );
 _);

_function L0335:boolean;
_var l2v1z, l2v2z:integer;
_(
 l2v1z := 600000B;
 code(=Э050105,);
 l2v1z := ;
 L0335 := true;
 _if l2v1z = 8 _then  EXIT;
 l2v2z := (8);
 l2v1z := 6077B;
  code(СД/-44/=2ЛС5,Э050131=,);
 l2v1z := ;
  code(15ПА=2СЧ5,Э050121=,);
  code(15ПА40000=2СЧ5,Э050121=,);
 _if l2v1z = 0 _then  EXIT;
 L0335 := false;
_);

_proced L0361;
_var l2v1z, l2v2z:integer;
_(
 l2v1z := (2000770000000000C);
 l2v2z := 60B;
  code(2СЧ4=СД/-44/,2ЛС3=2ЗЧ3,2Э0723=,)
_);

 _proced L0371(l2a1z, l2a2z:integer);
_var l2v1z, l2v2z, l2v3z, l2v4z:integer;
_(
 _if (l2a1z = (0)) & (l2a2z = (0)) _then  EXIT;
  code(6ПАА300=);
 _if (l2a1z < (0)) _then _(
   l2a1z := -l2a1z;
    code(=6СА20,);
  _);
 _if (l2a2z < (0)) _then _(
    l2a2z := -(l2a2z);
    code(=6СА10,);
  _);
  _select
  (l2a1z * 2) < l2a2z: _(  l2v1z := l2a2z; l2v2z := (l2a1z * 2) _);
  (l2a1z < l2a2z): _(  l2v1z := l2a2z; l2v2z := ((l2a2z - l2a1z) * 2); code(6CA2=) _);
  ((l2a2z * 2) > l2a1z): _(  l2v1z := l2a1z; l2v2z := ((l2a1z - l2a2z) * 2); code(6CA4=) _);
  true: _( l2v1z := l2a1z; l2v2z := (l2a2z * 2); code(6CA6=) _)
  _end;
  code(6СЧ=2ЗЧ7,);
  code(6СЧ1=2ЗЧ10,);
  code(ВИ=2ЗЧ3,);
  code(2СЧ5=УИ6,);
  code(СД/1/=2ЗЧ4,);
  code(L0443:2СЧ3=2ЦС6,2ЗЧ3=);
  _if (l2a1z > l2a2z) _then _(
    code(2СЧ4=2ЦС5,2ЗЧ4=2СЧ10,16ПАL0452=ПБL0207,);
  _);
  code(2СЧ7=16ПВL0207,L0452:6СА-1=6И1L0443,);
  EXIT;
  code(С;А300:2,34,3,34,3,36,4,36,6,35,5,35,5,37,4,37,2,30,1,30,1,32,0,32,6,31,7,31,7,33,0,33,К;)
_);

_proced L0515(l2a1z, l2a2z:integer);
 _(
 L0247( (0) );
 L0371( l2a1z, l2a2z );
 g80z := (g80z + l2a1z);
 g81z := (g81z + l2a2z);
 _);

_proced L0532(l2a1z, l2a2z, l2a3z, l2a4z:real);
_var l2v1z, l2v2z, l2v3z, l2v4z:integer;
_(
 l2v1z := round(l2a1z);
 l2v2z := round(l2a3z);
 l2v3z := round(l2a2z);
 l2v4z := round(l2a4z);
 _if (l2v1z <> g80z) _or (l2v3z <> g81z) _then _(
 L0247( (0) );
 L0371( (l2v1z - g80z), (l2v3z - g81z) );
  _);
 L0247( (1) );
 L0371( (l2v2z - l2v1z), (l2v4z - l2v3z) );
 g80z := l2v2z;
 g81z := l2v4z;
 _);

_proced L1265(l2a1z, l2a2z, l2a3z, l2a4z:integer);
_var l2v1z, l2v2z, l2v3z:integer; 
_proced L0570;
_var l3v1z, l3v2z, l3v3z, l3v4z, l3v5z, l3v6z, l3v7z:integer;
_(
 l2v1z := (0);
 l3v3z := (1);
 _while (l3v3z <= l2a2z) _do _(;
 L0371( -(l2v1z), (0) );
 l3v1z := l2a3z;
 l2v1z := (0);
 l3v7z := (1);
 l3v6z := (1);
 _while (l3v6z <= (l2a4z - (1))) _do _(
   (*=m+*)l3v7z := l3v7z * 10;(*=m-*)
   l3v6z := l3v6z + 1;
 _);
 l3v4z := (1);
% L0616:,BSS,;
 _while (l3v4z <= l2a4z) _do _(
   l3v5z := 14 * l2a1z;
   l2v1z := (l2v1z + l3v5z);
   l3v2z := trunc(l3v1z / l3v7z);
   l3v1z := l3v1z - l3v2z * l3v7z;
   l3v7z := l3v7z _div 10;
   _case l3v2z _of
   0: _(
   L0247( (1) );
   L0371( (0), l2a1z * 16 );
   L0371( (l2a1z * 8), (0) );
   L0371( (0), -((l2a1z * 16)) );
   L0371( -((l2a1z * 8)), (0) );
  _);
  1: _(
   L0371( (0), (l2a1z * 8) );
   L0247( (1) );
   L0371( (l2a1z * 8), (l2a1z * 8) );
   L0371( (0), -((l2a1z * 16)) );
   l3v5z := (l3v5z - (l2a1z * 8));
  _);
  2: _(
   L0371( (0), (l2a1z * 16) );
   L0247( (1) );
   L0371( (l2a1z * 8), (0) );
   L0371( (0), -((l2a1z * 8)) );
   L0371( -((l2a1z * 8)), -((l2a1z * 8)) );
   L0371( (l2a1z * 8), (0) );
   l3v5z := (l3v5z - (l2a1z * 8));
  _);
  3: _(
   L0371( (0), (l2a1z * 16) );
   L0247( (1) );
   l3v6z := (1);
   _while (l3v6z <= (2)) _do _(
     L0371( (l2a1z * 8), (0) );
     L0371( -((l2a1z * 8)), -((l2a1z * 8)) );
     l3v6z := (l3v6z + (1));
   _);
  _);
  4: _(
   L0371( (0), (l2a1z * 16) );
   L0247( (1) );
   L0371( (0), -((l2a1z * 8)) );
   L0371( (l2a1z * 8), (0) );
   L0247( (0) );
   L0371( (0), (l2a1z * 8) );
   L0247( (1) );
   L0371( (0), -((l2a1z * 16)) );
   l3v5z := (l3v5z - (l2a1z * 8));
  _);
  5: _(
   L0371( (l2a1z * 8), (l2a1z * 16) );
   L0247( (1) );
   L0371( -((l2a1z * 8)), (0) );
   L0371( (0), -((l2a1z * 8)) );
   L0371( (l2a1z * 8), (0) );
   L0371( (0), -((l2a1z * 8)) );
   L0371( -((l2a1z * 8)), (0) );
  _);
  6: _(
   L0371( (l2a1z * 8), (l2a1z * 16) );
   L0247( (1) );
   L0371( -((l2a1z * 8)), -((l2a1z * 8)) );
   L0371( (l2a1z * 8), (0) );
   L0371( (0), -((l2a1z * 8)) );
   L0371( -((l2a1z * 8)), (0) );
   L0371( (0), (l2a1z * 8) );
   L0247( (0) );
   L0371( (l2a1z * 8), -((l2a1z * 8)) );
   l3v5z := (l3v5z - (l2a1z * 8));
  _);
  7: _(
 L0371( (0), (l2a1z * 16) );
 L0247( (1) );
 L0371( (l2a1z * 8), (0) );
 L0371( -((l2a1z * 8)), -((l2a1z * 8)) );
 L0371( (0), -((l2a1z * 8)) );  
  _);
  8: _(
   L0247( (1) );
 L0371( (l2a1z * 8), (0) );
 L0371( (0), (l2a1z * 16) );
 L0371( -((l2a1z * 8)), (0) );
 L0371( (0), -((l2a1z * 8)) );
 L0371( (l2a1z * 8), (0) );
 L0247( (0) );
 L0371( -((l2a1z * 8)), (0) );
 L0247( (1) );
 L0371( (0), -((l2a1z * 8)) );
  _);
  9: _(
 L0371( (l2a1z * 8), (l2a1z * 8) );
 L0247( (1) );
 L0371( (0), (l2a1z * 8) );
 L0371( -((l2a1z * 8)), (0) );
 L0371( (0), -((l2a1z * 8)) );
 L0371( (l2a1z * 8), (0) );
 L0371( -((l2a1z * 8)), -((l2a1z * 8)) );
  _)
  _end;
 L0247( (0) );
 L0371( l3v5z, (0) );
 l3v4z := (l3v4z + (1));
  _);
 l3v3z := (l3v3z + (1));
 _)
_);

_( (* L1265 *)
   l2v2z := (1);
 l2v3z := (1);
 L0570;
 L0371( (-(l2v1z) + l2v2z), (0) );
 L0570;
 L0371( (-(l2v1z) - l2v2z), -(l2v3z) );
 L0570;
 L0371( (0), l2v3z );
 g80z := (g80z + l2v1z);
_);
_proced L1312(_var l2a1z, l2a2z:_array [1..20] _of real; l2a3z, l2a4z:integer; l2a5z:real);
_var l2v1z, l2v2z, l2v3z, l2v4z:integer; l2v5z, l2v6z:real;
_(
 l2v1z := (l2a3z - (1));
 _for l2v4z := (1) _to g91z _do _(
   _for l2v3z := 1 _to l2v1z _do _(
      L0532( l2a1z[l2v3z], l2a2z[l2v3z], l2a1z[l2v3z+1], l2a2z[l2v3z + 1] );
  _);
  L0532(l2a1z[l2a3z], l2a2z[l2a3z], l2a1z[1], l2a2z[1] );
 _);
 _for l2v2z := 1 _to l2a4z _do _(;
 l2v5z := l2a1z[1];
 l2v6z := l2a2z[1];
 _for l2v3z := 1 _to l2v1z _do _(
   l2a1z[l2v3z] := l2a1z[l2v3z] + (l2a1z[l2v3z + 1] - l2a1z[l2v3z]) * l2a5z;
   l2a2z[l2v3z] := l2a2z[l2v3z] + (l2a2z[l2v3z + 1] - l2a2z[l2v3z]) * l2a5z;
 _);                                                       
 l2a1z[l2a3z] := l2a1z[l2a3z] + (l2v5z - l2a1z[l2a3z]) * l2a5z;
 l2a2z[l2a3z] := l2a2z[l2a3z] + (l2v6z - l2a2z[l2a3z]) * l2a5z;
 _for l2v4z := 1 _to g91z _do _(
   _for l2v3z := 1 _to l2v1z _do _(
     L0532( l2a1z[l2v3z], l2a2z[l2v3z], l2a1z[l2v3z + 1], l2a2z[l2v3z + 1]);
   _);
    L0532( l2a1z[l2a3z], l2a2z[l2a3z], l2a1z[1], l2a2z[1] );
  _);
 _);
_);

_function L1521:integer;(*=m+*)
 _(
 g90z := (47 * g90z + 127) _MOD 1013;
 L1521 := g90z;
 _);

_proced L1531(l2a1z, l2a2z, l2a3z:integer);
_const c100=100;
_var l2v1z, l2v2z, l2v3z, l2v4z, l2v5z, l2v6z, l2v7z, l2v8z, l2v9z, l2v10z, l2v11z, l2v12z, l2v13z, l2v14z:integer;
l2v15z, l2v16z, l2v17z, l2v18z, l2v19z, l2v20v:real;
l2v20z, l2v40z:_array [1..20] _of real;
_(
 l2v7z := l2a1z;
 l2v2z := (l2a3z _MOD (100));
 l2v13z := 13;
 l2v8z := (1660);
 l2v9z := (1180);
 l2v10z := 30;
 l2v6z := (8);
 l2v14z := ((l2v2z + (51)) + g93z);
 _for l2v1z := (1) _to l2v14z _do l2v5z :=   L1521;
   _for l2v1z := (1) _to l2v13z _do (a) _(
 l2v5z :=   L1521;
 _for l2v4z := (1) _to l2v1z - 1 _do _(
  _if l2v20z[l2v4z] = l2v5z _then _(  l2v5z :=   L1521;  _goto a _);
  _);
% L1601:,BSS,;
 l2v20z[l2v1z] := l2v5z;
 _for l2v3z := (1) _to l2a2z _do  l2v5z :=   L1521;
 l2v40z[l2v1z] := L1521;
 _for l2v3z := (1) _to l2v7z _do  l2v5z :=   L1521;

 _if (l2v7z < (2)) _then l2v7z := (l2v7z + (1)) _else l2v7z := (l2v7z - (1));
 _);
 %  L1637:,BSS,;
  l2v15z := 1013.0;
 l2v16z := ;
 l2v17z := (0);
 l2v18z := ;
 _for l2v1z := (1) _to l2v13z  _do _(;
  _if (l2v20z[l2v1z] < l2v15z) _then l2v15z := l2v20z[l2v1z];
 _);
% L1653:,BSS,;
 _for l2v1z := (1) _to l2v13z _do _(;
  _if (l2v40z[l2v1z] < l2v16z) _then l2v16z := l2v40z[l2v1z];
 _);
%  L1664:,BSS,;
 _for l2v1z := (1) _to  l2v13z _do _(;
 _if (l2v20z[l2v1z] > l2v17z) _then  l2v17z := l2v20z[l2v1z];
 _);
% L1675:,BSS,;
 _for l2v1z := (1) _to l2v13z _do _(;
  _if (l2v40z[l2v1z] > l2v18z) _then  l2v18z := l2v40z[l2v1z];
 _);
% L1706:,BSS,;
 _if g95z _then
 l2v1z := (((g86z * 1000000) + (g87z * (10000))) + g88z)
  _else
 l2v1z := (((l2a1z * 1000000) + (l2a2z * (10000))) + l2a3z);

 l2v11z := ((l2v9z - (l2v10z * (2))) - (80));
  g80z := -70;
  g81z := -70;
  _if _not g94z _then _(
    L0247( (0) );
    L0515( (80), l2v11z );
    _if (g91z = (1)) _then L1265( 3, (1), l2v1z, l2v6z )
    _else L1265(3, 3, l2v1z, l2v6z );
  _);
 l2v11z := (l2v11z - (140));
 l2v12z := ((l2v8z - (l2v10z * (2))) - (140));
 l2v19z := ((l2v12z) / ((l2v17z) - l2v15z));
 l2v20v := ((l2v11z) / (l2v18z - l2v16z));
 _for l2v1z := (1) _to l2v13z _do _(;
   l2v20z[l2v1z] := (((l2v20z[l2v1z]) - l2v15z) * l2v19z);
   l2v40z[l2v1z] := ((l2v40z[l2v1z] - l2v16z) * l2v20v);
 _);
% L2003:,BSS,;
_if _not g94z  _then _(
  L1312( l2v20z, l2v40z, l2v13z, 35, 0.04999999999995 ); (* writing 0.05 causes a discrepancy in the last bit *)
  _) _else _(
    _for l2v1z := (1) _to l2v13z _do _(;
      writeln(l2v1z:3,  trunc(l2v20z[l2v1z]):5, trunc(l2v40z[l2v1z]) );
    _);
  _)
_);

_proced L2034;
 _(
 _while input@ = sp _do  get(input);
 _);

_function L2042:integer;
_var l2v1z:integer;
_(
 l2v1z := (0);
 _if (input@ > '9') _then  L0116( 5 );
 _while ord(input@) < 10 _do _(;
 l2v1z := l2v1z * 10 + ord(input@);
 get(input);
 _);
 L2042 := l2v1z;
 _);
_proced L2061;
_label 2077;
_var l2v1z, l2v2z, l2v3z, l2v4z:integer;
_(
 (a) _(
   writeln('ВВОД ДАННЫХ <Д М Г ПОВ ВЕР [Д М Г]>');
   BIND(' -=% {172');
   _if (input@ = 'К') _then  _GOTO 2261;
   L2034;
   l2v1z :=   L2042;
  _if (l2v1z > 31) _then _( 2077: writeln('ОШИБКА В ДАТЕ.');  _goto a _);
  _);
  L2034;
  l2v2z :=   L2042;
  _if (l2v2z > 12) _then _goto 2077;
  L2034;
  l2v3z :=   L2042;
  _if (l2v3z < (1900)) _or (l2v3z > (2000)) _then _goto 2077;
  L2034;
  g91z :=   L2042;
  _if (g91z > 3) _then  g91z := 3;
  L2034;
  _if (input@ <> etx) _then  g93z :=   L2042 _else g93z := (0);
  L2034;
  _if (input@ = etx) _then  g95z := false _else _(
    g95z := true;
    L2034;
    g86z :=   L2042;
    _if (g86z > 31) _then _goto 2077;
    L2034;
    g87z :=   L2042;
    _if (g87z > 12) _then _goto 2077;
     L2034;
     g88z :=   L2042;
     _if (g88z < (1900)) _or (g88z > (2000)) _then _goto 2077;
   _);
   _if  _not g94z  _then  L0160( g92z );
   L1531( l2v1z, l2v2z, l2v3z );
_);
 _proced L2177;
 _(
 _if _not L0335 _then _(
   writeln('НЕТ ЛЕНТЫ');
   _GOTO 2261;
 _);  
 L2061;
 _if _not g94z _then _(
   L0247( (0) );
   g83z := (44);
   code(16ПВL0207=,);
 _);
 L0361;
 _if _not g94z _then _(
   _while _not L0170( g92z) _do L0132( (200) );
 _)
_);

_(
 g10z := ref(g13v);
 g83z := (1010101010101010C);
 g89z := ;
 g13v := g89z;
 g90z := 777B;
 g11z := (0);
 g12z := (1);
 g80z := (0);
 g81z := (0);
 g79z := (1);
 g78z := (0);
 g77z := (1);
 g82z := false;
  g83z := 32;
  L0276( (0), g83z );
 L0316( (0), g83z );
 L0247( (0) );
 g94z := false;
 g92z :=   ttyNum;
  2261:
  BIND(' ==+ {172');
  _select
  input@ = 'К': HALT;
  (input@ = 'Г'): _(    g90z := 777B;    L2177; _);
  true:  writeln('НЕПОНЯТНО')
  _end;
  _goto 2261;
_).
