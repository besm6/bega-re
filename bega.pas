(*=p-,t-,l-,m-*)_program БЕГА;
_label 11132, 11136, 11176, 11204, 11210, 11214, 11220, 11227, 11230, 11244;

_const c54 = 54; c517 = 517;
d14 =1660730B;
d15 = 2661100B;
d16 = 6400230B;
d17 = 400137B;
d18 = 5660630B;
d19 = 4660640B;
d20 = 2660734B;
d21 = '  ИТМ';
d22 = ' И ВТ ';
n62 = 62;
ETX = '{377';
SPACE = ' ';
dot = '.';
n36 = 36;
n45 = 45; n11 = 11; LEFT = '{146'; n32 = 32; n76 = 76; n9 = 9;
n47=47;n1023=1023; n6=6; n100=100; n2=2; n39=39; n4=4; n10=10;
_type bits = _set _of 0..47; rec = _array[1..10] _of bits;
  digit='0'..'9';
_var
gl10z:integer;
gl11z:bits;
gl12z:integer; entered: alfa;
tambov:alfa; gl15z, gl16z:boolean; gl17z, gl18z, gl19z, gl20z:integer;
gl21z:@rec;
gl22z:integer;
gl23z:_set _of 0..45;
 gl24z, gl25z, gl26z, gl27z, gl28z, gl29z, gl30z, gl31z, gl32z, gl33z, gl34z, gl35z, gl36z:integer; 
flags: _set _of 0..47;
gl38z, gl39z:integer;
hardcopy:boolean;
awake:boolean;
gl42z, gl43z, gl44z:integer;
gl45z: _array [1..39] _of integer;
tempfile:text;
pieces:_array[1..4] _of integer; 
field: _array [0..10] _of integer;
dsppos, gl386z, gl387z, termno:integer;
black,
gl390z:boolean; gl390a:bits; display: _array[1..100] _of alfa;

_procedure TTIN(level:integer);
_label 1570;
_var v1, v2: integer;
_(
  _case level _of
  0: BIND;
  1: BIND(' ==* {172');
  2: BIND(' =-* {172');
  3: BIND(' --* {172')
  _end;
  _if hardCopy _then _(
      code(CЧ76013=УИ7,);
      v1 := 2;
      code(ЗЧ76013=,);
      _case level _of
      1: write(' ==* ');
      2: write(' =-* ');
      3: write(' --* ')
      _end;
  _);
  rewrite(tempfile);
  v2 := 0;
  _while input@ <> ETX _do _(
    _if hardCopy _then write(input@);
    v2 := v2 + 1;
    _if v2 > 128 _then _(
      rewrite(tempfile);
      write(tempfile,'SLЕ  {377');
      flags := flags + [47];
      _goto 1570
    _);
    write(tempfile,input@);
    get(input);
  _); (* while *)
  write(tempfile, ETX);
  1570:
  reset(tempfile);
  _if hardCopy _then _(
    writeLN;
    code(ВИ7=ЗЧ76013,);
  _)
_);

_procedure checkTime;
_var l2v1z:integer;
_(
  code(Э0634=,);
  l2v1z := ;
 _if ((gl30z - l2v1z) < (100)) _then _(
    rewrite(tempfile);
    writeln('ВАШЕ ВРЕМЯ ИСТЕКЛО');
    gl15z := false;
    write(tempfile,'КОН  {377');
    _GOTO 11227;
 _)
_);
_procedure P2775;
_var a: alfa;
_(
 writeLN;
 checkTime;
 code(CЧ77015=);
 a := ;
 _if (a = 'Н{3770000') _then _GOTO 11132;
_);

_procedure P3006(_var a:alfa); (* unused *)
_var t:_array [1..6] _of char; i:integer;
_(
 _for i := 1 _to 6 _do _(
   _if (tempfile@ = '{377') _then
     t[i] := '0'
   _else _(
     t[i] := tempfile@;
     code(16ПВ76312=,)
   _)
 _);
 pck(t[1], a);
_);

_procedure P3030(a:integer);
_var l2v1z,l2v2z,l2v3z,l2v4z,l2v5z:integer;
_(
 l2v1z := gl45z[a];
 l2v5z :=;
 l2v4z := gl20z - 1;
 l2v1z := sel(l2v5z, l2v4z, 6) + gl19z;
  code(СД/6/=2ЗЧ5,МР=СД/-6/,МР=2ЗЧ4,);
  ins(l2v5z, l2v1z, l2v4z, 6);
  gl45z[a] := ;
  _if (l2v2z > 0) _then _(
  gl19z := l2v2z;
  P3030(a - 1);
  gl19z := 1;
  _); 
 _if (gl20z = 1) _then
 l2v3z := (44C)
 _else l2v3z := (26C);
 _if (a <= l2v3z) _and (a > 0) _then P3030(0);
_);

_function getDate:integer;
_var t:integer;
_(
   code(Э050114=,); t := ;
   getDate := ((((sel(t,16,4)*10+sel(t,20,4))*10+sel(t,28,1))*10+sel(t,24,4))*10+sel(t,33,2))*10+sel(t,29,4)
_);
_function getTime:alfa;
_var l2v1z, l2v2z:integer;
l2v:_array [1..6] _of char; l2v9z:alfa;
_( 
  code(Э05310=,);
  l2v1z := ;
  l2v1z := trunc(l2v1z / 3000);
  l2v[1] := ' ';
  l2v[4] := '.';
  l2v2z := trunc(l2v1z / 600);
  l2v[2] := ;
  l2v1z := l2v1z - l2v2z * 600;
  l2v2z := l2v1z _div 60;
  l2v[3] := ;
  l2v1z := l2v1z - l2v2z * 60;
  l2v2z := l2v1z _div 10;
  l2v[5] := ;
  l2v[6] := chr(l2v1z - l2v2z * 10);
  pck(l2v[1], l2v9z);
  getTime := l2v9z;
_);

_procedure printTenths(a:integer);
_var v:integer;
_( 
  v := trunc(a/10); write(v:1, (a - v*10):1);
_);

_procedure readZone(a, b: integer);
_( code(=14ПВ77451,) _); 

_function zeller(l2a1z, l2a2z, l2a3z:integer):integer;
_(
 _if l2a2z < 3 _then l2a3z := l2a3z - 1;
 l2a2z := l2a2z + 9;
 _if l2a2z > 11 _then l2a2z := l2a2z - 12;
 l2a2z := l2a2z + 1;
 zeller := (((((l2a1z + l2a3z) + (l2a3z _div 4)) + (((13 * l2a2z) - 1) _DIV 5)) - 28) _MOD 7);
  _);

_procedure checkPerm;
_label 1, 2;
_var l2v1z, l2v2z, l2v3z, l2v4z, l2v5z, l2v6z: integer;
l2v7z:alfa; l2v8z:_array [1..6] _of char;
l2v14z:bits;
_(
  _if gl23z * [3] = [3] _then exit;
  _if 26 _in flags _then _(
    1: writeln('ИГРА ЗАКРЫТА');
    _GOTO 11132;
  _);
  _if gl23z * [2] = [2] _then _(
    write('ДЛЯ ВАС ');
    _goto 1;
  _);
  l2v3z :=   getDate;
  l2v5z := l2v3z _div 10000;
  l2v3z := l2v3z - l2v5z * 10000;
  l2v4z := l2v3z _div 100;
  l2v3z := l2v3z - l2v4z * 100;
  _if (zeller( l2v3z, l2v4z, l2v5z) > 4) _then exit;
  readZone(66C, 517);
  l2v14z := gl21z@[6];
  l2v7z :=   getTime;
  unpck(l2v8z[1], l2v7z);
  l2v2z := (ord(l2v8z[2])*10+ord(l2v8z[3]))*2 + (ord(l2v8z[5])*10+ord(l2v8z[6])) _div 30;
  _if _not (l2v2z _IN l2v14z) _then _(
    writeln('ИГРА СЕЙЧАС ЗАКРЫТА');
    _repeat
      l2v2z := l2v2z + 1;
      _if (l2v2z _IN l2v14z) _then _(
        write('ОТКРОЕТСЯ В ');
        l2v1z := l2v2z _div 2;
        l2v2z := (l2v2z - l2v1z*2) * 30;
        printTenths( l2v1z );
        write(dot);
        printTenths( l2v2z );
        write(' - СЕЙЧАС');
        writeln(  getTime );
       2: rewrite(tempfile);
       write(tempfile,'ВЫХ  {377');
       gl15z := false;
       _GOTO 11227;
     _);
   _until l2v2z >= 57C;
   writeln('СЕГОДНЯ НЕ ОТКРОЕТСЯ');
   _goto 2;
  _)
_);

_function getCmd(_var a:alfa; b:integer):boolean;
_var l:_array[1..7] _of bits;
_( code(=14ПВ77400,) _);

_procedure sleep(l2a1z:integer);
_var l2v1z:integer;
_(
 l2a1z := trunc(l2a1z / 4);
 _while l2a1z > 0 _do _(
   _if l2a1z > 2044 _then _(
     l2v1z := 2044;
     l2a1z := l2a1z - l2v1z;
   _) _else _(
     l2v1z := l2a1z;
     l2a1z := 0;
   _)
 _);
 l2v1z := l2v1z;
 code(Э0507700=,);
_);

_function extra71(l2a1z: integer):integer;
_var l2v1z: integer;
_(
  code(K;2СЧ4=,7ПАГ501=7ЛС,17ЗЧ1=17Э0711,7ПБ1=,С;Г501:0120000100000000,К;);
  l2v1z :=; 
  extra71 := sel(l2v1z, 24, 2);
_);

_procedure P3432(l2a1z:integer);
_(
  code(K;7ПАГ502=2СЧ3,7ЛС=,2ЗЧ3=2Э0713,7ПБ1=,С;Г502:0120000200000000,К;);
_);
(*=m+*)
_procedure P3442(l2a1z, l2a2z: integer; _var l2a3z: _array [1..100] _of alfa);
_var l2v1z:integer; l2v2z: @alfa;
_(
 l2v1z := trunc(l2a2z / 10);
  l2a2z := l2a2z - l2v1z*2; 
 l2v1z := l2a1z;
  code(7пагг1=сд/-14/,7лс=17зч,);
 l2a2z := l2a2z;
  code(сд/-53/=7рб2,17лс=7зч1,);
 l2v2z := ref(l2a3z);
  code(уи7=иагг1,э0711=,иагг1=пб3,с;гг1:3420000035000323,0,217000000000000,к;);
_);

