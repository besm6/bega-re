#!/usr/bin/env python3
"""Run the original BEGA games and verify their sessions and copied machine words."""
import argparse
import hashlib
import json
import os
from pathlib import Path
import re
import subprocess
import shutil
import tempfile

from volume import words, MASK, ZONE, put

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
    elif not (volumes/'kalah.bin').exists():
        subprocess.run(['python3', str(ROOT/'tools/build-bega-volumes.py'),
                        '--output', str(volumes), '--upgrade'], check=True)
    provenance = json.loads((volumes/'provenance.json').read_text())
    source = Path(provenance['source'])
    assert digest(source) == provenance['source_sha256'], 'source changed'
    assert digest(volumes/'bega.bin') == provenance['binary']['sha256']
    assert (volumes/'bega.bin').read_bytes() == (ROOT/'bega.o').read_bytes()
    for name,entry in zip(('kalah.bin','school.bin'),provenance['overlays']):
        assert digest(volumes/name) == entry['sha256']
    subprocess.run(['python3', str(ROOT/'tools/check-kalah-book.py'), str(volumes/'2068')], check=True)
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
    # Every emulator writes to its own disposable copy, retaining the changes
    # between sessions to prove persistence without touching the user's scores.
    private = tempfile.TemporaryDirectory(prefix='bega-check-',dir=ROOT/'build/bega')
    private_volumes = Path(private.name)
    for name in ('2068','bega.bin','kalah.bin','school.bin','provenance.json'):
        shutil.copy2(volumes/name,private_volumes/name)
    initial = bytearray((private_volumes/'2068').read_bytes())
    put(initial,0o1013,[2 << 48]*1024)
    (private_volumes/'2068').write_bytes(initial)
    private_before = (private_volumes/'2068').read_bytes()
    scores_before = words(private_before,0o1013)

    def session(name, required, volume_path=private_volumes):
        commands = (SESSIONS/(name+'.txt')).read_text()
        result = subprocess.run([str(ROOT/'run-bega.sh'), '-t'], input=commands,
                                text=True, capture_output=True, timeout=25,
                                env=dict(os.environ, BEGA_VOLUMES=str(volume_path)))
        for suffix, data in [('input',commands), ('out',result.stdout), ('trace',result.stderr)]:
            (logs/(name+'.'+suffix)).write_text(data)
        assert result.returncode == 0, (name,result.stderr[-2000:])
        for error in ('АВОСТ', 'ОШ.АДСИС', 'НЕ ПОНИМАЮ', 'НЕВЕРНЫЙ ХОД',
                      'ЭТО НЕ ХОД', 'ИГРА ЗАКРЫТА', 'ИГРА СЕЙЧАС ЗАКРЫТА',
                      'НЕПОНЯТНО', '"ЧП"', 'ЛУНКА ПУСТАЯ', 'ОШИБКА - ПОВТОРИ'):
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
    training = ['Т Р Е Н И Р О В О Ч Н А Я', 'ВАШ ХОД:', 'МОЙ ХОД:',
                'ИГРА КОНЧИЛАСЬ', 'ПАРТИЯ НЕДОИГРАНА', 'НЕКОТОРЫЕ ОБЩИЕ СВЕДЕНИЯ О БЛОКЕ ИГР']
    for name in ('kalah-help','kalah-user','kalah-jinn','kalah-book-exit'):
        required = (['В КАЛАХ ИГРАЮТ ДВОЕ', 'П Р А В И Л А', 'Д О П О Л Н Е Н И Е',
                     'НЕКОТОРЫЕ ОБЩИЕ СВЕДЕНИЯ О БЛОКЕ ИГР'] if name == 'kalah-help' else training)
        result = session(name,required)
        descriptors = ['0010000000400230','0010050000400235']
        if name != 'kalah-help':
            descriptors += ['0010320000661013','0000320000661013']
        for descriptor in descriptors:
            assert descriptor in result.stderr, (name,descriptor)
        if name == 'kalah-help':
            assert '0010000000400236' in result.stderr and '0010010000400237' in result.stderr
            assert result.stdout.count('ИДТИ?') == 3
        if name in ('kalah-jinn','kalah-book-exit'):
            assert '0010320000400153' in result.stderr, 'opening page not read'
            moves = [int(m) for m in re.findall(r'=\+\+>\s*([1-6])',result.stdout)]
            if name == 'kalah-jinn':
                assert moves == [1,6], moves
                # Redrawn position proves sowing agrees with the generator.
                assert '(  ) ( 7) ( 7) ( 7) ( 7) (  )' in result.stdout
                assert 'К ( 2)' in result.stdout
            else:
                assert moves[:2] == [6,5], moves
                assert '0010320000660635' in result.stderr, 'corrections not read after book exit'
        # Every child returns to BEGA before the final exit to PULT.
        assert result.stderr.count('0010000000400125') >= 2
    private_after = (private_volumes/'2068').read_bytes()
    changed = [z for z in range(0o2000) if
               private_before[(z+4)*ZONE:(z+5)*ZONE] != private_after[(z+4)*ZONE:(z+5)*ZONE]]
    assert changed == [0o1013], changed
    scores_after = words(private_after,0o1013)
    # Per-category statistics: twelve words per category, last word = training.
    for level,increment in ((1,1),(3,1),(4,1)):
        index = 0o1354 + level*12 + 11
        assert (scores_after[index] & MASK) == (scores_before[index] & MASK)+increment, (level,index)
    # Ordinary play has a different original flag [27] setting. A fresh
    # database avoids consuming the training user's historical daily quota.
    normal_volumes = private_volumes/'normal'
    normal_volumes.mkdir()
    (normal_volumes/'2068').write_bytes(private_before)
    shutil.copy2(volumes/'kalah.bin',normal_volumes/'kalah.bin')
    normal = session('kalah-normal',['ВАШ ХОД:', 'МОЙ ХОД:',
                     'НЕКОТОРЫЕ ОБЩИЕ СВЕДЕНИЯ О БЛОКЕ ИГР'], normal_volumes)
    assert 'Т Р Е Н И Р О В О Ч Н А Я' not in normal.stdout
    assert 'ИГРА ОТЛОЖЕНА' in normal.stdout or 'ИГРА ОКОНЧЕНА' in normal.stdout
    assert '0000320000661013' in normal.stderr
    normal_after = (normal_volumes/'2068').read_bytes()
    assert [z for z in range(0o2000) if
            private_before[(z+4)*ZONE:(z+5)*ZONE] != normal_after[(z+4)*ZONE:(z+5)*ZONE]] == [0o1013]
    private.cleanup()
    assert before == digest(volumes/'2068'), 'persistent game volume changed'
    assert digest(source) == provenance['source_sha256'], 'source changed'
    report = dict(passed=True, source=str(source), source_sha256=provenance['source_sha256'],
                  binary_sha256=provenance['binary']['sha256'],
                  copied_words_and_tags=True, matches_repository_bega_o=True,
                  private_writes=['1013'], opening_histories=6548,
                  source_and_local_volume_unchanged=True, sessions=checks)
    (logs/'check.json').write_text(json.dumps(report,ensure_ascii=False,indent=2)+'\n')
    print('PASS: 12 BEGA/KALAH sessions, opening book and corrections, normal play and training statistics; source and user disks unchanged')


if __name__ == '__main__':
    main()
