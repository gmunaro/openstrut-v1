#!/usr/bin/env python3
"""FORA DE USO desde 15/10/2026: o tradutor/RT45 resolveram o pedido e o contorno saiu do correcoes.json.
Fica so como registro do que foi feito.

Contorno do PEDIDOS-TRADUTOR P3 (= laje P8): `RT_PU#(CSNG(expr _FLOAT), ...)` nao arredonda para
SINGLE no QB64 (o valor vai inteiro para o parametro DOUBLE); `CVS(MKS$(expr))` arredonda como o FSTP
do QB4.5. Para cada linha do .BAS atual com `RT_PU#(CSNG(`, grava em src-original/pilar/correcoes.json
a linha com essa troca (se a linha ja e correcao manual, troca dentro dela).
Uso: python -I csng_pu.py EXE ...
"""
import json
import re
import sys

raiz = __file__.replace("\\", "/").rsplit("/tests/", 1)[0]
cj = f"{raiz}/src-original/pilar/correcoes.json"
c = json.load(open(cj, encoding="utf-8"))
EV = ("PROVISORIO (PEDIDOS-TRADUTOR P3, = laje P8): CSNG(expressao _FLOAT) no QB64 nao arredonda para SINGLE "
      "quando o valor vai para o parametro DOUBLE de RT_PU#; CVS(MKS$(...)) arredonda como o FSTP do QB4.5. "
      "Linha do tradutor com so essa troca (tests/retraducao/pilar/csng_pu.py).")


def troca(cod):
    out, i = "", 0
    while True:
        j = cod.find("RT_PU#(CSNG(", i)
        if j < 0:
            return out + cod[i:]
        k = j + len("RT_PU#(CSNG(")
        nivel, q = 1, k
        while nivel:
            ch = cod[q]
            if ch == '"':
                q = cod.index('"', q + 1)
            elif ch == "(":
                nivel += 1
            elif ch == ")":
                nivel -= 1
            q += 1
        out += cod[i:j] + "RT_PU#(CVS(MKS$(" + cod[k:q - 1] + "))"
        i = q


for exe in sys.argv[1:]:
    tab = c.setdefault(exe, {})
    n = 0
    for l in open(f"{raiz}/src-original/pilar/{exe}.BAS", encoding="cp437"):
        if "RT_PU#(CSNG(" not in l:
            continue
        m = re.search(r"'@([0-9a-f]+)", l)
        end = "0x" + m.group(1)
        if end in tab and isinstance(tab[end], list):
            tab[end] = [troca(x) for x in tab[end]]
        else:
            tab[end] = [troca(l.split("   '@")[0].strip())]
            tab["_" + end] = EV
        n += 1
    print(exe, n, "linhas")
json.dump(c, open(cj, "w", encoding="utf-8"), indent=1, ensure_ascii=False)
