"""Small standalone host for JINN's documented 76021/76022 interface.

This is new glue, not a reconstruction of the missing TAMBOV environment.
Original Pascal overlays remain unchanged. Each emitted instruction occupies
one word; short memory operations use UTC for the full 15-bit address.
Adapted from kadry-re/tools/monitor.py.
"""
from volume import GOST, gost

BASE = 0o60000
STATE = 0o61400
CONTEXT = 0o61500
COMMAND = 0o62000


class Code:
    def __init__(self):
        self.code = []
        self.labels = {}
        self.data = {}

    def label(self, name):
        self.labels[name] = BASE + len(self.code)

    def ins(self, op, arg=0, reg=0):
        self.code.append((op, arg, reg))

    def mem(self, op, arg, reg=0):
        self.ins('utc', arg)
        self.ins(op, 0, reg)

    def const(self, name, value):
        self.labels[name] = STATE + len(self.data)
        self.data[name] = value

    def build(self):
        short = dict(xta=0o10, atx=0, aex=0o12, aax=0o11, arx=0o13,
                     aox=0o15, asn=0o36, ati=0o40, ita=0o42, mtj=0o44,
                     e70=0o70, ntr=0o37)
        long = dict(utc=0o22, wtc=0o23, vtm=0o24, utm=0o25, uza=0o26,
                    u1a=0o27, uj=0o30, vjm=0o31, v1m=0o35, vlm=0o37)
        result = [1 << 48] * 1024
        assert BASE + len(self.code) < STATE
        for i, (op, arg, reg) in enumerate(self.code):
            if isinstance(arg, str):
                arg = self.labels[arg]
            if op in long:
                instruction = reg << 20 | 1 << 19 | (long[op] & 0o17) << 15 | (arg & 0o77777)
            else:
                assert 0 <= arg <= 0o7777
                instruction = reg << 20 | short[op] << 12 | arg
            # UTC 0 preserves a pending C across the word boundary.
            result[i] |= instruction << 24 | 0o2200000
        for name, value in self.data.items():
            result[self.labels[name]-BASE] = value | (2 << 48)
        return result


