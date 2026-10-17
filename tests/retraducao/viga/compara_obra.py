#!/usr/bin/env python3
"""Compara os arquivos de obra gravados pelo original (runs/<caso>/obra) com os da V1 (pasta "C:"
do caso), byte a byte. Com VIGA_DATAS=1 troca antes datas (MM-DD-AAAA, MM-DD-AA) e horas por marcas.
Uso: python -I compara_obra.py <runs/CASO do oraculo> <pasta C: da V1>"""
import os
import re
import sys

HORA = re.compile(rb"\d\d:\d\d(:\d\d)?|\d\d-\d\d-\d{4}")
# Datas do relogio fixo (2026-10-14). O oraculo gravou 10-15-2026 nos casos retrad_vpl_edv* (rodados de madrugada),
# mesmo com "date 10-14-2026" no autoexec; causa provavel: o dia UTC do conteiner (PEDIDOS-TRADUTOR S3).
DATAS = (b"10-14-2026", b"10-15-2026")


def so_relogio(x, y):
    """Pares de horas (oráculo, V1) se a única diferença são horas HH:MM[:SS] na mesma posição, entre
    12:00 e 14:00 (relógio fixo do oráculo e do roda_retrad.sh, que anda com o tempo de cada execução;
    mesma regra do tools/compara_retrad.py), ou datas do relógio fixo (DATAS); None se há outra diferença."""
    if len(x) != len(y):
        return None
    hx = {m.start(): m for m in HORA.finditer(x)}
    pares, i = [], 0
    while i < len(x):
        if x[i] == y[i]:
            i += 1
            continue
        m = next((m for k, m in hx.items() if k <= i < m.end()), None)
        if m is None:
            return None
        a, b = x[m.start():m.end()], y[m.start():m.end()]
        if not HORA.fullmatch(b):
            return None
        if len(a) == 10:
            if a not in DATAS or b not in DATAS:
                return None
        elif not (b"12:00" <= a[:5] < b"14:00" and b"12:00" <= b[:5] < b"14:00"):
            return None
        pares.append((a.decode(), b.decode()))
        i = m.end()
    return pares

sys.stdout.reconfigure(encoding="utf-8")
o, v = sys.argv[1], sys.argv[2]
pat = [(re.compile(rb"\d\d-\d\d-\d\d(\d\d)?"), b"DD-DD-DD"), (re.compile(rb"\d\d:\d\d(:\d\d)?"), b"HH:MM")]
ok = dif = 0
pasta = os.path.join(o, "obra")
todos = sorted(os.path.relpath(os.path.join(r, f), pasta) for r, _, fs in os.walk(pasta) for f in fs)     if os.path.isdir(pasta) else []
for n in todos:
    po = os.path.join(pasta, n)
    pv = os.path.join(v, n)
    if not os.path.exists(pv):
        print(f"FALTA  obra/{n} na V1"); dif += 1; continue
    bo, bv = open(po, "rb").read(), open(pv, "rb").read()
    for p, s in (pat if os.environ.get("VIGA_DATAS") == "1" else []):
        bo, bv = p.sub(s, bo), p.sub(s, bv)
    rel = so_relogio(bo, bv) if bo != bv else None
    if rel:
        print(f"OK     obra/{n} ({len(bo)} bytes, igual (relógio): " + ", ".join(f"{a} x {b}" for a, b in rel) + ")"); ok += 1
    elif bo == bv:
        print(f"OK     obra/{n} ({len(bo)} bytes" + (", datas trocadas)" if os.environ.get("VIGA_DATAS") == "1" else ")")); ok += 1
    else:
        k = next((i for i in range(min(len(bo), len(bv))) if bo[i] != bv[i]), min(len(bo), len(bv)))
        print(f"DIFERE obra/{n}: {len(bo)} x {len(bv)} bytes; 1o byte diferente em {k}: {bo[k:k+16].hex(' ')} | {bv[k:k+16].hex(' ')}")
        dif += 1
print(f"obra: {ok} iguais, {dif} diferentes")
