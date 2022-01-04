(*=p-,t-,m-*)
_program ГОРОСК;
_label 2261;
_const sp=' '; etx='{377'; up=0;down=1;
_type bitset = _set _of 0..47;
_var g10z:@integer; g11z, g12z:integer; g13v: integer;
g13z:_array [1..63] _of integer;
pencnt,g78z,g79z,curX,curY:integer;
penDown:boolean;
g83z, g84z, g85z, day2, month2, year2, g89z, seed, ПОВ,tty,ВЕР:integer;
debug, twoDates,g96z:boolean;
_proced error(err:integer);
_(
  writeln('ОШИБКА = ', err:5, sp, input@);
  _GOTO 2261;
_);

_proced pause(l2a1z:integer);
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
_var allones,result:bitset;
_(
 allones := [0..47];
  code(17ЗЧ1=17Э0711,);
 result := ;
 ttyNum := minel(result) + 1;
_);

_proced detach(l2a1z:integer);
_(
   code(7ПАЬИС=2СЧ3,7ЛС=,2ЗЧ3=2Э0713,7ПБ1=,C;ЬИС:0120000200000000,К;);
_);

_function grab(l2a1z:integer):boolean;
_var l2v1z:bitset;
l2v2z:integer;
_(
  l2v1z := [l2a1z-1];
  code(Э06257=,СД/6/=МР,СД/-6/=МР,);
  l2v2z := ;
  grab := l2v2z = 77C;
_);

