#!/usr/bin/env python3
"""Contorno provisório (PEDIDOS-TRADUTOR.md, D1): DIM de matriz dinâmica de DS vira REDIM.

As matrizes de DS (`A_xxxx`) são declaradas no início do programa como "não dimensionadas"
(`REDIM SHARED A_xxxx(-32768 TO -32768)`, no COMUM_DESENHO.BI ou no próprio .BAS). Um `DIM`
depois disso dá erro 10 (Array already dimensioned) no QB64, e sem ON ERROR ligado o QB64 abre
uma caixa de diálogo e o programa para ali (DESENHO 0x101f0, logo depois do CLEAR). No QB4.5 o
CLEAR apaga as matrizes dinâmicas e o DIM as cria; o REDIM do QB64 faz o mesmo. Dentro de SUB
(DESDIM 0x11418, SUB 0x113f7), o DIM criaria uma matriz local no QB64; REDIM age na compartilhada.

Escreve em src-original/desenho/correcoes.json, para cada `DIM A_xxxx(...)` do lift, a linha
`lift: REDIM A_xxxx(...)` (o tradutor põe o tipo e o comentário do elemento). Entradas geradas
levam evidência começando por "REDIM". Rode de novo depois de mudar o lift.

Uso: python -I tests/retraducao/desenho/gera_redim.py
  REA_WORK = pasta do trabalho de engenharia reversa (variável de ambiente obrigatória; lê $REA_WORK/dump).
"""
import glob
import json
import os
import re
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
RAIZ = os.path.normpath(os.path.join(AQUI, "..", "..", ".."))
REA_WORK = os.environ.get("REA_WORK") or sys.exit("defina REA_WORK=<pasta do trabalho de engenharia reversa> (dump em $REA_WORK/dump, livros em $REA_WORK/ledger)")
DUMP = os.path.join(REA_WORK, "dump")
CORR = os.path.join(RAIZ, "src-original", "desenho", "correcoes.json")
EXES = ["DESENHO", "DESDIM", "DESEDITA", "DESGRAF", "DESIMP", "DESINIT", "DESEDCAO"]
RE_DIM = re.compile(r"^0x([0-9a-f]+)  DIM (A_[0-9a-f]{4}\(.*?\))\s*(?:'.*)?$")


def main():
    d = json.load(open(CORR, encoding="utf-8"))
    for exe in EXES:
        if not os.path.isdir(os.path.join(DUMP, exe)):
            continue
        tab = d.setdefault(exe, {})
        for k in [k for k in tab if k.startswith("_") and str(tab[k]).startswith("REDIM")]:
            del tab[k]
            tab.pop(k[1:], None)
        n = 0
        for f in sorted(glob.glob(os.path.join(DUMP, exe, "*.lift.txt"))):
            if "módulo: MIXT " in open(f, encoding="utf-8").read(2000):
                continue   # MIXT: traduzido uma vez em comum/MIXT.BM
            for linha in open(f, encoding="utf-8"):
                m = RE_DIM.match(linha.rstrip("\n"))
                if not m:
                    continue
                a = "0x" + m.group(1)
                if a in tab:
                    continue
                tab[a] = ["lift: REDIM " + m.group(2)]
                tab["_" + a] = (f"REDIM (gera_redim.py, PEDIDOS D1): DIM de matriz de DS ja declarada "
                                f"REDIM SHARED; DIM da erro 10 no QB64. {os.path.basename(f)}")
                n += 1
        print(f"{exe}: {n} DIM -> REDIM")
    json.dump(d, open(CORR, "w", encoding="utf-8"), ensure_ascii=False, indent=1)


if __name__ == "__main__":
    main()
