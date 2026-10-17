#!/usr/bin/env python3
"""Compara a saída do oráculo (original no DOSBox-X) com a do programa retraduzido.

Uso: python -I tools/compara_retrad.py <runs/CASO-data do oráculo> <saída de tools/roda_retrad.sh>
     [--ignora REGEX ...]

Telas de texto: compara linha a linha (o oráculo grava UTF-8; o RT45 grava CP437).
Telas gráficas: compara os PNG pixel a pixel (aceso/apagado), se os dois existirem.
Impressora: compara impressora.prn byte a byte. --obra <pasta C: da V1>: também os arquivos da
obra que o oráculo devolveu em <runs>/obra.
Relógio: tela, impressora ou arquivo cuja única diferença são horas HH:MM[:SS] na mesma posição,
as duas entre --relogio (12:00:00) e --relogio + --janela minutos (120), sai "igual (relógio)".
Marca: com --marca openstrut (padrão, ou o da variável V1_MARCA), antes de comparar troca nas telas
de texto e na impressora do oráculo cada texto do original pelo do OpenStrut (src-original/marca.json,
a mesma tabela do tools/retraduz.py, mesma largura); os arquivos da obra não mudam (a V1 grava neles o
texto do original). As trocas cujo texto do original está só como hash na tabela (nomes de pessoa e da
empresa do original) precisam do texto em V1_MARCA_ORIGINAL (tools/marca.py); sem ele ficam de fora, com
aviso, e a diferença nesses textos aparece. --marca original compara sem troca (EXE gerados com
retraduz.py --marca original).
Sai com 0 se tudo bate (descontadas as linhas que casam com --ignora).
"""
import argparse
import os
import re
import struct
import sys
import zlib

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import marca as marca_tab   # noqa: E402  (tools/marca.py)


