#!/usr/bin/env python3
"""Generate the 1024 tagged words of a replacement KALAH opening book."""
import argparse
import hashlib
import json
from pathlib import Path
import struct

from kalah_book import generate


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--depth', type=int, default=4)
    parser.add_argument('--output', type=Path, default=Path('build/bega/opening.bin'))
    args = parser.parse_args()
    page,report = generate(args.depth)
    data = struct.pack('<1024Q',*page)
    report['sha256'] = hashlib.sha256(data).hexdigest()
    args.output.parent.mkdir(parents=True,exist_ok=True)
    args.output.write_bytes(data)
    args.output.with_suffix('.json').write_text(json.dumps(report,ensure_ascii=False,indent=2)+'\n')
    print(f'{args.output}: {report["histories"]} histories, depth {args.depth}, {report["searches"]} searches')


if __name__ == '__main__':
    main()
