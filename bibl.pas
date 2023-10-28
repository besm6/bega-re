(*=p-,t-,д+*)_program БИБЛ; _label 12450, 12453, 12465, 13074;
_const НУ41=41В; plus='+';
ну1=5420001в; ну2=3420213в; ну3=5420111в; librID=7005; с384=384; с7=7;
пароль='софия '; влэвм1='0итм и'; влэвм2=' вт ан'; signal=5420147В;
ban=5420273В; ну6=6420075в; reader=4661111В; с248=370в; с113=161в; с6=6;
с158=236в; с400=400; area=76В; c1023=1023; c4=4; eol='{175';etx='{377';
eot='{172'; semi=';     '; sp=' ';dot='.';comma=',';opar='(';cpar=')';
minus='-'; п='п'; д='д'; ромб='$'; sp6='      '; ornam='-=#=- ';
руб='РУБ   ';rub='RUB   ';rub2='RUB2  '; rub3='RUB3  ';rub4='RUB4  ';
rub5='RUB5  ';rub6='RUB6  ';jur='JUR   '; жур='ЖУР   ';
_type 
letter ='a'..'z';
digit=0..9;
bitset=_set _of 0..47;
page=_array [0..1023] _of alfa;
ipage=_array [0..1023] _of integer;
unp16=_array [1..16] _of char;
longset=_array[0..5] _of bitset;
unp6=_array [1..6] _of char;
t2=0..2;
t3=0..3;
_var cmd:alfa; g11z:alfa; g12z:boolean;
g13z, g14z, admin: boolean;
g16z:boolean;
g17z:@page;
g18z:@ipage;
g19z, g20z:integer;
g21z, nSect, curSec, g24z, g25z, g26z, g27z: integer;
g28z:_record r:_array[1..7] _of alfa _end;
g35z:_array [1..7] _of alfa;
g42z, g49z:_array[1..7] _of integer;
catal:_array [1..7] _of alfa;
g63z:_array[1..7] _of boolean;
g70z:integer;
g71z:bitset;
g72z, g73z, g74z, g75z, g76z, g77z, reqTime, g79z, g80z:integer;
userID:alfa;
g82z:integer;
g83z, g84z, g85z:bitset;
g86z, g87z, prn:boolean;
g89z, screen:boolean;
g91z:integer;
statAr:_array[0..39] _of integer;
INP:text;
_proced L3576;
 _(
   code(=14ПВ76255,)
 _);
_proced putInp(l2a1z:alfa);
 _(
  rewrite(INP);
  write(INP, l2a1z); 
_);

_proced TTIN(level:boolean);
_var i:integer;
_(
 _if level _then  BIND(' ==# {172') _else  BIND(' =-# {172');
  code(СЧ77062=); i := ;
 _if i = 1 _then _(
 putInp( 'SLЕ   ' );
 g85z := g85z + [47];
  _) _else _(
 _if prn  _then _(
  code(СЧ76013=УИ7,);
  i := 2;
 code(ЗЧ76013=);
 _if level _then  write(' ==# ') _else  write(' =-# ');
  _);
 rewrite(INP);
 _while (input@ <> etx) _do _(
   _if prn  _then _(  write(input@) _);
   INP@ := input@; put(INP); get(input);
 _);
 _);
 INP@ := etx;
 put(INP);
 reset(INP);
 _if prn _then _( writeLN;  code(ви7=зч76013,) _);
 _);

_proced limit; _label 3671;
_var t:integer; l2v2z, l2v3z:bitset;
_(
 code(=Э0634,);
 t := ;
 _if reqTime - t < 50 _then _(
 write('ВАШЕ ВРЕМЯ ИСТЕКЛО');
3671:
 writeLN;
 rewrite(INP);
 g12z := false;
 write(INP,'КОН  {377');
 _GOTO 12465;
  _);
 code(Э0650=,УИ7=7Э06540,);
 l2v2z := ;
  l2v3z := l2v2z _mod [0..47];
 _if sel(l2v3z, 0, 16) < 22 _then _(
  write('БУМАГА КОНЧИЛАСЬ');
 _goto 3671;
  _);
 _);

_proced MORE;
_var a:alfa;
_(
 writeLN;
 limit;
  code(СЧ77015=); a := ;
 _if a = 'Н{3770000' _then  _GOTO 12450;
_);
_proced L3726;
 _(
   _if prn _then _( MORE; EXIT _);
   write('{172     ');
   code(СЧ75205=УИ7,СЧ76401=ЛСвал,);
   code(17ЗЧ1=17Э0711,Э07176402=,);
   code(СД/30/=ЛУ77422,ЗЧ77424=);
   rewrite(output);
   code(СЧ77424=СР77423,У0мет1=СЧ77424,СР77422=У1мет2,Э0620=,);
   code(вал:6зч=5зч321,мет1:сч76422=уи7,7са-1=ви7,зч76422=у1е,сч76421=зч76422,);
   code(15па76516=12пвф,); (* BIND('ИДТИ? ') *)
   code(сч70000=ср76517,у0мет2=сч70000,ср76520=у1е,э0620=,мет2:);
   _GOTO 12450;
 _);

_function getNum(base:integer):integer;
 _(
   code(=14пв77463,);
   writeln('ОШИБКА В ЧИСЛЕ');
   _GOTO 12450;
 _);
(*=m-*)
_proced prDec2(i:integer);
_var c:char;
_(
 c := chr(i _div 10);
 write(c, chr(i - ord(c)*10));
 _);

_proced expect(c:char);
 _(
 L3576;
   _if INP@ = c _then get(INP);
 L3576;
 _);

_proced getPat(_var pat:_array [1..16] _of char; _var len: integer);
_var i, l:integer;  c:char;
_(
 l := 0;
 _for i := 1 _to 16 _do _(
   c := INP@;
   _if (c = etx) _or  (c = opar) _or  (c = cpar) _or
     (c = sp)  _or  (c = plus) _or  (c = comma) _then
     pat[i] := sp
    _else _( pat[i] := c; l := l + 1;  get(INP) _);
  _); 
  len := l;
_);

_proced stats(l2a1z:integer);
_var l2v1z, l2v2z, l2v3z:integer;
_(
 l2v1z := statArr[l2a1z];
 l2v3z := ;
 l2v1z := (sel( l2v3z, 30, 6) + g21z);
  code(СД/6/=); l2v2z := ;
  code(МР=СД/-6/,МР=);  l2v1z := ;
  ins( l2v3z, l2v1z, 30, 6 );
  statArr[l2a1z] := ;
    _if l2v2z > 0 _then _(
    g21z := l2v2z;
    stats(l2a1z - 1);
    g21z := 1;
  _);
 _if (l2a1z <= 22) & (l2a1z > (0)) _then  stats( (0) );
_);

_proced GOSTEP;
_var l2v1z:integer;
_(
 stats( 21 );
 _if (INP@ = etx) _then  l2v1z := 14
  _else l2v1z := getNum( 10 );
 _if l2v1z < 14 _then  l2v1z := 14;
 _if l2v1z > 999 _then  l2v1z := 999;
 l2v1z := l2v1z;
  code(зч76421=зч76422,);
  writeln('УСТАНОВЛЕНО - ИДТИ С ШАГОМ', l2v1z:4, ' СТРОК');
 _);

_proced noCmd;
_(
 write('ПРИКАЗА '); ГГ(cmd, 'В ', влэвм1, влэвм2, ' НЕТ' ); writeLN;
   g85z := g85z - [2];
_);

_proced L4152(l2a1z:integer);
_var l2v1z, l2v2z:integer;
_(
 l2v2z := (l2a1z _DIV 10000);
 l2a1z := (l2a1z - (l2v2z * 10000));
 l2v1z := (l2a1z _DIV 100);
  l2a1z := (l2a1z - (l2v1z * 100));
 write(sp);
 prDec2( l2a1z );
 write(dot);
 prDec2( l2v1z );
 write(dot);
 prDec2( l2v2z );
_);
_proced rdpg32(l2a1z, l2a2z:integer);
_( code(=14пв77451,) _);

_proced wrpg32(l2a1z, l2a2z:integer);
 _(code(=14пв77457,) _);

_proced enq41; _var l2v1z: integer;
_(
 l2v1z := 41B;
 code(СД/-14/=Э050105,Э050115=,)
 _);

_proced deq41; _var l2v1z: integer;
_(
  l2v1z := 41B;
 code(СД/-14/=Э050105,Э050116=,)
 _);

_function toHex(l2a1z:integer):alfa;
_var a:_array[1..9] _of integer;
_(
  code(=ПБ76324,);
  _);

_function F4232(l2a1z, l2a2z:integer):boolean;
_var l2v1z:integer; l2v2z:alfa; l2v3z:integer; l2v4z: alfa;
_(
 F4232 := true;
  _if l2a1z <= 0 _then exit;
 l2v4z :=   toHex( l2a1z );
 l2v1z := l2a2z * 64 + 63;
  code(СД/-44/=);
 l2v1z := ;
 l2v2z := '00    ';
 l2v3z := 177777В;
  code(2СЧ11=2СБ7,2РБ10=2ЗЧ11,2ЛС6=Э050131,);
 l2v1z := ;
  l2v3z := 0+40000B;
  code(УИ15=2СЧ11,Э050121=,);
  _if l2v1z = 0 _then exit;
 F4232 := false;  
_);

_function volNum(l2a1z, l2a2z:integer):integer;
_var l2v1z, l2v2z, l2v3z:integer;
_(
  code(2СЧ4=СД/-3/,2ЛС5=СД/-14/,Э050105=,);
 l2a1z := ;
 l2a2z := 0;
 l2v2z := 4096;
 _for l2v1z := 1 _to 4 _do _(
 l2v3z := trunc(l2a1z / l2v2z);
 l2a1z := l2a1z - l2v3z * l2v2z;
 l2v2z := shift(l2v2z, 4);
 l2a2z := l2a2z * 10 + l2v3z;
  _);
 volNum := l2a2z;
_);

_proced freeNU(l2a1z:integer);
_var l2v1z:integer;
_(
  _if volNum( 0, l2a1z) = 0 _then exit;
  l2v1z := 200077T;
  code(2СЧ3=СД/-44/,2ЛС4=2ЗЧ4,2Э0724=,);
 _);

_proced P4337(l2a1z, l2a2z:integer);
_var l2v1z:integer;
_(
 l2v1z :=   volNum( 0, l2a2z );
  _if l2v1z = l2a1z _then exit;
 _if l2v1z <> 0 _then  freeNU( l2a2z );
 _if _not F4232( l2a1z, l2a2z) _then _(
  writeln('НЕТ БОБИНЫ ', l2a1z:4 );
 rewrite(INP);
 write(INP,'ВЫХ  {377');
 g12z := false;
  _if (g27z = 2) _or (g27z = 3) _then _(  g27z := 0; _GOTO 12450 _);
 _GOTO 12465;
  _);
 _);

_proced errmsg(l2a1z:integer);
_var l2v1z, l2v2z, l2v3z:alfa; l2v4z:integer;
_(
  code(=2ИА4,15ПА=ВИ15,2ЗЧ7=УИ15,);
 l2v4z := (4000000000000000C);
  code(2ЛС3=Э050202,);
 writeln(l2v1z,  l2v2z, l2v3z);
 _GOTO 12450;
_);

_proced arfa(l2a1z:integer);
_var l2v1z:bitset; l2v2z:alfa; l2v3z:integer;
_(
  freeNU( l2a1z );
  code(ИК75205=7ПА-1,);
 _if admin _or g14z  _then l2v3z := 1200000000000010C
 _else l2v3z := 1200000000004010C;
  code(7ЗЧ=);
 l2v1z := [l2a1z - 24];
  code(=СД/60/,);
 l2v2z := 'КЛЮЧАР';
 code(=7Э063,ВИ16=);  l2v3z := ;
 rewrite(output);
 _if (l2v3z <> 0) _then _(
  writeln('СООБЩЕНИЕ АРФЫ: ');
 g27z := 0;
 errmsg( l2v3z );
  _);
 _);

_proced getVol(l2a1z, l2a2z:integer);
_var l2v1z:integer; l2v2z:alfa; l2v3z:integer;
(* Level 3 *) _proced L4465(_var l3a1z:integer);
_var l3v1z:unp6; l3v7z, l3v8z:integer;
 _(
 unpck( l3v1z[1], l2v2z );
 l3v8z := 0;
 (loop) _for l3v7z := 1 _to 4 _do _(
 _if (l3v1z[l3v7z] = ';') _then _exit loop _else
  l3v8z := l3v8z * 10 + ord(l3v1z[l3v7z]);
  _);
 l3a1z := l3v8z;
 rewrite(output);
 _);

