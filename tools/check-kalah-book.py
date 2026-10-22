#!/usr/bin/env python3
"""Validate the packed book against every reachable original-format history.

Use an absolute 16-word board, as in the original exMvLogic, independently
of the relative 14-pit representation used by the generator.
"""
import argparse
from pathlib import Path

from volume import words, MASK, gost


def verify(page):
    assert page[35] & MASK == gost('!ДЕБЮТ')
    occupied = set()
    count = 0

    def visit(board, player, index):
        nonlocal count
        if index > 8415:
            return
        offset = index if index <= 1547 else index-224
        word,shift = offset//8, 42-6*(offset % 8)
        assert word != 35 and offset not in occupied, ('overlapping histories',index)
        occupied.add(offset)
        count += 1
        mask = page[word] >> shift & 63
        moves = [p for p in range(1,7) if board[player*8+p]]
        if not any(board[1:7]) or not any(board[9:15]):
            assert mask == 0
            return
        assert mask, ('empty recommendation',index)
        assert all(not (mask & (1 << (6-p))) or p in moves for p in range(1,7)), index
        for pit in moves:
            b = list(board)
            side,at = player,pit
            remaining = b[side*8+at]
            b[side*8+at] = 0
            while remaining:
                at += 1
                if at > (7 if side == player else 6):
                    side,at = 1-side,1
                b[side*8+at] += 1
                remaining -= 1
            extra = side == player and at == 7
            if side == player and at < 7 and b[side*8+at] == 1:
                opposite = (1-side)*8+7-at
                if b[opposite]:
                    b[player*8+7] += b[opposite]+1
                    b[opposite] = b[side*8+at] = 0
            assert sum(b) == 72, (index,pit,'stones lost')
            visit(b,player if extra else 1-player,index*6+pit)

    visit((0,)+(6,)*6+(0,0)+(6,)*6+(0,),0,0)
    assert count == 6548, count
    return count


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('volume', nargs='?', type=Path, default=Path('build/bega/volumes/2068'))
    args = parser.parse_args()
    print(f'PASS: {verify(words(args.volume.read_bytes(),0o153))} reachable opening histories; legal nonempty masks, no overlap')


if __name__ == '__main__':
    main()
