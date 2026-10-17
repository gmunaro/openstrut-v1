#!/usr/bin/env python3
"""FORA DE USO desde 15/10/2026: o tradutor/RT45 resolveram o pedido e o contorno saiu do correcoes.json.
Fica so como registro do que foi feito.

Acrescenta a src-original/pilar/correcoes.json a troca de ordem do TAB num PRINT USING.

O lift escreve `PRINT USING f$; TAB(n); ""; x` mas o .asm chama B$FTAB, B$PSSD "", B$USNG e so
depois o item (ex.: PILGEEDI 0x1968c..0x196ab): o TAB e o "" saem antes do USING. Traduzido como o
lift, o QB64 aplica o formato numerico ao "" e da erro 13 (PILAREDI 0x40be0, caso ref_pilaredi).
Le a linha gerada no .BAS atual e grava a linha com `TAB(n); ""; USING f$;` (PEDIDOS-TRADUTOR P2).
Uso: python -I using_tab.py EXE:0xENDERECO ...
"""
import json
import re
import sys

raiz = __file__.replace("\\", "/").rsplit("/tests/", 1)[0]
cj = f"{raiz}/src-original/pilar/correcoes.json"
c = json.load(open(cj, encoding="utf-8"))
for arg in sys.argv[1:]:
    exe, end = arg.split(":")
    tag = "'@" + end[2:]
    linha = next(l for l in open(f"{raiz}/src-original/pilar/{exe}.BAS", encoding="cp437")
                 if tag + " " in l or l.rstrip().endswith(tag))
    if "(correcao manual)" in linha:
        print(arg, "ja corrigido"); continue
    cod = linha.split("   '@")[0].strip()
    novo, n = re.subn(r'^((?:RT_LPTABRE: )?PRINT (?:#\w+, )?)USING ("[^"]*"|\S+?); ((?:TAB|SPC)\([^)]*\)); ""; ', r'\1\3; ""; USING \2; ', cod)
    assert n == 1, (arg, cod)
    c.setdefault(exe, {})[end] = [novo]
    c[exe]["_" + end] = ("PROVISORIO (PEDIDOS-TRADUTOR P2): o .asm chama B$FTAB, B$PSSD \"\" e so depois B$USNG; "
                         "o TAB e o \"\" vao antes do USING (no QB64, o \"\" no formato numerico da erro 13). "
                         "Linha do tradutor com so essa troca (tests/retraducao/pilar/using_tab.py).")
    print(arg, "->", novo)
json.dump(c, open(cj, "w", encoding="utf-8"), indent=1, ensure_ascii=False)