def monitor(target=0o6420172, output_base=None, game_overlays=False):
    c = Code()
    for name, value in dict(target=target, transfer=0, file=0, index=0,
                            descriptor=0, one=1, maskunit=0o777777,
                            nextpage=1 << 30 | 1, read=1 << 39,
                            adsis=0o10360000400006, resident=0o10370000270031,
                            ret=0o76002, end=0o377,
                            jinn=0o10370000400104,
                            context=CONTEXT, command=COMMAND,
                            tambov=gost('ТАМБОВ')).items():
        c.const(name, value)

    def load(name): c.mem('xta', name)
    def store(name): c.mem('atx', name)
    def runtime(address):
        load('file'); c.ins('ati', 0o15)
        c.ins('vjm', address, 0o16)
    def index_start(): load('command'); store('index')
    def advance(): load('index'); c.mem('arx', 'one'); store('index')
    def copy_context(to_program=True):
        c.ins('xta', 4, 0o13); c.ins('ati', 0o7)
        c.ins('vtm', CONTEXT, 0o10)
        c.ins('vtm', (-61) & 0o77777, 0o11)
        label = 'restorectx' if to_program else 'savectx'
        c.label(label)
        c.ins('xta', 0, 0o10 if to_program else 0o7)
        c.ins('atx', 0, 0o7 if to_program else 0o10)
        c.ins('utm', 1, 0o7); c.ins('utm', 1, 0o10)
        c.ins('vlm', label, 0o11)

    c.label('boot')
    # Load the original JINN resident before installing our two monitor entries.
    c.ins('utc', 'jinn'); c.ins('e70')
    c.mem('xta', 'enterjump'); c.mem('atx', 0o76021)
    c.mem('xta', 'execjump'); c.mem('atx', 0o76022)
    load('tambov'); c.mem('atx', 0o76233)
    c.ins('uj', 'launch')

    c.label('enter')
    copy_context()
    c.ins('xta', 3, 0o13); store('file')
    runtime(0o74064)  # REWRITE destination TEXT
    index_start()
    c.label('writechar')
    load('file'); c.ins('ati', 0o7)
    load('index'); c.ins('ati', 0o10)
    c.ins('xta', 0, 0o10); store('transfer')
    c.ins('wtc', 0, 0o7); c.ins('atx')  # TEXT current record pointer
    runtime(0o74040)
    load('transfer'); c.mem('aex', 'end'); c.ins('uza', 'entered')
    advance(); c.ins('uj', 'writechar')
    c.label('entered')
    runtime(0o74042)  # RESET the command TEXT before the first getCmd
    # JINN's command parser and skip-space helper share this TEXT descriptor.
    load('file'); c.mem('atx', 0o76253)
    c.ins('vtm', 0, 0o10)  # resident terminal entries use M10 as zero base
    c.ins('xta', 2, 0o13); c.ins('ati', 3)
    c.ins('uj', 0o74012)  # ordinary Pascal procedure return

    c.label('exec')
    if not game_overlays:
        c.ins('uj', 'quit')
    else:
        for name,value in dict(request=0, parent=0o1660730, main=target,
                               kalah=0o6400230, school=0o2400236,
                               masklocation=0o777777, returnmain=0,
                               cmdend=0o377).items():
            c.const(name,value)
        # The level-2 exec frame contains its descriptor in slot 3.
        c.ins('xta', 3, 2); store('request')
        c.mem('aex', 'parent'); c.ins('uza', 'parent_return')
        load('request'); c.mem('aax', 'masklocation'); store('request')
        load('kalah'); c.mem('aax', 'masklocation'); c.mem('aex', 'request')
        c.ins('uza', 'select_kalah')
        load('school'); c.mem('aax', 'masklocation'); c.mem('aex', 'request')
        c.ins('uza', 'select_school')
        c.ins('uj', 'quit')
        c.label('select_kalah'); load('kalah'); store('request')
        c.ins('uj', 'transfer_overlay')
        c.label('select_school'); load('school'); store('request')
        c.ins('uj', 'transfer_overlay')
        c.label('parent_return')
        load('target'); c.mem('aex', 'main'); c.ins('uza', 'quit')
        load('main'); store('request')
        load('one'); store('returnmain')
        c.label('transfer_overlay')
        copy_context(False)
        c.ins('xta', 3, 0o13); store('file')
        runtime(0o74042)
        index_start()
        c.label('readchar')
        load('file'); c.ins('ati', 0o7)
        c.ins('wtc', 0, 0o7); c.ins('xta'); store('transfer')
        load('index'); c.ins('ati', 0o10)
        load('transfer'); c.ins('atx', 0, 0o10)
        c.mem('aex', 'end'); c.ins('uza', 'command_saved')
        runtime(0o74041)
        advance(); c.ins('uj', 'readchar')
        c.label('command_saved')
        # Original flag [27] permits category/side selection in training but
        # closes tournament play. Select it only for an explicit КАЛ ТРЕН
        # entry; subsequent commands inside that overlay retain its mode.
        c.const('trainingflag', 1 << (47-27))
        c.const('nottraining', ((1 << 48)-1) ^ (1 << (47-27)))
        c.const('spacechar', GOST.index(' '))
        c.const('trainingchar', GOST.index('Т'))
        load('request'); c.mem('aex', 'kalah'); c.ins('u1a', 'training_ready')
        for i,ch in enumerate('КАЛ'):
            c.const('kal'+str(i), GOST.index(ch))
            c.mem('xta', COMMAND+i); c.mem('aex', 'kal'+str(i))
            c.ins('u1a', 'training_ready')
        c.mem('xta', CONTEXT+15); c.mem('aax', 'nottraining')
        c.mem('atx', CONTEXT+15)
        index_start()
        c.label('skip_game_word')
        load('index'); c.ins('ati', 0o10); c.ins('xta', 0, 0o10)
        c.mem('aex', 'end'); c.ins('uza', 'training_ready')
        c.ins('xta', 0, 0o10); c.mem('aex', 'spacechar')
        c.ins('uza', 'skip_training_space')
        advance(); c.ins('uj', 'skip_game_word')
        c.label('skip_training_space')
        advance(); load('index'); c.ins('ati', 0o10)
        c.ins('xta', 0, 0o10); c.mem('aex', 'spacechar')
        c.ins('uza', 'skip_training_space')
        c.ins('xta', 0, 0o10); c.mem('aex', 'trainingchar')
        c.ins('u1a', 'training_ready')
        c.mem('xta', CONTEXT+15); c.mem('aox', 'trainingflag')
        c.mem('atx', CONTEXT+15)
        c.label('training_ready')
        load('returnmain'); c.ins('uza', 'command_ready')
        # КОН in a child block returns to the game prompt, not out of BEGA.
        # Preserve other commands so, for example, ШАШ can cross back directly.
        for i,ch in enumerate('КОН'):
            c.const('kon'+str(i), GOST.index(ch))
            c.mem('xta', COMMAND+i); c.mem('aex', 'kon'+str(i))
            c.ins('u1a', 'clear_return')
        for i,ch in enumerate('ИГР'):
            c.const('game'+str(i), GOST.index(ch))
            load('game'+str(i)); c.mem('atx', COMMAND+i)
        load('cmdend'); c.mem('atx', COMMAND+3)
        c.label('clear_return')
        c.ins('xta'); store('returnmain')
        c.label('command_ready')
        load('request'); store('target')
        c.ins('uj', 'launch')

    c.label('launch')
    # Start each overlay with a fresh ADSIS; settings at 67000 survive.
    c.ins('utc', 'adsis'); c.ins('e70')
    if output_base is not None:
        c.const('outputbase', output_base)
        # BEGA's landMsg sends OUTPUT from 71000 explicitly. Match the host's
        # ADSIS stream setup to that buffer without changing the program.
        load('outputbase'); c.mem('atx', 0o75205)
        c.mem('atx', 0o75224)
    load('target'); c.mem('aax', 'maskunit'); c.mem('aox', 'read'); store('descriptor')
    load('target'); c.ins('asn', 64+18); c.ins('ati', 0o11)
    c.label('loadpage')
    c.ins('utc', 'descriptor'); c.ins('e70')
    c.mem('xta', 'descriptor'); c.mem('arx', 'nextpage'); store('descriptor')
    c.ins('utm', -1, 0o11); c.ins('v1m', 'loadpage', 0o11)
    c.ins('xta', 5); c.ins('ati', 0o17)
    load('ret'); c.ins('atx', 1, 0o17)
    c.ins('uj', 7)
    c.label('quit')
    c.ins('utc', 'resident'); c.ins('e70')
    c.ins('uj', 0o76002)

    c.const('enterjump', (0o3000000 | c.labels['enter']) << 24)
    c.const('execjump', (0o3000000 | c.labels['exec']) << 24)
    c.data['ret'] = c.labels['quit']
    return c
