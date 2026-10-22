"""Generate a replacement opening page for the unmodified 2148 KALAH.

The board is relative to the player to move: six pits and store, then the
opponent's six pits and store. Pit numbers and capture follow exMvLogic.
This is a new depth-limited analysis, not the lost historical opening theory.
"""
from volume import gost

LIMIT = 8415
INITIAL = (6,)*6 + (0,) + (6,)*6 + (0,)


def play(board, pit):
    """Return (next relative board, extra turn); pit is 1..6."""
    b = list(board)
    at = pit-1
    stones = b[at]
    if not stones:
        raise ValueError('empty pit')
    b[at] = 0
    while stones:
        at = (at+1) % 14
        if at == 13:  # skip opponent's store
            continue
        b[at] += 1
        stones -= 1
    if at < 6 and b[at] == 1 and b[12-at]:
        b[6] += b[12-at] + 1
        b[at] = b[12-at] = 0
    extra = at == 6
    if not any(b[:6]) or not any(b[7:13]):
        b[6] += sum(b[:6])
        b[13] += sum(b[7:13])
        b[:6] = b[7:13] = [0]*6
    result = tuple(b)
    return (result if extra else result[7:]+result[:7]), extra


def legal(board):
    if not any(board[:6]) or not any(board[7:13]):
        return []
    return [i+1 for i in range(6) if board[i]]


def slot(index):
    # Original L5104 / L5241: the gap contains no legal opening histories.
    adjusted = index - 224 if index > 1547 else index
    return adjusted//8, (7-adjusted % 8)*6


def generate(depth=4):
    if depth < 1:
        raise ValueError('search depth must be positive')
    table = {}
    searched = 0

    def evaluate(b):
        if not legal(b):
            return (b[6]-b[13])*1000
        # Material, movable stones and immediate extra-turn opportunities.
        return (b[6]-b[13])*100 + sum(b[:6])-sum(b[7:13]) + 8*(
            sum(bool(b[i]) and (b[i]+i) % 13 == 6 for i in range(6)) -
            sum(bool(b[i+7]) and (b[i+7]+i) % 13 == 6 for i in range(6)))

    def search(b, d, alpha, beta):
        nonlocal searched
        searched += 1
        moves = legal(b)
        if d == 0 or not moves:
            return evaluate(b)
        key = b,d
        if key in table:
            value,flag = table[key]
            if flag == 'exact':
                return value
            if flag == 'lower':
                alpha = max(alpha,value)
            else:
                beta = min(beta,value)
            if alpha >= beta:
                return value
        old_alpha, old_beta = alpha,beta
        children = [(play(b,m),m) for m in moves]
        children.sort(key=lambda child: (child[0][1], b[child[1]-1]+child[1] == 7), reverse=True)
        value = -1000000
        for (child,extra),m in children:
            score = (search(child,d-1,alpha,beta) if extra else
                     -search(child,d-1,-beta,-alpha))
            value = max(value,score)
            alpha = max(alpha,value)
            if alpha >= beta:
                break
        flag = 'upper' if value <= old_alpha else 'lower' if value >= old_beta else 'exact'
        table[key] = value,flag
        return value

    page = [2 << 48]*1024
    occupied = {}
    histories = 0
    recommendations = {}

    def visit(b,index,history):
        nonlocal histories
        if index > LIMIT:
            return
        word,shift = slot(index)
        assert word != 35 and (word,shift) not in occupied, history
        occupied[word,shift] = history
        histories += 1
        moves = legal(b)
        if not moves:
            return
        scores = {}
        for m in moves:
            child,extra = play(b,m)
            scores[m] = (search(child,depth-1,-1000000,1000000) if extra else
                         -search(child,depth-1,-1000000,1000000))
        best = max(scores.values())
        chosen = [m for m in moves if scores[m] == best]
        # Six bits encode pits 1..6 from MSB to LSB (Pascal SET [1..6]).
        page[word] |= sum(1 << (6-m) for m in chosen) << shift
        if len(history) <= 1:
            recommendations[history or 'start'] = dict(moves=chosen, scores=scores)
        # Cover every legal user continuation, including moves not recommended.
        for m in moves:
            child,extra = play(b,m)
            visit(child,index*6+m,history+str(m))

    visit(INITIAL,0,'')
    page[35] |= gost('!ДЕБЮТ')
    report = dict(origin='generated replacement', depth=depth,
                  depth_unit='individual moves, including extra turns',
                  histories=histories, searches=searched, cached_positions=len(table),
                  recommendations=recommendations)
    return page,report
