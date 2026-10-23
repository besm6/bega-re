#!/usr/bin/env python3
"""Inventory surviving JINN images on exact local 2148/2248 paths."""
import argparse
import hashlib
import json
from pathlib import Path

from volume import words,MASK,ZONE,GOST,gost

ROLES = {0o20:'СТАТ (earlier)',0o1010:'МОСТ',0o1070:'ДЖИН (ARFA loader)',
         0o1071:'ГОРОСК',0o1120:'СТАТ',0o1125:'БЕГА',0o1132:'ШКОЛА',
         0o1172:'БИБЛ',0o1230:'КАЛАХ',0o1236:'ШККАЛ'}


def digest(data):
    return hashlib.sha256(data).hexdigest()


def scan(path):
    data = path.read_bytes()
    programs = []
    zones = len(data)//ZONE-4
    # Search all word positions too, rather than assuming zone alignment.
    for zone in range(zones):
        page = words(data,zone)
        window = page + (words(data,zone+1)[:6] if zone+1<zones else [])
        for word in range(min(1024,len(window)-6)):
            h = window[word:word+7]
            if h[0]&MASK != 0o7727070700000000 or h[4]&MASK != gost('РАSСАL'):
                continue
            count = h[6]&MASK
            if not 1 <= count <= 32 or (zone+count)*1024+word > zones*1024:
                continue
            name = ''.join(GOST[b] if b<len(GOST) else '?' for b in (h[1]&MASK).to_bytes(6,'big'))
            payload = [w for z in range(zone,zone+count+(1 if word else 0)) for w in words(data,z)]
            payload = payload[word:word+count*1024]
            raw = b''.join((w&MASK).to_bytes(6,'big') for w in payload)
            tagged = b''.join(w.to_bytes(8,'little') for w in payload)
            programs.append(dict(zone=f'{zone:04o}',word=f'{word:04o}',name=name,
                                 role=ROLES.get(zone) if word==0 else None,
                                 end=f'{h[5]&MASK:05o}',pages=count,
                                 sha256=digest(raw),tagged_sha256=digest(tagged)))
    return dict(path=str(path.resolve()),sha256=digest(data),physical_zones=zones,programs=programs)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--2148',dest='source2148',type=Path,default=Path('/usr/local/share/besm6/2148'))
    parser.add_argument('--2248',dest='source2248',type=Path,default=Path('/usr/local/share/besm6/2248'))
    parser.add_argument('--output',type=Path,default=Path('build/jinn/inventory.json'))
    args = parser.parse_args()
    sources = {n:scan(p) for n,p in [('2148',args.source2148),('2248',args.source2248)]}
    for role in ROLES.values():
        found = [(n,p) for n,s in sources.items() for p in s['programs'] if p['role']==role]
        if not found:continue
        same = len(found)==2 and found[0][1]['tagged_sha256']==found[1][1]['tagged_sha256']
        print(f'{role}: '+', '.join(f'{n}:{p["zone"]} ({p["pages"]} pages)' for n,p in found)+
              ('; words/tags identical' if same else ''))
    args.output.parent.mkdir(parents=True,exist_ok=True)
    args.output.write_text(json.dumps(sources,ensure_ascii=False,indent=2)+'\n')


if __name__ == '__main__':
    main()
