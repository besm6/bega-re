#!/usr/bin/env python3
"""Build private PULT/JINN volumes and sample BIBL data; never overwrite volumes."""
import argparse
import hashlib
import json
from pathlib import Path

from monitor import monitor, BASE, CONTEXT
from volume import ZONE, MASK, GOST, gost, words, put, catalog

ROOT = Path(__file__).resolve().parents[1]


def digest(data):
    return hashlib.sha256(data).hexdigest()


def text_bytes(text):
    """GOST text with explicit newline and end-of-text controls."""
    return bytes(0o175 if c == '\n' else 0o127 if c == '$' else GOST.index(c) for c in text)


def text_page(payload):
    if len(payload) > 1023 * 6:
        raise ValueError('text overlaps the counters in word 01777')
    payload = payload.ljust(1024 * 6, b'\0')
    return [int.from_bytes(payload[i:i+6], 'big') | (2 << 48)
            for i in range(0, len(payload), 6)]


def sample_library():
    image = bytearray((0o2000+4)*ZONE)
    put(image, 0o600, catalog('ТРОЯ', [('ЮМОР', 1, 1)]), 2048)
    humor = (text_bytes('21.10.26\n$1. ПРОГРАММИСТ\n') + bytes([0o204]) +
             text_bytes('ПРОГРАММИСТ СКАЗАЛ: ЕЩЕ ОДНА ОШИБКА - И МОЖНО СПАТЬ.\n'
                        '$2. БИБЛИОТЕКАРЬ\n'
                        'БИБЛИОТЕКАРЬ: ТИШИНА - ТОЖЕ ИНФОРМАЦИЯ.\n') + bytes([0o172]))
    put(image, 0o601, text_page(humor), 2048)
    # The first issue also contains the range header. The reader consumes its
    # two numbers, then starts displaying immediately after the second delimiter.
    first = (text_bytes('1-2\nРОМАН. ВЫПУСК 1\n') + bytes([0o204]) +
             text_bytes('КОРАБЛЬ ПРИБЫЛ НА ЛУНУ.\n'
                        'КАПИТАН ОТКРЫЛ КНИГУ И ЗАБЫЛ О ВРЕМЕНИ.\n') + bytes([0o172]))
    second = text_bytes('РОМАН. ВЫПУСК 2\nНА ЛУНЕ ОТКРЫЛАСЬ БИБЛИОТЕКА.\n') + bytes([0o172])
    for zone, data in ((0o620, first), (0o621, second)):
        put(image, zone, text_page(data), 2048)
    return image


