#!/usr/bin/env python3
"""Solve BEGA's French checkers by retrograde analysis of all 2640 states."""
import argparse
import hashlib
from itertools import combinations
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
BINARY_SHA256 = 'ca3240e2a12b7ad7e3bf7a56fe80f8cdc8df80b0be58bc40e690e2689662374e'
WHITE, BLACK = 0, 1

# P6165, machine addresses 06165–06232: 18 directed edges for white.
# These pairs were checked against bega.o with disbesm6 and dtran.
PAIRS = ((0,2), (0,3), (1,5), (1,6), (2,1), (2,5), (3,2), (3,5),
         (4,9), (5,4), (5,7), (5,8), (5,9), (6,5), (7,10), (8,7),
         (8,10), (9,8))
# validate, 06233–06326, also permits n -> n+1; black can reverse edges.
WHITE_EDGES = set(PAIRS) | {(i,i+1) for i in range(10)}
BLACK_EDGES = WHITE_EDGES | {(b,a) for a,b in WHITE_EDGES}


def moves(state):
    """Return (next state, move) pairs; state = (sorted whites, black, turn)."""
    white, black, turn = state
    occupied = set(white) | {black}
    if black == 0:
        return []
    if turn == WHITE:
        return [((tuple(sorted(set(white)-{a}|{b})), black, BLACK), (a,b))
                for a in white for x,b in sorted(WHITE_EDGES)
                if x == a and b not in occupied]
    return [((white, b, WHITE), (black,b)) for a,b in sorted(BLACK_EDGES)
            if a == black and b not in occupied]


def solve():
    states = [(white,black,turn)
              for white in combinations(range(11),3)
              for black in range(11) if black not in white
              for turn in (WHITE,BLACK)]
    successors = {s:moves(s) for s in states}
    # Rank zero: black is trapped. All black-at-zero positions are black wins.
    winning = {s:0 for s in states
               if s[1] != 0 and s[2] == BLACK and not successors[s]}
    rounds = 0
    while True:
        added = {}
        for state in states:
            if state in winning or state[1] == 0 or not successors[state]:
                continue
            children = successors[state]
            if state[2] == WHITE:
                ranks = [winning[v] for v,_ in children if v in winning]
                if ranks:
                    added[state] = 1 + min(ranks)
            elif all(v in winning for v,_ in children):
                added[state] = 1 + max(winning[v] for v,_ in children)
        if not added:
            break
        winning.update(added)
        rounds += 1

    # Certificate: white can strictly reduce rank; black cannot prevent it.
    # Outside the attractor, black can stay outside or reach its goal. Infinite
    # avoidance eventually repeats a state, which is a black win under the rules.
    for state in states:
        children = successors[state]
        if state in winning:
            rank = winning[state]
            if rank == 0:
                assert state[1] != 0 and state[2] == BLACK and not children
            elif state[2] == WHITE:
                assert rank == 1 + min(winning[v] for v,_ in children if v in winning)
            else:
                assert all(v in winning for v,_ in children)
                assert rank == 1 + max(winning[v] for v,_ in children)
        elif state[1] != 0 and children:
            if state[2] == WHITE:
                assert all(v not in winning for v,_ in children)
            else:
                assert any(v not in winning for v,_ in children)
    return successors, winning, rounds


def describe(root, successors, winning):
    def outcome(state):
        return 'white' if state in winning else 'black'

    result = dict(winner=outcome(root), white_win_plies=winning.get(root),
                  first_moves=[dict(move=move, winner=outcome(child),
                                    plies=winning.get(child))
                               for child,move in successors[root]])
    state, line, seen = root, [], set()
    while state not in seen and successors[state]:
        seen.add(state)
        children = successors[state]
        if state in winning:
            if state[2] == WHITE:
                child,move = min(((v,m) for v,m in children if v in winning),
                                 key=lambda item:winning[item[0]])
            else:
                child,move = max(children, key=lambda item:winning[item[0]])
        else:
            child,move = next(((v,m) for v,m in children if v not in winning),
                              children[0])
        line.append(('white' if state[2] == WHITE else 'black', move))
        state = child
    result.update(line=line, last=state)
    return result


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--binary', type=Path, default=ROOT/'bega.o',
                        help='reviewed raw BEGA image; checked by SHA-256')
    parser.add_argument('--output', type=Path, default=ROOT/'build/bega/checkers-solution.json')
    args = parser.parse_args()
    binary_hash = hashlib.sha256(args.binary.read_bytes()).hexdigest()
    if binary_hash != BINARY_SHA256:
        parser.error('binary differs from the image against which the move graph was checked')
    successors, winning, rounds = solve()
    roots = {name:describe(((0,1,3),5,turn), successors, winning)
             for name,turn in (('white_first',WHITE), ('black_first',BLACK))}
    report = dict(states=len(successors), white_win=len(winning), iterations=rounds,
                  binary=str(args.binary.resolve()), binary_sha256=binary_hash,
                  strategy_certificate_verified=True, roots=roots)
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report,ensure_ascii=False,indent=2)+'\n')
    for name,result in roots.items():
        print(f'{name}: {result["winner"]} wins; {result["white_win_plies"]} plies')
    print(f'{len(successors)} states; strategy certificate verified; report: {args.output}')


if __name__ == '__main__':
    main()
