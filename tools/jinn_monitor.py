"""Adapt the surviving old МОСТ's packed command area to 62-word overlays.

МОСТ at 2148:1010 uses 56 saved words at 17700, packed TEXT at 17660,
and performs its own overlay reads. Later overlays use 76021/76022.
Transport the common 56-word prefix; retain the later six words in the host.
Original code is untouched.
"""
from monitor import Code, BASE, CONTEXT, COMMAND
from volume import GOST,gost,MASK

BRIDGE = 0o2660730


def monitor():
    c = Code()
    for name,value in dict(target=BRIDGE, root=BRIDGE, games=0o5400125,
                           stat=0o5400120, help=0o5400132, library=0o6420172,
                           kalah=0o6400230, school=0o2400236,
                           parent=0o1660730, bridge=0o4661034, libparent=0o3420213,
                           libstat=0o5420111, file=0, index=0, packed=0,
                           high=0, transfer=0, ended=0, active=0,
                           one=1, end=0o377, byte=0o377, mask=0o777777,
                           nextpage=1 << 30 | 1, read=1 << 39,
                           adsis=0o10360000400006, resident=0o10370000270031,
                           jinn=0o10370000400104, tambov=gost('ТАМБОВ'),
                           outputbase=0o71000, descriptor=0,
                           training=1 << (47-27), nottraining=MASK ^ (1 << (47-27)),
                           space=GOST.index(' '), train=GOST.index('Т'),
                           highend=0o17700, nobyte=MASK ^ 0o377).items():
        c.const(name,value)

    def load(name): c.mem('xta',name)
    def store(name): c.mem('atx',name)
    def runtime(address):
        load('file'); c.ins('ati',0o15); c.ins('vjm',address,0o16)
    def prefix(word,mismatch):
        for i,ch in enumerate(word):
            name = 'ch'+str(GOST.index(ch))
            if name not in c.data: c.const(name,GOST.index(ch))
            c.mem('xta',COMMAND+i); c.mem('aex',name); c.ins('u1a',mismatch)
    def command(word):
        for i,ch in enumerate(word):
            name = 'ch'+str(GOST.index(ch))
            if name not in c.data: c.const(name,GOST.index(ch))
            load(name); c.mem('atx',COMMAND+i)
        load('end'); c.mem('atx',COMMAND+len(word))
    def copy_context(to_program):
        c.ins('xta',4,0o13); c.ins('ati',7)
        c.ins('vtm',CONTEXT,0o10); c.ins('vtm',(-61)&0o77777,0o11)
        label = 'restorectx' if to_program else 'savectx'
        c.label(label)
        c.ins('xta',0,0o10 if to_program else 7)
        c.ins('atx',0,7 if to_program else 0o10)
        c.ins('utm',1,7); c.ins('utm',1,0o10); c.ins('vlm',label,0o11)
    def shared_context(to_high):
        c.ins('vtm',CONTEXT,0o10);c.ins('vtm',0o17700,7)
        c.ins('vtm',(-55)&0o77777,6)
        label = 'save_high' if to_high else 'restore_high'
        c.label(label)
        c.ins('xta',0,0o10 if to_high else 7)
        c.ins('atx',0,7 if to_high else 0o10)
        c.ins('utm',1,7);c.ins('utm',1,0o10);c.ins('vlm',label,6)

    c.label('boot')
    c.ins('utc','jinn'); c.ins('e70')
    load('enterjump'); c.mem('atx',0o76021)
    load('execjump'); c.mem('atx',0o76022)
    load('tambov'); c.mem('atx',0o76233)
    c.ins('uj','launch')

    c.label('enter')
    # ADSIS reuses low header words; the image's stack boundary remains in 5.
    c.ins('xta',5); store('active')
    c.const('saved12',0)
    c.ins('ita',0o12);store('saved12')
    c.ins('vjm','unpack',0o12)
    load('saved12');c.ins('ati',0o12)
    # Flag [27] selects the original extended training-only mode.
    load('active'); c.mem('aex','kalahname'); c.ins('u1a','context_ready')
    c.mem('xta',CONTEXT+15); c.mem('aax','nottraining'); c.mem('atx',CONTEXT+15)
    prefix('КАЛ','context_ready')
    c.ins('vtm',COMMAND,0o10)
    c.label('skipword')
    c.ins('xta',0,0o10); c.mem('aex','end'); c.ins('uza','context_ready')
    c.ins('xta',0,0o10); c.mem('aex','space'); c.ins('uza','skipspace')
    c.ins('utm',1,0o10); c.ins('uj','skipword')
    c.label('skipspace')
    c.ins('utm',1,0o10); c.ins('xta',0,0o10); c.mem('aex','space')
    c.ins('uza','skipspace')
    c.ins('xta',0,0o10); c.mem('aex','train'); c.ins('u1a','context_ready')
    c.mem('xta',CONTEXT+15); c.mem('aox','training'); c.mem('atx',CONTEXT+15)
    c.label('context_ready')
    copy_context(True)
    c.ins('xta',3,0o13); store('file')
    runtime(0o74064)
    c.ins('vtm',COMMAND,0o10); c.ins('ita',0o10); store('index')
    c.label('writechar')
    load('file'); c.ins('ati',7); load('index'); c.ins('ati',0o10)
    c.ins('xta',0,0o10); store('transfer')
    c.ins('wtc',0,7); c.ins('atx')
    runtime(0o74040)
    load('transfer'); c.mem('aex','end'); c.ins('uza','entered')
    load('index'); c.mem('arx','one'); store('index'); c.ins('uj','writechar')
    c.label('entered')
    runtime(0o74042)
    load('file'); c.mem('atx',0o76253)
    c.ins('vtm',0,0o10)
    c.ins('xta',2,0o13); c.ins('ati',3); c.ins('uj',0o74012)

    c.label('exec')
    c.ins('xta',3,2); store('target')
    copy_context(False)
    c.ins('xta',3,0o13); store('file'); runtime(0o74042)
    c.ins('vtm',COMMAND,0o10); c.ins('ita',0o10); store('index')
    c.label('readchar')
    load('file'); c.ins('ati',7)
    c.ins('wtc',0,7); c.ins('xta'); store('transfer')
    load('index'); c.ins('ati',0o10)
    load('transfer'); c.ins('atx',0,0o10)
    c.mem('aex','end'); c.ins('uza','route')
    runtime(0o74041)
    load('index'); c.mem('arx','one'); store('index'); c.ins('uj','readchar')
    c.label('route')
    load('target'); c.mem('aex','parent'); c.ins('uza','parent_return')
    load('target');c.mem('aex','bridge');c.ins('uza','bridge_return')
    load('target');c.mem('aex','libparent');c.ins('uza','root_return')
    load('target'); c.mem('aex','libstat'); c.ins('uza','select_stat')
    load('target'); c.mem('aax','mask'); store('target')
    for name in ('stat','games','help','library','kalah','school'):
        load(name); c.mem('aax','mask'); c.mem('aex','target')
        c.ins('uza','select_'+name)
    c.ins('uj','missing')
    for name in ('stat','games','help','library','kalah','school'):
        c.label('select_'+name); load(name); store('target'); c.ins('uj','pack_launch')
    c.label('bridge_return')
    c.const('statname',0o11316)
    load('active');c.mem('aex','statname');c.ins('u1a','root_return')
    # The old МОСТ routes these commands to STAT; the surviving later STAT
    # no longer implements them. Stop the otherwise endless cross-version loop.
    for i,word in enumerate(('ВРЕ','ВЦП','ИДИ','ПЕЧ','ЭКР')):
        prefix(word,'not_legacy'+str(i));c.ins('uj','missing')
        c.label('not_legacy'+str(i))
    c.ins('uj','root_return')
    c.label('parent_return')
    load('active'); c.mem('aex','kalahname'); c.ins('uza','back_games')
    load('active'); c.mem('aex','schoolname'); c.ins('uza','back_games')
    prefix('ИГР','root_return')
    c.ins('uj','select_games')
    c.label('back_games')
    prefix('КОН','select_games')
    command('ИГР'); c.ins('uj','select_games')
    c.label('root_return')
    prefix('КОН','root_ready')
    command('RЕQ')
    c.label('root_ready')
    load('root'); store('target'); c.ins('uj','pack_launch')

    # Stubs reached by the old bridge's own page loader have packed TEXT ready.
    c.label('library_stub')
    c.ins('vjm','unpack',0o12); c.ins('uj','select_library')
    c.label('missing_stub')
    c.ins('vjm','unpack',0o12)
    c.label('missing')
    message = '\nБЛОК НЕ НАЙДЕН. ВОЗВРАТ В ДЖИН.\n'
    raw = bytes(0o175 if ch=='\n' else GOST.index(ch) for ch in message)+bytes([0o172])
    raw = raw.ljust((len(raw)+5)//6*6,b'\0')
    for i in range(0,len(raw),6):
        name='msg'+str(i//6);c.const(name,int.from_bytes(raw[i:i+6],'big'))
        load(name);c.mem('atx',0o71000+i//6)
    c.const('sendtext',0o3000000024000321)
    c.ins('vtm',0o71000,7)
    c.mem('xta',0o76401); c.mem('aox','sendtext')
    c.ins('atx',1,0o17); c.ins('e71',1,0o17)
    c.ins('utc',0o76402);c.ins('e71')
    command('RЕQ'); c.ins('uj','root_ready')

    c.label('pack_launch')
    c.ins('vjm','pack',0o12)
    c.label('launch')
    # Discard the previous overlay's globals and stack. The packed command
    # and shared profile at 17660..17767 survive until the next enter hook.
    # In particular, BEGA's ШКО ШАШ draws its uninitialised field[] array;
    # stale STAT file descriptors there become unchecked CASE jump indices.
    c.ins('vtm',0o17657,7)
    c.ins('xta')
    c.label('clear_overlay')
    c.ins('atx',0,7)
    c.ins('utm',-1,7); c.ins('v1m','clear_overlay',7)
    c.ins('utc','adsis');c.ins('e70')
    load('outputbase');c.mem('atx',0o75205);c.mem('atx',0o75224)
    load('target');c.mem('aax','mask');c.mem('aox','read');store('descriptor')
    load('target');c.ins('asn',64+18);c.ins('ati',0o11)
    c.label('loadpage')
    c.ins('utc','descriptor');c.ins('e70')
    load('descriptor');c.mem('arx','nextpage');store('descriptor')
    c.ins('utm',-1,0o11);c.ins('v1m','loadpage',0o11)
    c.ins('xta',5);c.ins('ati',0o17)
    load('ret');c.ins('atx',1,0o17);c.ins('uj',7)
    c.label('quit')
    c.ins('utc','resident');c.ins('e70');c.ins('uj',0o76002)

    c.label('unpack')
    shared_context(False)
    c.ins('vtm',COMMAND,0o10);c.ins('vtm',0o17660,7)
    c.label('unpack_word')
    c.ins('xta',0,7);store('packed')
    c.ins('vtm',40,0o11);c.ins('vtm',(-5)&0o77777,6)
    c.label('unpack_char')
    load('packed');c.ins('asn',64,0o11);c.mem('aax','byte')
    c.ins('atx',0,0o10);c.mem('aex','end');c.ins('uza','unpacked')
    c.ins('utm',1,0o10);c.ins('utm',-8,0o11);c.ins('vlm','unpack_char',6)
    c.ins('utm',1,7);c.ins('ita',7);c.mem('aex','highend');c.ins('u1a','unpack_word')
    load('end');c.mem('atx',COMMAND+95)
    c.label('unpacked');c.ins('uj',0,0o12)

    c.label('pack')
    shared_context(True)
    c.ins('vtm',COMMAND,0o10);c.ins('vtm',0o17660,7)
    c.ins('xta');store('ended')
    c.label('pack_word')
    c.ins('xta');store('packed');c.ins('vtm',(-5)&0o77777,9)
    c.label('pack_char')
    c.ins('xta',0,0o10);store('transfer');c.mem('aex','end');c.ins('u1a','pack_append')
    load('one');store('ended')
    c.label('pack_append')
    load('packed');c.ins('asn',64-8);c.mem('aox','transfer');store('packed')
    c.ins('utm',1,0o10);c.ins('vlm','pack_char',9)
    load('packed');c.ins('atx',0,7)
    load('ended');c.ins('u1a','pack_done')
    c.ins('utm',1,7);c.ins('ita',7);c.mem('aex','highend');c.ins('u1a','pack_word')
    load('packed');c.mem('aax','nobyte');c.mem('aox','end');c.mem('atx',0o17677)
    c.label('pack_done');c.ins('uj',0,0o12)

    c.const('kalahname',0o12704);c.const('schoolname',0o3721)
    c.const('enterjump',(0o3000000|c.labels['enter'])<<24)
    c.const('execjump',(0o3000000|c.labels['exec'])<<24)
    c.const('ret',c.labels['quit'])
    return c
