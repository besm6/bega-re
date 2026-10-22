"""Small standalone host for JINN's documented 76021/76022 interface.

This is new glue, not a reconstruction of the missing TAMBOV environment.
Original Pascal overlays remain unchanged. Each emitted instruction occupies
one word; short memory operations use UTC for the full 15-bit address.
Adapted from kadry-re/tools/monitor.py.
"""
from volume import gost

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


def monitor(target=0o6420172, output_base=None):
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
    def copy_context():
        c.ins('xta', 4, 0o13); c.ins('ati', 0o7)
        c.ins('vtm', CONTEXT, 0o10)
        c.ins('vtm', (-61) & 0o77777, 0o11)
        c.label('restorectx')
        c.ins('xta', 0, 0o10)
        c.ins('atx', 0, 0o7)
        c.ins('utm', 1, 0o7); c.ins('utm', 1, 0o10)
        c.ins('vlm', 'restorectx', 0o11)

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
    # Other JINN blocks are not supplied by these standalone launchers.
    c.ins('uj', 'quit')

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
