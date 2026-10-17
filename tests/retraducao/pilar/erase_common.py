#!/usr/bin/env python3
"""FORA DE USO desde 15/10/2026: o tradutor/RT45 resolveram o pedido e o contorno saiu do correcoes.json.
Fica so como registro do que foi feito.

Contorno do PEDIDOS-TRADUTOR P4: ERASE de matriz do COMMON antes do CHAIN.

No QB64, depois de `ERASE m` (matriz dinamica) o LBOUND(m) da erro 9; o RT_COMMON_GRAVA gerado por
tools/common_familia.py testa `LBOUND(m, 1) <> -32768` e o CHAIN para no tratador de erro do
programa (PILAREDI 0x1075d..0x1080e + CHAIN PILAR em 0x10826: F2 no menu dava ' Modulo nao
encontrado' em vez de voltar ao PILAR). No QB4.5 a matriz apagada simplesmente nao existe; pela
convencao do RT45 isso e o estado 'nao dimensionada' (limites -32768). Para cada `ERASE A_xxxx`
de matriz do COMMON do EXE, grava em src-original/pilar/correcoes.json `REDIM A_xxxx(-32768 TO -32768, ...)`.
Uso: python -I erase_common.py EXE:COMUM_<NOME>.json ...
"""
import json
import re
import sys

raiz = __file__.replace("\\", "/").rsplit("/tests/", 1)[0]
cj = f"{raiz}/src-original/pilar/correcoes.json"
c = json.load(open(cj, encoding="utf-8"))
EV = ("PROVISORIO (PEDIDOS-TRADUTOR P4): ERASE de matriz do COMMON vira 'nao dimensionada' (limites -32768); "
      "no QB64 o LBOUND de matriz apagada da erro 9 no RT_COMMON_GRAVA do CHAIN seguinte "
      "(tests/retraducao/pilar/erase_common.py).")
for arg in sys.argv[1:]:
    exe, comum = arg.split(":")
    vs = {v["base"]: v for v in json.load(open(f"{raiz}/src-original/pilar/{comum}", encoding="utf-8"))["vars"]}
    tab = c.setdefault(exe, {})
    n = 0
    for l in open(f"{raiz}/src-original/pilar/{exe}.BAS", encoding="cp437"):
        m = re.match(r"^\s*ERASE (A_[0-9a-f]{4})([!#%&$]?)\s+'@([0-9a-f]+)", l)
        if not m or m.group(1) not in vs:
            continue
        v = vs[m.group(1)]
        dims = ", ".join(["-32768 TO -32768"] * max(1, v["nd"]))
        end = "0x" + m.group(3)
        tab[end] = [f"REDIM {v['nome']}{v['suf']}({dims})"]
        tab["_" + end] = EV
        n += 1
    print(exe, n, "ERASE de matriz do COMMON")
json.dump(c, open(cj, "w", encoding="utf-8"), indent=1, ensure_ascii=False)
