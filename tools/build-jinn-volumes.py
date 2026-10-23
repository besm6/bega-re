#!/usr/bin/env python3
"""Build a local JINN subset entering the surviving original МОСТ dispatcher.

ПУСК is absent. МОСТ, STAT, games, school and library are unpatched copies.
Local glue adapts the old dispatcher to the later overlay interface.
"""
import argparse
import hashlib
import importlib.util
import json
from pathlib import Path
import subprocess
import sys

from monitor import BASE, CONTEXT
from jinn_monitor import monitor, BRIDGE
from volume import MASK,GOST,ZONE,gost,words,put,catalog

ROOT = Path(__file__).resolve().parents[1]


def digest(data):
    return hashlib.sha256(data).hexdigest()


def refresh_monitor(output):
    """Replace generated glue only, retaining the profile and all data zones."""
    path = output/'2068'
    image = bytearray(path.read_bytes())
    if words(image,0o100)[0]&MASK != gost('ДИАЛ'):
        raise ValueError(f'{path}: not a local JINN volume')
    old = words(image,0o102)
    host = monitor().build()
    offset = CONTEXT-BASE
    host[offset:offset+62] = old[offset:offset+62]
    if old == host:
        return False
    put(image,0o102,host)
    start = (0o102+4)*ZONE
    with path.open('r+b') as disk:
        disk.seek(start)
        disk.write(image[start:start+ZONE])
    provenance = output/'provenance.json'
    if provenance.exists():
        report = json.loads(provenance.read_text())
        report['hashes']['2068'] = report['volume_sha256'] = digest(image)
        provenance.write_text(json.dumps(report,ensure_ascii=False,indent=2)+'\n')
    print(f'Updated {path}: monitor only; profile and data retained')
    return True


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--source',type=Path,default=Path('/usr/local/share/besm6/2148'))
    parser.add_argument('--output',type=Path,default=ROOT/'build/jinn/volumes')
    parser.add_argument('--refresh-monitor',action='store_true',
                        help='update only the generated monitor on an existing JINN volume')
    args = parser.parse_args()
    if args.refresh_monitor:
        refresh_monitor(args.output)
        return
    if args.output.exists() and any(args.output.iterdir()):
        parser.error('output directory is not empty; select a new --output')
    subprocess.run([sys.executable,str(ROOT/'tools/build-bega-volumes.py'),
                    '--source',str(args.source),'--output',str(args.output)],check=True)
    source = args.source.read_bytes()
    image = bytearray((args.output/'2068').read_bytes())
    report = json.loads((args.output/'provenance.json').read_text())
    for start,dest,count,name,end in ((0o1120,0o120,5,'СТАТ',0o11316),
                                     (0o1132,0o132,5,'ШКОЛА',0o11703),
                                     (0o1172,0o172,6,'БИБЛ',0o13132),
                                     (0o1010,0o730,2,'МОСТ',0o3105)):
        header = words(source,start)
        if header[5]&MASK != end or header[6]&MASK != count:
            parser.error(f'unexpected {name} header at {start:04o}')
        payload = []
        for i in range(count):
            data = words(source,start+i)
            put(image,dest+i,data)
            payload.extend(data)
        raw = b''.join(w.to_bytes(8,'little') for w in payload)
        binary = b''.join((w&MASK).to_bytes(6,'big') for w in payload)
        (args.output/(dict(СТАТ='stat',ШКОЛА='school-main',БИБЛ='bibl',МОСТ='bridge')[name]+'.bin')).write_bytes(binary)
        report['copied'].append(dict(name=name,source=f'{start:04o}',destination=f'{dest:04o}',
                                     count=count,sha256=digest(raw)))
    system = words(image,0)
    for i in range(1,0o75,2):
        if system[i]&MASK == gost('ИГРА'):
            system[i] = gost('ДИАЛ') | (2 << 48)
    put(image,0,system)
    put(image,0o100,catalog('ДИАЛ',[('ДИАЛ',1,1),('МОНИТ',2,1),('РЕЗИД',4,1),
                                  ('СТАТ',0o20,5),('БЕГА',0o25,5),('ШКОЛА',0o32,5),
                                  ('БИБЛ',0o72,6),('КАЛАХ',0o130,6),('ШККАЛ',0o136,2)]))
    c = monitor()
    host = c.build()
    context = [0]*62
    context[0] = 1
    context[1] = 1 << (47-3)
    context[2] = 2068
    context[3] = 7 << 32
    context[8] = 100000000
    context[9] = gost('УЧЕБА')
    context[11] = gost('501300')
    context[16] = 2068
    context[17] = 2068  # old МОСТ retains the original unit-66 volume here
    context[19] = context[20] = 1
    for i,w in enumerate(context):
        host[CONTEXT-BASE+i] = w | (2 << 48)
    put(image,0o102,host)
    put(image,0o103,[2 << 48]*1024)
    # The old dispatcher transports the common 56-word prefix at 17700.
    high = [2 << 48]*1024
    for i,w in enumerate(context[:56]): high[0o1700+i] |= w
    high[0o1660] |= int.from_bytes(
        bytes([GOST.index(ch) for ch in 'RЕQ'])+bytes([0o377,0,0]),'big')
    high[0o1777] |= gost('ТАМБОВ')
    put(image,0o105,high)
    stub = words(image,0o101)
    stub[0o12] = (1 << 48) | ((0o700000 | 0o32) << 24)
    stub[0o13] = (1 << 48) | ((0o3000000 | BASE) << 24)
    stub[0o32] = (2 << 48) | 0o10070000400105
    put(image,0o101,stub)
    generated = []
    for zone in (0o140,0o150,0o155,0o162,0o640,0o1000,0o1015,0o1035,0o1200):
        page = [2 << 48]*1024
        entry = 'library_stub' if zone == 0o640 else 'missing_stub'
        page[7] = (1 << 48) | ((0o3000000 | c.labels[entry]) << 24)
        put(image,zone,page)
        generated.append(f'{zone:04o}')
    put(image,0o1011,[2 << 48]*1024)
    # Reuse the existing synthetic BIBL fixtures, with no ARFA dependency.
    spec = importlib.util.spec_from_file_location('bibl_volumes',ROOT/'tools/build-volumes.py')
    library = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(library)
    (args.output/'2048').write_bytes(library.sample_library())
    (args.output/'2060').write_bytes(library.sample_users())
    (args.output/'2068').write_bytes(image)
    report['entry'] = dict(name='МОСТ',target=f'{BRIDGE:o}',initial_command='RЕQ',
                          original_startup_present=False,original_bridge_present=True)
    report['generated_stubs'] = generated
    report['writable_zones'] = ['1011','1013']
    report['hashes'] = {v:digest((args.output/v).read_bytes()) for v in ('2068','2048','2060')}
    report['volume_sha256'] = report['hashes']['2068']
    (args.output/'provenance.json').write_text(json.dumps(report,ensure_ascii=False,indent=2)+'\n')
    if digest(args.source.read_bytes()) != report['source_sha256']:
        raise RuntimeError('source changed during build')
    print(f'Created {args.output}: original МОСТ, STAT, games, school and library')


if __name__ == '__main__':
    main()