_( (* 4511 *)
  rewrite(output);
  _select
  (l2a1z = 1): _( _if g27z = 1 _then EXIT; g27z := 1; write('2048', semi) _);
  (l2a1z = 2): _( _if g27z = 2 _then EXIT; g27z := 2; write('ДЖИН.СИГНАЛ/4177..', semi) _);
  (l2a1z = 3): _( _if g27z = 3 _then EXIT; g27z := 3; write('2048', semi) _);
  (l2a1z = 4): write('ДЖИН.БАНК/4177..', semi)
  _end;
  code(ИК75205=СЧ,);   l2v2z := ;
  code(СД/-10/=МР,);   l2v1z := ;
  _if l2v1z _in letter _then arfa(l2a2z) _else
  _(
  L4465(l2v3z);
  P4337(l2v3z, l2a2z);
  _);
_);

_function F4610(_var l2a1z: integer; _var l2a2z:longset):boolean;
_var l2v1z, l2v2z:integer;
_(
 _for l2v1z := 0 _to 5 _do _(
 _if l2a2z[l2v1z] <> [] _then _(
  l2v2z := minel(l2a2z[l2v1z]);
  l2a2z[l2v1z] := l2a2z[l2v1z] - [l2v2z];
  l2a1z := l2v1z * 48 + l2v2z;
  F4610 := true;
  EXIT;
  _);
  _);  
 F4610 := false;
 _);
_function F4712(_var s:longset; i:integer):boolean; _label 4752;
_var l2v1z, l2v2z, l2v3z, l2v4z:integer; l2v5z: longset;

(* Level 3 *) _proced P4650;
_var l3v1z:integer;
_(
 l2v1z :=   getNum( i );
 _if (INP@ = '-') _then _(
  get(INP);
 l2v2z :=   getNum( i );
  _) _else  l2v2z := l2v1z;
 _for l3v1z := l2v1z _to l2v2z _do _(
  l2v4z := trunc(l3v1z / 48);
 _if (l2v4z > 5) _then _(  F4712 := true; _GOTO 4752 _);
 l2v5z[l2v4z] := l2v5z[l2v4z] + [l3v1z - l2v4z*48];
  _);
 _);

_( (* 4712 *)
 _for l2v3z := 0 _to 5 _do  l2v5z[l2v3z] := [];
 F4712 := false;
 _if INP@ _in digit _then P4650 _else _if INP@ = opar _then _(
  get(INP);
  (loop) _( P4650; _if INP@ = comma _then _( get(INP); _goto loop _) _);
  _if INP@ = ')' _then get(INP);
  _);
  4752:
  s := l2v5z;
_);

_function trim(l2a1z:alfa):alfa;
_var l2v1z:alfa;
_(
  code(2сч4=сд/30/,сд/-30/=);  l2a1z := ;
  l2v1z := '000   '; code(2лс4=);
 trim := ;
 _);

_proced find(name:alfa; disPrn:boolean); _label 5032;
_var i:integer; cur:alfa;
_(
 _for i := 1 _to nSect _do _(
   cur := catal[i];
   _if trim( name) <> RUВ _then  cur :=   trim( cur );
   _if name = cur _then _goto 5032;
 _);
 write('РАЗДЕЛА ', name, ' В ');
 ГГ( влэвм1 );
 writeln(влэвм2, ' НЕТ');
 _GOTO 12450;
5032:
 _if g63z[i]  _and   prn _and  _not (3 _IN g71z) _and   disPrn _then _(
 _if _not screen _then _(
  screen := true;
  code(лс76013=зч76013,);
 writeln('ВКЛЮЧЕНА ВЫДАЧА НА ЭКРАН');
  _);
 writeln('ПЕЧАТАТЬ РАЗДЕЛ НЕ РАЗРЕШЕНО');
 _GOTO 12450;
  _);
 _if g27z <> 1 _then  getVol( 1, 44В );
 rdpg32( 44В, g49z[i] );
 _);

_function inCatal(l2a1z:alfa):boolean;
_var l2v1z, i:integer; l2v3z: alfa;
_(
 inCatal := false;
 _for i := 1 _to nSect _do _(
   l2v3z :=   trim( catal[i] );
  _if (l2a1z = l2v3z) _then _(
    l2v1z := g42z[i];
    _if l2v1z > 0 _then _(
       _if l2v1z > 3 _then  l2v1z := 3;
       stats( l2v1z + 14 );
    _);
   inCatal := true;
   EXIT;
  _);
  _);
_);

_proced P5114(l2a1z:alfa; _var l2a2z:integer); _label 5132;
_var l2v1z:char; l2v2z, l2v3z, l2v4z, l2v5z, i, l2v7z, l2v8z, j, l2v10z, l2v11z:integer;
l2v12z:unp6; l2v18z:boolean;
_(
 find( l2a1z, false );
 l2v3z := 1;
 l2v2z := ;
 l2v10z := 0;
 l2a2z := ;
 l2v18z := false;
 l2v4z := -1;
  5132:
  l2v4z := l2v4z + 1;
  unpck( l2v12z[1], g17z@[l2v4z] );
  _for i := 1 _to 6 _do _(
   l2v1z := l2v12z[i];
  l2v8z := ;
  _if (l2v1z = eot) _or (l2v1z = '$') _then EXIT;
  _if l2v1z _in digit _then l2v18z := true;
  _if l2v18z _then _(
  _if l2v1z <= '9' _then  l2v10z := l2v10z * 10 + l2v8z
  _else _(
    _for j := 1 _to l2v3z-1 _do l2v10z := l2v10z * 100;
    l2a2z := l2a2z + l2v10z;
    _if  l2v3z = 3 _then  EXIT;
    l2v3z := l2v3z + 1;
    l2v10z := 0;
  _)
  _)
  _);
  _goto 5132
_);
  
 _proced NEWS;
