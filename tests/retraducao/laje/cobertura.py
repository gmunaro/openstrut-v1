#!/usr/bin/env python3
"""Cobertura dos programas retraduzidos: quais comandos do original (endereço '@xxxxx) rodaram.

Uso:
  python -I cobertura.py instrumenta <pasta src-original> <pasta destino> EXE...
      copia src-original/{laje,comum} para <destino> e, em cada <destino>/laje/<EXE>.BAS,
      põe "COVQ &Hxxxxx:" antes de cada comando com endereço. A SUB COVQ grava cada endereço
      novo (uma vez) em %SISTRUT_COV% como "EXE xxxxx".
  python -I cobertura.py junta <arquivo de cobertura>... > enderecos.txt
      une os arquivos e escreve "EXE xxxxx" ordenado.

O .BAS instrumentado fica fora do repositório; ele só serve para medir o que os roteiros exercitam
(checklist dos livros U em CHECKLIST.md). O comportamento do programa não muda: COVQ só escreve num
arquivo à parte.
"""
import os
import re
import shutil
import sys

END = re.compile(r"'@([0-9a-f]{5})\b")


def instrumenta(src, dst, exes):
    for sub in ("laje", "comum"):
        d = os.path.join(dst, sub)
        if os.path.isdir(d):
            shutil.rmtree(d)
        shutil.copytree(os.path.join(src, sub), d)
    for exe in exes:
        p = os.path.join(dst, "laje", exe + ".BAS")
        linhas = open(p, encoding="cp437").read().split("\n")
        out = []
        decl = False
        for l in linhas:
            s = l.lstrip()
            m = END.search(l)
            if m and not s.startswith("'") and not s.startswith("$") and not s.upper().startswith(("SUB ", "FUNCTION ", "DIM ", "REDIM SHARED")):
                ind = l[:len(l) - len(s)]
                l = f"{ind}COVQ &H{m.group(1)}: {s}"
            out.append(l)
            if not decl and s.startswith("'$INCLUDE:") and "COMUM_" in s:
                out.append("DIM SHARED COV_VISTO(0 TO &H7FFFF) AS _BYTE")
                decl = True
        assert decl, exe
        out += [
            "",
            "SUB COVQ (a AS LONG)",
            "    IF COV_VISTO(a) THEN EXIT SUB",
            "    COV_VISTO(a) = 1",
            "    DIM f AS INTEGER",
            "    f = FREEFILE",
            f"    OPEN ENVIRON$(\"SISTRUT_COV\") FOR APPEND AS #f: PRINT #f, \"{exe} \"; LCASE$(HEX$(a)): CLOSE #f",
            "END SUB",
            "",
        ]
        open(p, "w", encoding="cp437", newline="").write("\n".join(out))


def junta(arqs):
    vis = set()
    for a in arqs:
        for l in open(a, encoding="ascii", errors="replace"):
            p = l.split()
            if len(p) == 2:
                vis.add((p[0], int(p[1], 16)))
    for e, a in sorted(vis):
        print(f"{e} {a:05x}")


if __name__ == "__main__":
    if sys.argv[1] == "instrumenta":
        instrumenta(sys.argv[2], sys.argv[3], sys.argv[4:])
    else:
        junta(sys.argv[2:])
