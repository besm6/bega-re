# The main game module of JINN

## Общий вход в ДЖИН

```sh
make demo-jinn
./run-jinn.sh
./run-jinn.sh < sessions/jinn/library.txt
make inventory-jinn
```

На 2148 найден оригинальный блок-переключатель **МОСТ** (`1010–1011`),
соответствующий `switch.pas`. Новый запуск начинается с его запроса `==>`.
Он сам вызывает СТАТ, ШКОЛУ и игры. Например:

```text
ДАТА 31.12.83
КАЛ 31.12.83
КОН
ИГРА
ШАШКИ
```

На верхнем уровне `КАЛ` означает календарь. Для КАЛАХ сначала войдите
через `ИГРА`, затем дайте `КАЛ ТРЕН У ДЖИН`.
`БИБЛ` открывает библиотеку с местными примерами; `ШКО ДАТА` — справку.
`КОН` из подблока возвращает к запросу ДЖИНа, `КОН` на верхнем уровне
завершает задание с сообщением `ДО СВИДАНИЯ !`.

Первоначальный блок **ПУСК** и его рабочие архивы пока не найдены;
это запуск найденного МОСТа с локальной адаптацией интерфейса оверлеев.
Карта находок на 2148/2248, проверенные команды и ограничения —
в [JINN.md](JINN.md). Примеры — в [sessions/jinn/README.md](sessions/jinn/README.md).

## Локальный запуск игр

```sh
make demo-bega
./run-bega.sh
./run-bega.sh < sessions/bega/races.txt
./run-bega.sh < sessions/bega/checkers-white.txt
./run-bega.sh < sessions/bega/landing-crash.txt
./run-bega.sh < sessions/bega/kalah-book-exit.txt
make check-bega
```

Бинарник `БЕГА` найден на **2148:1125–1131** и **2248:1125–1131**.
Образы побитово одинаковы и совпадают с `bega.o`.
Запускалка использует частный том `build/bega/volumes/2068`
и свой HOME. На нём находятся ПУЛЬТ, АДСИС, резидент ДЖИН, БЕГА,
таблица шашек и оригинальные оверлеи КАЛАХ (`2148:1230–1235`)
и ШККАЛ (`1236–1237`). Для КАЛАХ создаётся новая дебютная база;
его учёт игроков сохраняется в локальной зоне `1013`. Устройство 40
подключено без записи, 66 — с записью на тот же том. Других томов данных нет.

Нужны Python 3, `dispak` с `--725`, исходный том
`/usr/local/share/besm6/2148` и системный `2099` там же.
`DISPAK=/path/to/dispak` выбирает другой эмулятор.

В игровом блоке доступны `ПОСАДКА`, `LANDING`, `ШАШКИ`, `БЕГА`, `КРЕСТИКИ`, `КАЛАХ`.
Например, `КАЛ ТРЕН У ДЖИН` запускает тренировку категории У с первым
ходом компьютера; `КАЛ ТРЕН Э ПОЛЬЗ` — категории Э с первым ходом человека.
Категории Ю и К также доступны. `ШКО КАЛ` показывает правила;
на `ИДТИ?` отвечайте пустой строкой. `КОН` внутри партии завершает её,
следующий `КОН` возвращает из КАЛАХ в БЕГА.
`ШКО ИНФ` показывает общую справку, `ШКО БЕГ` — описание скачек.
`КОН` возвращает в ПУЛЬТ, `КОНЕЦ` завершает ПУЛЬТ.

Готовые сеансы и ответы на игровые вопросы описаны в
[sessions/bega/README.md](sessions/bega/README.md).
Происхождение образа, устройство запуска и проверка — в [BEGA.md](BEGA.md).
Генератор и формат новой дебютной базы — в [KALAH-BOOK.md](KALAH-BOOK.md).
`make check` проверяет и библиотечный, и игровой блоки.

## Локальный запуск библиотечного блока

```sh
make demo                        # собрать частные тома и проверить примеры
./run-bibl.sh                     # интерактивный запуск БИБЛ
./run-bibl.sh < sessions/example.txt
make check                       # проверить библиотеку и игры
```

Нужны Python 3, `dispak` с поддержкой `--725`, системный том `2099`
в `/usr/local/share/besm6` и исходный `2148` там же.
Другой эмулятор задаётся через `DISPAK=/path/to/dispak`.
По образцу `kadry-re` запускалка создаёт собственные тома и HOME,
входит в архив ПУЛЬТа и запускает оригинальный бинарник.

