"""x87lab.py - apoio as sondas do x87 (sonda.exe): estendidos <-> bytes, mpmath, execucao.

Estendido como par (se, m): se = sinal<<15 | expoente com vies 16383, m = mantissa de 64 bits.
"""
import os, struct, subprocess, tempfile
import mpmath as mp

X87_TMP = os.environ.get("X87_TMP", os.path.join(tempfile.gettempdir(), "x87zen2"))
SONDA = os.environ.get("X87_SONDA", os.path.join(X87_TMP, "sonda.exe"))
mp.mp.prec = 300

CW_NEAR, CW_DOWN, CW_UP, CW_ZERO = 0x37F, 0x77F, 0xB7F, 0xF7F


def pack(v):
    se, m = v
    return struct.pack("<QH", m, se)


def unpack(b):
    m, se = struct.unpack("<QH", b[:10])
    return (se, m)


def run(op, cw, pares):
    """pares: lista de (a, b) estendidos. Devolve lista de (r0, r1, sw)."""
    fd, fin = tempfile.mkstemp(suffix=".bin", dir=X87_TMP)
    os.close(fd)
    fout = fin + ".out"
    with open(fin, "wb") as f:
        for a, b in pares:
            f.write(pack(a) + pack(b))
    subprocess.run([SONDA, op, "%x" % cw, fin, fout], check=True)
    res = []
    with open(fout, "rb") as f:
        d = f.read()
    for i in range(0, len(d), 22):
        res.append((unpack(d[i:i + 10]), unpack(d[i + 10:i + 20]), struct.unpack("<H", d[i + 20:i + 22])[0]))
    os.remove(fin)
    os.remove(fout)
    return res


ZERO = (0, 0)
UM = (0x3FFF, 1 << 63)


def to_mp(v):
    se, m = v
    s = se >> 15
    e = se & 0x7FFF
    if e == 0x7FFF:
        if (m << 1) & ((1 << 64) - 1):
            return mp.nan
        return -mp.inf if s else mp.inf
    if e == 0:
        e = 1
    x = mp.ldexp(mp.mpf(m), e - 16383 - 63)
    return -x if s else x


def from_mp(x, rnd="n"):
    """mpf -> estendido arredondado (n: ao par, d: para baixo, u: para cima, z: para zero). Sem denormais."""
    if x == 0:
        return (0, 0)
    s = 1 if x < 0 else 0
    ax = abs(x)
    man, ex = mp.frexp(ax)  # ax = man * 2^ex, man em [0.5, 1)
    e = int(ex) - 1  # ax = (2*man) * 2^e
    t = mp.ldexp(ax, 63 - e)
    fl = int(mp.floor(t))
    fr = t - fl
    if rnd == "n":
        if fr > 0.5 or (fr == 0.5 and fl & 1):
            fl += 1
    elif (rnd == "u" and not s) or (rnd == "d" and s):
        if fr > 0:
            fl += 1
    if fl == 1 << 64:
        fl >>= 1
        e += 1
    return ((s << 15) | (e + 16383), fl)


def ulp(v):
    se, m = v
    e = se & 0x7FFF
    return mp.ldexp(1, max(e, 1) - 16383 - 63)


def hx(v):
    return "%04x%016x" % v


def rnd_bits(x, p, rnd="n"):
    """arredonda o mpf x para p bits de mantissa (ao par por padrao)."""
    if x == 0:
        return mp.mpf(0)
    s = -1 if x < 0 else 1
    ax = abs(x)
    man, ex = mp.frexp(ax)
    t = mp.ldexp(ax, p - int(ex))
    fl = mp.floor(t)
    fr = t - fl
    if rnd == "n":
        if fr > 0.5 or (fr == 0.5 and int(fl) & 1):
            fl += 1
    elif rnd == "z":
        pass
    return s * mp.ldexp(fl, int(ex) - p)