def sample_users():
    image = bytearray((0o2000+4)*ZONE)
    page = [2 << 48]*1024
    # g70z=1 selects the second eight-word record in zone 1.
    page[8] |= gost('501300')
    page[12] |= 7 << 21
    put(image, 1, page, 2060)
    return image


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--source', type=Path, default=Path('/usr/local/share/besm6/2148'))
    parser.add_argument('--output', type=Path, default=ROOT/'build/volumes')
    args = parser.parse_args()
    args.output.mkdir(parents=True, exist_ok=True)
    for name in ('2068', '2048', '2060', 'bibl.bin', 'provenance.json'):
        if (args.output/name).exists():
            parser.error(f'{args.output/name} exists; select a new --output directory')
    original = args.source.read_bytes()
    header = words(original, 0o1172)
    if header[1] & MASK != gost('БИБЛ') or header[5] & MASK != 0o13132:
        parser.error('unexpected BIBL header at source zone 01172')
    if words(original, 0o64)[0o1451] & MASK != 0o1010000300360064:
        parser.error('unexpected JINN page-read helper at 0064:1451')
    image = bytearray((0o2000+4)*ZONE)
    copied = []

    def copy(source, destination, count, name):
        payload = []
        for i in range(count):
            data = words(original, source+i)
            put(image, destination+i, data)
            payload.append(b''.join(v.to_bytes(8, 'little') for v in data))
        copied.append(dict(name=name, source=f'{source:04o}', destination=f'{destination:04o}',
                           count=count, sha256=digest(b''.join(payload))))

    for zone in (0, 5, 6, 0o35, 0o36, 0o37, 0o40, 0o41, 0o51):
        copy(0o1000+zone, zone, 1, 'ПУЛЬТ')
    copy(0o1172, 0o172, 6, 'БИБЛ')
    copy(0o64, 0o104, 1, 'РЕЗИДЕНТ ДЖИН')
    system = words(image, 0)
    entries = []
    retained = {5, 6, 0o35, 0o36, 0o37, 0o40, 0o41, 0o51}
    for i in range(1, 0o75, 2):
        descriptor = system[i+1] & MASK
        if descriptor >> 24 in retained:
            entries.append((system[i] & MASK, descriptor))
    for i in range(1, 0o77):
        system[i] = 2 << 48
    entries.append((gost('БИБЛ'), 0o101 << 24 | 1))
    for i, (name, descriptor) in enumerate(entries):
        system[2*i+1] |= name
        system[2*i+2] |= descriptor
    system[0o377] = (2*len(entries)+1) | (2 << 48)
    put(image, 0, system)
    resident = words(image, 0o35)
    if resident[0o12] & MASK != 0o10010000402667:
        parser.error('unexpected PULT archive-list descriptor')
    resident[0o12] = (resident[0o12] & ~MASK) | 0o10010000400037
    put(image, 0o35, resident)
    put(image, 0o100, catalog('БИБЛ', [('БИБЛ', 1, 1), ('МОНИТ', 2, 1),
                                    ('РЕЗИД', 4, 1), ('ПРОГР', 0o72, 6)]))
    code = monitor()
    monitor_words = code.build()
    context = [0]*62
    context[0] = 1                    # user record
    context[1] = 1 << (47-3)         # Pascal SET element 3: privileged reading
    context[3] = 7 << 32             # seven issues per session
    context[8] = 100000000           # session time limit, 1/50 second
    context[9] = gost('УЧЕБА')
    context[11] = gost('501300')
    context[20] = 1                  # screen enabled, printer disabled
    for i, value in enumerate(context):
        monitor_words[CONTEXT-BASE+i] = value | (2 << 48)
    command = [2 << 48]*1024
    for i, ch in enumerate('БИБЛ'):
        command[i] |= GOST.index(ch)
    command[4] |= 0o377
    put(image, 0o102, monitor_words)
    put(image, 0o103, command)
    stub = [1 << 48]*1024
    stub[7] |= ((0o3000000 | 0o10) << 24) | 0x3a3a3a
    stub[0o10] |= (0o700000 | 0o30) << 24
    stub[0o11] |= (0o700000 | 0o31) << 24
    stub[0o12] |= (0o3000000 | BASE) << 24
    stub[0o30] = 0o10300000400102 | (2 << 48)
    stub[0o31] = 0o10310000400103 | (2 << 48)
    put(image, 0o101, stub)
    for name, data in (('2068', image), ('2048', sample_library()), ('2060', sample_users())):
        (args.output/name).write_bytes(data)
    binary = b''.join((w & MASK).to_bytes(6, 'big')
                     for z in range(0o1172, 0o1200) for w in words(original,z))
    (args.output/'bibl.bin').write_bytes(binary)
    report = dict(source=str(args.source.resolve()), source_sha256=digest(original),
                  copied=copied, binary=dict(zone='1172', count=6, end='13132',
                      sha256=digest(binary)),
                  patches=[dict(zone='0000', reason='minimal catalog and BIBL launcher'),
                           dict(zone='0035', word='0012', old='0010010000402667',
                                new='0010010000400037', reason='archive list relocation')],
                  samples=dict(humor='2048:0601', catalog='2048:0600',
                               roman=['2048:0620', '2048:0621'], user='2060:0001'),
                  hashes={v:digest((args.output/v).read_bytes()) for v in ('2068','2048','2060')})
    (args.output/'provenance.json').write_text(json.dumps(report, ensure_ascii=False, indent=2)+'\n')
    if digest(args.source.read_bytes()) != report['source_sha256']:
        raise RuntimeError('source changed during build')
    print(f'Created {args.output}: 2068 (program), 2048 (samples), 2060 (user)')


if __name__ == '__main__':
    main()
