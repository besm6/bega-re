# The main game module of JINN

The main game module of the information/entertainment interactive system "JINN" for BESM-6 consisted of the following parts:

1. Horse race simulation: A curses-like dynamic ASCII drawing of characters "racing" across the screen. This game (БЕГА) supplied the name of the Pascal program, compiled into the binary module.

2. Tic-tac-toe: Not really a game. A playing board (a grid of dots) was drawn on the screen, then the program would quit in a way that the grid was not disturbed. The terminal then could be swithced to the local (off-line) mode for a game of tic-tac-toe (КРЕСТИКИ), or rather Gomoku, coule be played between two people.

3. A variant of the [Fox and Hounds](https://en.wikipedia.org/wiki/Fox_games) game (ШАШКИ), referred to as "French Checkers" in the embedded tutorial.

4. A variant of the Lunar Lander game, said to be taken as a Pascal program from a computer exhibition. The provenance of the specific phrases used in it, e.g. "Next time bring along your Bible", or "Buck Rogers your (sic) not, but congratulations, you're down" could not be found. There was the original version (LANDING) as well as a Russian translation (ПОСАДКА), not without some translation blunders ("Turn in your spacesuit" after crashing 6 times, became, in the Russian version, "Put on your spacesuit").

In the program there were also references to a few other games, implemented as overlays. Only one of them, Kalah (КАЛАХ), has been [found](https://github.com/besm6/kalah-re) so far. The others are:

- "Inspector" (ИНСПЕКТОР): A variation on the theme of the [Inspector Clew-So](http://www.atarimania.com/game-atari-400-800-xl-xe-inspector-clew-so_2585.html) game.

- "Lotto" (ЛОТО): A variant of [Yahtzee](https://en.wikipedia.org/wiki/Yahtzee).

- "Glide path" (ГЛИССАДА): Reportedly an originally developed game imitating landing a plane allowing to control pitch, throttle and ailerons. ("The pilots has been poisoned by *a random selection of innocuous food, like boiled carrots*. The life of <N> passengers is in your hands...") It would draw the view of the landing strip in scale and perspective as ASCII graphics according to the distance and the altitude. No prototype has been found or suggested so far.

- "Cube" (КУБ): A Rubik's cube simulation. The program allowed to solve the cube by looking at the planar net or to experiment rotating it starting from the initial state. 

