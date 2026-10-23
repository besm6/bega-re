#!/usr/bin/env python3
"""Exercise the unpatched МОСТ and its surviving overlays on private disks."""
import hashlib
import importlib.util
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import tempfile

from volume import words,put,MASK,ZONE
from monitor import BASE,CONTEXT

ROOT = Path(__file__).resolve().parents[1]


def digest(data):return hashlib.sha256(data).hexdigest()


def main():
    volumes = ROOT/'build/jinn/volumes'
    if not (volumes/'provenance.json').exists():
        subprocess.run(['python3',str(ROOT/'tools/build-jinn-volumes.py')],check=True)
    p = json.loads((volumes/'provenance.json').read_text())
    original = Path(p['source']).read_bytes()
    assert digest(original)==p['source_sha256']
    relocated = (volumes/'2068').read_bytes()
    for entry in p['copied']:
        start,dest = int(entry['source'],8),int(entry['destination'],8)
        for i in range(entry['count']):
            expected,actual = words(original,start+i),words(relocated,dest+i)
            if dest+i==0:
                assert expected[0o77:0o377]==actual[0o77:0o377]
                assert expected[0o400:]==actual[0o400:]
            else:
                if dest+i==0o35:expected[0o12]=expected[0o12]&~MASK|0o10010000400037
                assert actual==expected,(entry,i)
    before = {v:digest((volumes/v).read_bytes()) for v in ('2068','2048','2060')}
    logs = ROOT/'build/jinn/logs';logs.mkdir(parents=True,exist_ok=True)
    checks = {}
    with tempfile.TemporaryDirectory(prefix='jinn-check-',dir=ROOT/'build/jinn') as temp:
        private = Path(temp)
        for v in ('2068','2048','2060'):shutil.copy2(volumes/v,private/v)
        previous = (private/'2068').read_bytes()
        subprocess.run(['python3',str(ROOT/'tools/build-jinn-volumes.py'),
                        '--output',str(private),'--refresh-monitor'],check=True)
        updated = (private/'2068').read_bytes()
        monitor_start = (0o102+4)*ZONE
        assert previous[:monitor_start]==updated[:monitor_start]
        assert previous[monitor_start+ZONE:]==updated[monitor_start+ZONE:]
        offset = CONTEXT-BASE
        assert words(previous,0o102)[offset:offset+62]==words(updated,0o102)[offset:offset+62]
        system = bytearray((private/'2068').read_bytes())
        for z in (0o1011,0o1013):put(system,z,[2 << 48]*1024)
        (private/'2068').write_bytes(system)
        spec=importlib.util.spec_from_file_location('fixtures',ROOT/'tools/build-volumes.py')
        fixtures=importlib.util.module_from_spec(spec);spec.loader.exec_module(fixtures)
        (private/'2048').write_bytes(fixtures.sample_library())
        (private/'2060').write_bytes(fixtures.sample_users())

        def session(name,required):
            commands=(ROOT/'sessions/jinn'/(name+'.txt')).read_text()
            result=subprocess.run([str(ROOT/'run-jinn.sh'),'-t'],input=commands,
                                  text=True,capture_output=True,timeout=30,
                                  env=dict(os.environ,JINN_VOLUMES=str(private)))
            for suffix,data in [('input',commands),('out',result.stdout),('trace',result.stderr)]:
                (logs/(name+'.'+suffix)).write_text(data)
            assert result.returncode==0,(name,result.stderr[-1500:])
            for error in ('АВОСТ','НЕ ПОНИМАЮ','НЕПОНЯТНО','ОШ.АДСИС','НЕТ БОБИНЫ','"ЧП"'):
                assert error not in result.stdout,(name,error,result.stdout)
            assert 'ДО СВИДАНИЯ !' in result.stdout,name
            for text in required:assert text in result.stdout,(name,text,result.stdout)
            assert '0010000000660730' in result.stderr and '0010010000660731' in result.stderr
            checks[name]=dict(passed=True,output_sha256=digest(result.stdout.encode()))
            return result

        basic=session('basic',['31 ДЕКАБРЯ 1983 - СУББОТА','НОЯБРЬ','ДЕКАБРЬ','ЯНВАРЬ','1984'])
        assert re.search(r'17770: \*70 .*0010000000400120',basic.stderr),'МОСТ did not load STAT itself'
        library=session('library',['ВЫ ВОШЛИ В ШКОЛУ ДЖИНА','П Р И К А З   Д А Т А',
                                    'ВЫ ВОШЛИ В БЛОК БИБЛИОТЕКИ','ПРОГРАММИСТ СКАЗАЛ:',
                                    'КОРАБЛЬ ПРИБЫЛ НА ЛУНУ.'])
        assert re.search(r'17770: \*70 .*0010000000400132',library.stderr)
        assert '0010000000660640' in library.stderr and '0010000000420172' in library.stderr
        assert words((private/'2048').read_bytes(),0o620)[1023]&MASK==1
        assert (words((private/'2060').read_bytes(),1)[12]>>21)&7==6
        kalah=session('kalah',['Т Р Е Н И Р О В О Ч Н А Я','МОЙ ХОД:',
                              'ПАРТИЯ НЕДОИГРАНА','31 ДЕКАБРЯ 1983 - СУББОТА'])
        assert [int(s) for s in re.findall(r'=\+\+>\s*([1-6])',kalah.stdout)]==[1,6]
        assert '0010320000400153' in kalah.stderr
        landing=session('landing',['РЕRFЕСТ LАNDING.','IМРАСТ VЕLОСIТУ ОF 3 F.Р.S.',
                                   'FUЕL LЕFТ 576 LВS.'])
        assert re.search(r'17770: \*70 .*0010000000400125',landing.stderr)
        missing=session('missing',['БЛОК НЕ НАЙДЕН. ВОЗВРАТ В ДЖИН.',
                                   '31 ДЕКАБРЯ 1983 - СУББОТА'])
        assert missing.stdout.count('БЛОК НЕ НАЙДЕН.')==3
        routing=session('routing',['31 ДЕКАБРЯ 1983 - СУББОТА',
                                   'П Р И К А З   Ш А Ш К И',
                                   'I0    I-----I2    I-----I5',
                                   'ИГРУ ВО ФРАНЦУЗСКИЕ ШАШКИ',
                                   'ВЫ ВОШЛИ В ШКОЛУ ДЖИНА'])
        assert routing.stdout.count('П Р И К А З   Ш А Ш К И')==2
        assert routing.stdout.count('ИГРУ ВО ФРАНЦУЗСКИЕ ШАШКИ')==2
        assert routing.stdout.count('НЕКОТОРЫЕ ОБЩИЕ СВЕДЕНИЯ О БЛОКЕ ИГР')==3
        assert len(re.findall(r'17770: \*70 .*0010000000400125',routing.stderr))==4
        assert len(re.findall(r'6[0-7]{4}: \*70 .*0010000000400125',routing.stderr))==1
        for error in ('НЕТ ТАКОГО ПРИКАЗА','В БЛОКЕ НЕТ ПРИКАЗА',' .  . '):
            assert error not in routing.stdout,(error,routing.stdout)
        after=(private/'2068').read_bytes()
        changed=[z for z in range(0o2000) if system[(z+4)*ZONE:(z+5)*ZONE]!=after[(z+4)*ZONE:(z+5)*ZONE]]
        assert changed==[0o1011,0o1013],changed
    assert before=={v:digest((volumes/v).read_bytes()) for v in before}
    assert digest(Path(p['source']).read_bytes())==p['source_sha256']
    report=dict(passed=True,sessions=checks,copied_words_and_tags=True,
                original_bridge_loads_overlays=True,private_writes=['2068:1011','2068:1013','2048:0620','2060:0001'],
                source_and_user_volumes_unchanged=True)
    (logs/'check.json').write_text(json.dumps(report,ensure_ascii=False,indent=2)+'\n')
    print('PASS: original МОСТ, STAT, school, BIBL, BEGA, KALAH, repeated game entries and checkers help; source/user disks unchanged')


if __name__=='__main__':main()
