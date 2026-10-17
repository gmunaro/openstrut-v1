#!/usr/bin/env python3
"""Contorno provisório (PEDIDOS-TRADUTOR.md, D2; o mesmo do P2 da família PILAR e do A2 da ARMACAO).

O lift escreve `PRINT USING f$; TAB(n); ""; x`, mas o .asm chama B$FTAB e B$PSSD "" antes do
B$USNG: o TAB e o "" saem antes do USING. Traduzido como o lift, o QB64 aplica o formato ao ""
e o item seguinte cai no campo errado (DESDIM 0x573a9: "e" num campo "##" dá erro 13, e o
tratador do DESDIM mostra "erro no processamento").

Lê os .BAS gerados da família e grava em src-original/desenho/correcoes.json a linha com
`TAB(n); ""; USING f$;`. Linhas já corrigidas são mantidas. Rode depois de regenerar.
Uso: python -I tests/retraducao/desenho/gera_usingtab.py
"""
import glob
import json
import os
import re

AQUI = os.path.dirname(os.path.abspath(__file__))
RAIZ = os.path.normpath(os.path.join(AQUI, "..", "..", ".."))
DIR = os.path.join(RAIZ, "src-original", "desenho")
CORR = os.path.join(DIR, "correcoes.json")
RE = re.compile(r'^((?:RT_LPTABRE: )?PRINT (?:#\w+, )?)USING ("[^"]*"|\S+?); ((?:TAB|SPC)\([^)]*\)); ""; ')


def main():
    c = json.load(open(CORR, encoding="utf-8"))
    for bas in sorted(glob.glob(os.path.join(DIR, "*.BAS"))):
        exe = os.path.basename(bas)[:-4]
        n = 0
        for linha in open(bas, encoding="cp437"):
            if "(correcao manual)" in linha or "   '@" not in linha:
                continue
            cod, resto = linha.strip().split("   '@", 1)
            novo, k = RE.subn(r'\1\3; ""; USING \2; ', cod)
            if not k:
                continue
            end = "0x" + resto.split()[0]
            c.setdefault(exe, {})[end] = [novo]
            c[exe]["_" + end] = ("USINGTAB (gera_usingtab.py, PEDIDOS D2): o .asm chama B$FTAB, B$PSSD \"\" e so "
                                 "depois B$USNG; TAB e \"\" vao antes do USING. Linha do tradutor com so essa troca.")
            n += 1
        print(f"{exe}: {n} linhas")
    json.dump(c, open(CORR, "w", encoding="utf-8"), ensure_ascii=False, indent=1)


if __name__ == "__main__":
    main()