Примеры приказов:

```text
ИДИ 999
ИНФ
ЮМОР
ЮМОР (БИБЛИОТЕКАРЬ)
РОМАН 1
РОМАН 2
РОМАН С
НОВ
КОН
КОНЕЦ
```

`ИДИ 999` увеличивает шаг выдачи. При обычном шаге на запрос `ИДТИ?`
отвечайте отдельно. `КОН` возвращает в ПУЛЬТ, `КОНЕЦ` завершает задание.
`РОМАН` без аргумента спрашивает номер выпуска.

Бинарник `БИБЛ` найден на **2148:1172–1177**, резидент ДЖИН — на
**2148:0064**, АДСИС — на **2148:1006**. Числа зон здесь восьмеричные.
Образы программ на локальном томе сохраняют исходные слова и теги.
Это запуск исторической программы; перекомпиляция `bibl.pas` не выполняется.

Файлы создаются в `build/volumes/`:

| Файл | Назначение |
|---|---|
| `2068` | Минимальный ПУЛЬТ, АДСИС, БИБЛ и монитор запуска |
| `2048` | Каталог, два юмористических пункта и два выпуска романа |
| `2060` | Учебная запись пользователя и остаток квоты чтения |
| `bibl.bin` | Исходный БИБЛ: шесть зон, шесть байтов на слово |
| `provenance.json` | Хеши, происхождение и карта переноса зон |

Примеры вымышленные. Чтение романа сохраняет счётчик в `2048` и квоту
в `2060`. При каждом входе монитор выдаёт учебному пользователю семь чтений
и право читать независимо от расписания. `make check` работает с временными
томами и не расходует квоту постоянного экземпляра.

Для отдельного комплекта:

```sh
python3 tools/build-volumes.py --source /path/to/2148 --output /tmp/bibl/volumes
BIBL_VOLUMES=/tmp/bibl/volumes ./run-bibl.sh
```

Сборщик отказывается перезаписывать существующий комплект.
Соседние репозитории для запуска не нужны.
Формат данных, границы проверенных процедур, хеши и ограничения окружения
описаны в [BIBL.md](BIBL.md).

The main game module of the information/entertainment interactive system "JINN" for BESM-6 consisted of the following parts:

1. Horse race simulation: A curses-like dynamic ASCII drawing of characters "racing" across the screen. This game (БЕГА) supplied the name of the Pascal program, compiled into the binary module.

2. Tic-tac-toe: Not really a game. A playing board (a grid of dots) was drawn on the screen, then the program would quit in a way that the grid was not disturbed. The terminal then could be swithced to the local (off-line) mode for a game of tic-tac-toe (КРЕСТИКИ), or rather Gomoku, coule be played between two people.

3. A variant of the [Fox and Hounds](https://en.wikipedia.org/wiki/Fox_games) game (ШАШКИ), referred to as "French Checkers" in the embedded tutorial.

4. A variant of the Lunar Lander game, said to be taken as a Pascal program from a computer exhibition. The provenance of the specific phrases used in it, e.g. "Next time bring along your Bible", or "Buck Rogers your (sic) not, but congratulations, you're down" could not be found. There was the original version (LANDING) as well as a Russian translation (ПОСАДКА), not without some translation blunders ("Turn in your spacesuit" after crashing 6 times, became, in the Russian version, "Put on your spacesuit").

In the program there were also references to a few other games, implemented as overlays. Only one of them, Kalah (КАЛАХ), has been [found](https://github.com/besm6/kalah-re) so far. The others are:

- "Inspector" (ИНСПЕКТОР): A variation on the theme of the [Inspector Clew-So](http://www.atarimania.com/game-atari-400-800-xl-xe-inspector-clew-so_2585.html) game.

- "Lotto" (ЛОТО): A variant of [Yahtzee](https://en.wikipedia.org/wiki/Yahtzee).

- "Glide path" (ГЛИССАДА): Reportedly an originally developed game imitating landing a plane allowing to control pitch, throttle and ailerons. ("The pilots have been poisoned by *a random selection of innocuous food, like boiled carrots*. The life of *N* passengers is in your hands...") It would draw the view of the landing strip in scale and perspective as ASCII graphics according to the distance and the altitude. No prototype has been found or suggested so far.

- "Cube" (КУБ): A Rubik's cube simulation. The program allowed to solve the cube by looking at the planar net or to experiment rotating it starting from the initial state. 

