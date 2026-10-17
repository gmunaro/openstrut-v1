#!/usr/bin/env python3
"""Contorno PROVISORIO do pedido R10 (PEDIDOS-TRADUTOR, secao VPLOTA): STR$ de DOUBLE.
O B$STR8 do BRUN45 escreve 16 algarismos significativos (oraculo retrad_vpl_dxf2: 78062.39999999999);
o STR$ do QB64 escreve a forma mais curta que volta ao mesmo DOUBLE (78062.4). Para cada linha
'X = ...STR$(RT_DBL#(expr))...' do VPLOTA.BAS gerado, grava em src-original/viga/correcoes.json a troca por
RT_FX# = RT_DBL#(expr) e o texto montado com _TOSTR$(ABS(RT_FX#), 16) (sem o 0 antes do ponto, espaco ou
'-' na frente, como o QB4.5). Numeros com expoente (>= 1D16 ou muito pequenos) nao sao tratados.
Uso: python -I gera_str8.py   (depois regenerar com build.sh)"""
import json, os, re
raiz = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", "..", ".."))
bas = open(os.path.join(raiz, "src-original", "viga", "VPLOTA.BAS"), encoding="cp437").read().split("\n")
pc = os.path.join(raiz, "src-original", "viga", "correcoes.json")
d = json.loads(open(pc, encoding="utf-8").read())
v = d["VPLOTA"]
n = 0
for l in bas:
    m = re.search(r"'@([0-9a-f]+)", l)
    if not m or "STR$(RT_DBL#(" not in l or "(correcao manual)" in l:
        continue
    cod = l[:l.index("'@")].strip()
    i = cod.index("STR$(RT_DBL#(") + len("STR$(")
    # expressao RT_DBL#(...) com parenteses balanceados
    k, prof = i + len("RT_DBL#("), 1
    while prof:
        prof += {"(": 1, ")": -1}.get(cod[k], 0); k += 1
    expr = cod[i:k]
    novo = cod[:i - len("STR$(")] + "RT_FX$" + cod[k + 1:]
    ad = "0x" + m.group(1)
    v[ad] = ["RT_FX# = " + expr + "   ' PROVISORIO (R10): STR$ de DOUBLE com 16 algarismos (B$STR8)",
             "RT_FX$ = _TOSTR$(ABS(RT_FX#), 16): IF LEFT$(RT_FX$, 2) = \"0.\" THEN RT_FX$ = MID$(RT_FX$, 2)",
             "RT_FX$ = MID$(\" -\", 1 - (RT_FX# < 0), 1) + RT_FX$",
             novo]
    v["_" + ad] = ("PROVISORIO (PEDIDOS-TRADUTOR R10): STR$ de DOUBLE (B$STR8) escreve 16 algarismos significativos; o QB64 "
                   "escreve o mais curto que volta ao mesmo valor (oraculo retrad_vpl_dxf2, VPINI 0x55b82: ' 78062.39999999999' x "
                   "' 78062.4' no FV1_E2E.DXF). Gerado por tests/retraducao/viga/gera_str8.py.")
    n += 1
open(pc, "w", encoding="utf-8", newline="\n").write(json.dumps(d, ensure_ascii=False, indent=1))
print(n, "linhas")
