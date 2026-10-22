"""DISPAK zones and GOST names; adapted from kadry-re/tools/volume.py."""
import struct

ZONE = 8256
MASK = (1 << 48) - 1
GOST = ('0123456789+-/,. ' '⏨↑()×=;[]*‘’≠<>:'
        'АБВГДЕЖЗИЙКЛМНОП' 'РСТУФХЦЧШЩЫЬЭЮЯD'
        'FGIJLNQRSUVWZ‾⩽⩾' '∨∧⊃¬÷≡%◇|―_!"Ъ°′')


def gost(s):
    return int.from_bytes(bytes(GOST.index(c) for c in s.ljust(6)), 'big')


def words(image, zone):
    return list(struct.unpack_from('<1024Q', image, (zone + 4) * ZONE + 64))


def put(image, zone, data, volume=2068):
    assert len(data) == 1024
    payload = struct.pack('<1024Q', *data)
    total = sum(w & MASK for w in data)
    while total >> 48:
        total = (total & MASK) + (total >> 48)
    first = ((zone + 4) * 2 << 36) | (0o30 << 21) | 8 | (2 << 48)
    second = (0o1370707 << 24) | (volume << 12) | (2 << 48)
    control = struct.pack('<8Q', first, second, 2 << 48, total | (2 << 48),
                          first + (1 << 36), second, 2 << 48, total | (2 << 48))
    offset = (zone + 4) * ZONE
    image[offset:offset + ZONE] = control + payload


def catalog(name, entries):
    data = [2 << 48] * 1024
    data[0] |= gost(name)
    for i, (name, start, count) in enumerate(entries):
        data[2*i+1] |= gost(name)
        data[2*i+2] |= (start << 24) | count
    data[0o377] |= 2*len(entries)+1
    return data