_var l2v1z, i, l2v3z:integer;
l2v4z, l2v5z:alfa;
l2v6z:boolean;
_(
 stats( 12 );
 write('   ДАТЫ ПОСЛЕДНИХ ИЗМЕНЕНИЙ ФАЙЛОВ');
  L3726;
 l2v3z := 0;
 _for i := 1 _to nSect _do _(
   l2v4z := catal[i];
   l2v5z :=   trim( l2v4z );
 _if (l2v5z <> RUВ) _and (l2v5z <> 'DОL   ') _and (l2v5z <> JUR) _then _(
   l2v3z := l2v3z + 1;
   P5114( l2v5z, l2v1z );
   write( l2v4z:11, ' -' );
   L4152( l2v1z );
   l2v6z := (l2v3z _MOD 3) = 0;
   _if l2v6z _then  L3726;
  _);
  _);
 _if _not l2v6z _then  L3726;
_);

 _proced INF;
 _(
   stats( 1 );
 write('В БЛОКЕ БИБЛИОТЕКИ ИСПОЛНЯЮТСЯ -
 1. ИНФОРМАЦИЯ                  - ДАЕТ СПИСОК ПРИКАЗОВ
 2. ШКОЛА  <ИМЯ ПРИКАЗА>        - ДАЕТ ПОДРОБНОЕ ОПИСАНИЕ ПРИКАЗОВ
 3. ОБЗОР <ТЕМА> [ <ОБРАЗЦЫ> ]  - ПОКАЗ ОБЗОРОВ ПО ТЕМАМ
 4. ВЫСТАВКА     [ <ОБРАЗЦЫ> ]  - НОВЫЕ ПОСТУПЛЕНИЯ');
 write('
 5. ЖУРНАЛЫ      [ <ОБРАЗЦЫ> ]  - ПОСТУПЛЕНИЕ ЖУРНАЛОВ
 6. ПРЕПРИНТЫ    [ <ОБРАЗЦЫ> ]  - НОВЫЕ ПРЕПРИНТЫ
 7. АВТОРЕФЕРАТЫ [ <ОБРАЗЦЫ> ]  - НОВЫЕ АВТОРЕФЕРАТЫ
 8. БЕН                         - НОВЫЕ ПОСТУПЛЕНИЯ В БЕН
 9. ЮМОР                        - ОТДЕЛ ЮМОРА
10. ДОЛЖНИКИ                    - СПИСОК ДОЛЖНИКОВ');
 write('
11. НОВИЗНА                     - ДАЕТ ДАТЫ ПОСЛЕДНИХ ИЗМЕНЕНИЙ ФАЙЛОВ
12. ПОКАЖИ  [<РАЗДЕЛ> <ПУНКТЫ>] - ПОКАЗ ПУНКТОВ
13. РУБРИКАТОР   [ <ОБРАЗЦЫ> ]  - ПОКАЗ РУБРИКАТОРА
14. СИГНАЛ <СПИСОК ПАРАМЕТРОВ>  - ПОКАЗ СИГНАЛЬНОЙ ИНФОРМАЦИИ
15. ЗАКАЗ  [ <+/-> <РУБРИКА> ]  - ЗАКАЗ НА БИБ-ОБСЛУЖИВАНИЕ
16. РОМАН  [ <НОМЕР ВЫПУСКА> ]  - ПОКАЗ ТЕКСТОВ БОЛЬШОГО ОБЪЕМА
17. СПРАВКА                     - ПЕРЕХОД В СПРАВОЧНЫЙ БЛОК
  ТАКЖЕ ЗДЕСЬ ИСПОЛНЯЮТСЯ :ПЕЧ,ЭКР,ИДИ.
СОБСТВЕННЫЕ ФАЙЛЫ ВЫЗЫВАЮТСЯ ОДНОИМЕННЫМИ ПРИКАЗАМИ.
  ОБ ОБРАЗЦАХ СМ. "ШКО ИНФ".');
 MORE;
 _);
_function getCmd(_var l2a1z:alfa; l2a2z:integer):boolean;
_var a:_array[1..7]_of alfa;
_(
  code(=14пв77400,);
 _);

_proced SCHOOL; _label 5461;
 _(
   stats( 2 ); 
   _if getCmd( cmd, 3) _then 
   _select
   (cmd = 'ИНФ   '): _(
   write('  П Р И К А З   И Н Ф О Р М А Ц И Я

    НЕКОТОРЫЕ ОБЩИЕ СВЕДЕНИЯ О БИБЛИОТЕЧНОМ БЛОКЕ.
  БИБЛИОТЕЧНЫЙ БЛОК ДАЕТ ВОЗМОЖНОСТЬ СИСТЕМАТИЧЕСКИ ЗНАКОМИТЬСЯ
С НОВОЙ ЛИТЕРАТУРОЙ, ПОСТУПАЮЩЕЙ В НАУЧНУЮ БИБЛИОТЕКУ, ТЕМАТИЧЕСКИМИ
ПОДБОРКАМИ И ДРУГИМИ МАТЕРИАЛАМИ. НОВИЗНА МАТЕРИАЛОВ ОПРЕДЕЛЯЕТСЯ
ДАТОЙ ВВОДА.
  НЕОБЯЗАТЕЛНЫМ ОПЕРАНДОМ БОЛЬШИНСТВА ПРИКАЗОВ БЛОКА ЯВЛЯЮТСЯ <ОБРАЗЦЫ>.
ОТДЕЛЬНЫЙ ОБРАЗЕЦ ЕСТЬ ПОСЛЕДОВАТЕЛЬНОСТЬ СИМВОЛОВ, НЕ СОДЕРЖАЩАЯ
ПРОБЕЛОВ И ЗНАКОВ "+", ",", "(", ")". ОБРАЗЦЫ ЗАДАЮТСЯ В КРУГЛЫХ
СКОБКАХ И РАЗДЕЛЯЮТСЯ ПРОБЕЛОМ ИЛИ ЗНАКОМ ПЛЮС, ВЫПОЛНЯЮЩИМ РОЛЬ
ЛОГИЧЕСКОГО "И", ИЛИ ЗАПЯТОЙ, ВЫПОЛНЯЮЩЕЙ РОЛЬ ЛОГИЧЕСКОГО "ИЛИ".
  ЧИСЛО ОБРАЗЦОВ НЕ БОЛЕЕ 4-Х. ОБРАЗЕЦ НЕ ДОЛЖЕН СОДЕРЖАТЬ БОЛЕЕ
16-ТИ ЗНАКОВ.
  ЕСЛИ <ОБРАЗЦЫ> НЕ ЗАДАНЫ, ТО ВЫДАЕТСЯ ТЕКСТ ВСЕГО РАЗДЕЛА. ЕСЛИ
<ОБРАЗЦЫ> ЗАДАНЫ, ТО ВЫДАЮТСЯ ТОЛЬКО ПУНКТЫ, СОДЕРЖАЩИЕ ЗАКАЗАННУЮ
ЛОГИЧЕСКУЮ КОМБИНАЦИЮ ОБРАЗЦОВ.
   ПРИМЕР: ОБЗОР БЭСМ (ПЕРЧУК,ДИАЛОГ+УПРАВЛ)
  В РЕЗУЛЬТАТЕ БУДУТ ВЫДАНЫ РАБОТЫ ПЕРЧУКА, А ТАКЖЕ ПУНКТЫ, В КОТОРЫЕ
ОДНОВРЕМЕННО ВХОДЯТ СЛОВА, СОДЕРЖАЩИЕ В СЕБЕ "ДИАЛОГ" И "УПРАВЛ".');
 MORE
   _);
   (cmd = 'ШКО   '):
 writeln('  П Р И К А З   Ш К О Л А

  ПРИКАЗ "ШКОЛА" ДАЕТ ПОДРОБНОЕ ОПИСАНИЕ ПРИКАЗОВ БЛОКА БИБЛИОТЕКИ.
   ФОРМА ОБРАЩЕНИЯ:
   ШКО  <ИМЯ ПРИКАЗА>');
   (cmd = 'ОБЗ   '):
 writeln('  П Р И К А З   О Б З О Р

  ПО ПРИКАЗУ "ОБЗОР" ДАЕТСЯ ПОДБОРКА ЛИТЕРАТУРЫ ПО ОПРЕДЕЛЕННОЙ
ТЕМАТИКЕ.');
   (cmd = 'ВЫС   '):
 writeln('  П Р И К А З   В Ы С Т А В К А

  ПО ПРИКАЗУ "ВЫСТАВКА" ВЫДАЕТСЯ ИНФОРМАЦИЯ О НОВЫХ КНИГАХ, ПОСТУПИВШИХ
В НАУЧНУЮ БИБЛИОТЕКУ. ЕСЛИ ЗАГЛАВИЕ НЕ ДАЕТ ПОЛНОГО ПРЕДСТАВЛЕНИЯ
О СОДЕРЖАНИИ, КНИГА СОПРОВОЖДАЕТСЯ КРАТКОЙ АННОТАЦИЕЙ.');
   (cmd = 'ЖУР   '):
 writeln('  П Р И К А З   Ж У Р Н А Л Ы 

  ПО ПРИКАЗУ "ЖУРНАЛЫ" ВЫДАЕТСЯ ИНФОРМАЦИЯ О ПОСТУПЛЕНИИ В БИБЛИОТЕКУ
ОСНОВНЫХ НАЗВАНИЙ ОТЕЧЕСТВЕННЫХ И ЗАРУБЕЖНЫХ ЖУРНАЛОВ.');
   (cmd = 'ПРЕ   '):
 writeln('  П Р И К А З   П Р Е П Р И Н Т Ы

   ПО ПРИКАЗУ "ПРЕПРИНТЫ" ВЫДАЕТСЯ ИНФОРМАЦИЯ О ВСЕХ ПОСТУПАЮЩИХ
В БИБЛИОТЕКУ ПРЕПРИНТАХ.');
   (cmd = 'АВТ   '):
 writeln('  П Р И К А З  А В Т О Р Е Ф Е Р А Т Ы

  ПО ПРИКАЗУ "АВТОРЕФЕРАТЫ" ВЫДАЕТСЯ ИНФОРМАЦИЯ О ВСЕХ ПОСТУПАЮЩИХ
В БИБЛИОТЕКУ АВТОРЕФЕРАТАХ.');
   (cmd = 'БЕН   '):
 writeln('  П Р И К А З  Б Е Н

  ПО ПРИКАЗУ "БЕН" ВЫДАЕТСЯ ИНФОРМАЦИЯ О НОВЫХ ПОСТУПЛЕНИЯХ В БИБЛИОТЕКУ
ЕСТЕСТВЕННЫХ НАУК АН СССР (БЕН) ЗАРУБЕЖНОЙ ЛИТЕРАТУРЫ, А ТАКЖЕ О
ПРОВОДИМЫХ БЕН МЕРОПРИЯТИЯХ.');
   (cmd = 'ЮМО   '):
 writeln('  П Р И К А З  Ю М О Р

  ПО ПРИКАЗУ "ЮМОР" НА ЭКРАН ВЫДАЕТСЯ ИНФОРМАЦИЯ, ИМЕЮЩАЯ ЦЕЛЬЮ
ПОДНЯТИЕ РАБОТОСПОСОБНОСТИ ПОЛЬЗОВАТЕЛЯ.');
   (cmd = 'ДОЛ   '):
 writeln('  П Р И К А З  Д О Л Ж Н И К И

  ПО ПРИКАЗУ "ДОЛЖНИКИ" ДАЕТСЯ ИНФОРМАЦИЯ О ЧИТАТЕЛЯХ, КОТОРЫЕ В
ТЕЧЕНИЕ НЕСКОЛЬКИХ ЛЕТ НЕ ВОЗВРАЩАЮТ ВЗЯТУЮ В БИБЛИОТЕКЕ ЛИТЕРАТУРУ,
НЕСМОТРЯ НА НЕОДНОКРАТНОЕ НАПОМИНАНИЕ СОТРУДНИКОВ БИБЛИОТЕКИ.');
   (cmd = 'НОВ   '):
 writeln('  П Р И К А З   Н О В И З Н А

  ПО ПРИКАЗУ "НОВИЗНА" ВЫДАЮТСЯ ДАТЫ ПОСЛЕДНЕГО ИЗМЕНЕНИЯ ВСЕХ ИМЕЮЩИХСЯ
ФАЙЛОВ.');
   (cmd = 'ПОК   '):
 writeln('  П Р И К А З   П О К А Ж И

  ПО ПРИКАЗУ "ПОКАЖИ" ВЫДАЕТСЯ СОДЕРЖИМОЕ ПУНКТОВ В СООТВЕТСТВИИ
С УКАЗАННЫМ РАЗДЕЛОМ И НОМЕРАМИ ПУНКТОВ. УЗНАТЬ НАЗВАНИЯ РАЗДЕЛОВ
МОЖНО, ЗАДАВ ПРИКАЗ "ПОКАЖИ" БЕЗ ПАРАМЕТРОВ. НАЗВАНИЯ РАЗДЕЛОВ МОЖНО
СОКРАЩАТЬ ДО ТРЕХ БУКВ. ПРИМЕРЫ:
  ПОК ПРЕ 4
  ПОК ВЫС 5-7
  ПОК АВТ (1,3-5,7)');
   (cmd = 'РУБ   '):
 writeln('  П Р И К А З   Р У Б Р И К А Т О Р

  ПО ПРИКАЗУ "РУБ" ВЫДАЕТСЯ РУБРИКАТОР, ПО КОТОРОМУ МОЖЕТ ВЫБИРАТЬСЯ
НЕОБХОДИМАЯ СИГНАЛЬНАЯ ИНФОРМАЦИЯ.');
   (cmd = 'СИГ   '): _(
 write('  П Р И К А З   С И Г Н А Л

  ПО ПРИКАЗУ "СИГНАЛ" ВЫДАЕТСЯ СИГНАЛЬНАЯ ИНФОРМАЦИЯ ВИНИТИ.  ОЗНАКОМИТЬСЯ
С ДЕЙСТВУЮЩИМ В ОРГАНИЗАЦИИ РУБРИКАТОРОМ МОЖНО ПРИКАЗОМ "РУБ".
  ПАРАМЕТРЫ ПРИКАЗА "СИГНАЛ" МОГУТ БЫТЬ: "РУБРИКА", "ЗАКАЗ", "ОБРАЗЦЫ",
"ДОПОЛНЕНИЕ", "ВЫПУСК", "КАТАЛОГ", "ФОРМАТ", "КОЛИЧЕСТВО", "ПУНКТЫ"
И "ДОКУМЕНТЫ".
  ПО ПАРАМЕТРУ "РУБ" ПРОИЗВОДИТСЯ ВЫБОР ИНФОРМАЦИИ ПО РУБРИКАМ.
РУБРИКИ УКАЗЫВАЮТСЯ В КРУГЛЫХ СКОБКАХ ЛИБО ЦИФРОВЫМ ИНДЕКСОМ, ЛИБО
НАБОРОМ СЛОВ ("КЛЮЧЕЙ"), ВХОДЯЩИХ В ТЕКСТОВОЕ ОПИСАНИЕ РУБРИК. "КЛЮЧЕВЫЕ"
СЛОВА МОЖНО СОКРАЩАТЬ ДО ПЕРВЫХ ТРЕХ СИМВОЛОВ. ПРОБЕЛ МЕЖДУ КЛЮЧЕВЫМИ
СЛОВАМИ ВЫПОЛНЯЕТ РОЛЬ ЛОГИЧЕСКОГО "И", ЗАПЯТАЯ - РОЛЬ ЛОГИЧЕСКОГО
"ИЛИ". ПРИМЕРЫ:            
  СИГ РУБ(13.1.2.2.2,13.1.2.2.9)');
 MORE;
 write('  СИГ РУБ(МАТ ОБЕ,ЗАП УСТ)
  ЕСЛИ ВЫ ОФОРМИЛИ ЗАКАЗ РУБРИК НА ИНДИВИДУАЛЬНОЕ УВЕДОМЛЕНИЕ, ТО
ПО ПАРАМЕТРУ "ЗАК" МОЖНО ПРОСМОТРЕТЬ РАНЕЕ ЗАКАЗАННЫЕ РУБРИКИ.
   ПРИМЕР: СИГ ЗАК
  ПО ПАРАМЕТРУ "ВЫП" УСТАНАВЛИВАЕТСЯ ЗАПРОС НА ДОСТУП К ЛЮБОМУ РАНЕЕ
ПОСТУПИВШЕМУ ВЫПУСКУ СИГНАЛЬНОЙ ИНФОРМАЦИИ ПО ЕГО НОМЕРУ.
   ПРИМЕР: СИГ ВЫП(3/82),ЗАК
  ПО УМОЛЧАНИЮ УСТАНАВЛИВАЕТСЯ ТЕКУЩИЙ ВЫПУСК.
  ПО ПАРАМЕТРУ "КАТ" ОСУЩЕСТВЛЯЕТСЯ ПРОСМОТР КАТАЛОГА ВСЕХ ПОСТУПАВШИХ
ВЫПУСКОВ СИГНАЛЬНОЙ ИНФОРМАЦИИ. ВЫДАЕТСЯ ПЕРЕЧЕНЬ НОМЕРОВ ВЫПУСКОВ
С УКАЗАНИЕМ НОМЕРОВ БОБИН, ГДЕ ОНИ ХРАНЯТСЯ.
  ПО ПАРАМЕТРУ "ОБР" ВЫБИРАЮТСЯ ДОКУМЕНТЫ ПО КОНТЕКСТУ В СООТВЕТСТВИИ
С ПЕРЕЧИСЛЕННЫМИ В СКОБКАХ ОБРАЗЦАМИ. КОЛИЧЕСТВО ОБРАЗЦОВ ЗДЕСЬ
НЕ БОЛЕЕ ВОСЬМИ. ЕСЛИ ПЕРЕД ОБРАЗЦОМ СТОИТ НАДЧЕРК, ТО ДАННЫЙ ОБРАЗЕЦ
НЕ ДОЛЖЕН ВХОДИТЬ В СОСТАВ ДОКУМЕНТА.
  ПОИСК ВХОЖДЕНИЯ ОБРАЗЦА РАСПРОСТРАНЯЕТСЯ НА ВЕСЬ ОБЪЕМ ДОКУМЕНТА,
КАК ЕГО МОЖНО ВИДЕТЬ В СЛУЖЕБНОМ ФОРМАТЕ.
   ПРИМЕР: СИГ РУБ(БИС),ОБР(АНГЛ,РУС)
  ПО ПАРАМЕТРУ "ДОП" ПРОИЗВОДИТСЯ ВЫБОРКА ДОКУМЕНТОВ, В НАЗВАНИЕ
КОТОРЫХ (ОРИГИНАЛЬНОЕ РУССКОЕ ИЛИ ПЕРЕВЕДЕННОЕ НА РУССКИЙ ЯЗЫК)
ВХОДИТ УКАЗАННОЕ В СКОБКАХ ПОНЯТИЕ, ОБРАЗОВАННОЕ ОТДЕЛЬНЫМИ СЛОВАМИ
ИЛИ СЛОВОСОЧЕТАНИЯМИ. ПОИСК ВЕДЕТСЯ ПО ОСНОВАМ СЛОВ. ЧИСЛИТЕЛЬНЫЕ
ЗАПИСЫВАЮТСЯ В ЦИФРОВОМ ВИДЕ.');
 MORE;
 write('   ПРИМЕР: СИГ ДОП(ДИАЛОГОВЫЕ СИСТЕМЫ НА БЭСМ-6),ФОР(СОК)
  ВОСПОЛЬЗОВАТЬСЯ ПАРАМЕТРОМ "ДОП" МОЖНО, ВЫЗВАВ ДЖИН ПО КЛЮЧУ "ОТЧЕТ".
  ПАРАМЕТР "ФОР" ОПРЕДЕЛЯЕТ ФОРМАТ ВЫДАЧИ СИГНАЛЬНОЙ ИНФОРМАЦИИ.
ФОРМАТ ВЫДАЧИ МОЖЕТ БЫТЬ:
  СОКРАЩЕННЫЙ - АВТОР И НАЗВАНИЕ РАБОТЫ,
  НОРМАЛЬНЫЙ  - АВТОР, НАЗВАНИЕ, ИСТОЧНИК И ДР.,
  СЛУЖЕБНЫЙ   - ВСЕ ИНФОРМАЦИОННЫЕ ПОЛЯ В ФОРМЕ ВИНИТИ,
  КАРТОЧНЫЙ   - В ВИДЕ БИБЛИОГРАФИЧЕСКОЙ КАРТОЧКИ,
  ТРЕБОВАНИЕ  - ДЛЯ ЗАКАЗА ЛИТЕРАТУРЫ ЧЕРЕЗ БИБЛИОТЕКУ.
ПО УМОЛЧАНИЮ ЗАДАЕТСЯ СОКРАЩЕННЫЙ ФОРМАТ. КАРТОЧКИ И ТРЕБОВАНИЯ
ВЫДАЮТСЯ ТОЛЬКО НА АЦПУ. ТРЕБОВАНИЯ ВЫДАЮТСЯ ПО НОМЕРАМ ДОКУМЕНТОВ.
  ПО ПАРАМЕТРУ "КОЛ" ВЫДАЕТСЯ ПОЛНОЕ КОЛИЧЕСТВО ДОКУМЕНТОВ.
   ПРИМЕР: СИГ РУБ(УСТ ВВО ВЫВ),КОЛ
  ПО ПАРАМЕТРАМ "ПУН" И "ДОК" ПРОИЗВОДИТСЯ ВЫБОРКА ПО НОМЕРАМ ПУНКТОВ
ИЛИ ПО НОМЕРАМ ДОКУМЕНТОВ. ПРИМЕРЫ:
  СИГ ЗАК,ФОР(КАР),ПУН(2,5,7-9)
  СИГ РУБ(ВЫЧ ТЕХ),ФОР(ТРЕБ),ПУН(143,162-166)
  СИГ РУБ(ВЫЧ ТЕХ),ФОР(ТРЕБ),ДОК(3897-3899)
  ПОСЛЕДОВАТЕЛЬНЫЕ НОМЕРА ПУНКТОВ УКАЗЫВАЮТСЯ ПЕРЕД КАЖДЫМ ДОКУМЕНТОМ
ПРИ ПРОСМОТРЕ СИГНАЛЬНОЙ ИНФОРМАЦИИ НА ЭКРАНЕ. НОМЕРА ДОКУМЕНТОВ
ВЫДАЮТСЯ В ФОРМАТАХ "СЛУЖ", "КАРТ" И "ТРЕБ".');
 MORE
   _);
   (cmd = 'ЗАК   '): _(
 write('  П Р И К А З  З А К А З

  ПО ПРИКАЗУ "ЗАКАЗ" ПОДАЕТСЯ ЗАЯВКА НА ИНДИВИДУАЛЬНОЕ УВЕДОМЛЕНИЕ
О ПОСТУПЛЕНИИ СИГНАЛЬНОЙ ИНФОРМАЦИИ ВИНИТИ. ЗАКАЗЫ ДЕЛАЮТСЯ В СООТВЕТСТВИИ
С РУБРИКАТОРОМ. ФОРМА ОБРАЩЕНИЯ:
     ЗАК [ <+/-> <РУБРИКА> ]
  ЕСЛИ ПАРАМЕТР ПРИКАЗА "ЗАК" НЕ УКАЗАН, ТО ВЫДАЮТСЯ ВСЕ РАНЕЕ ЗАКАЗАННЫЕ
РУБРИКИ. ЕСЛИ ПЕРЕД РУБРИКОЙ СТОИТ ЗНАК "+", ТО <РУБРИКА> ДОБАВЛЯЕТСЯ
К СПИСКУ ЗАКАЗОВ; ЕСЛИ СТОИТ ЗНАК "-", ТО <РУБРИКА> ИСКЛЮЧАЕТСЯ
ИЗ СПИСКА ЗАКАЗОВ. УВЕДОМЛЕНИЕ О ПОСТУПЛЕНИИ ЗАКАЗАННОЙ СИГНАЛЬНОЙ
ИНФОРМАЦИИ ПРОИЗВОДИТСЯ ПРИ ВХОДЕ В ДЖИН И ПРИ ВХОДЕ В БИБЛИОТЕЧНЫЙ
БЛОК.
   ПРИМЕР:  ЗАК +25.4.6   (ЗАКАЗ РУБРИКИ ИСК. ИНТЕЛЛЕКТ)');
 MORE
   _);
   (cmd = 'РОМ   '):
 writeln('  П Р И К А З   Р О М А Н

  ПО ПРИКАЗУ "РОМАН" МОЖНО ЗНАКОМИТЬСЯ С ТЕКСТАМИ БОЛЬШОГО ОБЪЕМА.
ВЕСЬ ТЕКСТ ДЕЛИТСЯ НА ВЫПУСКИ ПО 5-6 ТЫСЯЧ ЗНАКОВ КАЖДЫЙ. ЕЖЕДНЕВНО
ДВА ВЫПУСКА МОЖНО ПРОЧЕСТЬ В ЛЮБОЕ ВРЕМЯ СУТОК, ЕЩЕ НЕСКОЛЬКО -
ТОЛЬКО В СПЕЦИАЛЬНО ОТВЕДЕННОЕ ВРЕМЯ.
  ФОРМА ОБРАЩЕНИЯ:
  РОМ [<НОМЕР ВЫПУСКА>] .');
   (cmd = 'СПР   '):
 writeln('  П Р И К А З   С П Р А В К А

  ПО ПРИКАЗУ "СПРАВКА" ПРОИСХОДИТ ПЕРЕХОД В СПРАВОЧНЫЙ БЛОК ПО ЗАРУБЕЖНЫМ
ЭВМ, КОТОРЫЙ ЯВЛЯЕТСЯ АВТОНОМНЫМ БЛОКОМ И ИМЕЕТ СВОЙ НАБОР ПРИКАЗОВ.');
   true:  _( writeln('НЕТ ПРИКАЗА ', cmd); _goto 5461 _)
   _end _else _(
   writeln('НЕТ ПАРАМЕТРА ПРИКАЗА');
   5461: writeln('ЕСТЬ: ИНФ, ШКО, ОБЗ, ВЫС, ЖУР, КАР,
      ПРЕ, АВТ, ЮМО, ДОЛ, ЗАК, НОВ, ПОК, СПР, СИГ, РУБ');
   _)
_);

 _function time:integer;
 _(
 code(Э05310=,СД/4/=);
 time := ;
 _);

_function L5472(l2a1z:integer):boolean;
_var l2v1z, l2v2z:integer;
_(
 l2v2z := 7;
 l2v1z :=   time;
  code(2лу6=);
 l2v1z := ;
 L5472 := l2v1z < l2a1z;
 _);

_proced DOL(l2a1z:boolean); _label 5622, 5625, 5671, 5700, 5755, 5760, 5773;
_var l2v1z, l2v2z, l2v3z, i, l2v5z, l2v6z, l2v7z:integer;
l2v8z, l2v9z: alfa; l2v10z, l2v11z: char;
l2v12z:unp6;
l2v18z, l2v19z:boolean;
l2v20z:integer; l2v21z, l2v31z:_array [0..9] _of integer; l2v41z: _array [0..9] _of char;

_proced L5505(l3a1z:integer); _label 5507;
 _(
5507:
 _if i <= 6 _then _(
 l2v10z := l2v12z[i];
   _select 
   (l3a1z = 1): _if l2v10z _in digit _then EXIT;
   (l3a1z = 2): _(
   _if  (l2v10z = '(') _then EXIT;
   _if (l2v10z = eot) _then  _GOTO 5760;
   _);
   (l3a1z = 3):  _if (l2v10z = ')') _then EXIT;
   (l3a1z = 4): _if l2v10z _in letter _then EXIT;
   (l3a1z = 5): _if (l2v10z = '&') _then EXIT;
   (l3a1z = 6): _(
   _if l2v10z = sp _then EXIT;
   _if l2v10z = eol _then _( L3726; _GOTO 5671 _);
   _)
   _end;
 i := i + 1;
 l2v6z := l2v6z - 1;
 _goto 5507;
   _);
 l2v3z := l2v3z + 1;
 unpck( l2v12z[1], g17z@[l2v3z]);
 i := 1;
 _goto 5507;
 _);

_( (* DOL *)
  find( 'DОL   ', false);
 l2v1z := 1;
 l2v18z := true;
 l2v2z := 0;
 l2v20z := 0;
 _if _not (INP@ _in digit) _then  l2v9z := shift(userID, 32)
  _else l2v9z := toHex(getNum(10));
 _if _not l2a1z _then _(
  l2v3z := -1;
 5622: 
 l2v3z := l2v3z + 1;
  _if l2v3z > 1024 _then _( 5625:  writeln('ФАЙЛ ИСПОРЧЕН'); _GOTO 12450 _);
 unpck( l2v12z[1], g17z@[l2v3z] );
  _for i := 1 _to 6 _do _(
  l2v10z := l2v12z[i];
  _select
  (l2v10z = eot): EXIT;
  (l2v10z = eol): _( L3726; _goto 5671 _);
  (l2v10z = '('): _( L5505( 3 ); _goto 5671 _);
  (l2v10z = '%'): _goto 5671;
  (l2v10z = '&'): _( L5505( 6 ); _);
  (l2v10z = 'Z'): _goto 5671
  _end;
  write(l2v10z);
    5671:;
  _);
  _goto 5622;
  _) _else _( (* 5674 *)
 l2v8z := '000000';
 l2v19z := false;
 l2v18z := ;
 l2v3z := -1;
5700:
l2v3z := l2v3z + 1;
 _if l2v3z > 1024 _then _goto 5625;
 unpck( l2v12z[1], g17z@[l2v3z] );
  _for i := 1 _to 6 _do _(
   l2v10z := l2v12z[i];
 _if l2v18z _then _(
 _select
  (l2v10z = eot): _goto 5760;
  (l2v10z = eol): _(  l2v19z := false; l2v18z := ; _goto 5755 _);
  true: _goto 5755
  _end;
  _); (* 5725 *)
 _if _not l2v19z  _then _(  L5505( 2 ); L5505( 1 ) _);
_if l2v10z <> sp _then _(
  code(2сч13=сд/-10/,2лс15=);  l2v8z := ;
 l2v19z := true;
 _goto 5755;
 _goto 5755;
  _);
 L5505( 4 );
 _if l2v8z = l2v9z _then _(
 l2v41z[l2v2z] := l2v10z;
 L5505( 3 );
 L5505( 4 );
 l2v31z[l2v2z] := l2v3z;
 l2v21z[l2v2z] := i;
 l2v2z := l2v2z + 1;
 _if l2v2z > 10 _then _goto 5760;
  _);
  l2v8z := '000000';
  l2v18z := true;
  5755:;
  _); _goto 5700;
 5760:
  _if l2v2z = 0 _then EXIT;
 l2v2z := time  _MOD l2v2z;
 write('ВЫ ЗНАЕТЕ ');
 l2v3z := (l2v31z[l2v2z] - (1));
 i := l2v21z[l2v2z];
5773:
  l2v3z := (l2v3z + (1));
 _if l2v3z > 1024 _then _goto 5625;
 unpck( l2v12z[1], g17z@[l2v3z] );
 _while i <= 6 _do _(
  l2v10z := l2v12z[i];
  _select (l2v10z = eot) _or (l2v10z = eol):  _(
  writeln(' ?');
  stats( 18 );
  BIND('=-# {1720');
  _if (input@ <> 'Д') _then _(  writeln('ОЧЕНЬ ЖАЛЬ'); EXIT _);
  _if L5472(5) _then  write('ПОЖАЛУЙСТА, ');
  _if time _MOD 257 (* really 256 *) > 129 _then _(
   write('ПОПРОСИТЕ ');
  _if (l2v41z[l2v2z] = 'М') _then  write('ЕГО') _else  write('ЕЕ');
  _) _else _(
  write('ПЕРЕДАЙТЕ, ЧТО ');
  _if (l2v41z[l2v2z] = 'М') _then  write('ЕМУ') _else  write('ЕЙ');  
  write(' НУЖНО');
  _);
  writeln(' ЗАЙТИ В БИБЛИОТЕКУ');
  EXIT;
  _);
  l2v10z = '%': _( L5505(5); L5505(4) _)
  _end;
  write(l2v10z);
  i := i + 1;
  _); (* while *)
  i := 1;
  _goto 5773;
  _); (* 6101 *)
_);

_proced notFound(s:boolean);
 _(
 _if s _then write('ОБРАЗЕЦ НЕ НАЙДЕН')
 _else write('ОБРАЗЦЫ НЕ НАЙДЕНЫ');
 writeLN;
_);

_proced display(l2a1z:alfa); _label 6625, 6630, 6547, 6557, 6563;
_var l2v1z, l2v2z, l2v3z, l2v4z, l2v5z, l2v6z, l2v7z, l2v8z:integer;
l2v9z: alfa;
l2v10z, l2v11z, l2v12z:boolean;
l2v13z:integer;
l2v14z:boolean;
l2v15z:char;
l2v16z:unp6;
l2v22z, l2v23z:bitset;
pat:_array[1..4] _of unp16;
lens, l2v92z:_array[1..4] _of integer;

_proced pattern; _label 6154, 6217, 6231, 6264, 6301, 6375, 6424, 6441, 6452;
_var l3v1z, l3v2z, l3v3z, i, l3v5z, l3v6z, j, k, len, l3v10z, l3v11z, l3v12z, l3v13z, l3v14z:integer;
l3v15z:unp16;
l3v31z:char;
l3v32z:boolean;
p:_array [1..4] _of integer;
_(
 l3v14z := 1;
 l3v32z := false;
  _if l2v12z _then _goto 6231;
 j := 0;
 l3v6z := ;
 l2v7z := ;
 l3v5z := 1;
 expect( opar );
 l2v12z := true;
 l2v13z := 0;
 l2v22z := ;
  _for i := 1 _to 4 _do _(
   j := j + 1;
  l3v6z := l3v6z + 1;
  getPat(pat[i], len);
  l2v22z := l2v22z | [i];
 lens[i] := len;
 l3v31z := INP@;
6154:
  _select
  (l3v31z = cpar) | (l3v31z = etx) :  _goto 6217;
  (l3v31z = plus) | (l3v31z = sp) : get(INP);
  (l3v31z = comma) : _(
  _if i = 4 _then _goto 6217;
  l2v92z[l3v5z] := j;
 j := 0;
 l2v7z := l2v7z + 1;
 l3v5z := l3v5z + 1;
  get(INP);
  _);
  true: _(
  _while (l3v31z <> cpar) & (l3v31z <> etx) &
  (l3v31z <> plus) &  (l3v31z <> comma) & (l3v31z <> sp) _do _(
  get(INP);
  l3v31z := INP@
  _);
  _goto 6154;
  _) _end
  _); 6217:
   expect( cpar );
  l2v92z[l3v5z] := j;
  l2v7z := l2v7z + 1;
  _if INP@ <> etx _then
  writeln('КОЛ-ВО ОБРАЗЦОВ > 4, АНАЛИЗ ПО ПЕРВЫМ 4-М ОБРАЗЦАМ');  
  6231:
   l3v2z := 0;
 l3v1z := 1;
 l2v11z := false;
 l2v23z := l2v22z;
 _if l2v3z < 6 _then  l2v3z := l2v3z + 1
  _else _(  l2v3z := 1; l2v1z := l2v1z + 1 _);
 l3v11z := l2v3z;
 l3v12z := l2v1z;
 _for j := 1 _to 4 _do p[j] := 0;
 _for i := 1 _to l2v7z _do _(
   l3v2z := l3v2z + l2v92z[i];
   _for k := l3v1z _to l3v2z _do _(
  6264:
     _if (k _IN l2v23z) _then _(
     _if _not l3v32z _then _(  len := lens[k];  l3v15z := pat[k]  _);
  6301:
  unpck(l2v16z[1], g17z@[l2v1z]);
  _while l2v3z <= 6 _do _(
   l3v31z := l2v16z[l2v3z];
  _select
  (l3v31z = eot) : _if i >= l2v7z _then _(
     g13z := l2v10z _or g13z;
     _if _not l2v10z _and l2v14z _then notFound((l2v7z = 1) & (l2v92z[1] = 1)) ;
     _GOTO 6630;
  _) _else _goto 6452;
  (* 6335 *) (l3v31z = eol) : _goto 6441;
  (l3v31z = sp) : _goto 6441;
  (* 6343 *) (l3v31z = minus) : _(
    _if l2v3z = 6 _then _(
   l2v1z := l2v1z + 1;
  unpck( l2v16z[1], g17z@[l2v1z] );
  l2v3z := 1;
  _if (l2v16z[1] = eol) _then _goto 6441 _else _( l2v1z := l2v1z - 1; l2v3z := 6; _goto 6375 _);
  _);
  _if l2v16z[l2v3z + 1] = eol _then _goto 6441 _else _goto 6375;
  _);
  (* 6372 *)(l3v31z = '$'): _goto 6452 
  _end; (* 6375 *)
  6375:
  _if (l3v31z = l3v15z[l3v14z]) _then _(
   _if _not l3v32z _then  l3v32z := true;
  _if l3v14z = len _then _(
  p[i] := p[i] + 1;
  l2v23z := l2v23z - [k];
 _if p[i] = l2v92z[i] _then _(
  l2v3z := l3v11z;
  l2v1z := l3v12z;
  l2v11z := true;
  l2v10z := ;
  write(sp);
  EXIT;
  _); (* 6422 *)
  l3v32z := false;
  l3v14z := 1;
  6424: _if k >= l3v2z _then _goto 6452;
  k := k + 1;
  l2v3z := l3v11z;
  l2v1z := l3v12z;
  _goto 6264;
  _); (* 6432 *)
  l3v14z := l3v14z + 1;
  _goto 6441;
  _); (* 6434 *)
  _if l3v32z _then _(  l3v32z := false; l3v14z := 1; l2v3z := l2v3z - 1 _);
  6441: l2v3z := l2v3z + 1;
  _); (*6443 *)
   l2v3z := 1;
   l2v1z := l2v1z + 1;
  _goto 6301;
     _) _else _goto 6424; 
  _); 6452:
  _if i >= l2v7z _then  EXIT;
  l3v1z := l3v2z + 1;
  l2v3z := l3v11z;
  l2v1z := l3v12z;
  _for j := 1 _to  4 _do p[j] := 0;
  _); (* 6470 *)
  EXIT;
_);

_( (* 6471 *)
   find( l2a1z, true );
   l2v9z :=   trim( l2a1z );
  l2v14z := (l2v9z <> rub) & (l2v9z <> руб) & (l2v9z <> jur) & (l2v9z <> жур);
  l2v8z := 0;
  l2v1z := -1;
  l2v10z := false;
  l2v12z := ;
  l2v11z := ;
  _if INP@ = '(' _then _(
  l2v8z := 1;
  (L6521) _(
  l2v3z := 1;
  l2v1z := l2v1z + 1;
  _if (l2v1z > 1023) _then _goto 6557;
  unpck(l2v16z[1], g17z@[l2v1z]);
  _for l2v3z := 1 _to 6 _do _(
  l2v15z := l2v16z[l2v3z];
  _select
  (l2v15z = eot) : EXIT;
  (l2v15z = '$') : _goto 6547
  _end;  
  _); (* 6546 *)
  _goto L6521;
  _);
  6547:
  pattern;
  _if l2v11z _then _goto 6563;
  _goto 6547;
  _);
  (L6553) _(
   l2v3z := 1;
  l2v1z := l2v1z + 1;
  _if l2v1z > 1023 _then 6557: writeln('ФАЙЛ ИСПОРЧЕН') _else
  6563: _(
  unpck(l2v16z[1], g17z@[l2v1z]);
  _while l2v3z <= 6 _do _(
  l2v15z := l2v16z[l2v3z];
  _select
  (l2v15z = eot) : _( L3726; EXIT _);
  (l2v15z = eol) : _( L3726; _goto 6625 _);
  (l2v15z = '$') : _(
  _if l2v8z = 1 _then _goto 6547;
  write(sp);
  _goto 6625;
  _) _end;
  _if ord(l2v15z) >= 129 _then _(
     l2v4z := ord(l2v15z) - 129;
     l2v15z := sp;
     _for l2v5z := 1 _to l2v4z _do write(l2v15z);
  _);
  write(l2v15z);
  6625:
  l2v3z := l2v3z + 1;
  _);
  _goto L6553;
  _);
  _);
  6630:;
_);

_function F6631(_var l2a1z, l2a2z, l2a3z:integer):boolean; _label 6676, 6702, 6724;
_var l2v1z, l2v2z, l2v3z, l2v4z, l2v5z, l2v6z:integer;
l2v7z:integer;
l2v8z:integer;
l2v9z, l2v10z, l2v11z:bitset;
_(
 F6631 := false;
  _if (l2a3z = 0) _then _goto 6724;
  _if l2a3z = 1 _then  EXIT;
  code(иам=пб13,с;м:0,0,0,0,0,0,0,0,0,0,0,к;);
  l2v1z := l2a3z;
 l2v9z := ;
 l2a3z := 0;
  l2v5z := minel(l2v9z)+1;
 _if card(l2v9z) > 1 _then  l2v5z := l2v5z - 1;
 l2v9z := [l2v5z];
 l2v5z := ;
 l2v3z := ;
  6676:
  l2v6z := l2v3z;
 l2v7z := 0;
 l2v8z := l2v5z;
 l2v9z := ;
  6702:
  l2v4z := ((l2v1z - l2v8z) - (1));
  (*=c-*)l2v11z := l2v7z;(*=c+*)
  _for l2v2z := 0 _to l2v4z _do _(
  (*=c-*)l2v10z := l2v2z;(*=c+*)
  _if l2v10z * l2v9z = l2v11z _then _(
  l2a1z := (l2v2z + (1));
 l2a2z := (l2a1z + l2v8z);
 F6631 := true;
  code(7пам=6па-12,ц1:6иа=2сч21,6иа=7зч12,6кцц1=); EXIT;
  6724:
    code(7пам=6па-12,ц2:6иа=7сч12,6иа=2зч21,6кцц2=);
  _);
  _); (* 6732 *)
  _if (l2v6z <> l2v5z) _then _(
  l2v8z := (l2v6z - l2v5z);
  l2v6z := shift(l2v6z, 1);
  l2v7z := l2v5z;
  _goto 6702;
  _);
  l2v5z := shift(l2v5z, 1);
  _if (l2v5z > 0) _then _goto 6676;
_);
_proced P6745(_var l2a1z, l2a2z:alfa);
_var l2v1z:unp6;
l2v7z:boolean; l2v8z:integer; l2v9z: char; l2v10z, l2v11z:alfa;
_(
 l2v10z := l2a1z;
  code(7памаска=,7сб=сд/40/,7зч1=7са1,ви7=э050104,7сч=7пб4,а;маска:    00,000000,000000,к;сч3700=зч,1пб76345=зч,);
   l2v11z := ;
  unpck(l2v1z[1], l2v11z);
  l2v7z := false;
  _for l2v8z := 1 _to 6 _do _(
   l2v9z := l2v1z[l2v8z];
  _if _not (l2v9z _in letter) _and (l2v9z <> sp) _and (l2v9z <> dot) _then  l2v7z := true;
  _); (* 7006 *)
  _if (l2v11z = '000000') _or l2v7z _then _(
  l2a1z := 'НЕТ ТА';
  l2a2z := 'КОГО  ';
  EXIT;
  _);
 l2a1z := l2v11z;
  code(7сч1=); l2a2z := ;
_);

_function L7021(l2a1z:alfa):alfa;
_var l2v1z, l2v2z:integer; l2v3z:unp6;
_(
 unpck( l2v3z[1], l2a1z );
 l2v2z := 0;
 _for l2v1z := 1 _to 6 _do l2v2z := l2v2z * 47 + ord(l2v3z[l2v1z]);
 l2v2z := (l2v2z _MOD (997));
 L7021 :=   toHex( l2v2z );
 _);

_proced ZAKAZ; _label 7427, 10136, 10211, 10225, 10270, 10306, 10315, 10402;
_const magic='!ZAKAZ'; L='L';
_type a10=_array [0..10] _of alfa; 
_var l2v1z:char; l2v2z:alfa; l2v3z:alfa;
l2v4z, l2v5z:alfa;
l2v6z, j, i, l2v9z, l2v10z,
l2v11z, l2v12z, l2v13z, l2v14z:integer; l2v15z, monop: boolean;
l2v17z, l2v18z:boolean;
l2v19z:boolean;
l2v20z:@a10;
l2v21z:@a10;
l2v22z:a10;
l2v33z, l2v39z, l2v45z: unp6; l2v49z:page;

_function F7044:alfa;
_var i:integer; l3v2z:unp6; l3v8z:alfa;
_(
 _for i := 1 _to 6 _do _(
  _if (INP@ _in letter) _or (INP@ _in digit) _then _(
  l3v2z[i] := INP@;
  get(INP);
  _) _else 
 l3v2z[i] := sp;
  _);
 pck(l3v2z[1], l3v8z);
 F7044 := l3v8z;
 L3576;
 _);

_function F7074(l3a1z, l3a2z:alfa):boolean;
_var i:integer; l3v2z, l3v8z:unp6;
_(
 unpck( l3v2z[1], l3a1z );
 unpck( l3v8z[1], l3a2z );
 F7074 := true;
 _for i := 1 _to l2v14z _do 
  _if l3v2z[i] <> l3v8z[i] _then _( F7074 := false; EXIT _)
_);

_proced whom;
 _(
 _if g14z _then write(l2v4z) _else write('ВАС');
_);

_proced L7131(l3a1z:alfa);
_var i, l3v2z:integer; l3v3z:char; l3v4z:boolean; l3v5z:unp6;
_(
 unpck( l3v5z[1], l3a1z );
 l3v4z := false;
 _for i := 1 _to 6 _do _(
 l3v3z := l3v5z[i];
 l3v2z := ;
 _if l3v2z > 0 _then _(
 _if l3v4z  _then write(dot) _else  l3v4z := true;
 _if i = 1 _then _select
  (l3v2z = 1) : l3v2z := 501;
  (l3v2z = 2) : l3v2z := 502;
  (l3v2z = 3) : l3v2z := 473;
  (l3v2z = 4) : l3v2z := 474;
  (l3v2z = 5) : l3v2z := 493;
  (l3v2z = 6) : l3v2z := 282;
  (l3v2z = 7) : l3v2z := 816
  _end;
  write(l3v2z:1);
  _);
  _);
 _);

_function F7205:alfa;
_var l3v1z:alfa; i, l3v3z, l3v4z:integer; l3v5z:unp6;
_(
 _for i := 1 _to 6 _do l3v5z[i] := '0';
 l3v4z := 0;
 i := ;
  _while INP@ <> etx _do _(
  i := i + 1;
  _if INP@ = dot _then _( l3v4z := (l3v4z + (1)); get(INP) _);
  l3v3z :=   getNum( 10 );
  _if (l3v3z = 0) _or (i > 6) _or (i > 1) _and (l3v3z > 99) _or (l3v4z > 5)
  _then _( write('ОШИБКА В РУБРИКЕ'); L3726; _GOTO 12450 _); (* 7251 *)
  _if i = 1 _then _select
  (l3v3z = 501) : l3v3z := 1;
  (l3v3z = 502) : l3v3z := 2;
  (l3v3z = 473) : l3v3z := 3;
  (l3v3z = 474) : l3v3z := 4;
  (l3v3z = 493) : l3v3z := 5;
  (l3v3z = 282) : l3v3z := 6;
  (l3v3z = 816) : l3v3z := 7
  _end;
   l3v5z[i] := chr(l3v3z);
  _); (* 7302 *)
  pck(l3v5z[1], l3v1z);
  l2v14z := i;
  F7205 := l3v1z;
_);

_proced L7307; _( _if monop  _then  deq41; _);

_proced unclear(c:char);
_(
 write(c, ' - НЕПОНЯТНО');
 L3726;
_);
_proced P7324;
_var l3v1z, l3v2z, l3v3z, l3v4z:integer; l3v5z, l3v6z:alfa; l3v7z:boolean;
_(
 l3v4z := l2v13z;
 _while F6631( l3v2z, l3v3z, l3v4z) _do _(
 l3v7z := false;
 l3v5z := g17z@[l2v11z + l3v2z];
 l3v6z := g17z@[l2v11z + l3v3z];
 unpck( l2v33z[1], l3v5z );
 unpck( l2v39z[1], l3v6z );
 (loop) _for l3v1z := (1) _to 6 _do _(
  _if (l2v33z[l3v1z] > l2v39z[l3v1z]) _then _( l3v7z := true; _exit loop _);
  _if (l2v33z[l3v1z] < l2v39z[l3v1z]) _then _exit loop;
  _);
 _if l3v7z _then_(
 g17z@[l2v11z + l3v2z] := l3v6z;
 g17z@[l2v11z + l3v3z] := l3v5z;
  _)
  _);
 _);

_( (* ZAKAZ *)
  getVol( 2, 44В );
 _if volNum( 4, 4) = 0 _then _(
    ГГ( 'В', влэвм1, влэвм2 );  writeln('ЗАКАЗЫ НЕ ОБСЛУЖИВАЮТСЯ');
   _GOTO 12450;
  _);
 _if admin _then _(
  monop := INP@ <> 'П';
  7427:
  _if monop _then  enq41;
  rdpg32( 41В, 10 );
  (*=c-*)l2v10z := g17z@[1];(*=c+*)
  _if (g17z@[0] <> '!ZАКАZ') _or (l2v10z > 68) _then _(  L7307; _goto 10225 _);
  _select
  _not monop : _(
  get(INP);
  l2v15z := false;
  l2v17z := ;
  _if INP@ <> etx _then _(
  monop := _not monop;
  L3576;
  _if INP@ = 'Ф' _then l2v15z := true _else _(
  l2v17z := true;
  _if INP@ _in digit
  _then _( l2v11z := getNum(10) * 100; l2v3z := toHex(l2v11z) _)
  _else l2v18z := getCmd(l2v3z, 6);
  (q) _exit q _);  _); (* 7500 *)
  (loop) _for j := (1) _to l2v10z _do _(
 l2v11z := j * 11;
 l2v4z := g17z@[l2v11z];
 l2v18z := l2v17z _and (l2v4z = l2v3z);
  _if _not monop _or l2v18z _or l2v15z _then _(
  write( j:5 );
  unpck(l2v45z[1], l2v4z);
  l2v5z := l2v4z;
  _if l2v45z[1] _in letter _then write(l2v4z:8) _else _(
  write(sp:2 );
  _for l2v6z := 1 _to 4 _do write(l2v45z[l2v6z]);
  l2v5z := shift(l2v4z, 8);
  unpck(l2v45z[1], l2v5z);
  l2v45z[1] := sp;
  l2v45z[6] := ;
  pck(l2v45z[1], l2v5z);
  P6745(l2v4z, l2v3z);
  write(l2v4z:7, l2v3z);
  _); (* 7566 *)
  l2v5z :=   L7021( l2v5z );
 unpck( l2v45z[1], l2v5z );
  write( sp:2 );
 _for l2v6z := 4 _to 6 _do write(l2v45z[l2v6z]);
  L3726;
  _); (* 7606 *)
  _if _not monop _or l2v18z _then
    _for i := 1 _to 10 _do _(
      l2v2z := g17z@[l2v11z + i];
      _if (l2v2z <> '0') _then _( write(sp:7);  L7131( l2v2z ); L3726 _);
    _);
  _if l2v18z _then _exit loop;
  _)_); (* 7635 *)
  (INP@ = 'И') _or g14z : _(
  _if _not g14z _then _( get(INP); L3576 _);
  _if INP@ _in letter _then l2v1z := sp _else l2v1z := '0';
  _for j := 1 _to 6 _do _(
  _if (INP@ _in letter) _or (INP@ _in digit) _then _(
    l2v33z[j] := INP@; get(INP)
  _) _else l2v33z[j] := l2v1z;
  _); (* 7672 *)
  pck(l2v33z[1], l2v2z);
  write(l2v2z, sp);
  _for j := 1 _to l2v10z _do _(
  l2v11z := j * 11;
  _if (g17z@[l2v11z] = l2v2z) _then _(
    _if (j <> l2v10z) _then _(
   _for j := (j + (1)) _to l2v10z _do _(
  i := j * 11 + 64000В;
  l2v20z := ptr(i - 11);
  l2v21z := ptr(i);
  l2v20z@ := l2v21z@;
  _);
  _) _else (* 7736 *) l2v21z := ptr(l2v10z * 11 + 64000В);
  _for i := 0 _to 10 _do l2v21z@[i] := '000000';
  l2v10z := l2v10z - 1;
  g17z@[1] := ;
 wrpg32( 41В, 10 ); L7307; write('ИСКЛЮЧЕН'); L3726; EXIT;
  _)_); (* 7764 *)
  L7307; write('НЕ НАЙДЕН'); L3726; EXIT
  _);  (* 7772 *)
  (INP@ = 'У') : _(
   l2v9z := l2v10z;
   _while F6631(j, i, l2v9z) _do _(
   l2v15z := false;
   l2v20z := ptr(j * 11 + 64000В);
   unpck(l2v33z[1], l2v20z@[0]);
   l2v21z := ptr(i * 11 + 64000В);
   unpck(l2v39z[1], l2v21z@[0]);
   (loop) _for l2v6z := 1 _to 6 _do _(
   _if (l2v33z[l2v6z] < l2v39z[l2v6z]) _then _exit loop;
   _if (l2v33z[l2v6z] > l2v39z[l2v6z]) _then _( l2v15z := true; _exit loop _);
   _); (* 10035 *)
   _if l2v15z _then _(
   l2v22z := l2v20z@; l2v20z@ := l2v21z@; l2v21z@ := l2v22z _);
   _); (* 10061 *)
    wrpg32( 41В, 10 ); L7307; write('СДЕЛАНО'); L3726; EXIT;
  _);
  true: (* 10071 *) _(  L7307; unclear( INP@ ); EXIT; _)
  _end;
  EXIT;
 _); (* 10076 *)
 _if g14z _then _(
  l2v19z := INP@ = minus;
  _if l2v19z  _then _( get(INP);  L3576  _);
 _if _not (INP@ _in letter) _then _(  write('ОШИБКА В ИДПОЛЕ'); L3726; EXIT _);
 _if l2v19z _then _(  monop := true; _goto 7427 _);
 l2v4z :=   F7044;
  _) _else  l2v4z := userID;

  l2v1z := INP@;
  _select
  (l2v1z = etx) : ;
  (l2v1z = plus) _or (l2v1z = minus) : (a) _(
    get(INP);
  10136:
  l2v2z :=   F7205;
  _if l2v1z = plus _then _(
  _for j := 1 _to 6 _do _(
  rdpg32( 44В, 0 + j - 1 );
 (*=c-*)l2v11z := sel(g17z@[2], 36, 12); (* избыточно *)
 l2v10z := shift(g17z@[3], 36);(*=c+*)
 _for i := 1 _to l2v10z _do 
  _if F7074( l2v2z, g17z@[l2v11z + i - 1]) _then _exit a;
  _);
  write('РУБРИКА  '); L7131( l2v2z ); write('  НЕ СУЩЕСТВУЕТ'); L3726; EXIT;
  _)
  _);
  l2v1z _in digit: _( l2v1z := plus; _goto 10136 _);
  true: _( unclear(l2v1z); EXIT _)
  _end;
  10211:
  monop := l2v1z <> etx;
  _if monop _then enq41;
  rdpg32( 41В, 10 );
 _if g17z@[0] <>  '!ZАКАZ' _then _(
  L7307; 10225: write('ЗОНА ЗАКАЗОВ ИСПОРЧЕНА'); L3726; EXIT;
  _);
  (*=c-*)l2v10z := g17z@[1];(*=c+*)
 _if l2v10z > 68 _then _goto 10225;
  _for j := 1 _to l2v10z _do _(
  l2v11z := j * 11;
  _if g17z@[l2v11z] = l2v4z _then _goto 10270;
  _);
  l2v10z := l2v10z + 1;
  g17z@[1] := ;
  _if l2v10z > 68 _then _(  write('ДЛЯ '); whom; write(' НЕТ МЕСТА'); L3726; EXIT _);
  l2v11z := l2v10z * 11;
  g17z@[l2v11z] := l2v4z;
  10270:
  l2v13z := 0;
  _for j := 1 _to 10 _do
  _if g17z@[l2v11z + j] <> '000000' _then  l2v13z := l2v13z + 1;
  _select
  (l2v1z = etx) : _(
  _if (l2v13z = 0) _then_( 10306:  write('ЗАКАЗОВ У '); whom; write(' НЕТ'); L3726; EXIT _);
  10315: write(l2v4z, ' - ВАШИ ЗАКАЗЫ:'); L3726;
   _for j := 1 _to l2v13z _do _(
    write(sp:7); L7131(g17z@[l2v11z + j] ); L3726;
   _); EXIT
  _);
  (l2v1z = '+'): _(
   _for j := 1 _to l2v13z _do 
  _if g17z@[l2v11z + j] = l2v2z _then _(
  L7307; write('ЗАКАЗ  '); L7131( l2v2z ); write('  У '); whom; write(' УЖЕ ЕСТЬ'); L3726; EXIT
  _);
  _if l2v13z = 10 _then _(  L7307; write('БОЛЬШЕ ЗАКАЗЫВАТЬ НЕЛЬЗЯ'); L3726; EXIT _);
  l2v13z := (l2v13z + (1));
  g17z@[l2v11z + l2v13z] := l2v2z;
  10402: _if l2v13z > 0 _then  P7324;
  wrpg32(41В, 10);  L7307; write('ТЕПЕРЬ ');
  _if l2v13z = 0 _then _goto 10306; _goto 10315;
  _);
  (l2v1z = '-') : _(
  _if (l2v13z = 0) _then _(  L7307; _goto 10306 _);
  _for j := 1 _to l2v13z _do _(
  _if g17z@[l2v11z + j] = l2v2z _then _(
 _if j <> l2v13z _then  g17z@[l2v11z + j] := g17z@[l2v11z + l2v13z];
  g17z@[l2v11z + l2v13z] := '000000';
  l2v13z := l2v13z - 1;
  _goto 10402;
    _)
  _);
   L7307; write('ЗАКАЗА  '); L7131( l2v2z ); write('  У '); whom; write(' НЕТ'); L3726;
  _goto 10315;
  _)
  _end;
_);

_proced OBZOR;
_var name:alfa;
_(
 _if inCatal( 'БЭС   ') _or inCatal( 'ЗУ    ') _or inCatal( 'ЯЗ    ') _then _(
   _if INP@ = etx _then _(
     writeln('УКАЖИТЕ ТЕМУ ОБЗОРА');
     writeln('ЕСТЬ:');
     _if inCatal( 'БЭС   ') _then writeln('  БЭСМ');
     _if inCatal( 'ЗУ    ') _then writeln('  ЗУ (ЗАПОМИНАЮЩИЕ УСТРОЙСТВА)');
     _if inCatal( 'ЯЗ    ') _then writeln('  ЯЗ (ЯЗЫКИ ПРОГРАММИРОВАНИЯ)');
     TTIN( false );
   _);
   _if getCmd( name, 3) _then _(
     _if (name <> 'БЭС   ') _and ('ЗУ    ' <> name) _and ('ЯЗ    ' <> name) _then _(
       write('ОБЗОРА ', name, ' В '); ГГ( влэвм1 ); writeln(влэвм2, ' НЕТ');
       _GOTO 12450;
     _);
     stats( 3 );
     display( name );
   _);
 _) _else noCmd;
_);

_proced SHOW; _label 11014;
_var l2v1z, i, j, l2v4z, l2v5z, l2v6z, l2v7z, l2v8z, l2v9z, l2v10z:integer;
l2v11z: char;
l2v12z:unp6;
l2v18z:boolean;
name, l2v20z:alfa;
l2v21z:longset;
_(
 _if catal[1] = sp6 _then _( 
  write('В '); ГГ( влэвм1 ); writeln(влэвм2, ' НЕТ НИКАКИХ РАЗДЕЛОВ');
 _GOTO 12450;
  _);
  _if INP@ = etx _then _(
  writeln('ДАЙТЕ НАЗВАНИЕ РАЗДЕЛА.  ЕСТЬ:');
  j := 0;
  _for i := 1 _to nSect _do _(
  name := catal[i];
  l2v20z :=   trim( name );
  _if (l2v20z <> РУБ) _and (l2v20z <> RUВ)
  _and (l2v20z <> JUR) _and (l2v20z <> ЖУР) _then _( 
  j := j + 1;
  write( name:8 );
 _if j = 5 _then _( MORE; j := 0 _);
  _);
  _); (* 10642 *)
  _if j <> 0 _then  MORE;
  TTIN( false );
  _); (* 10647 *)
  l2v18z :=   getCmd( name, 3 );
  _if _not l2v18z _then EXIT;
  find( name, true);
  _if INP@ = etx _then _( writeln('НОМЕРА ПУНКТОВ ?'); TTIN( false) _);
 _if F4712(l2v21z, 10)  _then _(  writeln('НОМЕР СЛИШКОМ БОЛЬШОЙ');  _GOTO 12450 _);
  _while F4610( l2v5z, l2v21z) _do (a) _(
  write( l2v5z:4 );
 l2v6z := 0;
 l2v9z := ;
 l2v18z := ;
 l2v10z := -1;
 l2v1z := 1;
 j := -1;
  (loop) _(
  j := j + 1;
  unpck(l2v12z[1], g17z@[j]);
  _for l2v4z := 1 _to 6 _do _(
   l2v11z := l2v12z[l2v4z];
  _select
  (l2v11z = eot) : _( _if _not l2v18z _then write(' НЕТ ПУНКТА'); L3726; EXIT _);
  (l2v11z = eol) : _( _if l2v18z _then L3726; _goto 11014 _);
  (l2v11z = ромб) : _( _if l2v18z _then _exit loop; l2v18z := true; _goto 11014 _);
  (l2v11z = sp) : _( _if l2v9z = 0 _then _goto 11014 _)
  _end;
  _if _not l2v18z _then _(
  _while l2v11z <> eol _do _(
  _if (l2v4z < 6) _then l2v4z := (l2v4z + (1)) _else _(
  l2v4z := 1;
  j := j + 1;
 unpck( l2v12z[1], g17z@[j] );
  _);
 l2v11z := l2v12z[l2v4z];
  _); (* 10774 *)
  _goto 11014
  _); (* 10775 *)
  _if _not (l2v11z _in digit) _or (l2v6z <> 0) _then _(
  l2v6z := l2v9z;
   _if l2v5z = l2v6z _then write(l2v11z) _else _( l2v6z := 0; l2v9z := ; l2v18z := ; _)
  _) _else l2v9z := l2v9z * 10 + ord(l2v11z);
  11014:;
  _); (* 11016 *)
  _goto loop;
  _);
  _); (* 11020 *)
_);

_function date:integer;
_var d:integer;
_(
 code(Э050114=,); d := ;
  date := ((((sel(d, 16, 4) * 10
             + sel(d, 20, 4)) * 10
             + sel(d, 28, 1)) * 10
             + sel(d, 24, 4)) * 10
             + sel(d, 33, 2)) * 10
             + sel(d, 29, 4);
_);

_function txtTime:alfa;
_var t, i:integer; a:unp6; ret:alfa;
_(
 code(Э05310=,); t := ;
 t := trunc(t / 3000);
 a[1] := sp;
 a[4] := dot;
 i := trunc(t / 600);
 a[2] := ;
 t := t - i * 600;
 i := t _DIV 60;
 a[3] := ;
 t := t - i * 60;
 i := t _DIV 10;
 a[5] := ;
 a[6] := chr(t - i * 10);
 pck(a[1], ret);
 txtTime := ret;
 _);

_function zeller(d, m, y:integer):integer;
_(
 _if m < 3 _then y := y - 1;
 m := m + 9;
 _if m > 11 _then m := m - 12;
 m := m + 1;
 zeller := ((d + y + y _div 4 + (13 * m - 1) _DIV 5) - 28) _MOD 7;
_);

_function chkRom(how:boolean):boolean; _label 11150;
_var l2v1z, l2v2z, l2v3z, l2v4z, l2v5z, l2v6z:integer; l2v7z: alfa;
l2v8z:unp6; l2v14z:bitset;
_(
 chkRom := true;
 _if g71z * [3] = [3] _then EXIT;
 _if 26 _IN g85z _then _(
  11150: _if how _then writeln('РОМАН ЗАКРЫТ');
  chkRom := false;
  EXIT;
  _);
  _if g71z * [2] = [2] _then _(
  _if how  _then  write('ДЛЯ ВАС ');
  _goto 11150;
  _);
  l2v3z := date;
  l2v5z := l2v3z _DIV 10000;
 l2v3z := l2v3z - l2v5z * 10000;
 l2v4z := l2v3z _DIV 100;
 l2v3z := l2v3z - l2v4z * 100;
  _if zeller( l2v3z, l2v4z, l2v5z) > 4 _then EXIT;
 rdpg32( 41В, 1 );
 (*=c-*)l2v14z := g17z@[5];(*=c+*)
 l2v7z :=   txtTime;
 unpck(l2v8z[1], l2v7z );
 l2v2z := (ord(l2v8z[2]) * 10 + ord(l2v8z[3])) * 2 + (ord(l2v8z[5]) * 10 + ord(l2v8z[6])) _div 30 ;
 _if _not (l2v2z _IN l2v14z) _then _(
 chkRom := false;
 _if how  _then  writeln('РОМАН СЕЙЧАС ЗАКРЫТ');
 _repeat
 l2v2z := l2v2z + 1;
 _if l2v2z _IN l2v14z _then _(
 _if how _then _(
 write('ОТКРОЕТСЯ В ');
 l2v1z := shift(l2v2z, 1);
 l2v2z := (l2v2z - l2v1z*2) * 30; 
 prDec2( l2v1z );  write(dot); prDec2( l2v2z );
 writeln(' - СЕЙЧАС', txtTime);
  _);
 EXIT;
  _);
  _until l2v2z >= 47;
 _if how _then writeln('СЕГОДНЯ НЕ ОТКРОЕТСЯ');
 _)
_);

_proced ROMAN;
_var l2v1z, l2v2z, l2v3z, l2v4z, l2v5z, l2v6z, l2v7z, l2v8z, l2v9z, l2v10z, l2v11z:integer;
l2v12z:unp6;
l2v18z, l2v19z:boolean;

_function F11273:integer;
_(
  _if l2v6z = 6 _then _(
   l2v6z := 1;
   _if l2v7z = 1024 _then _(  MORE; _GOTO 12450 _);
   unpck(l2v12z[1], g17z@[l2v7z] );
   l2v7z := l2v7z + 1;
  _) _else  l2v6z := l2v6z + 1;
 F11273 := ord(l2v12z[l2v6z]);
_);

_( (* ROMAN *)
  l2v19z := false;
  _if g26z = 0 _then _(  writeln('СЕГОДНЯ НЕЛЬЗЯ'); EXIT _);
  _if g71z * [3] <> [3] _then _(
 _if prn _then _(
 prn := false;
 screen := true;
  code(сч13=зч76013,);
 writeln('ПЕЧАТЬ ОТКЛЮЧЕНА');
  _);
  l2v18z := g26z <= (7 - 4);
  l2v19z := _not chkRom( l2v18z);
 _if l2v18z _and l2v19z _then EXIT;
  _);
 l2v8z := (400);
 rdpg32( 44В, l2v8z );
 l2v6z := 6;
 l2v7z := 0;
  _repeat l2v11z :=   F11273 _until l2v11z _in digit;
  l2v4z := 0; l2v5z := ;
  _while l2v11z _in digit _do _( l2v4z := l2v4z * 10 + l2v11z; l2v11z :=   F11273 _);
  l2v11z :=   F11273;
  _while l2v11z _in digit _do _( l2v5z := l2v5z * 10 + l2v11z; l2v11z := F11273 _);
  _if INP@ = 'C' _then _(
  writeln('ВЫП  КВТ  ИГР  СУМ':22);
  l2v9z := 0;
  l2v10z := ;
  _for l2v3z := l2v4z _to l2v5z _do _(
  rdpg32( 44В, (((400) + l2v3z) - l2v4z) );
 l2v2z := sel(g17z@[1023], 0, 12);
 l2v1z := sel(g17z@[1023], 12, 12);
  write(l2v3z:7, l2v1z:5,  l2v2z:5, (l2v1z + l2v2z):5 );
 MORE;
 l2v10z := (l2v10z + l2v1z);
 l2v9z := (l2v9z + l2v2z);
  _);
  writeln('СУММА':7, l2v10z:5, l2v9z:5, (l2v10z + l2v9z):5);
  EXIT
  _); (* 11470 *)
  _if (INP@ = etx) _then _(
  writeln('НОМЕР ВЫПУСКА ? ЕСТЬ: ', l2v4z:1, ' - ', l2v5z:1);
  TTIN( false );
  _);
  l2v3z :=   getNum( 10 );
 _if (l2v3z < l2v4z) _then _( 
  write('ВЫПУСКА ', l2v3z:1, ' УЖЕ НЕТ');
 L3726;
 _GOTO 12450;
  _);
  _if (l2v3z > l2v5z) _then _(
  write('ВЫПУСКА ', l2v3z:1, ' ЕЩЕ НЕТ');
  L3726;
  _GOTO 12450;
  _);
  _if (l2v3z > l2v4z) _then _(
  l2v8z := ((l2v8z + l2v3z) - l2v4z);
  rdpg32( 44В, l2v8z );
  l2v6z := 6;
  l2v7z := 0;
  _);
  (L11545) _(
 l2v11z :=   F11273;
  _select
  (l2v11z = ord(eot)) :  _(  L3726;  _exit L11545  _);
  (l2v11z > (128)) : _(
  l2v2z := (l2v11z - (128));
  _for l2v1z := 1 _to l2v2z _do write(sp);
  _);
  (l2v11z = ord(eol)) : L3726;
  true: write(chr(l2v11z))
  _end; _goto L11545;
  _);
   g26z := (g26z - (1));
  stats( 6 );
  ins(g73z, g26z, 32, 3);
  _if l2v19z _then l2v1z := 4096 _else l2v1z := 1;
   g18z@[1023] := g18z@[1023] + l2v1z;
  wrpg32( 44В, l2v8z );
  l2v1z := g70z _mod 128 * 8;
  l2v2z := shift(g70z, 7) + 1;
  enq41;
  rdpg32( 41В, l2v2z );
  _if g17z@[l2v1z] = userID _then _(
  ins(g17z@[l2v1z+4], g26z, 21, 3);
  wrpg32( 41В, l2v2z );
  _);
 deq41;
_);

_proced NOTIMP; _( writeln('ПРИКАЗ НЕ РЕАЛИЗОВАН') _);

_proced ПЕЧ; _label 1, 2;
_var l2v1z:integer;
_(
 stats( 19 );
  _select 
  (INP@ = 'Д') : _(
 1: l2v1z := 2;
  code(лс76013=зч76013,);
 writeln('ВКЛЮЧЕНА ПЕЧАТЬ АЦПУ');
 prn := true;
 _if g89z _then _(  code(сч=э06276,); g89z := false;  _);
  _);
  (INP@ = 'Н') : _(
  2: prn := false;
 writeln('ВЫКЛЮЧЕНА ПЕЧАТЬ АЦПУ');
  code(сч76013=лу13,зч76013=);
  _);
  (INP@ = etx) : _(
  _if prn _then _goto 2 _else _goto 1;
  _);
  true:  writeln('НЕПОНЯТНО')
  _end
 _);

_proced ЭКР; _label 1, 2;
_var l2v1z:integer;
_(
 stats( 20 );
  _select 
  (INP@ = 'Д') : _(
 1: screen := true;
  code(лс76013=зч76013,);
 writeln('ВКЛЮЧЕНА ВЫДАЧА НА ЭКРАН');
  _);
  (INP@ = 'Н') : _(
  2: screen := false;
 writeln('ВЫКЛЮЧЕНА ВЫДАЧА НА ЭКРАН');
  l2v1z := 2;
  code(лу76013=зч76013,сч=зч77015,);
  _);
  (INP@ = etx) : _(
  _if screen _then _goto 2 _else _goto 1;
  _);
  true:  writeln('НЕПОНЯТНО')
  _end
_);

_proced updStat;
_var l2v1z, l2v2z:integer;
_(
 code(Э0634=,);
 l2v1z := ;
 l2v1z := (l2v1z - g19z);
  _if l2v1z < 0 _then EXIT;
 code(Э05310=,);
 l2v2z := ;
 l2v2z := (l2v2z - g20z);
  _if l2v2z < 0 _then EXIT;
 g21z := shift(l2v1z, 2);
 stats( 31 );
  (q); g21z := shift(l2v2z, 9);
 stats( 33 );
 _);

 _proced init;
_var l2v1z, l2v2z, l2v3z, i, l2v5z, l2v6z, l2v7z, l2v8z:integer;
name, l2v10z:alfa;
l2v11z:boolean;
l2v12z, l2v13z:alfa;
_(
 getVol( 1, 44В );
 rdpg32( 44В, 384 );
 nSect := 0;
 l2v1z := ;
 _for i := 1 _to 7 _do _(
 l2v11z := false;
  name := g28z.r[i];
 l2v2z := 1;
 l2v10z :=   trim( name );  
 _if (l2v10z = 'БЭС   ') 
 _or (l2v10z = 'ЗУ    ') 
 _or (l2v10z = 'ЯЗ    ') 
 _or (l2v10z = 'РУБ   ') 
 _or (l2v10z = 'ВЫС   ') 
 _or (l2v10z = 'ЖУР   ') 
 _or (l2v10z = 'ПРЕ   ') 
 _or (l2v10z = 'АВТ   ') 
 _or (l2v10z = 'ЮМО   ') 
 _or (l2v10z = 'ДОЛ   ') _then  l2v5z := 0
  _else _( l2v1z := l2v1z + 1; l2v5z := ; _);
  
  (loop) _while (g17z@[l2v2z] <> '000000') _do _(
  _if g17z@[l2v2z] = name _then _(
  l2v8z := sel(g17z@[l2v2z + 1], 24, 24) + 384;
  l2v11z := true;
  _exit loop;
  _);
 l2v2z := l2v2z + 2;
  _if l2v2z > 1021 _then  _exit loop;
  _);
  _if l2v11z _then _(
  nSect := nSect + 1;
 g49z[nSect] := l2v8z;
 catal[nSect] := name;
 g42z[nSect] := l2v5z;
 l2v13z := g35z[i];
  g63z[nSect] := l2v13z <> 'ПЕЧ   ';
  _);
  _); (* 12110 *)
_);

_proced exec(loc:integer);
_proced P12111(_var l3a1z:text; _var l3a2z: integer; l3a3z:integer);_( code(пб76022=,) _);
_(
 _if 13 _IN g85z _then _( g12z := false; g85z := g85z - [13] _);
 _if g12z _then  _GOTO 13074;
  _if _not (2 _IN g85z) _then writeln( ornam:18, 'ВЫ ВЫШЛИ ИЗ БЛОКА БИБЛИОТЕКИ  ', ornam);
 _if (loc <> signal) _and (loc <> ban) _then  stats( 22 );
 updStat;
 P12111( INP, g70z, area);
 _);

_proced enter;
_proced P12161(_var l3a1z:text; _var l3a2z:integer; l3a3z:integer); _( code(пб76021=) _);
_(
 P12161( INP, g70z, area);
  g26z := sel(g73z, 32, 3);
  g14z := toHex(librID * 100) = userID;
  admin := userID = '417700';
 init;
  _if 2 _IN g85z _then g85z := g85z - [2] _else _(
  writeln( ornam:18, '  ВЫ ВОШЛИ В БЛОК БИБЛИОТЕКИ  ', ornam);
  _if L5472(1) _and inCatal( 'DОL   ') _then  DOL( true );
  _);
 _GOTO 12453;
 _);
_proced secret(mode:boolean);
 _(
   code(иа76403=сч,17зч1=сч13,сд/-45/=17лу1,17ср1=17зч1,2сч3=сд/-45/,17лс1=иа76403,зч=)
_);

_proced passwd(_var l2a1z:alfa);
_var l2v1z:unp6; l2v7z:integer;
_(
 writeln('ПАРОЛЬ ?'); secret( true ); BIND(' --> {172'); secret( false );
 _for l2v7z := 1 _to 6 _do
  _if input@ = etx _then  l2v1z[l2v7z] := sp
  _else  _( l2v1z[l2v7z] := input@; get(input) _);
 pck(l2v1z[1], l2a1z);
 _);

 _proced getName(_var ret:alfa);
_var a:unp6; i:integer; w:alfa;
_(
 L3576;
 _if _not (INP@ _in letter) _then _( writeln('ОШИБКА В ИМЕНИ');  _GOTO 12450 _);
 w := sp6;
 unpck(a[1], w );
 i := 1;
  _while ((INP@ _in letter) _or (INP@ _in digit)) _and (i < 7) _do _( 
  a[i] := INP@;
  get(INP);
 i := i + 1;
  _);
  pck(a[1], ret);
  _while (INP@ _in letter) _or (INP@ _in digit) _do get(INP);
  L3576;
 _);

_proced skip;
_var dummy:boolean;
_(
 reset(INP);
 dummy := getCmd( cmd, 3 );
 dummy := (cmd = 'БИБ   ') _and getCmd( cmd, 3 );
 _);

_proced getRAM(n:integer);_var i:integer;
_(
  code(ви=Э0650,уи7=7Э06550,); i := ;
  i := sel(i, 41, 6);
  _if i < n _then _(
    i := n - i;
    code(=Э050177,); i := ;
    _if i <> 0 _then _(  writeln('НЕТ РЕСУРСА ПАМЯТИ. ПОПРОБУЙТЕ ЕЩЕ РАЗ.'); _GOTO 12450 _);
  _);
_);

_(
  g28z := [ 'РУБРИК', rub2, rub3, rub4, rub5, rub6, 'ЮМОР  '];
  g17z := _NIL;
  g18z := ;
  g21z := 1;
  code(Э0634=,); g19z := ; code(Э05310=,);  g20z := ;
  code(сч76233=); g11z := ;
  g12z := true; g27z := 0;
  _if (g11z <> 'ТАМБОВ') _then code(сч=Э0620,) _else enter;
12450:
  limit;
   TTIN( true );
  g12z := false;
 12453:
   _if getCmd(cmd, 3) _then _select
  ('СТА   ' = cmd) :  exec( 5420111C );
  ('КОН   ' = cmd) :  12465: exec( 3420213C );
  ('ПЕЧ   ' = cmd) :  ПЕЧ;
  ('ЭКР   ' = cmd) :  ЭКР;
  ('ПОЧ   ' = cmd) :  exec( 5420001C );
  ('БИБ   ' = cmd) : _if INP@ = etx _then _goto 12450 _else _goto 12453;
  ('ИНФ   ' = cmd) :  INF;
  ('ШКО   ' = cmd) :  SCHOOL;
  ('ИДИ   ' = cmd) :  GOSTEP;
  ('РОМ   ' = cmd) : _(  getVol( 3, 44В ); _if volNum(4,4) = 0 _then  noCmd _else ROMAN _);
  ('СИГ   ' = cmd) : _(
  g12z := false; g85z := g85z + [2]; getVol(2, 44В); getRAM(15); exec( signal )
  _);
  ('БАН   ' = cmd) : _(
  passwd( g11z );
   _if (g11z <> 'СОФИЯ ') _then _(  writeln('НЕВЕРНЫЙ ПАРОЛЬ'); _goto 12450 _);
   g12z := false;
   getVol( 2, 44В );
   exec( ban );
  _);
  (РУБ = cmd) : _(
  stats( 11 );
  g13z := INP@ = etx;
  display( cmd );  skip;
  display( RUВ2 ); skip;
  display( RUВ3 ); skip;
  display( RUВ4 ); skip;
  display( RUВ5 ); skip;
  display( RUВ6 );
  _if _not g13z _then  notFound( true );
  _);
  ('СПР   ' = cmd) : _(
  g12z := false; 
  stats( 13 );
  getVol( 4, 52В );
  g74z := volNum(5,2);
  exec( 6420075C );
  _);
  ('ФАЙ   ' = cmd) : _(
  g16z := false;
  _if INP@ _in letter _then (a) _(
  g16z := true; getName( cmd );
  _for curSec := 1 _to nSect _do _if cmd = catal[curSec] _then _exit a;
  writeln('В КАТАЛОГЕ НЕТ ИМЕНИ ', cmd);
  _goto 12450;
  _) (* 12653 *) _else 
  _if INP@ _in digit _then _(
  g24z :=   getNum( 8 );
  _if INP@ = 'В' _then get(INP);
  g25z :=   getNum( 8 );
 _if (g24z > 677777C) _or (g24z < 300000C) _or (g25z = 0) _then _(
  writeln('ОШИБКА В ЗАКАЗЕ ФАЙЛА');
  _goto 12450;
  _)
  _) _else _(
  writeln('ДАЙТЕ ИМЯ ФАЙЛА');
  write('ЕСТЬ:');
  _for curSec := 1 _to nSect _do _(
    write(catal[curSec]: 7);
    _if curSec _MOD 5 (* really 4 *) = 0 _then _(
      writeln; _if curSec <> nSect _then write('     ')
    _)
  _);
  _if (nSect _MOD 5 (* really 4 *) <> 0) _or (nSect = 0) _then writeln;
  _goto 12450
  _);
  _if _not g14z _and _not admin _and _not (26 _in g83z) _then _( 
    passwd( cmd );
    _if (cmd <> 'СОФИЯ ') _then _(  writeln('НЕВЕРНЫЙ ПАРОЛЬ'); _goto 12450 _);
  _);
  getRAM(16);
 _if g16z _then  getVol(1, 44В );
  g85z := g85z  + [2];
 g12z := false;
 g83z := g83z + [26];
 exec( reader );
  _);
  ('ВЫС   ' = cmd) : _(  stats( 4 ); display( cmd ) _);
  (ЖУР = cmd) : _(  stats( 5 ); g13z := INP@ = etx;
  display( cmd ); skip; display( JUR ); skip;
  _if _not g13z _then  notFound( true );
  _);
  ('КАР   ' = cmd) : NOTIMP;
  ('ПРЕ   ' = cmd) : _( stats( 7 ); display( cmd ) _);
  ('АВТ   ' = cmd) : _( stats( 8 ); display( cmd ) _);
  ('БЕН   ' = cmd) : _( stats( 3 ); display( cmd ) _);
  ('ЮМО   ' = cmd) : _( stats( 9 );
  _if INP@ _in digit _then  writeln(' .....ПОЕЗД УШЕЛ.....') _else display( cmd );
  _);
  ('ДОЛ   ' = cmd) : _( stats( 10 ); display( cmd ) _);
  ('DОL   ' = cmd) : DOL( true );
  ('ЗАК   ' = cmd) : ZAKAZ;
  ('ПОК   ' = cmd) : SHOW;
  ('НОВ   ' = cmd) : NEWS;
  ('ВЫХ   ' = cmd) : _goto 12465;
  inCatal(cmd) : display( cmd );
  true: _if g12z _and _not (13 _in g85z) _then   13074: writeln('В БЛОКЕ НЕТ ПРИКАЗА ', cmd)
  _else _goto 12465
  _end _else writeln('НЕ ПОНИМАЮ');
  _goto 12450;
  noCmd;
_).