_proced L0205;
_( code(addcmd:ЗЧ1=1ИК14,1СЧ15=СД/-6/,ЛС1=1ИК14,1ЗЧ15=);
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

 _proced setPen(dest:integer);
_var i:integer;
_(
 _if penDown & (dest = down) _then  EXIT;
 _if _not penDown & (dest = up) _then  EXIT;
 penDown := dest = down;
 _for i := 1 _to pencnt _do
   code(2СЧ3=ИАдевять,ЦС=16ПВaddcmd,ПБL0273=,С;девять:11,К;L0273:);
_);

_proced L0276(l2a1z:integer; _var l2a2z:integer);
 _(
 _if (l2a1z = (0)) _then pencnt := abs(l2a2z)
 _else _if (l2a1z = (1)) _then l2a2z := pencnt
 _else  error( 3 );
_);

_proced L0316(l2a1z: integer; _var l2a2z:integer);
 _(
 _if (l2a1z = (0)) _then g79z := l2a2z
 _else _if (l2a1z = (1)) _then l2a2z := g79z
 _else error( 1 );
 _);

_function lock:boolean;
_var i, j:integer;
_(
 i := 600000B;
 code(=Э050105,);
 i := ;
 lock := true;
 _if i = 8 _then  EXIT;
 j := 8;
 i := 6077B;
  code(СД/-44/=2ЛС5,Э050131=,);
 i := ;
  code(15ПА=2СЧ5,Э050121=,);
  code(15ПА40000=2СЧ5,Э050121=,);
 _if i = 0 _then  EXIT;
 lock := false;
_);

_proced unlock;
_var i, j:integer;
_(
 i := 200077T;
 j := 60B;
  code(2СЧ4=СД/-44/,2ЛС3=2ЗЧ3,2Э0723=,)
_);

 _proced transport(dx, dy:integer);
_var l2v1z, l2v2z, l2v3z, l2v4z:integer;
_(
 _if (dx = 0) & (dy = 0) _then  EXIT;
  code(6ПАА300=);
 _if dx < 0 _then _(
   dx := -dx;
    code(=6СА20,);
  _);
 _if dy < 0 _then _(
    dy := -dy;
    code(=6СА10,);
  _);
  _select
  dx * 2 < dy: _( l2v1z := dy; l2v2z := dx * 2 _);
  dx < dy:     _( l2v1z := dy; l2v2z := (dy - dx) * 2; code(6CA2=) _);
  dy * 2 > dx: _( l2v1z := dx; l2v2z := (dx - dy) * 2; code(6CA4=) _);
  true:        _( l2v1z := dx; l2v2z := dy * 2; code(6CA6=) _)
  _end;
  code(6СЧ=2ЗЧ7,);
  code(6СЧ1=2ЗЧ10,);
  code(ВИ=2ЗЧ3,);
  code(2СЧ5=УИ6,);
  code(СД/1/=2ЗЧ4,);
  code(L0443:2СЧ3=2ЦС6,2ЗЧ3=);
  _if dx > dy _then _(
    code(2СЧ4=2ЦС5,2ЗЧ4=2СЧ10,16ПАL0452=ПБaddcmd,);
  _);
  code(2СЧ7=16ПВaddcmd,L0452:6СА-1=6И1L0443,);
  EXIT;
  code(С;А300:2,34,3,34,3,36,4,36,6,35,5,35,5,37,4,37,2,30,1,30,1,32,0,32,6,31,7,31,7,33,0,33,К;)
_);

_proced rmoveto(dx, dy:integer);
 _(
 setPen(up);
 transport(dx, dy);
 curX := curX + dx;
 curY := curY + dy;
 _);

_proced line(fromx, fromy, tox, toy:real);
_var ifromx, itox, ifromy, itoy:integer;
_(
 ifromx := round(fromx);
 itox := round(tox);
 ifromy := round(fromy);
 itoy := round(toy);
 _if (ifromx <> curX) _or (ifromy <> curY) _then _(
 setPen(up);
 transport(ifromx - curX, ifromy - curY);
  _);
 setPen(down);
 transport(itox - ifromx, itoy - ifromy);
 curX := itox;
 curY := itoy;
_);

_proced plotNum(scale, bold, num, len:integer);
_var l2v1z, l2v2z, l2v3z:integer; 
_proced L0570;
_var curNum, curDig, l3v3z, l3v4z, l3v5z, l3v6z, power:integer;
_(
 l2v1z := 0;
 _for l3v3z := 1 _to bold _do _(
 transport( -(l2v1z), (0) );
 curNum := num;
 l2v1z := 0;
 power := 1;
 (*=m+*)_for l3v6z := 1 _to len - 1 _do power := power * 10;(*=m-*)
 l3v4z := (1);
% L0616:,BSS,;
 _while (l3v4z <= len) _do _(
   l3v5z := 14 * scale;
   l2v1z := (l2v1z + l3v5z);
   curDig := trunc(curNum / power);
   curNum := curNum - curDig * power;
   power := power _div 10;
   _case curDig _of
   0: _(
   setPen(down);
   transport( (0), scale * 16 );
   transport( (scale * 8), (0) );
   transport( (0), -((scale * 16)) );
   transport( -((scale * 8)), (0) );
  _);
  1: _(
   transport( (0), (scale * 8) );
   setPen(down);
   transport( (scale * 8), (scale * 8) );
   transport( (0), -((scale * 16)) );
   l3v5z := (l3v5z - (scale * 8));
  _);
  2: _(
   transport( (0), (scale * 16) );
   setPen(down);
   transport( (scale * 8), (0) );
   transport( (0), -((scale * 8)) );
   transport( -((scale * 8)), -((scale * 8)) );
   transport( (scale * 8), (0) );
   l3v5z := (l3v5z - (scale * 8));
  _);
  3: _(
   transport( (0), (scale * 16) );
   setPen(down);
   _for l3v6z := 1 _to 2 _do _(
     transport( (scale * 8), (0) );
     transport( -((scale * 8)), -((scale * 8)) );
   _);
  _);
  4: _(
   transport( (0), (scale * 16) );
   setPen(down);
   transport( (0), -((scale * 8)) );
   transport( (scale * 8), (0) );
   setPen(up);
   transport( (0), (scale * 8) );
   setPen(down);
   transport( (0), -((scale * 16)) );
   l3v5z := (l3v5z - (scale * 8));
  _);
  5: _(
   transport( (scale * 8), (scale * 16) );
   setPen(down);
   transport( -((scale * 8)), (0) );
   transport( (0), -((scale * 8)) );
   transport( (scale * 8), (0) );
   transport( (0), -((scale * 8)) );
   transport( -((scale * 8)), (0) );
  _);
  6: _(
   transport( (scale * 8), (scale * 16) );
   setPen(down);
   transport( -((scale * 8)), -((scale * 8)) );
   transport( (scale * 8), (0) );
   transport( (0), -((scale * 8)) );
   transport( -((scale * 8)), (0) );
   transport( (0), (scale * 8) );
   setPen(up);
   transport( (scale * 8), -((scale * 8)) );
   l3v5z := (l3v5z - (scale * 8));
  _);
  7: _(
 transport( (0), (scale * 16) );
 setPen(down);
 transport( (scale * 8), (0) );
 transport( -((scale * 8)), -((scale * 8)) );
 transport( (0), -((scale * 8)) );  
  _);
  8: _(
   setPen(down);
 transport( (scale * 8), (0) );
 transport( (0), (scale * 16) );
 transport( -((scale * 8)), (0) );
 transport( (0), -((scale * 8)) );
 transport( (scale * 8), (0) );
 setPen(up);
 transport( -((scale * 8)), (0) );
 setPen(down);
 transport( (0), -((scale * 8)) );
  _);
  9: _(
 transport( (scale * 8), (scale * 8) );
 setPen(down);
 transport( (0), (scale * 8) );
 transport( -((scale * 8)), (0) );
 transport( (0), -((scale * 8)) );
 transport( (scale * 8), (0) );
 transport( -((scale * 8)), -((scale * 8)) );
  _)
  _end;
 setPen(up);
 transport( l3v5z, (0) );
 l3v4z := (l3v4z + (1));
  _);
 _)
_);

_( (* plotNum *)
 l2v2z := 1;
 l2v3z := 1;
 L0570;
 transport(-l2v1z + l2v2z, 0);
 L0570;
 transport(-l2v1z - l2v2z, -l2v3z);
 L0570;
 transport(0, l2v3z);
 curX := curX + l2v1z;
_);

_proced L1312(_var l2a1z, l2a2z:_array [1..20] _of real; l2a3z, l2a4z:integer; l2a5z:real);
_var l2v1z, l2v2z, l2v3z, l2v4z:integer; l2v5z, l2v6z:real;
_(
 l2v1z := l2a3z - 1;
 _for l2v4z := 1 _to ПОВ _do _(
   _for l2v3z := 1 _to l2v1z _do _(
      line( l2a1z[l2v3z], l2a2z[l2v3z], l2a1z[l2v3z+1], l2a2z[l2v3z + 1] );
  _);
  line(l2a1z[l2a3z], l2a2z[l2a3z], l2a1z[1], l2a2z[1] );
 _);
 _for l2v2z := 1 _to l2a4z _do _(
 l2v5z := l2a1z[1];
 l2v6z := l2a2z[1];
 _for l2v3z := 1 _to l2v1z _do _(
   l2a1z[l2v3z] := l2a1z[l2v3z] + (l2a1z[l2v3z + 1] - l2a1z[l2v3z]) * l2a5z;
   l2a2z[l2v3z] := l2a2z[l2v3z] + (l2a2z[l2v3z + 1] - l2a2z[l2v3z]) * l2a5z;
 _);                                                       
 l2a1z[l2a3z] := l2a1z[l2a3z] + (l2v5z - l2a1z[l2a3z]) * l2a5z;
 l2a2z[l2a3z] := l2a2z[l2a3z] + (l2v6z - l2a2z[l2a3z]) * l2a5z;
 _for l2v4z := 1 _to ПОВ _do _(
   _for l2v3z := 1 _to l2v1z _do _(
     line( l2a1z[l2v3z], l2a2z[l2v3z], l2a1z[l2v3z + 1], l2a2z[l2v3z + 1]);
   _);
    line( l2a1z[l2a3z], l2a2z[l2a3z], l2a1z[1], l2a2z[1] );
  _);
 _);
_);

_function rand:integer;(*=m+*)
 _(
 seed := (47 * seed + 127) _MOD 1013;
 rand := seed;
 _);

_proced draw(day, month, year:integer);
_const c100=100;
_var i, l2v2z, l2v3z, l2v4z, l2v5z, len, l2v7z, l2v8z, l2v9z, l2v10z, l2v11z, l2v12z, l2v13z, l2v14z:integer;
l2v15z, l2v16z, l2v17z, l2v18z, l2v19z, l2v20v:real;
l2v20z, l2v40z:_array [1..20] _of real;
_(
 l2v7z := day;
 l2v2z := year _MOD 100;
 l2v13z := 13;
 l2v8z := 1660;
 l2v9z := 1180;
 l2v10z := 30;
 len := 8;
 l2v14z := l2v2z + 51 + ВЕР;
 _for i := 1 _to l2v14z _do l2v5z :=   rand;
   _for i := 1 _to l2v13z _do (a) _(
 l2v5z :=   rand;
 _for l2v4z := 1 _to i - 1 _do _(
  _if l2v20z[l2v4z] = l2v5z _then _(  l2v5z :=   rand;  _goto a _);
  _);
% L1601:,BSS,;
 l2v20z[i] := l2v5z;
 _for l2v3z := 1 _to month _do  l2v5z :=   rand;
 l2v40z[i] := rand;
 _for l2v3z := 1 _to l2v7z _do  l2v5z :=   rand;

 _if l2v7z < 2 _then l2v7z := l2v7z + 1 _else l2v7z := l2v7z - 1;
 _);
 %  L1637:,BSS,;
  l2v15z := 1013.0;
 l2v16z := ;
 l2v17z := 0;
 l2v18z := ;
 _for i := 1 _to l2v13z  _do _(
  _if l2v20z[i] < l2v15z _then l2v15z := l2v20z[i];
 _);
% L1653:,BSS,;
 _for i := 1 _to l2v13z _do _(
  _if l2v40z[i] < l2v16z _then l2v16z := l2v40z[i];
 _);
%  L1664:,BSS,;
 _for i := 1 _to  l2v13z _do _(
 _if l2v20z[i] > l2v17z _then  l2v17z := l2v20z[i];
 _);
% L1675:,BSS,;
 _for i := 1 _to l2v13z _do _(
  _if l2v40z[i] > l2v18z _then  l2v18z := l2v40z[i];
 _);
% L1706:,BSS,;
 _if twoDates _then
 i := day2 * 1000000 + month2 * 10000 + year2
  _else
 i := day * 1000000 + month * 10000 + year;

 l2v11z := (l2v9z - (l2v10z * 2)) - 80;
  curX := -70;
  curY := -70;
  _if _not debug _then _(
    setPen(up);
    rmoveto(80, l2v11z );
    _if ПОВ = 1 _then plotNum( 3, 1, i, len )
    _else plotNum(3, 3, i, len );
  _);
 l2v11z := l2v11z - 140;
 l2v12z := l2v8z - l2v10z * 2 - 140;
 l2v19z := l2v12z / (l2v17z - l2v15z);
 l2v20v := l2v11z / (l2v18z - l2v16z);
 _for i := 1 _to l2v13z _do _(
   l2v20z[i] := (l2v20z[i] - l2v15z) * l2v19z;
   l2v40z[i] := (l2v40z[i] - l2v16z) * l2v20v;
 _);
% L2003:,BSS,;
_if _not debug  _then _(
  L1312( l2v20z, l2v40z, l2v13z, 35, 0.04999999999995 );
  _) _else _(
    _for i := 1 _to l2v13z _do _(
      writeln(i:3,  trunc(l2v20z[i]):5, trunc(l2v40z[i]) );
    _);
  _)
_);

_proced skipSp;
 _(
 _while input@ = sp _do  get(input);
 _);

_function readInt:integer;
_var i:integer;
_(
 i := 0;
 _if (input@ > '9') _then  error( 5 );
 _while ord(input@) < 10 _do _(
   i := i * 10 + ord(input@);
   get(input);
 _);
 readInt := i;
 _);

_proced work;
_label 2077;
_var day, month, year, l2v4z:integer;
_(
 (a) _(
   writeln('ВВОД ДАННЫХ <Д М Г ПОВ ВЕР [Д М Г]>');
   BIND(' -=% {172');
   _if input@ = 'К' _then  _GOTO 2261;
   skipSp;
   day :=   readInt;
  _if day > 31 _then _( 2077: writeln('ОШИБКА В ДАТЕ.');  _goto a _);
  _);
  skipSp;
  month :=   readInt;
  _if month > 12 _then _goto 2077;
  skipSp;
  year :=   readInt;
  _if (year < 1900) _or (year > 2000) _then _goto 2077;
  skipSp;
  ПОВ :=   readInt;
  _if ПОВ > 3 _then  ПОВ := 3;
  skipSp;
  _if input@ <> etx _then  ВЕР := readInt _else ВЕР := 0;
  skipSp;
  _if input@ = etx _then  twoDates := false _else _(
    twoDates := true;
    skipSp;
    day2 :=   readInt;
    _if day2 > 31 _then _goto 2077;
    skipSp;
    month2 :=   readInt;
    _if month2 > 12 _then _goto 2077;
     skipSp;
     year2 :=   readInt;
     _if (year2 < 1900) _or (year2 > 2000) _then _goto 2077;
   _);
   _if  _not debug  _then  detach(tty);
   draw( day, month, year );
_);
 _proced horosc;
 _(
 _if _not lock _then _(
   writeln('НЕТ ЛЕНТЫ');
   _GOTO 2261;
 _);  
 work;
 _if _not debug _then _(
   setPen(up);
   g83z := 44;
   code(16ПВaddcmd=,);
 _);
 unlock;
 _if _not debug _then _(
   _while _not grab(tty) _do pause(200);
 _)
_);

_(
 g10z := ref(g13v);
 g83z := (1010101010101010C);
 g89z := ;
 g13v := g89z;
 seed := 777B;
 g11z := (0);
 g12z := (1);
 curX := (0);
 curY := (0);
 g79z := (1);
 g78z := (0);
 pencnt := (1);
 penDown := false;
  g83z := 32;
  L0276( (0), g83z );
 L0316( (0), g83z );
 setPen(up);
 debug := false;
 tty :=   ttyNum;
  2261:
  BIND(' ==+ {172');
  _select
  input@ = 'К': HALT;
  input@ = 'Г': _( seed := 777B; horosc; _);
  true:  writeln('НЕПОНЯТНО')
  _end;
  _goto 2261;
_).