_procedure landing(eng: boolean);
_label 4410, 4514, 4636;
_type arr = _record
f0, f1, f2, f3, f4, f5, f6, f7, f8, f9, f10,
f11, f12, f13, f14, f15, f16, f17, f18, f19, f20: real
_end;
_var l2v1z: @arr; saved: arr; l2v23z, Vfps, temp, altitude, Vmps, mass: real;
drymass, lunarG, l2v31z, l2v32z, value, newalt, l2v35z, l2v36z, l2v37z, l2v38z, l2v39z, l2v40z, deltaT: real;
interval, cursec, ruined, l2v45z, fuel, msgarg:integer; verbose: boolean;

_procedure landMsg(msg: integer); _(
_if eng _then _case msg _of
0: write('I UNDЕRSТООD IТ АS NIL.');
1: write('МISSIОN СОNТRОL ОUТ.');
2: write('УОU ВLЕW IТ АGАIN. WЕLL, ТНIRD ТIМЕS ТНЕ СНАRМ.....');
3: write('НОW DОЕS IТ FЕЕL ТО ТАSТЕ DЕАТН ТRЕЕ ТIМЕS....??');
4: write('NЕХТ ТIМЕ ВRING АLОNG УОUR ВIВLЕ.');
5: write('DО NОТ АРРLУ ТО NАSА FОR А JОВ. УОU''LL NЕVЕR МАКЕ IТ.');
6: write('УОU''VЕ RUINЕD SIХ МISSIОNS NОW. ТURN IN УОUR SРАСЕSUIТ.');
7: write('.......SРLАТ.  NОТ SО GООD.  INЕХРЕRIЕNСЕ РЕRНАРS.');
8: write('МISSIОN СОNТRОL САLLING LUNАR МОDULЕ:{214МАNUАL СОNТRОL IS NЕСЕSSАRУ FОR LАNDING.{214WНАТ IS УОUR ЕХРЕRIЕNСЕ: 0 1 2(SТАNDАRD) 3 4 5 6 7 8 9(NО ЕХРЕRIЕNСЕ) ?');
9: write('УОU МUSТ SРЕСIFУ А FUЕL RАТЕ ЕАСН 10 SЕСОNDS.{214RАТЕS МUSТ ВЕ ZЕRО ОR ВЕТWЕЕN 8 АND 200 LВS.РЕR SЕС.');
10: write('УОU НАVЕ ', msgarg:0, ' LВS ОF FUЕL.{214САРSULЕ WЕIGНТ IS NОW 32500 LВS INСLUDING FUЕL.{214СОММЕNСЕ LАNDING РRОСЕD.');
11: write('FIRSТ RАDАR СНЕСК СОМING UР:{214 ТIМЕ(SЕС) АLТ(МILЕS + FЕЕТ) VЕLОСIТУ(FРS) FUЕL(LВS)');
12: write('DОN''Т WАSТЕ ТIМЕ ТRУING ТО ВURN АТ ТНАТ RАТЕ.');
13: write('FUЕL ОUТ АТ ', msgarg:0, ' SЕСОNDS.');
14: write('ОN ТНЕ МООN АТ ', msgarg:0,  ' SЕСОNDS.');
15: write('IМРАСТ VЕLОСIТУ ОF ', msgarg:0, ' F.Р.S.');
16: write('FUЕL LЕFТ ', msgarg:0, ' LВS.');
17: write('РЕRFЕСТ LАNDING. УОU LUСКУ JЕТ JОСКЕУ.');
18: write('А GООD LАNDING, NОТ GRЕАТ, JUSТ GООD.');
19: write('ВUСК RОGЕRS УОUR NОТ, ВUТ СОNGRАТULАТIОNS, УОU''RЕ DОWN.');
20: write('НЕАVУ СRАFТ DАМАGЕ, УОU МАУ NЕVЕR SЕЕ ЕАRТН АGАIN.');
21: write('ТНЕRЕ''S NОW А NЕW LUNАR СRАТЕR ', msgarg:0, ' FЕЕТ DЕЕР.');
22: write('РЕRFЕСТ RЕСОRD! NО FАIR USING САLСULАТING АIDS.');
23: write('NАSА WILL DЕDUСТ  ', msgarg:0, ' $ FRОМ УОUR РАУСНЕСК ЕАСН WЕЕК');
24: write('FОR ТНЕ L.Е.М. УОU WIРЕD ОUТ.');
25: write('FОR ТНЕ ', msgarg:0, ' L.Е.М.''S УОU WIРЕD ОUТ.')
_end _else _case msg _of
0: write('НЕПОНЯТНО - ПОВТОРИТЕ');
1: write('ПОЛЕТЫ ОКОНЧЕНЫ.');
2: write('ОПЯТЬ НЕУДАЧА. ЧТО Ж - ПОПРОБУЙТЕ В ТРЕТИЙ РАЗ.....');
3: write('КАК ВЫ СЕБЯ ЧУВСТВУЕТЕ, ВСТРЕТИВ СМЕРТЬ ТРИ РАЗА....??');
4: write('В СЛЕДУЮЩИЙ РАЗ ВОЗЬМИТЕ С СОБОЙ БИБЛИЮ.');
5: write('НЕ ПЫТАЙТЕСЬ ПОСТУПИТЬ В NАSА НА РАБОТУ. ВАС НЕ ВОЗЬМУТ.');
6: write('ВЫ ПОГУБИЛИ УЖЕ ШЕСТЬ ПОЛЕТОВ. НАДЕВАЙТЕ СКАФАНДР.');
7: write('.......ШМЯК.  НЕ ОЧЕНЬ ХОРОШО. НАВЕРНОЕ МАЛО ОПЫТА.');
8: write('ЦЕНТР УПРАВЛЕНИЯ ВЫЗЫВАЕТ ЛУННЫЙ МОДУЛЬ:{214ДЛЯ ПОСАДКИ ПЕРЕЙДИТЕ НА РУЧНОЕ УПРАВЛЕНИЕ.{214КАКОВ ВАШ ОПЫТ: 0 1 2(НОРМА) 3 4 5 6 7 8 9(ОПЫТА НЕТ) ?');
9: write('ВЫ ДОЛЖНЫ УКАЗЫВАТЬ СКОРОСТЬ РАСХОДА ТОПЛИВА ЧЕРЕЗ КАЖДЫЕ 10 СЕКУНД.{214РАСХОД ДОЛЖЕН БЫТЬ ИЛИ 0 ИЛИ ОТ 8 ДО 200 ФУНТОВ В СЕКУНДУ.');
10: write('У ВАС ', msgarg:0, ' ФУНТОВ ТОПЛИВА.{214ВЕС КАПСУЛЫ СЕЙЧАС 32500 ФУНТОВ, ВКЛЮЧАЯ ТОПЛИВО.{214НАЧИНАЙТЕ ПОСАДКУ.');
11: write('ПЕРВЫЙ РАДИОЛОКАЦИОННЫЙ ЗАМЕР ВЫСОТЫ:{214ВРЕМЯ(СЕК) ВЫС(МИЛИ  + ФУТЫ) СКОРОСТЬ(Ф/С) ТОПЛ(ФУН)');
12: write('НЕ ТРАТЬТЕ ВРЕМЯ, ПЫТАЯСЬ ЖЕЧЬ ТОПЛИВО С ТАКОЙ СКОРОСТЬЮ.');
13: write('ТОПЛИВО КОНЧИЛОСЬ НА ', msgarg:0,  ' СЕКУНДЕ.');
14: write('НА ЛУНЕ НА ', msgarg:0, ' СЕКУНДЕ.');
15: write('СКОРОСТЬ В МОМЕНТ КАСАНИЯ ', msgarg:0, ' ФУТ/СЕК.');
16: write('ОСТАЛОСЬ ТОПЛИВА ', msgarg:0, ' ФУНТОВ.');
17: write('ИДЕАЛЬНАЯ ПОСАДКА. ВЫ СЧАСТЛИВЫЙ РАКЕТНЫЙ ЖОКЕЙ.');
18: write('ХОРОШАЯ ПОСАДКА, НЕ БЛЕСТЯЩАЯ, ПРОСТО ХОРОШАЯ.');
19: write('ВЫ НЕ БАК РОДЖЕРС, НО ПРИМИТЕ ПОЗДРАВЛЕНИЯ. ВЫ СЕЛИ.');
20: write('КРУШЕНИЕ КОРАБЛЯ. НАВЕРНОЕ ВЫ НИКОГДА НЕ УВИДИТЕ ЗЕМЛЮ.');
21: write('НА ЛУНЕ ВОЗНИК НОВЫЙ КРАТЕР ГЛУБИНОЙ ', msgarg:0, ' ФУТОВ.');
22: write('ЗАМЕЧАТЕЛЬНЫЙ УСПЕХ! КОМПЬЮТЕР ВАМ НЕ НУЖЕН.');
23: write('NАSА БУДЕТ ВЫЧИТАТЬ ', msgarg:0, ' $ ИЗ ВАШЕЙ ЗАРПЛАТЫ КАЖДУЮ НЕДЕЛЮ.');
24: write('ВАС ИСКЛЮЧИЛИ ИЗ СОСТАВА ЭКИПАЖА ДЛЯ ПОЛЕТА НА ЛУНУ.');
25: write('ВАС ИСКЛЮЧИЛИ ИЗ СОСТАВА ЭКИПАЖА НА ', msgarg:0, ' ПОЛЕТОВ НА ЛУНУ.')
_end;
write('{172     ');
code(сч76401=лсИСЭ71,17зч1=7па71000,17э0711=,э07176402=,);
    rewrite(output); exit;
    code(С;ИСЭ71:3000000024000321,К;)
_);

