#!/usr/bin/env python3
"""Run the original BEGA games and verify their sessions and copied machine words."""
import argparse
import hashlib
import json
import os
from pathlib import Path
import re
import subprocess

from volume import words, MASK

ROOT = Path(__file__).resolve().parents[1]
SESSIONS = ROOT/'sessions/bega'


def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--volumes', type=Path, default=ROOT/'build/bega/volumes')
    args = parser.parse_args()
    volumes = args.volumes.resolve()
    if not (volumes/'2068').exists():
        subprocess.run(['python3', str(ROOT/'tools/build-bega-volumes.py'),
                        '--output', str(volumes)], check=True)
    provenance = json.loads((volumes/'provenance.json').read_text())
    source = Path(provenance['source'])
    assert digest(source) == provenance['source_sha256'], 'source changed'
    assert digest(volumes/'bega.bin') == provenance['binary']['sha256']
    assert (volumes/'bega.bin').read_bytes() == (ROOT/'bega.o').read_bytes()
    original, relocated = source.read_bytes(), (volumes/'2068').read_bytes()
    for entry in provenance['copied']:
        start, dest = int(entry['source'],8), int(entry['destination'],8)
        for i in range(entry['count']):
            expected, actual = words(original,start+i), words(relocated,dest+i)
            if dest+i == 0:
                assert expected[0o77:0o377] == actual[0o77:0o377]
                assert expected[0o400:] == actual[0o400:]
            else:
                if dest+i == 0o35:
                    expected[0o12] = expected[0o12] & ~MASK | 0o10010000400037
                assert expected == actual, entry
    before = digest(volumes/'2068')
    logs = ROOT/'build/bega/logs'
    logs.mkdir(parents=True, exist_ok=True)
    checks = {}

    def session(name, required):
        commands = (SESSIONS/(name+'.txt')).read_text()
        result = subprocess.run([str(ROOT/'run-bega.sh'), '-t'], input=commands,
                                text=True, capture_output=True, timeout=25,
                                env=dict(os.environ, BEGA_VOLUMES=str(volumes)))
        for suffix, data in [('input',commands), ('out',result.stdout), ('trace',result.stderr)]:
            (logs/(name+'.'+suffix)).write_text(data)
        assert result.returncode == 0, (name,result.stderr[-2000:])
        for error in ('АВОСТ', 'ОШ.АДСИС', 'НЕ ПОНИМАЮ', 'НЕВЕРНЫЙ ХОД',
                      'ЭТО НЕ ХОД', 'ИГРА ЗАКРЫТА', 'ИГРА СЕЙЧАС ЗАКРЫТА'):
            assert error not in result.stdout, (name,error,result.stdout)
        assert 'unknown op' not in result.stderr, result.stderr[-2000:]
        assert 'ВРЕМЯ РЕШ:' in result.stdout, (name,'PULT did not finish')
        assert '00000000000000000000000000000000' not in result.stdout, \
            (name,'OUTPUT buffer mismatch')
        for text in required:
            assert text in result.stdout, (name,text,result.stdout)
        for descriptor in ('0010000000400125', '0010040000400131',
                           '0010370000400104', '0010360000400006'):
            assert descriptor in result.stderr, (name,descriptor)
        checks[name] = dict(passed=True, required=required,
                            output_sha256=hashlib.sha256(result.stdout.encode()).hexdigest())
        return result

    session('help', ['НЕКОТОРЫЕ ОБЩИЕ СВЕДЕНИЯ О БЛОКЕ ИГР', 'РАЗМЕТКА ЭКРАНА'])
    landed = session('landing-crash', ['ЛУННЫЙ МОДУЛЬ', 'У ВАС 16000 ФУНТОВ ТОПЛИВА.',
                       'НА ЛУНЕ НА 114 СЕКУНДЕ.', '5880 ФУТ/СЕК.',
                       'КРАТЕР ГЛУБИНОЙ 1117 ФУТОВ.', 'ПОЛЕТЫ ОКОНЧЕНЫ.'])
    assert len(re.findall(r'РАСХОД=',landed.stdout)) == 12
    english = session('landing-english', ['LUNАR МОDULЕ', '16000 LВS ОF FUЕL.',
                        'ОN ТНЕ МООN АТ 149 SЕСОNDS.',
                        'IМРАСТ VЕLОСIТУ ОF 3 F.Р.S.', 'FUЕL LЕFТ 576 LВS.',
                        'РЕRFЕСТ LАNDING.', 'МISSIОN СОNТRОL ОUТ.'])
    for failure in ('НЕАVУ СRАFТ DАМАGЕ', 'NЕW LUNАR СRАТЕR', 'SРLАТ'):
        assert failure not in english.stdout, english.stdout
    for side in ('white','black'):
        result = session('checkers-'+side, ['ИГРА К ВАШИМ УСЛУГАМ',
                            'ХОТИТЕ ИГРАТЬ БЕЛЫМИ ?', 'МОЙ ХОД',
                            'ВАШ ХОД:', 'ВЫ ПРОИГРАЛИ', 'ХОТИТЕ ИГРАТЬ ЕЩЕ ?'])
        assert '0010320000400137' in result.stderr, 'missing checkers position table'
        assert '\x1b[' in result.stdout, 'missing checkers terminal drawing'
    race = session('races', ['ВЫ НА БЕГАХ', 'НАЧИНАТЬ ?', 'НАЧНЕМ ?',
                             'ЗАБЕГ ОКОНЧЕН', 'ЕЩЕ ПОБЕГАЕМ ?', 'НУ КАК ХОТИТЕ'])
    assert '\x1b[H\x1b[J' in race.stdout, 'missing race screen clear'
    grid = session('tictactoe', ['ПЕРЕД НАЧАЛОМ ИГРЫ СДЕЛАЙТЕ', 'ОFF LINЕ'])
    rows = [line for line in grid.stdout.split('\x1b',1)[0].split('\n')
            if '.' in line and set(line) <= {' ','.'}]
    # The machine loops print 017 rows of 032 dots, then the raw pass adds a row.
    assert len(rows) == 16 and all(line.count('.') == 26 for line in rows), 'wrong grid'
    assert before == digest(volumes/'2068'), 'read-only game volume changed'
    assert digest(source) == provenance['source_sha256'], 'source changed'
    report = dict(passed=True, source=str(source), source_sha256=provenance['source_sha256'],
                  binary_sha256=provenance['binary']['sha256'],
                  copied_words_and_tags=True, matches_repository_bega_o=True,
                  source_and_local_volume_unchanged=True, sessions=checks)
    (logs/'check.json').write_text(json.dumps(report,ensure_ascii=False,indent=2)+'\n')
    print('PASS: BEGA help, lunar landing RU/EN, checkers white/black, races, grid; disks unchanged')


if __name__ == '__main__':
    main()
