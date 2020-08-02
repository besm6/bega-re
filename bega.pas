(*=p-,t-,l-,m-*)_program БЕГА;
_label 11132, 11136, 11176, 11204, 11210, 11214, 11220, 11227, 11230, 11244;

_const (* list = 64000B; n0 = 0; n1 = 1; *) c54 = 54; c517 = 517;
d14 =1660730B;
d15 = 2661100B;
d16 = 6400230B;
d17 = 400137B;
d18 = 5660630B;
d19 = 4660640B;
d20 = 2660734B;
d21 = '0  ИТМ';
d22 = ' И ВТ ';
n62 = 62;
n255 = 255;
n15 = 15;
dot = '.';
n36 = 36;
n45 = 45; n11 = 11; n102 = 102;n32 = 32; n76 = 76; n9 = 9;
n47=47;n1023=1023; n6=6; n100=100; n2=2; n39=39; n4=4; n10=10;
_type bits = _set _of 0..47; rec = _array[1..10] _of bits;
_var
gl10z,
gl11z:integer;
gl12z, gl13z, gl14z, gl15z, gl16z, gl17z, gl18z, gl19z, gl20z:integer;
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
_procedure filler; 
_(

(q) _exit q; (q) _exit q; (q) _exit q;
(q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q;
(q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q;
(q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q;
(q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q;
(q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q;

(q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q;
(q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q;
(q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q;
(q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q;
(q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q;
(q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q;
(q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q;
(q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q;

(q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q;
(q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q;
(q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q;
(q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q;
(q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q;
(q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q;
(q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q;
(q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q;

(q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q;
(q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q;
(q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q;
(q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q;
(q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q;
(q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q;
(q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q;
(q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q;

_);

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
  _while input@ <> chr(255) _do _(
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
  write(tempfile, chr(255));
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
    gl15z := 0;
    write(tempfile,'КОН  {377');
    _GOTO 11227;
 _)
_);
_procedure P2775;
_var l2v1z: alfa;
_(
 writeLN;
 checkTime;
 code(CЧ77015=);
 l2v1z := ;
 _if (l2v1z = 'Н{3770000') _then _GOTO 11132;
_);

_procedure P3006(_var a:alfa);
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
 _if (a < l2v3z) _and (a > 0) _then P3030(0);
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
  readZone( (66C), (517) );
  l2v14z := gl21z@[6];
  l2v7z :=   getTime;
  unpck(l2v8z[1], l2v7z);
  l2v2z := (ord(l2v8z[2])*10+ord(l2v8z[3]))*2 + (ord(l2v8z[5])*10+ord(l2v8z[6])) _div 30;
  _if _not (l2v2z _IN l2v14z) _then _(
    writeln('ИГРА СЕЙЧАС ЗАКРЫТА');
    _repeat
      l2v2z := (l2v2z + (1C));
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
       gl15z := (0C);
       _GOTO 11227;
     _);
   _until (l2v2z >= (57C));
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
 _while (l2a1z > (0C)) _do _(
   _if (l2a1z > (2044)) _then _(
     l2v1z := (2044);
     l2a1z := (l2a1z - l2v1z);
   _) _else _(
     l2v1z := l2a1z;
     l2a1z := (0C);
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

_procedure P3442(l2a1z, l2a2z, l2a3z: integer);
_var l2v1z, l2v2z: integer;
_(
 l2v1z := trunc(l2a2z / 10);
  l2a2z := l2a2z - l2v1z*2; (q) _exit q; (q) _exit q;
 l2v1z := l2a1z;
  code(7пагг1=сд/-14/,7лс=17зч,);
 l2a2z := l2a2z;
  code(сд/-53/=7рб2,17лс=7зч1,);
 l2v2z := l2a3z;
  code(уи7=иагг1,э0711=,иагг1=пб3,с;гг1:3420000035000323,0,217000000000000,к;);
_);

_procedure landing(eng: boolean);
_label 4354, 4410, 4514, 4636, 4720;
_type arr = _record
f0, f1, f2, f3, f4, f5, f6, f7, f8, f9, f10,
f11, f12, f13, f14, f15, f16, f17, f18, f19, f20: real
_end;
_var l2v1z: @arr; saved: arr; l2v23z, Vfps, temp, altitude, Vmps, mass: real;
drymass, epsilon, l2v31z, l2v32z, usage, newalt, l2v35z, l2v36z, l2v37z, l2v38z, l2v39z, l2v40z, deltaT: real;
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
 mass := mass - deltaT * usage;
 altitude := newalt;
 Vmps := l2v35z;
_);
_procedure P4250;
_(
 l2v36z := deltaT * usage / mass;
 l2v35z := (((epsilon * deltaT) + Vmps) - (LN(1.0 + l2v36z) * l2v31z));
 l2v37z := (l2v36z * l2v36z);
 l2v38z := (l2v37z * l2v36z);
 l2v39z := (l2v38z * l2v36z);
 l2v40z := (l2v39z * l2v36z);
  newalt := (((altitude - (((epsilon * deltaT) * deltaT) / (2.0))) - (Vmps * deltaT)) + ((l2v31z * deltaT) * (((((l2v36z / (2.0)) + (l2v37z / (6.0))) + (l2v38z / (12.0))) + (l2v39z / (20.0))) + (l2v40z / (30.0)))));
  _);

_procedure dead;
_(
 _if (ruined = 1) _then
  landMsg(7) (* splat *)
 _else _if (ruined < 6) _then
  landMsg( ruined ) (* oops again *)
 _else _( landMsg(6); (* enough already *)
   ending;
  _)
_);

_( (* landing *)
  checkPerm;
  l2v1z := ref(l2v23z);
  verbose := false;
  landMsg(8);
  _if eng _then BIND('WНАТ IS YOURS ? {172') _else BIND('ЧТО У ВАС ? {172');
  getval(usage);
  _if _not (trunc(usage) _IN [0..9]) _then usage := 9.0;
  landMsg(9);
  fuel := round(15000 + usage * 500);
  msgarg := ;
  landMsg(10);
  l2v45z := 0;
  ruined := 0;
  4354:
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
  epsilon := 1.000000000001e-3;
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
 _if eng _then BIND('{146{146{146{146{146{146{146{146{146{146{146{146{146{146{146{146{146{146{146FUEL RATE={172')
 _else BIND('{146{146{146{146{146{146{146{146{146{146{146{146{146{146{146{146{146РАСХОД={172');
 getval(usage);
  _if ((usage < 8.0) _or (usage > 200)) _and (usage <> 0.0) _then _(
     landMsg(12);
     _goto rate;
  _)
  _);
 (* 4466 *)
 _for cursec := 1 _to interval _do _(
  l2v32z := 1.0;
 (* L4472:,BSS,; *)
 (L4472) _if mass - drymass < 1.000000000001e-3 _then _( (* else 4617 *)
   msgarg := round(temp);
   landMsg(12);
  deltaT := ((-(Vmps) + SQRT(((Vmps * Vmps) + ((2 * altitude) * epsilon)))) / epsilon);
  Vmps := ((epsilon * deltaT) + Vmps);
  temp := (temp + deltaT);
  4514: msgarg := round(temp);
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

  _if (input@ <> '0') _then _goto 4354;
  _if (ruined = 0) _then landMsg(22)
  _else _(
    l2v23z := (ruined * 34.23);
    msgarg := round( l2v23z );
    landMsg(23);
    msgarg := ruined;
    _if (ruined = 1) _then landMsg(24) _else landMsg(25);
  _);
 ending;
  _) _else _( (* 4617 *)
   _if (l2v32z < (1.000000000001e-3)) _then _( (q) _goto 4720 _);
   deltaT := l2v32z;
   _if ((((deltaT) * usage) + drymass) > mass) _then
     deltaT := (((mass) - drymass) / usage);
   (* 4632 *)
   P4250;
  _if (newalt <= 0.0) _then 4636: _(
  _if (deltaT < 5.0e-3) _then
   _goto 4514;
   deltaT := ((2.0 * altitude) / (SQRT(((Vmps * Vmps) + ((2.0 * altitude) * (epsilon - (((l2v31z) * usage) / mass))))) + Vmps));
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
  Vfps := ((1.0 - ((mass * epsilon) / (l2v31z * usage))) / 2.0);
  deltaT := (((mass * Vmps) / ((l2v31z * usage) * (SQRT(((Vfps * Vfps) + (Vmps / l2v31z))) + Vfps))) + 0.04999999999995);
 P4250;  
  _if (newalt <= 0.0) _then _goto 4636;
 update;
  _if (-l2v35z > 0.0) _and (Vmps > 0.0) _then _( _) _else _goto L4472;
  _goto L4664; 
  _) _else _(
   update;
  _goto L4472;
  _);
  _); (* 4472 if *)
  4720:;
  _); (* for *)
  _goto 4410;
_);
_procedure tictactoe;
_(
write('{175           =---> ПЕРЕД НАЧАЛОМ ИГРЫ СДЕЛАЙТЕ "ОFF LINЕ" <---={175');
write(' .  . ');
write(' .  .');
write('ПРАВИЛА ИГРЫ:{175{175 ПОЛЕ ДЛЯ ИГРЫ СОСТОИТ ИЗ 11 КЛЕТОК.{175 КЛЕТКИ ПОЛЯ ИМЕЮТ НОМЕРА ОТ 0 ДО 10.{175 В ИГРЕ ПРИНИМАЮТ УЧАСТИЕ ТРИ БЕЛЫЕ И ОДНА ЧЕРНАЯ ФИШКИ.{175 НАЧАЛЬНОЕ ПОЛОЖЕНИЕ ИЗОБРАЖЕНО НА РИСУНКЕ:{175');
write('{175 БЕЛЫЕ НА КЛЕТКАХ 0,1,3, ЧЕРНАЯ НА КЛЕТКЕ 5. ВОЗМОЖНЫЕ НАПРАВЛЕНИЯ{175ДВИЖЕНИЯ ПОКАЗАНЫ ЧЕРТОЧКАМИ. БЕЛЫЕ ФИШКИ МОГУТ ХОДИТЬ ТОЛЬКО{175ВПЕРЕД И ВБОК. НАПРИМЕР, ЕСЛИ БЕЛАЯ ФИШКА СТОИТ НА ПОЛЕ 5, ОНА{175МОЖЕТ ХОДИТЬ НА КЛЕТКИ 4,6,7,8,9. ЧЕРНАЯ ФИШКА МОЖЕТ ХОДИТЬ В{175ЛЮБОМ НАПРАВЛЕНИИ.{175  ЦЕЛЬ БЕЛЫХ - ЛИШИТЬ ЧЕРНУЮ ФИШКУ ВОЗМОЖНОСТИ ХОДИТЬ, ЗАГНАВ{175ЕЕ НА КЛЕТКИ 4,6 ИЛИ 10 И ОКРУЖИВ.{175  ЦЕЛЬ ЧЕРНЫХ - ЗАНЯТЬ КЛЕТКУ 0. ПОВТОРЕНИЕ ПОЗИЦИИ СЧИТАЕТСЯ{175     ');
write('           ВЫИГРЫШЕМ ЧЕРНЫХ.{175{175  ПРИКАЗЫ ИГРЫ:{175N1-N2  - ВВОД ХОДА. ФИШКА ХОДИТ С КЛЕТКИ N1 НА КЛЕТКУ N2.{175СДАЮСЬ - ПОДАЕТСЯ ЕСЛИ ВИДНО, ЧТО ДАЛЬНЕЙШЕЕ СОПРОТИВЛЕНИЕ БЕСПОЛЕЗНО.{175КОНЕЦ  - ВЫХОД ИЗ ИГРЫ. ЭТОТ ПРИКАЗ МОЖНО ПОДАТЬ В ЛЮБОЙ МОМЕНТ.{175ПОЛЕ   - ЕСЛИ ИЗ-ЗА КАКИХ-ЛИБО НЕДОРАЗУМЕНИЙ ПОЛЕ НА ЭКРАНЕ ОКАЖЕТСЯ{175         ИСПОРЧЕННЫМ, ЭТИМ ПРИКАЗОМ ЕГО МОЖНО ВОССТАНОВИТЬ.{175ДА,НЕТ - ТАК СЛЕДУЕТ ОТВЕЧАТЬ НА ВОПРОСЫ.{175    ВСЕ ПРИКАЗЫ МОЖНО СОКРАЩАТЬ ДО ОДНОЙ БУКВЫ.{175');
_);

_procedure checkers;
_procedure myMove(l3a1z, l3a2z: integer);
_(
 write('МОЙ ХОД ':10);
 write(l3a1z);
 write(' - ');
 writeln(l3a2z);
_);
_( (* checkers *)
mymove(0, 0);
_);
_FUNСТI RАNDОМ:RЕАL;(* СЛУЧАЙНОЕ ЧИСЛО В (0,1) *)
_(
  СОDЕ(К;ВР77=17ЗЧ1,РА3=СЧХRАND,АУАRАND=МР,
ЦССRАND=ЛУЕВПИЛ,ЛСЕСОРВ=ЗЧХRАND,РА=АС,17РК1=ПБЮЮR,
С;ХRАND:0,АRАND:4004142135623735,
СRАND:0003303130564677,ЕВПИЛ:0017777777777777,Л;ЕСОРВ:В1/57,
К;ЮЮR:ЗЧ=,);RАNDОМ:=;_);(*ЕND RАNDОМ*)

_РRОСЕD RАND0;(* НАЧАЛЬНАЯ УСТАНОВКА RАNDОМ *)
_(СОDЕ(К;Э05310=,СД/-31/=ЗЧХRАND,Э050114=,
СД/-5/=ЦСХRАND,ЛУЕВПИЛ=ЛСЕСОРВ,ЗЧХRАND=,)_);(*ЕND RАND0*)


_procedure inform;
_var l2v1z:alfa;
_procedure load(_var l3a1z: alfa); 
_(
 rewrite(tempfile);
 write(tempfile,'ШКО   ':6);
 (* readln( l3a1z:6 ); *)
_);
_( (* inform *)
 _if getCmd(l2v1z, 3) _then _(
 _if (l2v1z = 'ИНФ   ') _then
 writeln('  П Р И К А З   И Н Ф О Р М А Ц И Я{175{175   НЕКОТОРЫЕ ОБЩИЕ СВЕДЕНИЯ О БЛОКЕ ИГР{175  В РАБОЧЕЕ ВРЕМЯ ВХОДИТЬ В ИГРОВОЙ БЛОК НЕ РЕКОМЕНДУЕТСЯ. ИГРА{175НА ДЕНЬГИ В ЛЮБОЕ ВРЕМЯ ЗАПРЕЩЕНА.')
 _else _if (l2v1z = 'ШКО   ') _then
 writeln('  П Р И К А З   Ш К О Л А{175{175  ПРИКАЗ ШКО-ЛА ДАЕТ ПОДРОБНОЕ ОПИСАНИЕ ПРИКАЗОВ БЛОКА "ИГРА".{175    ФОРМА ОБРАЩЕНИЯ:{175    ШКО-ЛА  <ПРИКАЗ>')
 _else _if (l2v1z = 'LAN   ') _or (l2v1z = 'ПОС   ') _then
write('  П Р И К А З   П О С А Д К А  (LАNDING){175{175  ИГРА В ПОСАДКУ НА ЛУНУ (LАNDING) ВЗЯТА В ВИДЕ ПАСКАЛЬ-ПРОГРАММЫ{175НА ОДНОЙ ИЗ ЗАРУБЕЖНЫХ ВЫСТАВОК ПО ВЫЧИСЛИТЕЛЬНОЙ ТЕХНИКЕ. АДАПТАЦИЯ{175ДЛЯ БЭСМ-6 С.И.ПИРИНА И А.Н.БИРЮКОВА.{175  ЦЕЛЬ ИГРЫ: ДОСТИЧЬ ПОВЕРХНОСТИ ЛУНЫ (ВЫСОТА 0) С НУЛЕВОЙ СКОРОСТЬЮ.{175  ЛИЦА, ДОСТАТОЧНО ЗНАКОМЫЕ С АНЛИЙСКИМ ЯЗЫКОМ - ЯЗЫКОМ ОРИГИНАЛА,{175МОГУТ ВЫЗЫВАТЬ ИГРУ ПРИКАЗОМ "LАNDING".{175   Р Е К О М Е Н Д А Ц И И{1751) ПЕРЕД САМОЙ ПОСАДКОЙ МОЖНО ПЕРЕЙТИ НА МЕНЬШИЙ ИНТЕРВАЛ ВРЕМЕНИ.{175ДЛЯ ЭТОГО ПЕРЕД УКАЗАНИЕМ СКОРОСТИ РАСХОДА ТОПЛИВА СЛЕДУЕТ НАБРАТЬ{175 Т<N> , ГДЕ N - ИНТЕРВАЛ (ОДНА ЛИТЕРА) В СЕКУНДАХ. НАПРИМЕР: Т170{175ОЗНАЧАЕТ - УСТАНОВИТЬ ИНТЕРВАЛ В ОДНУ СЕКУНДУ И РАСХОД ТОПЛИВА 70{175ФУН/СЕК. ВОЗВРАТ К 10-С',
'ЕКУНДНОМУ ИНТЕРВАЛУ ПУТЕМ НАБОРА Т+ .{1752) ДЛЯ ОКОНЧАНИЯ ИГРЫ В ПРОИЗВОЛЬНЫЙ МОМЕНТ НАБЕРИТЕ ВМЕСТО СКОРОСТИ{175РАСХОДА ТОПЛИВА ЛИТЕРУ "К".')
 _else _if (l2v1z = 'ШАШ   ') _then _(
 write('  П Р И К А З   Ш А Ш К И');
 (* L2775; *)
 (* L5516; *)
 write('  ИГРУ ВО ФРАНЦУЗСКИЕ ШАШКИ ЗАПРОГРАММИРОВАЛ Ю.В.КАШАЕВ.');
 (* L2775; *)
 _) 
 _else _if (l2v1z = 'КРЕ   ') _then
 writeln('  П Р И К А З   К Р Е С Т И К И{175{175  ПО ПРИКАЗУ "КРЕ" ПРОИЗВОДИТСЯ РАЗМЕТКА ЭКРАНА ТЕРМИНАЛА ДЛЯ ИГРЫ{175В КРЕСТИКИ-НОЛИКИ. ПО ОКОНЧАНИИ РАЗМЕТКИ ДЖИН ОСВОБОЖДАЕТ ТЕРМИНАЛ{175И ОКАНЧИВАЕТ ЗАДАЧУ.')
 _else _if (l2v1z = 'УЗО   ') _then
 writeln('  П Р И К А З   У З О Р{175{175ПРИКАЗ НЕ РЕАЛИЗОВАН')
 _else _if (l2v1z = 'БЕГ   ') _then
 writeln('  П Р И К А З   Б Е Г А{175{175  ИГРА "ИППОДРОМ" ИМИТИРУЕТ РЫСИСТЫЕ ИСПЫТАНИЯ ЛОШАДЕЙ. ПОСЛЕ НАЧАЛА{175ИГРЫ ФОРМИРУЕТСЯ БЕГОВОЕ ПОЛЕ, НА КОТОРОМ ОТМЕЧАЮТСЯ МЕСТА СТАРТА,{175БАРЬЕРА, ФИНИША. ПО БЕГОВОМУ ПОЛЮ ПЕРЕДВИГАЮТСЯ ЦИФРЫ, ОБОЗНАЧАЮЩИЕ{175ЛОШАДЕЙ. ОКОЛО СТАРТОВОГО СТОЛБА ПРОСТАВЛЯЮТСЯ БУКВЫ, ОБОЗНАЧАЮЩИЕ{175КЛАССНОСТЬ ЛОШАДЕЙ. СООТНОШЕНИЕ СРЕДНИХ СКОРОСТЕЙ БЕГА ДЛЯ РАЗЛИЧНЫХ{175КЛАССОВ:{175              А : В : С   КАК   1.5 : 1.25 : 1.0{175  ПОСЛЕ ОКОНЧАНИЯ ЗАБЕГА ОКОЛО ФИНИШНОГО СТОЛБА ВЫСТАВЛЯЮТСЯ НОМЕРА{175ЗАНЯТЫХ МЕСТ.{175  АВТОР ИГРЫ "БЕГА" (ИППОДРОМ) - В.Н.ПИЛЬЩИКОВ. АДАПТИРОВАЛ ИГРУ{175ДЛЯ ДЖИНА В.В.ДОЛМАТОВ.');

_)
_);
(* main program *)

_(      
TTIN(0);
checkTime;
checkPerm;
inform;
P2775;
write(getDate, getTime, zeller(0,0,0)); printTenths(0); readZone(0,0);
  sleep(0);write(extra71(0));
  P3432(0); P3442(0,0,0); landing(true);
11132:; 11136:; 11176:; 11204:; 11210:; 11214:; 11220:; 11227:; 11230:; 11244: ;
writeln('НЕ ПОНИМАЮ');
_).     