_procedure getval(_var val: real);
_var l3v1z:integer;
_(
 l3v1z := 0;
 (a) _select 
  input@ = 'K': _GOTO 11132;
  input@ = 'S': _( saved := l2v1z@; get(input); _);
  input@ = 'T': _( get(input); interval := ord(input@); get(input); _goto a _);
  input@ = 'Y': _( get(input); verbose := true; _goto a _);
  input@ = 'R': _( l2v1z@ := saved; get(input) _)
  _end;
  val := -1;
  _while (input@ <= '9') _do _(
    val := 0;
    l3v1z := 10*l3v1z + ord(input@);
    get(input);
  _);
  _if val = -1 _then
    landMsg(0)
  _else
    val := l3v1z;
_);
_procedure ending;
_(
 landMsg(1);
 _GOTO 11132;
_);
_procedure update;
_(
 temp := temp + deltaT;
 l2v32z := l2v32z - deltaT;
 mass := mass - deltaT * value;
 altitude := newalt;
 Vmps := l2v35z;
_);
_procedure P4250;
_(
 l2v36z := deltaT * value / mass;
 l2v35z := (((lunarG * deltaT) + Vmps) - (LN(1.0 + l2v36z) * l2v31z));
 l2v37z := (l2v36z * l2v36z);
 l2v38z := (l2v37z * l2v36z);
 l2v39z := (l2v38z * l2v36z);
 l2v40z := (l2v39z * l2v36z);
  newalt := (((altitude - (((lunarG * deltaT) * deltaT) / (2.0))) - (Vmps * deltaT)) + ((l2v31z * deltaT) * (((((l2v36z / (2.0)) + (l2v37z / (6.0))) + (l2v38z / (12.0))) + (l2v39z / (20.0))) + (l2v40z / (30.0)))));
  _);

_procedure dead;
_(
 _if (ruined = 1) _then
  landMsg(7) (* splat *)
 _else _if (ruined < 6) _then
  landMsg( ruined ) (* oops again *)
 _else (q) _( landMsg(6); (* enough already *)
   ending; _exit q
  _)
_);

_( (* landing *)
  checkPerm;
  l2v1z := ref(l2v23z);
  verbose := false;
  landMsg(8);
  _if eng _then BIND('WНАТ IS YOURS ? {172') _else BIND('ЧТО У ВАС ? {172');
  getval(value);
  _if _not (trunc(value) _IN [0..9]) _then value := 9.0;
  landMsg(9);
  fuel := round(15000 + value * 500);
  msgarg := ;
  landMsg(10);
  l2v45z := 0;
  ruined := 0;
  (L4354) _(
    checkTime;
    checkPerm;
    _if eng _then P3030(3) _else P3030(10);
    landMsg(11);
    interval := 10;
    temp := (0C);
    altitude := 120;
    Vmps := 1.0;
    mass := 32500;
    drymass := mass - fuel;
    lunarG := 1.000000000001e-3;
    l2v31z := 1.8;
    _if (l2v45z = 0) _then
      saved := l2v1z@
    _else
      l2v45z := (1C);
  4410:
    write(round(temp):5, trunc(altitude):13);
    write(trunc((((altitude - (trunc(altitude))) * (5280)) + (0.5))):8);
    write(trunc((((5280) * Vmps) + (0.5))):9);
    write(round(((mass) - drymass)):13 );
  
    _if verbose _then write(Vmps * Vmps / altitude:0);
    P2775;
    (rate) _(
      _if eng _then
        BIND('{146{146{146{146{146{146{146{146{146{146{146{146{146{146{146{146{146{146{146FUEL RATE={172')
      _else
        BIND('{146{146{146{146{146{146{146{146{146{146{146{146{146{146{146{146{146РАСХОД={172');
      getval(value);
      _if ((value < 8.0) _or (value > 200)) _and (value <> 0.0) _then _(
        landMsg(12);
        _goto rate;
      _)
    _);
    (* 4466 *)
    _for cursec := 1 _to interval _do (q) _(
      l2v32z := 1.0;
      (* L4472:,BSS,; *)
      (L4472) _if mass - drymass < 1.000000000001e-3 _then _( (* else 4617 *)
        msgarg := round(temp);
        landMsg(12);
        deltaT := ((-(Vmps) + SQRT(((Vmps * Vmps) + ((2 * altitude) * lunarG)))) / lunarG);
        Vmps := ((lunarG * deltaT) + Vmps);
        temp := (temp + deltaT);
  4514:
        msgarg := round(temp);
        landMsg(14); (* on the Moon at ... sec *)
        Vfps := (5280 * Vmps);
        msgarg := round(Vfps);
        landMsg(15); (* impact velocity *)
        temp := mass - drymass;
        _if temp < 0.0 _then temp := 0.0;
        msgarg := round( temp );
        landMsg(16); (* fuel remaining *)
        _if Vfps <= 3 _then landMsg(17) (* perfect *)
        _else _if Vfps <= 15 _then landMsg(18) (* good *)
        _else _if Vfps <= 35 _then landMsg(19) (* no Buck Rogers *)
        _else _if Vfps <= 80 _then landMsg(20) (* heavy damage *)
        _else _(
          msgarg := trunc(0.19 * Vfps);
          landMsg(21); (* crater *)
          ruined := ruined + 1;
          dead;
          (q) _exit q; (* aligning *)
        _);
        (* 4570 *)
        _if eng _then BIND('ТRY АGAIN (1) OR NOT (0) ? {172')
        _else BIND('ЕЩЕ РАЗ (1) ИЛИ ВСЕ (0) ? {172');

        _if (input@ <> '0') _then _goto L4354;
        _if (ruined = 0) _then landMsg(22)
        _else _(
          l2v23z := (ruined * 34.23);
          msgarg := round( l2v23z );
          landMsg(23);
          msgarg := ruined;
          _if (ruined = 1) _then landMsg(24) _else landMsg(25);
        _);
        ending;
      _) _else _if (l2v32z < (1.000000000001e-3)) _then _exit L4472 _else _(
        deltaT := l2v32z;
        _if ((((deltaT) * value) + drymass) > mass) _then
          deltaT := (((mass) - drymass) / value);
        (* 4632 *)
        P4250;
        _if (newalt <= 0.0) _then
  4636: _(
          _if (deltaT < 5.0e-3) _then
            _goto 4514;
          deltaT := ((2.0 * altitude) / (SQRT(((Vmps * Vmps) + ((2.0 * altitude) * (lunarG - (((l2v31z) * value) / mass))))) + Vmps));
          P4250;
          update;
          _goto 4636;
        _);
        (* 4655 *)
        _if (Vmps <= 0.0) _then _(
          update;
          _goto L4472;
        _);
        _if (l2v35z < 0.0) _then (L4664) _(
          Vfps := ((1.0 - ((mass * lunarG) / (l2v31z * value))) / 2.0);
          deltaT := (((mass * Vmps) / ((l2v31z * value) * (SQRT(((Vfps * Vfps) + (Vmps / l2v31z))) + Vfps))) + 0.04999999999995);
          P4250;  
          _if (newalt <= 0.0) _then
            _goto 4636;
          update;
          _if ((-l2v35z > 0.0) _and (Vmps > 0.0)) _then _( _) _else _goto L4472;
          _goto L4664; 
        _) _else _(
          update;
          _goto L4472;
        _);
      _); (* 4472 if *)
    _); (* for *)
    _goto 4410;
  _); (* L4354 *)
  ending;
_); (* landing *)

