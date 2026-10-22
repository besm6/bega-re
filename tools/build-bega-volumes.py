#!/usr/bin/env python3
"""Build a private read-only PULT/JINN volume for the original BEGA games."""
import argparse
import hashlib
import json
from pathlib import Path

from monitor import monitor, BASE, CONTEXT
from volume import ZONE, MASK, GOST, gost, words, put, catalog

ROOT = Path(__file__).resolve().parents[1]


def digest(data):
    return hashlib.sha256(data).hexdigest()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--source', type=Path, default=Path('/usr/local/share/besm6/2148'))
    parser.add_argument('--output', type=Path, default=ROOT/'build/bega/volumes')
    args = parser.parse_args()
    args.output.mkdir(parents=True, exist_ok=True)
    for name in ('2068', 'bega.bin', 'provenance.json'):
        if (args.output/name).exists():
            parser.error(f'{args.output/name} exists; select a new --output directory')
    original = args.source.read_bytes()
    header = words(original, 0o1125)
    if header[1] & MASK != gost('БЕГА') or header[5] & MASK != 0o11346:
        parser.error('unexpected BEGA header at source zone 01125')
    if header[6] & MASK != 5:
        parser.error('unexpected BEGA image length')
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
    copy(0o1125, 0o125, 5, 'БЕГА')
    copy(0o1137, 0o137, 1, 'ТАБЛИЦА ШАШЕК')
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
    entries.append((gost('ИГРА'), 0o101 << 24 | 1))
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
    put(image, 0o100, catalog('ИГРА', [('ИГРА', 1, 1), ('МОНИТ', 2, 1),
                                    ('РЕЗИД', 4, 1), ('БЕГА', 0o25, 5),
                                    ('ШАШТАБ', 0o37, 1)]))
    code = monitor(target=0o5400125, output_base=0o71000)
    monitor_words = code.build()
    context = [0]*62
    context[0] = 1
    context[1] = 1 << (47-3)       # SET [3]: games open regardless of the clock
    context[8] = 100000000         # gl30z, session CPU budget in 1/50 sec
    context[9] = gost('УЧЕБА')
    context[11] = gost('501300')
    context[19] = 1                # awake; hardcopy stays disabled
    for i, value in enumerate(context):
        monitor_words[CONTEXT-BASE+i] = value | (2 << 48)
    command = [2 << 48]*1024
    for i, ch in enumerate('ИГР'):
        command[i] |= GOST.index(ch)
    command[3] |= 0o377
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
    binary = b''.join((w & MASK).to_bytes(6, 'big')
                     for z in range(0o1125, 0o1132) for w in words(original,z))
    (args.output/'2068').write_bytes(image)
    (args.output/'bega.bin').write_bytes(binary)
    report = dict(source=str(args.source.resolve()), source_sha256=digest(original),
                  copied=copied, binary=dict(zone='1125', count=5, end='11346',
                      sha256=digest(binary), equals_repository_bega_o=binary==(ROOT/'bega.o').read_bytes()),
                  patches=[dict(zone='0000', reason='minimal catalog and game launcher'),
                           dict(zone='0035', word='0012', old='0010010000402667',
                                new='0010010000400037', reason='archive list relocation')],
                  runtime_setup=dict(output_buffer='71000',
                                     reason='BEGA landMsg uses 71000 explicitly'),
                  volume_sha256=digest(image))
    (args.output/'provenance.json').write_text(json.dumps(report, ensure_ascii=False, indent=2)+'\n')
    if digest(args.source.read_bytes()) != report['source_sha256']:
        raise RuntimeError('source changed during build')
    print(f'Created {args.output}/2068: original BEGA, checkers table and PULT/JINN host')


if __name__ == '__main__':
    main()
