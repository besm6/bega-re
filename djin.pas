(*=p-,t-*)_program ДЖИН;
_const d1 = 'ДЖИН.Р';d2='АБОЧ/4';d3='177..;';d4='ДЖИН.П';d5='РОГР/4';c57=57b;c2=2;
 _proced error(l2a1z:integer);
_var l2v1z, l2v2z, l2v3z:alfa; l2v4z:integer;
_(
  code(=2ИА4,15ПА=ВИ15,2ЗЧ7=УИ15,);
 l2v4z := 4T;
 code(2ЛС3=Э050202,);
 writeln(' *** ОШИБКА АРХ. = ', l2v1z, l2v2z, l2v3z);
 code(ПБ76002=);
 _);
_proced JUMP;
 _(
   code(Э070СЛОВО(1)=,Э070СЛОВО(2)=,Э070СЛОВО(3)=,Э070СЛОВО(4)=,СЧСЛОВО=Э0756,ПБ6=,СЛОВО:Э070СЛОВО(5)=,);
   code(C;10010000420002,10020000420003,10030000420004,10040000420005,10000000420001,К;)
_);

_proced release(l2a1z:integer);
_var l2v1z:integer;
_(
 l2v1z := 200077T;
  code(2СЧ3=СД/-44/,2ЛС4=2ЗЧ3,2Э0723=,)
_);

_function getVol(l2a1z:integer):integer;
_var l2v1z, l2v2z, l2v3z:integer;
_(
 l2v1z := 0;
  code(2СЧ4=СД/-14/,Э050105=,);
 l2a1z := ;
 _if l2a1z > 9999 _then _( getVol := l2a1z; EXIT _);
  code(=2СЧ4,СД/-40/=2ЗЧ4,);
 _for l2v2z := 1 _to 4 _do _(;
    code(2СЧ4=СД/-4/,2ЗЧ4=МР,); 
    l2v3z := ;
    l2v1z := ((l2v1z * 10) + l2v3z);
 _);
 getVol := l2v1z;
_);

_proced GETJINN;
_label 224;
_const c3 = 3;
_var l2v1z:integer; l2v2z:alfa; l2v3z:_set _of 0..47;
l2v4z:_record a, b, c, d: alfa _end;

 _function ARFA:integer;
_var l3v1z:integer; l3v2z:alfa;
_(
 l3v1z := 1300000000000010C;
 l2v4z := [l3v1z];
 code(СЧ=СД/60/,);
 l3v2z := 'КЛЮЧАР';
 code(7Э0630=,);
 ARFA := ;
  code(ВИ16=);
 l3v1z := ;
 _if l3v1z <> 0 _then  error( l3v1z );
 _);

_(
  l2v3z := [9,10];
  l2v4z := [, d1,d2,d3];
  l2v1z := ord(ref(l2v4z));
  code(=УИ7,);
  l2v1z :=   getVol( 41B );

  _if (ARFA = l2v1z) _then _goto 224;
  _if l2v1z <> 0 _then  release( 41B );
   l2v1z := 1200000000000010C;
  l2v4z := [l2v1z];
  l2v3z := l2v3z; code(=СД/60/,);
  l2v2z := 'КЛЮЧАР';
  code(7Э0630=,ВИ16=);
  l2v1z := ;
  _if (l2v1z <> 0) _then  error( l2v1z );
  224:
  l2v3z := l2v3z - [9];
  l2v4z := [,d4,d5];
  l2v1z :=   getVol( 42B );
  _if (ARFA  = l2v1z) _then  EXIT;
  _if (l2v1z <> 0) _then  release( 42B );
   l2v1z := 1200000000004010C;
  l2v4z := [l2v1z];
  l2v3z := l2v3z; code(=СД/60/,);
  l2v2z := 'КЛЮЧАР';
  code(7Э0630=,ВИ16=);
  l2v1z := ;
 _if l2v1z <> 0 _then  error( l2v1z );
  _);

_(
 GETJINN;
 JUMP;
_).