_procedure tictactoe;
_var l2v1z, l2v2z, l2v3z:integer; arr:_array [1..100] _of alfa;
_procedure P4725;
_(
  P3442( termno, 1, arr);
  (loop) _( 
    l2v3z :=   extra71( termno );
    _case l2v3z _of
    0: _( sleep(8); _goto loop _);
    3: _GOTO 11230
    _end;
  _);
_); (* P4725 *)
_(
  checkPerm;
  P3030(5);
  l2v1z := (74C);
  code(ЗЧ76421=ЗЧ76422,);
  writeln('
           =---> ПЕРЕД НАЧАЛОМ ИГРЫ СДЕЛАЙТЕ "ОFF LINЕ" <---=
');
  _for l2v1z := (1C) _to (17C) _do _(
    _for l2v2z := (1C) _to (14C) _do _(
      write(' .  . ');
    _);
    writeln(' .  .');
  _);
  _for l2v2z := (1C) _to (14C) _do _(
  arr[l2v2z] := '{240{056{240{240{056{240'; (* ' .  . ' in ISO *)
  _);
  arr[13] := '{240{056{240{240{056{000'; (* ' .  .' in ISO *)
  P4725;
  _for l2v2z := (1C) _to (7C) _do _(
    arr[l2v2z] := '{210{210{210{231{210{210'; 
  _);
  arr[8] := '{210{210{210{210{210{000';;
  P4725;
  P3432( termno );
  _GOTO 11230;
_);
_function rand(l2a1z: integer):integer;
_var l2v1z:integer;
_(
  code(Э05310=,СД/1/=2ЗЧ5,);
  rand := (l2v1z _MOD l2a1z);
_);
_procedure TTOUT;
_label 1;
_var l2v1z, l2v2z:alfa; l2v3z, l2v4z, l2v5z, l2v6z, l2v7z: integer;
arr:_array [1..100] _of alfa;
_(
  display[dsppos] := '{000{000{000{000{000{000';
  l2v7z := (1C);
  l2v6z := (0C);
  _for l2v4z := (1C) _to dsppos _do _(
    l2v1z := display[l2v4z];
    _for l2v5z := (1C) _to (6C) _do _(
      code(2СЧ3=СД/-10/,2ЗЧ3=МР0,2ЗЧ5=,);
      _if (l2v3z <> (128)) _then _(
        _if (l2v6z = (6C)) _then _(
          arr[l2v7z] := l2v2z;
          l2v7z := (l2v7z + (1C));
          l2v6z := (0C);
        _);
        code(2СЧ4=СД/-10/,2ЛС5=2ЗЧ4,); (* l2v2z := ((l2v2z << 8) | l2v3z); *)
        l2v6z := (l2v6z + (1C));
      _);
    _);
    _if (l2v4z = dsppos) _then
      _for l2v6z := (l2v6z + (1C)) _to (6C) _do
        code(2СЧ4=СД/-10/,2ЗЧ4=,); (* l2v2z := l2v2z << 8 *)
      arr[l2v7z] := l2v2z;
  _);
  dsppos := 1;
  P3442( termno, 1, arr);
  1: _case  extra71( termno ) _of
    0: sleep(4);
    2: exit;
    3: _GOTO 11132
  _end; _goto 1;
_);
_procedure msg(num: integer);
_(
  _if ((num > 6) _and _not black) _or (num > 7) _then _(
    (*=C-*)
    display[1] := 311523246515232C; (* HOME DN DN DN DN DN *)
    display[2] := 4651523246515232C; (* DN DN DN DN DN DN  *)
    display[3] := 4270561342705613C; (* DC DC DC DC DC DC *)
    display[4] := ;
    (*=C+*)
    dsppos := 5;
    TTOUT;
  _);
  _case num _of
  1: writeln('ИГРА К ВАШИМ УСЛУГАМ
НУЖНЫ ПРАВИЛА ?');
  3: writeln('ВАШ ХОД:');
  8: writeln('ПОЗДРАВЛЯЮ! ВЫ ВЫИГРАЛИ');
  5: writeln('ХОТИТЕ ИГРАТЬ БЕЛЫМИ ?');
  6: writeln('ХОТИТЕ ИГРАТЬ ЕЩЕ ?');
  7: writeln('ВЫ ПРОИГРАЛИ');
  4: writeln('ПОВТОРЕНИЕ ПОЗИЦИИ');
  9: writeln('ВЫ ОШИБЛИСЬ !');
  10: writeln('НАБЕРИТЕ "ДА" ИЛИ "НЕТ" !');
  11: writeln('НЕВЕРНЫЙ ХОД !');
  12: writeln('ЭТО НЕ ХОД !')
  _end;
  _if (num > 8) _then
    msg( gl386z )
  _else
    gl386z := num;
_);

_procedure setup;
_var i: integer;
_(
  _for i := 2 _to 10 _do
    field[i] := 0;
  field[1] := 2;
  field[0] := ;
  field[3] := ;
  field[5] := 1;
  pieces[1] := 0;
  pieces[2] := 1;
  pieces[3] := 3;
  pieces[4] := 5;
_);
_procedure P5272(l2a1z:integer);
_var l2v1z:integer; a:_array [1..6] _of char;
_(
  _if (l2a1z = 1) _then
    setup;
  (*=C-*)
  display[1] := 4771763747717637C; (* 6 x clear screen *)
  display[2] := ;
  display[3] := (5012024050120240C); (* 6 spaces *)
  display[4] := ;
  display[11] := ;
  display[12] := ;
  display[19] := ;
  display[20] := ;
  display[27] := ;
  display[65] := ;
  display[73] := ;
  display[74] := ;
  display[81] := ;
  display[82] := ;
  display[89] := ;
  display[90] := ;
  display[5] := 1322645513226455C; (* ------ *)
  display[7] := ;
  display[9] := ;
  display[21] := ;
  display[23] := ;
  display[25] := ;
  display[35] := ;
  display[37] := ;
  display[39] := ;
  display[41] := ;
  display[43] := ;
  display[55] := ;
  display[57] := ;
  display[59] := ;
  display[61] := ;
  display[63] := ;
  display[75] := ;
  display[77] := ;
  display[79] := ;
  display[91] := ;
  display[93] := ;
  display[95] := ;
  display[14] := 6222645513226455C; (* I----- *)
  display[16] := ;
  display[46] := ;
  display[48] := ;
  display[50] := ;
  display[52] := ;
  display[84] := ;
  display[86] := ;
  display[29] := 5012024062320240C; (* ___I__ *)
  display[31] := ;
  display[33] := ;
  display[67] := ;
  display[69] := ;
  display[71] := ;
  display[6] := 1332024050120240C; (* -_____ *)
  display[8] := ;
  display[36] := ;
  display[38] := ;
  display[40] := ;
  display[42] := ;
  display[22] := ;
  display[24] := ;
  display[56] := ;
  display[58] := ;
  display[60] := ;
  display[62] := ;
  display[76] := ;
  display[78] := ;
  display[92] := ;
  display[94] := ;
  display[10] := 1320520040100200C; (* - LF NUL NUL NUL NUL *)
  display[26] := ;
  display[80] := ;
  display[18] := 6220520040100200C; (* I LF NUL NUL NUL NUL *)
  display[88] := ;
  display[28] := 5012024053720240C; (* ___/__ *)
  display[32] := ;
  display[68] := ;
  display[30] := 5012024027120240C; (* ___\__ *)
  display[66] := ;
  display[70] := ;
  display[34] := 5012024027120012C; (* ___\_ LF *)
  display[72] := 5012024053720012C; (* ___/_ LF *)
  display[54] := 5014441240100200C; (* _I LF NUL NUL NUL *)
  display[44] := 1322641240100200C; (* -- LF NUL NUL NUL *)
  display[64] := ;
  display[96] := 13205T; (* - LF EOT *)
  (*=C+*)
  l2v1z := 0;
  _while l2v1z <= 9 _do _(
    a[1] := chr(201);
    a[3] := chr(160);
    a[6] := ;
    _case field[l2v1z] _of
    1: _( a[4] := chr(126);  a[5] := ; _); (* ЧЧ *)
    2: _( a[4] := chr(226);  a[5] := ; _); (* ББ *)
    0: _( a[4] := chr(160);  a[5] := ; _)  (*    *)
    _end;
    _case l2v1z _of
    0: _( a[2] := chr(60C); dsppos := 55C; _);
    1: _( a[2] := chr(177); dsppos := 15C; _);
    2: _( a[2] := chr(178); dsppos := 57C; _);
    3: _( a[2] := chr(63C); dsppos := 123C; _);
    4: _( a[2] := chr(180); dsppos := 125C; _);
    5: _( a[2] := chr(65C); dsppos := 61C; _);
    6: _( a[2] := chr(66C); dsppos := 17C; _);
    7: _( a[2] := chr(183); dsppos := 21C; _);
    8: _( a[2] := chr(184); dsppos := 63C; _);
    9: _( a[2] := chr(71C); dsppos := 127C; _)
    _end;
   pck(a[1], display[dsppos]);
   l2v1z := l2v1z+1;
  _);
  a[1] := chr(201);
  a[2] := chr(177);
  a[3] := chr(60C);
  a[4] := chr(160);
  _case field[10] _of
    1: _( a[5] := chr(126);  a[6] := ; _); (* ЧЧ *)
    2: _( a[5] := chr(226);  a[6] := ; _); (* ББ *)
    0: _( a[5] := chr(160);  a[6] := ; _)  (*    *)
  _end;
  pck(a[1], display[53]);
  dsppos := 141C;
  TTOUT;
  _if gl390z _and (gl386z <> 5) _and (gl386z <> 6) _then
    msg( gl386z );
_);

_procedure rules;
_(
  write('ПРАВИЛА ИГРЫ:{175
 ПОЛЕ ДЛЯ ИГРЫ СОСТОИТ ИЗ 11 КЛЕТОК.
 КЛЕТКИ ПОЛЯ ИМЕЮТ НОМЕРА ОТ 0 ДО 10.
 В ИГРЕ ПРИНИМАЮТ УЧАСТИЕ ТРИ БЕЛЫЕ И ОДНА ЧЕРНАЯ ФИШКИ.
 НАЧАЛЬНОЕ ПОЛОЖЕНИЕ ИЗОБРАЖЕНО НА РИСУНКЕ:
');
  P2775;
  sleep(85);
  gl390z := false;
  P5272(0);
  sleep(45);
  write('
 БЕЛЫЕ НА КЛЕТКАХ 0,1,3, ЧЕРНАЯ НА КЛЕТКЕ 5. ВОЗМОЖНЫЕ НАПРАВЛЕНИЯ
ДВИЖЕНИЯ ПОКАЗАНЫ ЧЕРТОЧКАМИ. БЕЛЫЕ ФИШКИ МОГУТ ХОДИТЬ ТОЛЬКО
ВПЕРЕД И ВБОК. НАПРИМЕР, ЕСЛИ БЕЛАЯ ФИШКА СТОИТ НА ПОЛЕ 5, ОНА
МОЖЕТ ХОДИТЬ НА КЛЕТКИ 4,6,7,8,9. ЧЕРНАЯ ФИШКА МОЖЕТ ХОДИТЬ В
ЛЮБОМ НАПРАВЛЕНИИ.
  ЦЕЛЬ БЕЛЫХ - ЛИШИТЬ ЧЕРНУЮ ФИШКУ ВОЗМОЖНОСТИ ХОДИТЬ, ЗАГНАВ
ЕЕ НА КЛЕТКИ 4,6 ИЛИ 10 И ОКРУЖИВ.
  ЦЕЛЬ ЧЕРНЫХ - ЗАНЯТЬ КЛЕТКУ 0. ПОВТОРЕНИЕ ПОЗИЦИИ СЧИТАЕТСЯ
                ВЫИГРЫШЕМ ЧЕРНЫХ.{175
  ПРИКАЗЫ ИГРЫ:
N1-N2  - ВВОД ХОДА. ФИШКА ХОДИТ С КЛЕТКИ N1 НА КЛЕТКУ N2.
СДАЮСЬ - ПОДАЕТСЯ ЕСЛИ ВИДНО, ЧТО ДАЛЬНЕЙШЕЕ СОПРОТИВЛЕНИЕ БЕСПОЛЕЗНО.
КОНЕЦ  - ВЫХОД ИЗ ИГРЫ. ЭТОТ ПРИКАЗ МОЖНО ПОДАТЬ В ЛЮБОЙ МОМЕНТ.
ПОЛЕ   - ЕСЛИ ИЗ-ЗА КАКИХ-ЛИБО НЕДОРАЗУМЕНИЙ ПОЛЕ НА ЭКРАНЕ ОКАЖЕТСЯ
         ИСПОРЧЕННЫМ, ЭТИМ ПРИКАЗОМ ЕГО МОЖНО ВОССТАНОВИТЬ.
ДА,НЕТ - ТАК СЛЕДУЕТ ОТВЕЧАТЬ НА ВОПРОСЫ.
    ВСЕ ПРИКАЗЫ МОЖНО СОКРАЩАТЬ ДО ОДНОЙ БУКВЫ.
');
  P2775;
_);

_procedure checkers;
_label 1, 7452;
_type pair = _record f1, f2: integer _end; arbits = _array [1..10] _of bits;
_var
l2v1z, l2v2z:@arbits; l2v3z:integer;  c: char; pairarray:_array [1..18] _of pair;

_procedure replicate(c: char; cnt:integer);
_var a: _array [1..6] _of char; i: integer;
_(
  _while (cnt > 0) _do _(
    _for i := 1 _to 6 _do _(
      _if (cnt <= 0) _then
        a[i] := chr(128)
      _else _(
        a[i] := c;
        cnt := cnt - 1;
      _);
    _);
    pck(a[1], display[dsppos]);
    dsppos := dsppos + 1;
  _); (* while *)
_);
_procedure DrawMove(pos1, pos2: integer; isMyMove: boolean; c: char);
_var l3v1z, l3v2z, l3v3z, l3v4z: integer;
_procedure P5565(l4a1z: integer);
_(
  _case l4a1z _of
  0: _( l3v1z := 3C;  l3v2z := 5C; _);
  1: _( l3v1z := 17C; l3v2z := 1C; _);
  2: _( l3v1z := 17C; l3v2z := 5C; _);
  3: _( l3v1z := 17C; l3v2z := 11C; _);
  4: _( l3v1z := 33C; l3v2z := 11C; _);
  5: _( l3v1z := 33C; l3v2z := 5C; _);
  6: _( l3v1z := 33C; l3v2z := 1C; _);
  7: _( l3v1z := 47C; l3v2z := 1C; _);
  8: _( l3v1z := 47C; l3v2z := 5C; _);
  9: _( l3v1z := 47C; l3v2z := 11C; _);
  10: _(l3v1z := 64C; l3v2z := 5C; _)
  _end
_);
_(
  (* 5646 *)
  P5565( pos1 );
  (*=c-*) display[dsppos] := (310020040100200C); (*=c+*)
  dsppos := (dsppos + (1C));
  replicate( chr(154), l3v2z );
  replicate( chr(30C), l3v1z );
  replicate( chr(160), (2C) );
  l3v3z := l3v1z;
  l3v4z := l3v2z;
  P5565( pos2 );
  _if l3v2z - l3v4z > 0 _then
    replicate( chr(154), l3v2z - l3v4z )
  _else
    replicate( chr(153), l3v4z - l3v2z );
  _if l3v1z - l3v3z - 2 > 0 _then
    replicate( chr(30C), l3v1z - l3v3z - 2)
  _else
    replicate( chr(136), l3v3z - l3v1z + 2);
  replicate( c, 2);
  _if (isMyMove) _then _( (*=c-*)
    display[dsppos] := 311523246515232C; (* HOME DN DN DN DN DN *)
    display[dsppos + 1] := 4651523246515232C; (* DN DN DN DN DN DN *)
    display[dsppos + 2] := 4270561342705613C; (* DC DC DC DC DC DC *)
    display[dsppos + 3] := ;
    dsppos := dsppos + 4;
  _); (*=c+*)
  TTOUT;
_);
_procedure sort;
_var i, j, t: integer;
_(
  _for i := 1 _to 3 _do
    _for j := i + 1 _to 3 _do
      _if pieces[j] < pieces[i] _then _(
        t := pieces[i];
        pieces[i] := pieces[j];
        pieces[j] := t;
      _)
_);

_function posNum:integer;
_(
  posNum := pieces[1] * 100000 + pieces[2] * 10000 + pieces[3] * 100 + pieces[4];
_);
_function F6002(l3a1z:_set _of 0..47; l3a2z: integer): integer;
_var l3v1z, l3v2z, l3v3z, l3v4z: integer;
_(
  l3v1z := 0;
  l3v3z := l3a2z * 4;
  _for l3v2z := 0 _to 3 _do _(
    _if ((l3v3z + l3v2z) _IN l3a1z) _then 
      l3v4z := 1
    _else
      l3v4z := 0;
    l3v1z := l3v1z * 2 + l3v4z;
  _);
  F6002 := l3v1z;
_);

_function F6032(l3a1z: _set _of 0..47):integer;
_(
  F6032 := F6002(l3a1z, 0) * 100000 + F6002(l3a1z, 1) * 10000 +
  F6002(l3a1z, 2) * 100 + F6002(l3a1z, 3);
_);

_procedure P6064(_var l3a1z:_set _of 0..47; l3a2z, l3a3z: integer);
_var l3v1z, l3v2z:_set _of 0..47;
l3v3z, l3v4z, l3v5z, l3v6z: integer;
_(
  l3v3z := ((l3a2z + (1C)) * (4C));
  l3v2z := [l3v3z-4..l3v3z-1];
  l3v1z := [];
  l3v4z := l3a3z;
  _for l3v5z := 1 _to 4 _do _(
    l3v6z := l3v4z _MOD 2;
    l3v4z := l3v4z _div 2;
    _if (l3v6z = 1) _then
      l3v1z := l3v1z + [l3v3z -l3v5z];
  _);
  l3a1z := (l3a1z - l3v2z * [0..47]) + l3v1z * l3v2z;
_);

_function F6130(l3a1z: integer; _var l3a2z:text):integer;
_var l3v1z: integer;  l3v2z: char; l3v3z: integer;
_(
  l3v1z := 0;
  _for l3v3z := 1 _to l3a1z _do _(
    _if _not (l3a2z@ _in digit) _then _(
      F6130 := l3v1z;
      exit;
    _);
    l3v2z := l3a2z@;
    get(l3a2z);
    l3v1z := l3v1z * 10 + ord(l3v2z);
  _);
  F6130 := l3v1z;
_); 
_procedure P6165;
_(

  pairarray[1].f1 := 0;
  pairarray[1].f2 := 2;
  pairarray[2].f1 := 0;
  pairarray[2].f2 := 3;
  pairarray[3].f1 := 1;
  pairarray[3].f2 := 5;
  pairarray[4].f1 := 1;
  pairarray[4].f2 := 6;
  pairarray[5].f1 := 2;
  pairarray[5].f2 := 1;
  pairarray[6].f1 := 2;
  pairarray[6].f2 := 5;
  pairarray[7].f1 := 3;
  pairarray[7].f2 := 2;
  pairarray[8].f1 := 3;
  pairarray[8].f2 := 5;
  pairarray[9].f1 := 4;
  pairarray[9].f2 := 9;
  pairarray[10].f1 := 5;
  pairarray[10].f2 := 4;
  pairarray[11].f1 := 5;
  pairarray[11].f2 := 7;
  pairarray[12].f1 := 5;
  pairarray[12].f2 := 8;
  pairarray[13].f1 := 5;
  pairarray[13].f2 := 9;
  pairarray[14].f1 := 6;
  pairarray[14].f2 := 5;
  pairarray[15].f1 := 7;
  pairarray[15].f2 := 10;
  pairarray[16].f1 := 8;
  pairarray[16].f2 := 7;
  pairarray[17].f1 := 8;
  pairarray[17].f2 := 10;
  pairarray[18].f1 := 9;
  pairarray[18].f2 := 8;
_);

_function validate(pos1, pos2:integer; l3a3z:boolean):boolean;
_var i:integer;
_(
  _if (pos1 > 10) _or (pos2 > 10) _or (pos1 < 0) _or (pos2 < 0) 
    _or ((field[pos1] = 2) _and l3a3z) _or ((field[pos1] = 1) _and _not l3a3z)
    _or (field[pos2] <> 0) _or (field[pos1] = 0) _then _(
    validate := false;
    exit
  _);
  _for i := 1 _to 18 _do _(
    _if _not ((pairar[i].f1 <> pos1) _or (pairar[i].f2 <> pos2)) _or
      (_not (((pairar[i].f2 <> pos1) _or (pairar[i].f1 <> pos2))) _and l3a3z) _then _(
      validate := true;
      exit;
    _)
  _);
  _if ((pos1 - 1 = pos2) _and  l3a3z) _or (pos1 + 1 = pos2) _then _(
    validate := true;
    exit
  _);
  validate := false;
_);

_procedure doMove(pos1, pos2: integer);
_var i:integer;
_(
  field[pos2] := field[pos1];
  field[pos1] := 0;
  _for i := 1 _to 4 _do _(
    _if (pieces[i] = pos1) _then
      pieces[i] := pos2;
  _);
_);

_procedure myMove(pos1, pos2: integer);
_(
  writeln('МОЙ ХОД ':10, pos1:1, ' - ', pos2:1);
_);


_procedure flip(_var i: integer);
_(
  _case i _of
  1:i := 3;
  3:i := 1;
  4:i := 6;
  6:i := 4;
  7:i := 9;
  9:i := 7
_end;
_);

_procedure PickWhite(_var l3a1z, l3a2z, l3a3z: integer);
_var l3v1z, l3v2z, i, l3v4z, j, l3v6z, l3v7z, l3v8z: integer;
saved:_array[1..4] _of integer;
_(
  (* saved := pieces *) _for j := 1 _to 4 _do saved[j] := pieces[j];
  _for i := 1 _to 2 _do _(
    l3v2z := posNum;
    l3v4z := 1;
    l3v8z := 65;
    _repeat _(
      l3v6z := trunc((l3v4z + l3v8z) / 2);
      l3v7z :=   F6032(l2v1z@[l3v6z] );
      _if (l3v7z = l3v2z) _then _(
        l3v1z := rand(3) * 2;
        l3a1z :=   F6002( l2v1z@[l3v6z], l3v1z + 4);
        l3a2z :=   F6002( l2v1z@[l3v6z], l3v1z + 5);
        l3a3z :=   F6002( l2v1z@[l3v6z], 10);
        (* pieces := saved *) _for j := 1 _to 4 _do pieces[j] := saved[j];
        _if i = 2 _then _(
          flip( l3a1z );
          flip( l3a2z );
        _);
        exit
      _)  _else _(
        _if (l3v7z < l3v2z) _then 
          l3v4z := l3v6z + 1
        _else
          l3v8z := l3v6z - 1;
      _);
    _) _until (l3v4z > l3v8z);
    _for j := 1 _to 4 _do _(;
      flip( pieces[j] );
    _);
    sort;
  _);
_);

_procedure readline(_var l3a1z, l3a2z:integer; _var l3a3z:char; _var l3a4z:boolean);
_type letter='A'..'Z';
_var i:integer;
_(
  _for i := 1 _to 5 _do _(
    (L6561) _(
      TTIN(2);
      _if tempfile@ <> 'П' _then _exit L6561;
      P5272(0);
      _goto L6561;
    _);
    _if tempfile@ = 'K' _then _GOTO 7452;
    _if tempfile@  _in digit _then _(
      l3a1z :=   F6130(10, tempfile );
      _if tempfile@ = '-' _then (a) _(
        code(16ПВ76312=,);
        _if tempfile@ _in digit _then _(
          l3a2z := F6130(10, tempfile );
          l3a4z := true;
          exit;
        _) _else
          msg(9);
      _) _else _(
        msg(9);
      _);
    _) _else _if tempfile@ _in letter _then _(
      l3a3z := tempfile@;
      l3a4z := false;
      exit;
    _) _else _if _not (tempfile@ _in digit) _and _not (tempfile@ _in letter) _then _(
      msg(9); (q) _exit q;
    _); 
  _);
  (* L6656 *)
  _GOTO 7452;
_);

_procedure getMove(_var l3a1z, l3a2z: integer; _var ret: integer);
_var i: integer; l3v2z: char; l3v3z:boolean;
_(
  ret := 0;
  _for i := 1 _to 5 _do _(
    readline( l3a1z, l3a2z, l3v2z, l3v3z);
    _if _not l3v3z _and (l3v2z = 'C') _then _(
      ret := 1;
      exit
    _) _else _if _not l3v3z _and (l3v2z <> 'C') _then _(
      msg(12);
    _) _else _if l3v3z _and validate( l3a1z, l3a2z, black) _then _(
      ret := 0;
      exit
    _) _else (q) _(
      msg(11); (* incorrect move *)
      _exit q
    _)
  _);
  _GOTO 7452;
_);

_procedure YesOrNo(_var c: char);
_var x, y, i:integer; isMove:boolean; ch:char;
_(
  _for i := 1 _to 5 _do _(
    readline(x, y, ch, isMove);
    _if (_not isMove _and (ch = 'Д')) _or
        (_not isMove _and (ch = 'H')) _then _(
      c := ch;
      exit;
    _);
    msg(10); (* enter yes or no *)
  _);
  _GOTO 7452;
_);

_procedure UserBlack;
_var pos1:integer; pos2:integer; ret: integer; 
_(
  setup;
  P5272(0);
  black := true;
  (L6773) _(
    PickWhite(pos1, pos2, ret);
    DrawMove( pos1, pos2, true, chr(226) ); (* Б *)
    myMove( pos1, pos2 );
    doMove( pos1, pos2 );
    sort;
    _if ret = 11 _then _(
      msg(7); (* you lost *)
      exit
    _);
    msg(3); (* your move: *)
    getMove(pos1, pos2, ret);
    _if ret = 1 _then _(
      msg(7); (* you lost *)
      exit
    _);
    DrawMove( pos1, pos2, false, chr(126) ); (* Ч *)
    doMove( pos1, pos2 );
    sort;
    _goto L6773;
  _)
_);

_procedure PickBlack(_var pos1, pos2:integer; _var saved:_array [1..4] _of integer);
_var l3v1z, l3v2z, l3v3z, l3v4z, i, j, cur, hash: integer;
_(
  (* saved := pieces; *) _for i := 1 _to 4 _do code(=3ИК12,1СЧ561=3ИК12,3ЗЧ5=);
  pos1 := pieces[4];
  _for j := 1 _to 2 _do _(
    cur :=   posNum;
    _if cur = 10205 _then _(
      _case rand(6) _of
      0: pos2 := 3;
      1: pos2 := 4;
      2: pos2 := 6;
      3: pos2 := 7;
      4: pos2 := 8;
      5: pos2 := 9
      _end;
      _if j = 2 _then _(
        flip( pos2 );
        (* pieces := saved; *) _for i := 1 _to 4 _do code(=3ИК12,3СЧ5=3ИК12,1ЗЧ561=);
      _);
      exit
    _);
    (* 7136 *)
    hash := posNum _MOD 698 + 1;
   _repeat 
    _if (F6032(l2v2z@[hash]) = cur) _then _(
      pos2 := F6002(l2v2z@[hash], rand(3) + 4);
      _if (j = 2) _then _(
        (* pieces := saved; *) _for i := 1 _to 4 _do code(=3ИК12,3СЧ5=3ИК12,1ЗЧ561=);  
        flip( pos2 );
      _);
      _if (F6002(l2v2z@[hash], 7) = 2) _then _(
        saved[1] := 11;
      _);
      _if (pos2 = 12) _then _(
        saved[1] := 12;
      _);
      P6064(l2v2z@[hash], 7, F6002(l2v2z@[hash], 7) + 1);
      exit
    _) _else _(
      hash := F6002( l2v2z@[hash], 8) * 256 +
        F6002( l2v2z@[hash], 9) * 16 + F6002( l2v2z@[hash], 10);
    _);
   _until hash = 3840;
    _for i := 1 _to 4 _do
      flip( pieces[i] );
    sort;
  _);
_);

_procedure UserWhite;
_label 1;
_var i, l3v2z, l3v3z:integer; l3v4z: _array [1..1] _of integer;
_(
  setup;
  P5272(0);
  black := false;
  _for i := 1 _to 698 _do _(
    P6064(l2v2z@[i], 7, 0);
  _);
  1:
  msg(3); (* your move: *)
  getMove(l3v2z, l3v3z, l3v4z[1]);
  _if (l3v4z[1] = 1) _then _(
    msg(7); (* you lost *)
    exit
  _);
  doMove( l3v2z, l3v3z );
  sort;
  DrawMove( l3v2z, l3v3z, false, chr(226) ); (* Б *)
  (*=c-*)PickBlack(l3v2z, l3v3z, l3v4z);(*=c+*)
  _if (l3v4z[1] = 11) _then _(
    msg(7); (* you lost *)
    msg(4); (* repetition *)
    exit
  _);
  _if (l3v4z[1] = 12) _then _(
    msg(8); (* you won *)
    exit
  _);
  DrawMove( l3v2z, l3v3z, true, chr(126) ); (* Ч *)
  doMove( l3v2z, l3v3z );
  myMove( l3v2z, l3v3z );
  _if (l3v3z = 0) _then _(
    msg(7); (* you lost *)
    exit
  _);
  sort;
  _goto 1;
_);

_( (* checkers *)
  checkPerm;
  readZone(0, 400137C);
  l2v1z := ptr(64000C);
  l2v2z := ptr(64101C);
  P6165;
  dsppos := 1;
  setup;
  msg(1); (* need rules? *)
  YesOrNo(c);
  _if (c = 'Д') _then
    rules;
  gl390z := true;
  gl10z := 698;
  code(ЗЧ76421=ЗЧ76422,);
  1:
    checkTime;
    msg(5); (* wanna play White? *)
    YesOrNo(c);
    _if (c = 'Д') _then 
      UserWhite
    _else
      UserBlack;
    P3030(4);
    msg(6); (* play again? *)
    YesOrNo(c);
  _if (c = 'H') _then _goto 7452;
  _goto 1;
  7452:
  l2v3z := gl387z;
  code(ЗЧ76421=ЗЧ76422,);
_);

_FUNСТI RANDOM:REAL;(* СЛУЧАЙНОЕ ЧИСЛО В (0,1) *)
_(
  СОDЕ(К;ВР77=17ЗЧ1,РА3=СЧХRАND,АУАRАND=МР,
ЦССRАND=ЛУЕВПИЛ,ЛСЕСОРВ=ЗЧХRАND,РА=АС,17РК1=ПБЮЮR,
С;ХRАND:0,АRАND:4004142135623735,
СRАND:0003303130564677,ЕВПИЛ:0017777777777777,Л;ЕСОРВ:В1/57,
К;ЮЮR:ЗЧ=,);RАNDОМ:=;_);(*ЕND RАNDОМ*)

_РRОСЕD RАND0;(* НАЧАЛЬНАЯ УСТАНОВКА RАNDОМ *)
_(СОDЕ(К;Э05310=,СД/-31/=ЗЧХRАND,Э050114=,
СД/-5/=ЦСХRАND,ЛУЕВПИЛ=ЛСЕСОРВ,ЗЧХRАND=,)_);(*ЕND RАND0*)

_procedure races;
_label 10307, 10434, 10521;
_const clrscr = '{162'; CRLF = '{141'; HOME = '{167'; EOT = '{172'; DOWN = '{177'; RIGHT = '{171'; UP = '{176';
_var l2v1z, l2v2z: real;  l2v3z, l2v4z, l2v5z, l2v6z, l2v7z, l2v8z, l2v9z, l2v10z, 
l2v11z, l2v12z, l2v13z, l2v14z, l2v15z, l2v16z, l2v17z, l2v18z:integer;
letter:_array [1..3] _of char;
class:_array [1..9] _of char;
rating:_array [1..3] _of real;
speed:_array [1..9] _of real;
running:_array [1..9] _of boolean;
l2v51a:_array [1..9] _of integer;
l2v60a:_array [1..9] _of integer;
l2v69a:_array [1..9] _of integer;
l2v78a:_array [1..9] _of integer;
l2v87a:_array [1..9] _of integer;
_procedure P7506;
_label 7551;
_var l3v1z, l3v2z, l3v3z:integer; l3v4z: _array[1..6] _of char; l3v10z: boolean;
_(
  write(tempfile,EOT);
  reset(tempfile);
  l3v10z := false;
  (loop) _for l3v2z := 1 _to 100 _do _(;
    _for l3v3z := 1 _to 6 _do _(;
      _if _not eof(tempfile) _then _(
        code(=16ПВ76312,);
        l3v4z[l3v3z] := tempfile@;
      _) _else _(
        l3v10z := true;
        l3v4z[l3v3z] := EOT;
      _);
    _);
    pck(l3v4z[1], display[l3v2z]);
    _if l3v10z _then _exit loop;
  _);
  (* 7544 *)
  P3442( termno, 0, display);
 7551:
 l3v1z :=   extra71( termno );
  _case l3v1z _of
  0: _( sleep(8);
    _goto 7551;
  _);
  1: _(
    writeln('НЕРВНЫМ НА БЕГА ХОДИТЬ ВРЕДНО !');
    rewrite(tempfile);
    write(tempfile,'КОН  {377');
    gl15z := false;
    _GOTO 11227;
  _);
  2: _(
    rewrite(tempfile);
    exit
  _);
  3: _GOTO 11230
  _end
_);
_function F7610:boolean;
_(
  _if (tempfile@ = ETX) _or (tempfile@ = 'Д') _then
  F7610 := false
  _else
  F7610 := true;
  
  rewrite(tempfile);
_);
_procedure P7624(l3a1z:integer);
_(
 (L7626) _(
  _if (l2v16z = l3a1z) _then exit
  _else _if (l2v16z < l3a1z) _then _(
    write(tempfile, RIGHT);
    l2v16z := (l2v16z + (1C));
    _goto L7626;
  _) _else _(
    write(tempfile, LEFT);
    l2v16z := (l2v16z - (1C));
    _goto L7626;
    _exit L7626; (* aligning *)
  _);
_)  
_);
_procedure P7650;
_var l3v1z:integer;
_(
  checkTime;
  write(tempfile, SPACE, clrscr, '       ЗАБЕГ ', l2v11z:0,
    CRLF, DOWN, ' К  С', CRLF, DOWN);
  _for l3v1z := (1C) _to l2v7z _do _(;
    write(tempfile, SPACE, class[l3v1z], '  ', l3v1z:1, CRLF);
  _);
  l2v16z := (1C);
  P7624( (l2v5z + (1C)) );
  _for l3v1z := (1C) _to l2v7z _do _(;
    write(tempfile, UP, LEFT, ':');
  _); (* 7761 *)
  write(tempfile, UP, UP, LEFT, 'Б');
  P7624( l2v4z );
  write(tempfile,'Ф    М', DOWN, LEFT, LEFT, LEFT, LEFT, LEFT);
  _for l3v1z := (1C) _to l2v7z _do _(;
    write(tempfile, DOWN, LEFT, '.');
  _);
  write(tempfile, CRLF);
  P7506;
  writeln('НАЧНЕМ ?');
  TTIN( (2C) );
  _if F7610 _then _(
    writeln('КАК ВАМ БУДЕТ УГОДНО');
    _GOTO 11132;
  _);
  write(tempfile,' {176       {176{141{176        ');
  P7506;
_);
_procedure P10073;
_var l3v1z, l3v2z: integer;
_(
  write(tempfile, SPACE, HOME, DOWN, DOWN, DOWN, RIGHT, RIGHT, RIGHT, RIGHT);
  l2v16z := (5C);
  _for l3v1z := (1C) _to l2v7z _do _(;
    write(tempfile, DOWN);
    l3v2z := l2v60a[l3v1z];
    _if (l3v2z <> (0C)) _and (l2v78a[l3v1z] <> (0C)) _then _( (q) _exit q; (q) _exit q;
      P7624( l3v2z );
      _if (-1 = l2v78a[l3v1z]) _then _(
        write(tempfile, RIGHT, 'ВЫБ');
        l2v16z := (l2v16z + (4C));
      _) _else _(
        write(tempfile, SPACE);
        l2v16z := (l2v16z + (1C));
        _if (-2 = l2v78a[l3v1z]) _then _(
          l3v2z := l2v4z;
        _) _else _(
          l3v2z := l2v69a[l3v1z];
        _);
        P7624( l3v2z );
        write(tempfile, l3v1z:1);
        l2v16z := (l2v16z + (1C));
        _if (l3v2z = l2v4z) _then _(
          P7624( (l2v4z + (5C)) );
          write(tempfile, l2v51a[l3v1z]:1);
          l2v16z := (l2v16z + (1C));
        _)
      _)
    _) (* 10216 *)
  _); (* loop *)
  write(tempfile, DOWN, CRLF);
  P7506;
_);
_( (* races *)
  checkPerm;
  RAND0;
  letter[1] := 'A';
  letter[2] := 'B';
  letter[3] := 'C';
  rating[1] := 1.5;
  rating[2] := 1.25;
  rating[3] := 1.0;
  l2v3z := (74C);
  l2v4z := ((5C) + l2v3z);
  l2v5z := ((5C) + (42C));
  l2v6z := (4C);
  l2v8z := (12C);
  l2v9z := (4C);
  l2v10z := (24C);
  l2v2z := 9.999999999991e-3;
  l2v7z := (6C);
  l2v11z := (0C);
  rewrite(tempfile);
  _if (gl16z) _then _(
    writeln('  ВЫ НЕ ХОТЕЛИ ИГРАТЬ.{175БУДЬТЕ ЖЕ ХОЗЯИНОМ СВОЕМУ СЛОВУ !');
    _GOTO 11132;
  _);
  write(tempfile, SPACE, CLRSCR, 'ВЫ НА БЕГАХ');
  P7506;
  writeln('НАЧИНАТЬ ?');
  TTIN( (2C) );
  _if F7610 _then
    _GOTO 11132;
  10307:
  P3030( (10C) );
  _for l2v18z := (1C) _to l2v7z _do _(;
    gl12z := (trunc(random * 3.0) + (1C));
    class[l2v18z] := letter[gl12z];
    speed[l2v18z] := rating[gl12z];
  _);
  l2v11z := (l2v11z + (1C));
  l2v15z := (0C);
  l2v14z := (0C);
  l2v12z := (5C);
  _for l2v18z := (1C) _to l2v7z _do _(;
    running[l2v18z] := true;
    l2v69a[l2v18z] := (5C);
    l2v51a[l2v18z] := (0C);
  _); (* 10344 *)
  P7650;
  _repeat
    l2v13z := l2v12z;
    _for l2v18z := (1C) _to l2v7z _do _(;
      l2v60a[l2v18z] := l2v69a[l2v18z];
      l2v78a[l2v18z] := (0C);
      _if running[l2v18z] _then (q) _(
        l2v1z := random * speed[l2v18z];
        _if l2v1z >= 0.99 _then
          l2v1z := 0.99;
          _if (l2v1z < l2v2z) _then _goto 10434;
          gl12z := trunc((((l2v8z + (1C))) * l2v1z));
          _if ((l2v13z - l2v60a[l2v18z]) >= l2v10z) _then _(
            gl12z := (gl12z + l2v9z);
            _if (gl12z > l2v8z) _then _(
              gl12z := l2v8z;
            _)
          _);
          l2v17z := (l2v60a[l2v18z] + gl12z);
          _if ((l2v5z - (1C)) <> l2v17z) _or (gl12z <> (0C)) _then (q) _(
            _if (l2v60a[l2v18z] < l2v5z) _and
                 (l2v17z >= l2v5z) _then _(
              l2v17z := (l2v17z - l2v6z);
              gl12z := (gl12z - l2v6z);
              _if (l2v17z <= l2v5z) _then _(
                l2v17z := (l2v5z - (1C));
                gl12z := (l2v17z - l2v60a[l2v18z]);
              _)
            _);
            l2v78a[l2v18z] := gl12z;
            l2v69a[l2v18z] := l2v17z;
            _if (l2v17z > l2v12z) _then
              l2v12z := l2v17z;
            _) _else 10434: _(; (* 10434 *)
            l2v15z := (l2v15z + (1C));
            running[l2v18z] := false;
            l2v78a[l2v18z] := -1;
            l2v69a[l2v18z] := 0;
          _)
      _);
    _); (* 10445 *)
    _while (l2v12z >= l2v4z) _do _(
      l2v17z := (0C);
      _for l2v18z := (1C) _to l2v7z _do _(;
        _if (l2v69a[l2v18z] = l2v12z) _and
            running[l2v18z] _then _(
          l2v17z := (l2v17z + (1C));
          gl12z := l2v17z;
          (L10461) _(
            gl12z := (gl12z - (1C));
            _if (gl12z = (0C)) _then _exit L10461
            _else _if (l2v78a[l2v18z] > l2v78a[l2v87a[gl12z]]) _then _exit L10461
            _else _if (l2v78a[l2v18z] < l2v78a[l2v87a[gl12z]]) _then _goto 10521
            _else _if (speed[l2v18z] < speed[l2v87a[gl12z]]) _then _exit L10461
            _else _if (speed[l2v18z] > speed[l2v87a[gl12z]]) _then _goto 10521
            _else _(
              l2v1z :=   random;
              _if (l2v1z > 0.5) _then
                _exit L10461
              _else (q) _exit q;
              (q) _exit q; 
            _);
            10521: l2v87a[(gl12z + (1C))] := l2v87a[gl12z];
            _goto L10461
          _); (* 10525 *)
          l2v87a[(gl12z + (1C))] := l2v18z;
        _); (* 10530 *)
      _);
      (* 10532 *)
      _for l2v18z := (1C) _to l2v17z _do _(;
        l2v14z := (l2v14z + (1C));
        gl12z := l2v87a[l2v18z];
        l2v51a[gl12z] := l2v14z;
        running[gl12z] := false;
        l2v78a[gl12z] := -2;
        l2v69a[gl12z] := (0C);
      _);
      l2v12z := (l2v12z - (1C));
    _); (* 10552 *)
    P10073;
  _until (l2v15z + l2v14z) = l2v7z;
  (q) _exit q;
  writeln('ЗАБЕГ ОКОНЧЕН');
  writeln('ЕЩЕ ПОБЕГАЕМ ?');
  TTIN( (2C) );
  _if F7610 _then _(
    writeln('НУ КАК ХОТИТЕ');
    gl16z := true;
    exit
  _);
  _if (l2v11z > (6C)) _then _(
    writeln('НЕ НАДО УВЛЕКАТЬСЯ !{175НА СЕГОДНЯ ХВАТИТ !');
    rewrite(tempfile);
    write(tempfile,'ВЫХ  {377');
    gl15z := false;
    _GOTO 11227;
  _);
  checkPerm;
  _goto 10307;
_);

_procedure P10614;
_var l2v1z, l2v2z: integer;
_(
  code(э0634=,);
  l2v1z := ;
  l2v1z := (l2v1z - gl17z);
  _if l2v1z < 0 _then exit;
  code(э05310=,);
  l2v2z := ;
  l2v2z := (l2v2z - gl18z);
  _if l2v2z < 0 _then exit;
  gl19z := shift(l2v1z,2);
  P3030(31);
  (q)
  gl19z := shift(l2v2z,9);
  P3030(33);
_);
_procedure exec(arg:integer);
_procedure P10640(_var f:text; _var i:integer; j:integer); _( code(ПБ76022=,); _);
_(
  _if gl15z _then _GOTO 11244;
  flags := (flags + [13]);
  gl20z := (31C);
  P10614;
  P10640(tempfile, gl22z, (76C) );
_);

_procedure P10672;
_procedure P10664(_var f:text; _var i:integer; j:integer); _( code(ПБ76021=); _);
_(
  P10664(tempfile, gl22z, (76C) );
  gl15z := (flags * [13]) <> [13];
  gl20z := (31C);
  _GOTO 11136;


  
_);

_procedure inform;
_label 1;
_var l2v1z:alfa;
_procedure load(l3a1z: alfa); 
_(
  rewrite(tempfile);
  write(tempfile,'ШКО   ');
  write(tempfile, l3a1z);
_);
_( (* inform *)
  _if getCmd(l2v1z, 3) _then _(
  _if (l2v1z = 'ИНФ   ') _then
    writeln('  П Р И К А З   И Н Ф О Р М А Ц И Я{175{175   НЕКОТОРЫЕ ОБЩИЕ СВЕДЕНИЯ О БЛОКЕ ИГР{175  В РАБОЧЕЕ ВРЕМЯ ВХОДИТЬ В ИГРОВОЙ БЛОК НЕ РЕКОМЕНДУЕТСЯ. ИГРА{175НА ДЕНЬГИ В ЛЮБОЕ ВРЕМЯ ЗАПРЕЩЕНА.')
  _else _if (l2v1z = 'ШКО   ') _then
    writeln('  П Р И К А З   Ш К О Л А{175{175  ПРИКАЗ ШКО-ЛА ДАЕТ ПОДРОБНОЕ ОПИСАНИЕ ПРИКАЗОВ БЛОКА "ИГРА".{175    ФОРМА ОБРАЩЕНИЯ:{175    ШКО-ЛА  <ПРИКАЗ>')
  _else _if (l2v1z = 'LAN   ') _or (l2v1z = 'ПОС   ') _then
    writeln('  П Р И К А З   П О С А Д К А  (LАNDING){175{175  ИГРА В ПОСАДКУ НА ЛУНУ (LАNDING) ВЗЯТА В ВИДЕ ПАСКАЛЬ-ПРОГРАММЫ{175НА ОДНОЙ ИЗ ЗАРУБЕЖНЫХ ВЫСТАВОК ПО ВЫЧИСЛИТЕЛЬНОЙ ТЕХНИКЕ. АДАПТАЦИЯ{175ДЛЯ БЭСМ-6 С.И.ПИРИНА И А.Н.БИРЮКОВА.{175  ЦЕЛЬ ИГРЫ: ДОСТИЧЬ ПОВЕРХНОСТИ ЛУНЫ (ВЫСОТА 0) С НУЛЕВОЙ СКОРОСТЬЮ.{175  ЛИЦА, ДОСТАТОЧНО ЗНАКОМЫЕ С АНЛИЙСКИМ ЯЗЫКОМ - ЯЗЫКОМ ОРИГИНАЛА,{175МОГУТ ВЫЗЫВАТЬ ИГРУ ПРИКАЗОМ "LАNDING".
   Р Е К О М Е Н Д А Ц И И{1751) ПЕРЕД САМОЙ ПОСАДКОЙ МОЖНО ПЕРЕЙТИ НА МЕНЬШИЙ ИНТЕРВАЛ ВРЕМЕНИ.{175ДЛЯ ЭТОГО ПЕРЕД УКАЗАНИЕМ СКОРОСТИ РАСХОДА ТОПЛИВА СЛЕДУЕТ НАБРАТЬ{175 Т<N> , ГДЕ N - ИНТЕРВАЛ (ОДНА ЛИТЕРА) В СЕКУНДАХ. НАПРИМЕР: Т170{175ОЗНАЧАЕТ - УСТАНОВИТЬ ИНТЕРВАЛ В ОДНУ СЕКУНДУ И РАСХОД ТОПЛИВА 70{175ФУН/СЕК. ВОЗВРАТ К 10-СЕКУНДНОМУ ИНТЕРВАЛУ ПУТЕМ НАБОРА Т+ .{1752) ДЛЯ ОКОНЧАНИЯ ИГРЫ В ПРОИЗВОЛЬНЫЙ МОМЕНТ НАБЕРИТЕ ВМЕСТО СКОРОСТИ{175РАСХОДА ТОПЛИВА ЛИТЕРУ "К".')
  _else _if (l2v1z = 'ШАШ   ') _then _(
    write('  П Р И К А З   Ш А Ш К И');
    P2775;
    rules;
    write('  ИГРУ ВО ФРАНЦУЗСКИЕ ШАШКИ ЗАПРОГРАММИРОВАЛ Ю.В.КАШАЕВ.');
    P2775;
  _) 
  _else _if (l2v1z = 'КРЕ   ') _then
    writeln('  П Р И К А З   К Р Е С Т И К И{175{175  ПО ПРИКАЗУ "КРЕ" ПРОИЗВОДИТСЯ РАЗМЕТКА ЭКРАНА ТЕРМИНАЛА ДЛЯ ИГРЫ{175В КРЕСТИКИ-НОЛИКИ. ПО ОКОНЧАНИИ РАЗМЕТКИ ДЖИН ОСВОБОЖДАЕТ ТЕРМИНАЛ{175И ОКАНЧИВАЕТ ЗАДАЧУ.')
  _else _if (l2v1z = 'УЗО   ') _then
    writeln('  П Р И К А З   У З О Р{175{175ПРИКАЗ НЕ РЕАЛИЗОВАН')
  _else _if (l2v1z = 'БЕГ   ') _then
    writeln('  П Р И К А З   Б Е Г А{175{175  ИГРА "ИППОДРОМ" ИМИТИРУЕТ РЫСИСТЫЕ ИСПЫТАНИЯ ЛОШАДЕЙ. ПОСЛЕ НАЧАЛА{175ИГРЫ ФОРМИРУЕТСЯ БЕГОВОЕ ПОЛЕ, НА КОТОРОМ ОТМЕЧАЮТСЯ МЕСТА СТАРТА,{175БАРЬЕРА, ФИНИША. ПО БЕГОВОМУ ПОЛЮ ПЕРЕДВИГАЮТСЯ ЦИФРЫ, ОБОЗНАЧАЮЩИЕ{175ЛОШАДЕЙ. ОКОЛО СТАРТОВОГО СТОЛБА ПРОСТАВЛЯЮТСЯ БУКВЫ, ОБОЗНАЧАЮЩИЕ{175КЛАССНОСТЬ ЛОШАДЕЙ. СООТНОШЕНИЕ СРЕДНИХ СКОРОСТЕЙ БЕГА ДЛЯ РАЗЛИЧНЫХ{175КЛАССОВ:{175              А : В : С   КАК   1.5 : 1.25 : 1.0{175  ПОСЛЕ ОКОНЧАНИЯ ЗАБЕГА ОКОЛО ФИНИШНОГО СТОЛБА ВЫСТАВЛЯЮТСЯ НОМЕРА{175ЗАНЯТЫХ МЕСТ.{175  АВТОР ИГРЫ "БЕГА" (ИППОДРОМ) - В.Н.ПИЛЬЩИКОВ. АДАПТИРОВАЛ ИГРУ{175ДЛЯ ДЖИНА В.В.ДОЛМАТОВ.')
  _else _if (l2v1z = 'ЛОТ   ') _then _(
    load( 'ЛОТ  {377' );
    _GOTO 11176;
  _) _else _if (l2v1z = 'КАЛ   ') _then _(
    load( 'КАЛ  {377' );
    _GOTO 11204;
  _) _else _if (l2v1z = 'ТУР   ') _then _(
    load( 'ТУР  {377' );
    _GOTO 11204;
  _) _else _if (l2v1z = 'ГЛИ   ') _then _(
    load( 'ГЛИ  {377' );
    _GOTO 11210;
  _) _else _if (l2v1z = 'КУБ   ') _then _(
    load( 'КУБ  {377' );
    _GOTO 11214;
  _) _else _if (l2v1z = 'ИНС   ') _then _(
    load( 'ИНС  {377' );
    _GOTO 11220;
  _) _else _(
    writeln('НЕТ ТАКОГО ПРИКАЗА');
   _goto 1;
  _) _) _else _(
    write('НЕТ ПАРАМЕТРА ПРИКАЗА ');
    1: writeln('ЕСТЬ: ИНФ,ШКО,ПОС,ШАШ,БЕГ,ЛОТ,КРЕ,КАЛ,КУБ,ИНС');
    exit
  _);
  P3030( (2C) );
_);
_procedure BadCommand;
_(
  write('ПРИКАЗА ', entered, 'В ');
  ГГ(d21);
  writeln(d22, ' НЕТ');
_);

(* main program *)

_(
  gl19z := (1C);
  code(э0634=,);
  gl17z := ;
  code(э05310=,);
  gl18z := ;
  gl16z := false;
  gl21z := ptr(64000C);
  gl11z := [0..47];
  code(17зч1=17э0711,);
  gl390a := ;
  termno := minel(gl390a) + 1;
  code(СЧ76421=); gl387z := ;
  code(СЧ76233=); tambov := ;
  _if tambov <> 'ТАМБОВ' _then _(
    code(СЧ=Э0620,);
    _goto 11132
  _);
  P10672;
11132:
  checkTime;
  gl20z := 25;
  TTIN(1);
  gl15z := false;
11136:
  _if getCmd(entered, 3)  _then _(
    _if ('ИГР   ' = entered) _then _(
      _if (tempfile@ = ETX) _then
        _goto 11132
      _else
        _goto 11136;
    _)
    _else _if ('LАN   ' = entered) _then landing(true)
    _else _if ('ПОС   ' = entered) _then landing(false)
    _else _if ('КРЕ   ' = entered) _then tictactoe
    _else _if ('ШАШ   ' = entered) _then checkers
    _else _if ('ШКО   ' = entered) _then inform
    _else _if ('ЛОТ   ' = entered) _or ('УЗО   ' = entered) _then 11176: exec(2661100C)
    _else _if ('КАЛ   ' = entered) _or ('ТУР   ' = entered) _then 11204: exec(6400230C)
    _else _if ('ГЛИ   ' = entered) _then 11210: exec(5660630C)
    _else _if ('КУБ   ' = entered) _then 11214: exec(4660640C)
    _else _if ('ИНС   ' = entered) _then 11220: exec(2660734C)
    _else _if ('БЕГ   ' = entered) _then races
    _else _if ('КОН   ' = entered) _then 11227: _(
      exec(1660730C);
      11230:
      rewrite(tempfile);
      gl15z := false;
      code(сч0=зч76013,);
      write(tempfile,'СОN  {377');
      flags := flags + [47];
      _goto 11227;
    _) _else _if (gl15z) _then 11244: _(
      writeln('В БЛОКЕ НЕТ ПРИКАЗА ', entered);
    _) _else _(
      _goto 11227; (q) _exit q; 
    _)
  _) _else
    writeln('НЕ ПОНИМАЮ'); (* 11256 *)
  _goto 11132;
  BadCommand;
_).     
