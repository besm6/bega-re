#!/usr/bin/env python3
"""Exercise the original BIBL on disposable copies and verify persistent data."""
import argparse
import hashlib
import json
import os
from pathlib import Path
import re
import subprocess
import tempfile

from volume import words, MASK

ROOT = Path(__file__).resolve().parents[1]


def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--volumes', type=Path, default=ROOT/'build/volumes')
    args = parser.parse_args()
    volumes = args.volumes.resolve()
    if not (volumes/'provenance.json').exists():
        subprocess.run(['python3', str(ROOT/'tools/build-volumes.py'),
                        '--output', str(volumes)], check=True)
    provenance = json.loads((volumes/'provenance.json').read_text())
    source = Path(provenance['source'])
    assert digest(source) == provenance['source_sha256'], 'source volume changed'
    original, relocated = source.read_bytes(), (volumes/'2068').read_bytes()
    for entry in provenance['copied']:
        start, dest = int(entry['source'], 8), int(entry['destination'], 8)
        for i in range(entry['count']):
            expected, actual = words(original, start+i), words(relocated, dest+i)
            if dest+i == 0:
                assert expected[0o77:0o377] == actual[0o77:0o377]
                assert expected[0o400:] == actual[0o400:]
            else:
                if dest+i == 0o35:
                    expected[0o12] = expected[0o12] & ~MASK | 0o10010000400037
                assert expected == actual, entry
    assert digest(volumes/'bibl.bin') == provenance['binary']['sha256']
    before = {v:digest(volumes/v) for v in ('2068', '2048', '2060')}
    logs = ROOT/'build/logs'
    logs.mkdir(parents=True, exist_ok=True)
    with tempfile.TemporaryDirectory(prefix='bibl-check-', dir=ROOT/'build') as temp:
        private = Path(temp)/'volumes'
        # Fresh fixtures make counter and quota expectations independent of
        # interactive use of the persistent local volumes.
        subprocess.run(['python3', str(ROOT/'tools/build-volumes.py'),
                        '--source', str(source), '--output', str(private)], check=True)

        def session(name, commands):
            result = subprocess.run([str(ROOT/'run-bibl.sh'), '-t'], input=commands,
                                    text=True, capture_output=True, timeout=20,
                                    env=dict(os.environ, BIBL_VOLUMES=str(private)))
            for suffix, value in [('input', commands), ('out', result.stdout),
                                  ('trace', result.stderr)]:
                (logs/(name+'.'+suffix)).write_text(value)
            assert result.returncode == 0, result.stderr[-2000:]
            for error in ('АВОСТ', 'ОШ.АДСИС', 'ФАЙЛ ИСПОРЧЕН', 'НЕ ПОНИМАЮ',
                          'НЕПОНЯТНО', 'НЕТ БОБИНЫ', 'НЕТ РЕСУРСА'):
                assert error not in result.stdout, result.stdout
            assert 'ВРЕМЯ РЕШ:' in result.stdout, 'PULT did not finish normally'
            return result

        system_before = digest(private/'2068')
        demo = session('example', (ROOT/'sessions/example.txt').read_text())
        for text in ('В БЛОКЕ БИБЛИОТЕКИ ИСПОЛНЯЮТСЯ', 'КОРАБЛЬ ПРИБЫЛ НА ЛУНУ.',
                     'НА ЛУНЕ ОТКРЫЛАСЬ БИБЛИОТЕКА.', 'ПРОГРАММИСТ СКАЗАЛ:',
                     'БИБЛИОТЕКАРЬ: ТИШИНА', '21.10.26'):
            assert text in demo.stdout, text
        assert '\n    КОРАБЛЬ' in demo.stdout, 'ROMAN compressed spaces'
        assert '\n    ПРОГРАММИСТ СКАЗАЛ' in demo.stdout, 'HUMOR compressed spaces'
        for descriptor in ('0010000000420172', '0010370000400104',
                           '0010320000440600', '0010320000440601',
                           '0010320000440620', '0010320000440621'):
            assert descriptor in demo.stderr, descriptor
        library = (private/'2048').read_bytes()
        assert [words(library,z)[1023] & MASK for z in (0o620,0o621)] == [1,1]
        assert (words((private/'2060').read_bytes(),1)[12] >> 21) & 7 == 5
        for z in (0o600,0o601):
            assert words(library,z) == words((volumes/'2048').read_bytes(),z)

        filtered = session('filter', 'иди 999\nюмор (БИБЛИОТЕКАРЬ)\n'
                            'юмор (НЕБЫВАЛОЕ)\nроман 0\nроман 3\nкон\nконец\n')
        assert 'БИБЛИОТЕКАРЬ: ТИШИНА' in filtered.stdout
        assert 'ПРОГРАММИСТ СКАЗАЛ' not in filtered.stdout
        for text in ('ОБРАЗЕЦ НЕ НАЙДЕН', 'ВЫПУСКА 0 УЖЕ НЕТ', 'ВЫПУСКА 3 ЕЩЕ НЕТ'):
            assert text in filtered.stdout, text
        restart = session('restart', 'иди 999\nроман с\nроман\n2\nкон\nконец\n')
        assert re.search(r'СУММА\s+0\s+2\s+2', restart.stdout), restart.stdout
        assert 'НОМЕР ВЫПУСКА ? ЕСТЬ: 1 - 2' in restart.stdout
        assert 'НА ЛУНЕ ОТКРЫЛАСЬ БИБЛИОТЕКА.' in restart.stdout
        assert [words((private/'2048').read_bytes(),z)[1023] & MASK
                for z in (0o620,0o621)] == [1,2]
        # A session allows seven reads; the eighth must leave the disk alone.
        quota = session('quota', 'иди 999\n' + 'роман 1\n'*8 + 'кон\nконец\n')
        assert quota.stdout.count('КОРАБЛЬ ПРИБЫЛ НА ЛУНУ.') == 7
        assert 'СЕГОДНЯ НЕЛЬЗЯ' in quota.stdout
        assert words((private/'2048').read_bytes(),0o620)[1023] & MASK == 8
        assert (words((private/'2060').read_bytes(),1)[12] >> 21) & 7 == 0
        assert digest(private/'2068') == system_before
    assert before == {v:digest(volumes/v) for v in before}, 'persistent local disks changed'
    assert digest(source) == provenance['source_sha256']
    report = dict(passed=True, binary_sha256=provenance['binary']['sha256'],
                  checks=['copied words and tags', 'help and both samples',
                          'compressed spaces', 'HUMOR pattern and no match',
                          'ROMAN bounds and prompted issue', 'persistent counters',
                          'user quota and rejection after seven reads',
                          'normal PULT exit', 'source and persistent disks unchanged'],
                  source_sha256=provenance['source_sha256'], hashes=before)
    (logs/'check.json').write_text(json.dumps(report, ensure_ascii=False, indent=2)+'\n')
    print('PASS: original BIBL, HUMOR filters, ROMAN issues/counters/quota, normal exit; source unchanged')


if __name__ == '__main__':
    main()