def le_png(caminho):
    """PNG 8 bits (cinza ou paleta) ou RGB/RGBA -> (w, h, lista de linhas com 0/1)."""
    d = open(caminho, "rb").read()
    pos, w, h = 8, None, None
    dados, tipo, prof = b"", None, None
    while pos < len(d):
        n = struct.unpack(">I", d[pos:pos + 4])[0]
        t = d[pos + 4:pos + 8]
        c = d[pos + 8:pos + 8 + n]
        if t == b"IHDR":
            w, h, prof, tipo = struct.unpack(">IIBB", c[:10])
        elif t == b"IDAT":
            dados += c
        pos += 12 + n
    raw = zlib.decompress(dados)
    canais = {0: 1, 2: 3, 3: 1, 4: 2, 6: 4}[tipo]
    bpp = canais * prof // 8 or 1
    stride = (w * canais * prof + 7) // 8
    linhas, ant = [], bytearray(stride)
    i = 0
    for _ in range(h):
        f = raw[i]
        lin = bytearray(raw[i + 1:i + 1 + stride])
        i += 1 + stride
        for x in range(stride):
            a = lin[x - bpp] if x >= bpp else 0
            b = ant[x]
            cc = ant[x - bpp] if x >= bpp else 0
            if f == 1:
                lin[x] = (lin[x] + a) & 255
            elif f == 2:
                lin[x] = (lin[x] + b) & 255
            elif f == 3:
                lin[x] = (lin[x] + (a + b) // 2) & 255
            elif f == 4:
                p = a + b - cc
                pa, pb, pc = abs(p - a), abs(p - b), abs(p - cc)
                pr = a if pa <= pb and pa <= pc else (b if pb <= pc else cc)
                lin[x] = (lin[x] + pr) & 255
        ant = lin
        px = []
        for x in range(w):
            if prof == 8:
                v = lin[x * canais:(x + 1) * canais]
                px.append(1 if any(v[:3] if canais >= 3 else v[:1]) else 0)
            else:
                bit = (lin[x * prof // 8] >> (8 - prof - (x * prof) % 8)) & ((1 << prof) - 1)
                px.append(1 if bit else 0)
        linhas.append(px)
    return w, h, linhas


def pad(linhas, i):
    return (linhas[i] if i < len(linhas) else "").ljust(80)[:80]


_ATR = {}


def atr_oraculo(run, k):
    """Atributos (25 linhas em hexadecimal) da k-ésima tela do oráculo, lidos do telas.raw
    (docker/oraculo.py: "\x0c=== TELA nome modo=MM", texto, "ATR\r\n", 2000 bytes). None se não há."""
    if run not in _ATR:
        lista = []
        try:
            raw = open(os.path.join(run, "telas.raw"), "rb").read()
        except OSError:
            raw = b""
        for m in re.finditer(rb"\x0c=== TELA (.*?) modo=([0-9A-F]{2})\r\n", raw):
            fim = raw.find(b"\x0c=== TELA ", m.end())
            corpo = raw[m.end():fim if fim >= 0 else len(raw)]
            j = corpo.find(b"ATR\r\n")
            lista.append(corpo[j + 5:j + 5 + 2000] if j >= 0 and not corpo.startswith(b"BIN") else None)
        _ATR[run] = lista
    lista = _ATR[run]
    if k < 1 or k > len(lista) or not lista[k - 1] or len(lista[k - 1]) < 2000:
        return None
    b = lista[k - 1]
    return ["".join(f"{x:02X}" for x in b[y * 80:(y + 1) * 80]) for y in range(25)]


HORA = re.compile(rb"(?<![0-9])([0-2][0-9]):([0-5][0-9])(?::([0-5][0-9]))?(?![0-9])")


def so_relogio(x, y, ini, janela):
    """Diferenças só em horas escritas pelo programa (TIME$): x e y (bytes) do mesmo tamanho, e cada
    trecho diferente cai dentro de um HH:MM[:SS] na mesma posição nos dois, com as duas horas entre
    o início do relógio fixo (SISTRUT_DATA / ORACULO_DATA) e início + janela minutos. O relógio
    anda com o tempo real nos dois lados, e o oráculo leva mais tempo até a mesma tela/relatório.
    Devolve a lista de pares (hora oráculo, hora V1) ou None se há outra diferença."""
    if len(x) != len(y) or x == y:
        return None
    def seg(m):
        return int(m.group(1)) * 3600 + int(m.group(2)) * 60 + int(m.group(3) or 0)
    hx = {m.span(): m for m in HORA.finditer(x)}
    hy = {m.span(): m for m in HORA.finditer(y)}
    pares, i = [], 0
    while i < len(x):
        if x[i] == y[i]:
            i += 1
            continue
        sp = next((sp for sp in hx if sp[0] <= i < sp[1] and sp in hy), None)
        if sp is None:
            return None
        for m in (hx[sp], hy[sp]):
            if not (ini <= seg(m) <= ini + janela * 60):
                return None
        pares.append((hx[sp].group(0).decode(), hy[sp].group(0).decode()))
        i = sp[1]
    return pares


def le_tela(caminho, cp437):
    b = open(caminho, "rb").read()
    t = b.decode("cp437" if cp437 else "utf-8", "replace")
    return [l.rstrip() for l in t.replace("\r", "").split("\n")][:25]


FONTE_QB64 = os.path.join(os.environ.get("QB64_DIR") or "C:/qb64pe/qb64pe", "internal", "c", "libqb.cpp")


class Marca:
    """Trocas de marca.json aplicadas ao oráculo, com a contagem do que foi trocado.
    Texto (tela, realce, impressora): o texto do original vira o do OpenStrut, o mais longo
    primeiro, numa passada só. Desenho em CGA (PNG 640x200) e cópia gráfica da tela na impressora
    (ESC L, colunas de 8 pixels com o bit 7 em cima): o texto escrito com a fonte 8x8 vira o
    texto novo com a mesma fonte. A fonte é a do QB64 PE (file_charset8_raw); se o desenho do
    oráculo não bate com ela, nada é trocado e a diferença aparece."""
    def __init__(self, caminho, fonte=FONTE_QB64):
        tab = marca_tab.trocas(caminho)
        self.sem_texto = sum(1 for t in tab if t["original"] is None)
        self.trocas = sorted(((t["original"], t["openstrut"]) for t in tab if t["original"] is not None),
                             key=lambda p: -len(p[0]))
        self.tab = dict(self.trocas)
        # (?!) não casa nada: tabela sem nenhum texto do original conhecido
        self.re = re.compile("|".join(re.escape(o) for o, _ in self.trocas) or "(?!)")
        self.reb = re.compile(b"|".join(re.escape(o.encode("cp437")) for o, _ in self.trocas) or b"(?!)")
        self.fonte = fonte
        self.glifos = None
        self.telas = self.impressora = self.imagem = self.grafico = 0

    def linha(self, l):
        x, n = self.re.subn(lambda m: self.tab[m.group(0)], l.ljust(80))
        self.telas += n
        return x.rstrip()

    def _glifos(self):
        if self.glifos is None:
            txt = open(self.fonte, encoding="utf-8", errors="replace").read()
            k = txt.index("file_charset8_raw[] = {")
            v = [int(x) for x in re.findall(r"\d+", txt[k + 23:txt.index("}", k)])]
            self.glifos = [[[1 if v[c * 64 + y * 8 + x] else 0 for x in range(8)] for y in range(8)]
                           for c in range(256)]
        return self.glifos

    def _linhas(self, t):
        """Texto -> 8 linhas de pixels ('0'/'1'), 8 colunas por caractere."""
        g = self._glifos()
        return ["".join("".join(map(str, g[c][y])) for c in t.encode("cp437")) for y in range(8)]

    def _colunas(self, t):
        """Texto -> bytes da cópia gráfica: uma coluna de 8 pixels por byte, bit 7 = linha de cima."""
        g = self._glifos()
        return bytes(sum(g[c][y][x] << (7 - y) for y in range(8)) for c in t.encode("cp437") for x in range(8))

    def bytes(self, b):
        b, n = self.reb.subn(lambda m: self.tab[m.group(0).decode("cp437")].encode("cp437"), b)
        self.impressora += n
        if os.path.exists(self.fonte):
            for o, novo in self.trocas:
                po, pn = self._colunas(o), self._colunas(novo)
                if po != pn and po in b:
                    self.grafico += b.count(po)
                    b = b.replace(po, pn)
        return b

    def imagem_cga(self, linhas):
        """Pixels (0/1) do PNG do oráculo: troca o texto desenhado com a fonte 8x8."""
        if not os.path.exists(self.fonte):
            return linhas
        img = ["".join(map(str, l)) for l in linhas]
        for o, novo in self.trocas:
            po, pn = self._linhas(o), self._linhas(novo)
            for y in range(len(img) - 7):
                x = img[y].find(po[0])
                while x >= 0:
                    if all(img[y + r][x:x + len(po[r])] == po[r] for r in range(8)):
                        for r in range(8):
                            img[y + r] = img[y + r][:x] + pn[r] + img[y + r][x + len(pn[r]):]
                        self.imagem += 1
                    x = img[y].find(po[0], x + 1)
        return [[int(c) for c in l] for l in img]


def main():
    sys.stdout.reconfigure(encoding="utf-8", newline=chr(10))
    ap = argparse.ArgumentParser()
    ap.add_argument("oraculo")
    ap.add_argument("v1")
    ap.add_argument("--ignora", action="append", default=[])
    ap.add_argument("--relogio", default="12:00:00",
                    help="hora de partida do relógio fixo nos dois lados (padrão 12:00:00, o de roda_retrad.sh)")
    ap.add_argument("--janela", type=int, default=120, help="minutos depois da partida aceitos como hora do relógio")
    ap.add_argument("--obra", help="pasta C: da V1: compara também os arquivos de <oraculo>/obra com os dela")
    ap.add_argument("--marca", choices=("openstrut", "original"), default=os.environ.get("V1_MARCA") or "openstrut",
                    help="openstrut: aplica as trocas de marca.json às telas e à impressora do oráculo")
    ap.add_argument("--marca-json", default=os.path.join(os.path.dirname(os.path.abspath(__file__)), "..",
                                                         "src-original", "marca.json"))
    a = ap.parse_args()
    marca = Marca(a.marca_json) if a.marca == "openstrut" else None
    if marca and marca.sem_texto:
        print(f"aviso: {marca.sem_texto} trocas de marca sem o texto do original (defina V1_MARCA_ORIGINAL; "
              "ver tools/marca.py); a diferença nesses textos vai aparecer", file=sys.stderr)
    h = [int(x) for x in a.relogio.split(":")] + [0, 0]
    ini = h[0] * 3600 + h[1] * 60 + h[2]
    ign = [re.compile(x) for x in a.ignora]
    to, tv = os.path.join(a.oraculo, "telas"), os.path.join(a.v1, "telas")
    nomes = sorted(f for f in os.listdir(to) if f.endswith(".txt") and ".realce" not in f)
    ok = dif = rel = 0
    for n in nomes:
        base = n[:-4]
        po, pv = os.path.join(to, base + ".png"), os.path.join(tv, base + ".png")
        if os.path.exists(po) and os.path.exists(pv):
            wo, ho, io = le_png(po)
            if marca and (wo, ho) == (640, 200):
                io = marca.imagem_cga(io)
            wv, hv, iv = le_png(pv)
            if (wo, ho) != (wv, hv):
                print(f"DIFERE {base}: imagem {wo}x{ho} no oráculo, {wv}x{hv} na V1")
                dif += 1
                continue
            npx = sum(1 for y in range(ho) for x in range(wo) if io[y][x] != iv[y][x])
            if npx:
                print(f"DIFERE {base}: {npx} pixels diferentes em {wo}x{ho}")
                dif += 1
            else:
                print(f"OK     {base} (imagem {wo}x{ho})")
                ok += 1
            continue
        if not os.path.exists(os.path.join(tv, n)):
            print(f"FALTA  {base} na V1")
            dif += 1
            continue
        lo, lv = le_tela(os.path.join(to, n), False), le_tela(os.path.join(tv, n), True)
        if marca:
            lo = [marca.linha(l) for l in lo]
        # célula do cursor piscando: o oráculo grava em qualquer fase do pisca, a V1 numa só.
        # Se a única diferença de texto da tela é uma célula com "_" de um lado, é o cursor.
        cel = [(i, c) for i in range(25) for c in range(80)
               if pad(lo, i)[c] != pad(lv, i)[c]]
        cursor = None
        if len(cel) == 1 and "_" in (pad(lo, cel[0][0])[cel[0][1]], pad(lv, cel[0][0])[cel[0][1]]):
            cursor = cel[0]
            i, c = cursor
            lo[i] = pad(lo, i)[:c] + "_" + pad(lo, i)[c + 1:]
            lv[i] = pad(lv, i)[:c] + "_" + pad(lv, i)[c + 1:]
            lo[i], lv[i] = lo[i].rstrip(), lv[i].rstrip()
        ro_, rv_ = os.path.join(to, base + ".realce.txt"), os.path.join(tv, base + ".realce.txt")
        # com os atributos exatos dos dois lados, o realce (derivado deles, com desempate diferente
        # quando dois atributos empatam como o mais comum; DESENHO D4) não conta
        ao, av = atr_oraculo(a.oraculo, int(base[:3])), os.path.join(tv, base + ".atr.txt")
        if os.path.exists(ro_) and os.path.exists(rv_) and not (ao and os.path.exists(av)):
            ro, rv = le_tela(ro_, False), le_tela(rv_, True)
            if marca:   # o realce traz o texto das células realçadas
                ro = [marca.linha(l) for l in ro]
            for i in range(25):
                x, y = pad(ro, i), pad(rv, i)
                if cursor and cursor[0] == i:
                    c = cursor[1]
                    x, y = x[:c] + " " + x[c + 1:], y[:c] + " " + y[c + 1:]
                if x != y and not any(r.search(lo[i] if i < len(lo) else "") for r in ign):
                    lo.append(f"(realce {i + 1}) {x.rstrip()}")
                    lv.append(f"(realce {i + 1}) {y.rstrip()}")
        # atributo exato de cada célula: o do oráculo vem do telas.raw, o da V1 de .atr.txt
        if ao and os.path.exists(av):
            av = [l.strip() for l in open(av, encoding="ascii").read().splitlines()][:25]
            for i in range(25):
                x, y = ao[i], (av[i] if i < len(av) else "")
                if cursor and cursor[0] == i:
                    c = cursor[1] * 2
                    x, y = x[:c] + ".." + x[c + 2:], y[:c] + ".." + y[c + 2:]
                if x != y and not any(r.search(lo[i] if i < len(lo) else "") for r in ign):
                    lo.append(f"(atributo {i + 1}) {x}")
                    lv.append(f"(atributo {i + 1}) {y}")
        difs, relogio = [], []
        for i in range(max(len(lo), len(lv))):
            x = lo[i] if i < len(lo) else ""
            y = lv[i] if i < len(lv) else ""
            if x != y and not any(r.search(x) for r in ign):
                r = so_relogio(x.encode("cp437", "replace"), y.encode("cp437", "replace"), ini, a.janela)
                if r:
                    relogio += r
                else:
                    difs.append((i + 1, x, y))
        if difs:
            dif += 1
            print(f"DIFERE {base}:")
            for i, x, y in difs:
                print(f"   linha {i:2d} oráculo: {x!r}")
                print(f"           V1     : {y!r}")
        else:
            ok += 1
            rel += bool(relogio)
            print(f"OK     {base}" + (f" (igual (cursor) na linha {cursor[0] + 1}, coluna {cursor[1] + 1})" if cursor else "")
                  + (" (igual (relógio): " + ", ".join(f"{p} x {q}" for p, q in relogio) + ")" if relogio else ""))
    pi_o, pi_v = os.path.join(a.oraculo, "impressora.prn"), os.path.join(a.v1, "impressora.prn")
    if os.path.exists(pi_o) or os.path.exists(pi_v):
        bo = open(pi_o, "rb").read() if os.path.exists(pi_o) else b""
        bv = open(pi_v, "rb").read() if os.path.exists(pi_v) else b""
        if marca:
            bo = marca.bytes(bo)
        r = so_relogio(bo, bv, ini, a.janela)
        if bo == bv:
            print(f"OK     impressora.prn ({len(bo)} bytes iguais)")
            ok += 1
        elif r:
            print(f"OK     impressora.prn ({len(bo)} bytes, igual (relógio): " + ", ".join(f"{p} x {q}" for p, q in r) + ")")
            ok += 1
            rel += 1
        else:
            k = next((i for i in range(min(len(bo), len(bv))) if bo[i] != bv[i]), min(len(bo), len(bv)))
            print(f"DIFERE impressora.prn: {len(bo)} x {len(bv)} bytes; primeiro byte diferente em {k}: "
                  f"{bo[k:k + 16].hex(' ')} | {bv[k:k + 16].hex(' ')}")
            dif += 1
    if a.obra and os.path.isdir(os.path.join(a.oraculo, "obra")):
        na_v1 = {f.upper(): f for f in os.listdir(a.obra) if os.path.isfile(os.path.join(a.obra, f))}
        for f in sorted(os.listdir(os.path.join(a.oraculo, "obra"))):
            if f.upper().endswith((".EXE", ".OBJ")):
                continue
            bo = open(os.path.join(a.oraculo, "obra", f), "rb").read()
            if f.upper() not in na_v1:
                print(f"FALTA  obra/{f} na V1")
                dif += 1
                continue
            bv = open(os.path.join(a.obra, na_v1[f.upper()]), "rb").read()
            r = so_relogio(bo, bv, ini, a.janela)
            if bo == bv:
                print(f"OK     obra/{f} ({len(bo)} bytes iguais)")
                ok += 1
            elif r:
                print(f"OK     obra/{f} ({len(bo)} bytes, igual (relógio): " + ", ".join(f"{p} x {q}" for p, q in r) + ")")
                ok += 1
                rel += 1
            else:
                k = next((i for i in range(min(len(bo), len(bv))) if bo[i] != bv[i]), min(len(bo), len(bv)))
                print(f"DIFERE obra/{f}: {len(bo)} x {len(bv)} bytes; primeiro byte diferente em {k}: "
                      f"{bo[k:k + 16].hex(' ')} | {bv[k:k + 16].hex(' ')}")
                dif += 1
    if marca:
        print(f"\nmarca: trocas no oráculo: {marca.telas} em texto de tela, {marca.imagem} em desenho, "
              f"{marca.impressora} em texto da impressora, {marca.grafico} na cópia gráfica da impressora")
    # com o relógio congelado nos dois lados a regra do relógio não devia ser usada: conta à parte
    print(f"\n{ok} iguais, {dif} diferentes" + (f" ({rel} iguais só pela regra do relógio)" if rel else ""))
    sys.exit(0 if dif == 0 else 1)


if __name__ == "__main__":
    main()
