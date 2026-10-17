"""Compara, pixel a pixel, os despejos da sonda grafica: oraculo (QB4.5) x QB64 (RT45GFX).

Uso: python -I compara_gfx.py <obra do oraculo> <saida do QB64> [pasta para PNG das diferencas]
  oraculo: G<n>.CGA (BSAVE de B800:0000, 16384 bytes) ou G<n>.E0..E3 (planos EGA, 28000 bytes)
  QB64:    G<n>.RAW (indice de cor por pixel, 640 x altura)
Tambem compara os arquivos de texto GFX?.TXT (PMAP e erros) linha a linha.
Saida: uma linha por cena com o numero de pixels diferentes; codigo 1 se algo difere.
"""
import os
import sys


def le_oraculo(pasta, n):
    cga = os.path.join(pasta, "G%d.CGA" % n)
    if os.path.exists(cga):
        b = open(cga, "rb").read()[7:]
        px = bytearray(640 * 200)
        for y in range(200):
            o = (y & 1) * 0x2000 + (y >> 1) * 80
            for xb in range(80):
                v = b[o + xb]
                for k in range(8):
                    px[y * 640 + xb * 8 + k] = (v >> (7 - k)) & 1
        return 640, 200, px
    pl = [open(os.path.join(pasta, "G%d.E%d" % (n, p)), "rb").read()[7:] for p in range(4)]
    px = bytearray(640 * 350)
    for i in range(80 * 350):
        for k in range(8):
            c = 0
            for p in range(4):
                c |= ((pl[p][i] >> (7 - k)) & 1) << p
            px[i * 8 + k] = c
    return 640, 350, px


def png(caminho, w, h, linhas):
    import zlib, struct
    raw = b"".join(b"\x00" + bytes(l) for l in linhas)
    def chunk(t, d):
        c = struct.pack(">I", len(d)) + t + d
        return c + struct.pack(">I", zlib.crc32(t + d) & 0xFFFFFFFF)
    with open(caminho, "wb") as f:
        f.write(b"\x89PNG\r\n\x1a\n" + chunk(b"IHDR", struct.pack(">IIBBBBB", w, h, 8, 2, 0, 0, 0))
                + chunk(b"IDAT", zlib.compress(raw, 9)) + chunk(b"IEND", b""))


def main():
    orc, q64 = sys.argv[1], sys.argv[2]
    dif_dir = sys.argv[3] if len(sys.argv) > 3 else None
    ns = sorted({int(f[1:].split(".")[0]) for f in os.listdir(orc) if f.startswith("G") and f[1:2].isdigit()})
    ruim = 0
    for n in ns:
        raw = os.path.join(q64, "G%d.RAW" % n)
        if not os.path.exists(raw):
            continue
        w, h, a = le_oraculo(orc, n)
        b = open(raw, "rb").read()
        if len(b) != w * h:
            print("G%d: tamanho %d x %d" % (n, len(b), w * h)); ruim += 1; continue
        if h == 200:
            b = bytes(1 if v else 0 for v in b)
        dif = [i for i in range(w * h) if a[i] != b[i]]
        acesos = sum(1 for v in a if v)
        print("G%d: %d pixels diferentes (%d acesos no oraculo)" % (n, len(dif), acesos))
        if dif:
            ruim += 1
            amostra = [(i % w, i // w, a[i], b[i]) for i in dif[:12]]
            print("   (x, y, oraculo, qb64):", amostra)
            if dif_dir:
                os.makedirs(dif_dir, exist_ok=True)
                linhas = []
                for y in range(h):
                    l = bytearray()
                    for x in range(w):
                        i = y * w + x
                        if a[i] and not b[i]:
                            l += b"\xff\x40\x40"      # so no oraculo: vermelho
                        elif b[i] and not a[i]:
                            l += b"\x40\xff\x40"      # so no QB64: verde
                        elif a[i] != b[i]:
                            l += b"\xff\xff\x00"      # cores diferentes: amarelo
                        elif a[i]:
                            l += b"\x80\x80\x80"
                        else:
                            l += b"\x00\x00\x00"
                    linhas.append(l)
                png(os.path.join(dif_dir, "dif_G%d.png" % n), w, h, linhas)
    for t in sorted(f for f in os.listdir(orc) if f.startswith("GFX") and f.endswith(".TXT")):
        q = os.path.join(q64, t)
        if not os.path.exists(q):
            continue
        la = [l.strip() for l in open(os.path.join(orc, t), encoding="latin-1")]
        lb = [l.strip() for l in open(q, encoding="latin-1")]
        d = [(i, x, y) for i, (x, y) in enumerate(zip(la, lb)) if x != y]
        if len(la) != len(lb):
            d.append(("linhas", len(la), len(lb)))
        print("%s: %s" % (t, "igual" if not d else "DIFERE %s" % d[:6]))
        ruim += bool(d)
    return 1 if ruim else 0


if __name__ == "__main__":
    sys.exit(main())
