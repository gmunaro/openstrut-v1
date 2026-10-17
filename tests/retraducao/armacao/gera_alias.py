#!/usr/bin/env python3
"""FORA DE USO desde o commit 9b33d44 (o tradutor resolve A1 e A2). Não rodar: as entradas
que ele gerava saíram do correcoes.json. Fica como registro do contorno.

Contorno provisório (PEDIDOS-TRADUTOR.md, A1): matrizes estáticas do ARMADURA.

O BC do QB4.5 acessa elemento de matriz estática com índice constante como variável simples
(`[0EE2h]`), e o lift mostra `V_0ee2!`; com índice variável mostra `ST_0ece!(i)`. No original os
dois são a mesma memória (ex.: `READ V_0ece!, ...` enche a tabela de bitolas que o laço lê como
`ST_0ece!(i)`). O tradutor trata os dois como variáveis diferentes e não declara as `ST_`, e o
QB64 cria a `ST_` com 0..10 (erro 9 no índice 11: tela "erro no processamento").

Este script reescreve, em `src-original/armacao/correcoes.json`, cada linha do lift que usa um
desses escalares como `"lift: ..."` com o elemento da matriz (`V_0ee2!` -> `ST_0ece!(5)`) e põe
os DIM das matrizes antes do primeiro comando do programa (0x100fd). Entradas geradas levam
evidência começando por "ALIAS"; as outras ficam como estão. Rode de novo depois de mudar o lift.

Também (A2): `LPRINT USING f$; TAB(n); ""; ...` vira `PRINT #RT_LPT, TAB(n);` seguido do
`LPRINT USING f$; ...` (no QB64 o "" do TAB consumiria o primeiro campo do formato).

Tamanhos: cada matriz vai do seu endereço até o início da seguinte no DS (DIM x(13) = 14
elementos de 4 bytes, 0x0ECE..0x0F05). ST_0f7a e ST_11e2 são (21, 6) do original, aqui
lineares (i + 22*j), 154 elementos cada.

Uso: python -I tests/retraducao/armacao/gera_alias.py
  REA_WORK = pasta do trabalho de engenharia reversa (variável de ambiente obrigatória; lê $REA_WORK/dump/ARMADURA).
"""
import json
import os
import re
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
RAIZ = os.path.normpath(os.path.join(AQUI, "..", "..", ".."))
REA_WORK = os.environ.get("REA_WORK") or sys.exit("defina REA_WORK=<pasta do trabalho de engenharia reversa> (dump em $REA_WORK/dump, livros em $REA_WORK/ledger)")
DUMP = os.path.join(REA_WORK, "dump", "ARMADURA")
CORR = os.path.join(RAIZ, "src-original", "armacao", "correcoes.json")

# (endereço DS, n. de elementos, sufixo)
MATRIZES = [(0x0ECE, 14, "!"), (0x0F06, 14, "!"), (0x0F3E, 4, "!"), (0x0F4E, 4, "!"),
            (0x0F5E, 7, "!"), (0x0F7A, 154, "!"), (0x11E2, 154, "!"), (0x144A, 4, "$")]
TAM = {"!": 4, "$": 4}
PRIMEIRO = 0x100fd   # ON ERROR GOTO L_113bd, primeiro comando do nível de módulo
RE_LIN = re.compile(r"^0x([0-9a-f]+)  (.*)$")
RE_V = re.compile(r"\bV_([0-9a-f]{4})([!$])(\{COMMON\?\})?")
RE_TABUSING = re.compile(r'^LPRINT USING (.+?); (TAB|SPC)\((\d+)\); ""; (.*)$')


def separa_comentario(s):
    dentro = False
    for i, ch in enumerate(s):
        if ch == '"':
            dentro = not dentro
        elif ch == "'" and not dentro:
            return s[:i].rstrip()
    return s.rstrip()


def elemento(m):
    a, suf = int(m.group(1), 16), m.group(2)
    for base, n, t in MATRIZES:
        if t == suf and base <= a < base + n * TAM[t] and (a - base) % TAM[t] == 0:
            return f"ST_{base:04x}{t}({(a - base) // TAM[t]})"
    return m.group(0)


def main():
    corr = json.load(open(CORR, encoding="utf-8"))
    tab = corr.setdefault("ARMADURA", {})
    for k in [k for k in tab if k.startswith("_") and str(tab[k]).startswith("ALIAS")]:
        tab.pop(k, None)
        tab.pop(k[1:], None)
    novas = {}
    for nome in sorted(os.listdir(DUMP)):
        if not nome.endswith(".lift.txt") or "_M_MIXT" in nome or nome.startswith("04"):
            continue
        for linha in open(os.path.join(DUMP, nome), encoding="utf-8"):
            m = RE_LIN.match(linha.rstrip("\n"))
            if not m:
                continue
            cmd = separa_comentario(m.group(2))
            novo = RE_V.sub(elemento, cmd)
            t = RE_TABUSING.match(novo)
            if t:   # A2: TAB/SPC dentro de LPRINT USING vira um PRINT # proprio antes do USING
                novas[int(m.group(1), 16)] = [f"RT_LPTABRE: PRINT #RT_LPT, {t.group(2)}({t.group(3)});",
                                             f"lift: LPRINT USING {t.group(1)}; {t.group(4)}"]
            elif novo != cmd:
                novas[int(m.group(1), 16)] = ["lift: " + novo]
    dims = "DIM SHARED " + ", ".join(f"ST_{b:04x}{t}(0 TO {n - 1})" for b, n, t in MATRIZES)
    primeiro = None
    for nome in sorted(os.listdir(DUMP)):
        if nome.startswith("010030_"):
            for linha in open(os.path.join(DUMP, nome), encoding="utf-8"):
                m = RE_LIN.match(linha.rstrip("\n"))
                if m and int(m.group(1), 16) == PRIMEIRO:
                    primeiro = "lift: " + separa_comentario(m.group(2))
    assert primeiro, "comando 0x100fd nao achado"
    k = f"0x{PRIMEIRO:x}"
    tab[k] = [dims + "   ' matrizes estaticas do original (gera_alias.py)", primeiro]
    tab["_" + k] = "ALIAS: DIM das matrizes estaticas ST_ (o tradutor nao declara; QB64 criaria 0..10)."
    for a, l in sorted(novas.items()):
        k = f"0x{a:x}"
        if k in tab and not str(tab.get("_" + k, "")).startswith("ALIAS"):
            raise SystemExit(f"{k} ja tem correcao manual; junte a mao")
        tab[k] = l
        tab["_" + k] = ("ALIAS: escalar do lift que e elemento de matriz estatica" if len(l) == 1 else
                        "ALIAS/TAB: LPRINT USING com TAB/SPC; no QB4.5 o \"\" do TAB nao consome campo do "
                        "formato, no QB64 consome (erro 13). Oraculo retrad_arm_secoes: '   Mk(ret)  =  9.20 tm'"
                        ) + " (gera_alias.py)"
    json.dump(corr, open(CORR, "w", encoding="utf-8"), indent=1, ensure_ascii=False)
    print(f"{len(novas)} linhas geradas; DIM em 0x{PRIMEIRO:x}")


if __name__ == "__main__":
    main()
