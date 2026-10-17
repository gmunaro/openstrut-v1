#!/usr/bin/env python3
"""Contorno provisório (PEDIDOS-TRADUTOR.md, P3): ERASE de matriz estática no VIGA e no VPLOTA.

O BC do QB4.5 põe as matrizes estáticas no DS; o lift mostra o elemento como `ST_xxxx!(i)` (ou
como escalar `V_yyyy`, com índice constante) e o tradutor já declara essas matrizes e junta os
escalares (tools/retraduz.py, `estaticas`). O `ERASE` de matriz estática, porém, aparece como
`ERASE A_<descritor>`, com o descritor na área de constantes, e o tradutor o deixa como ERASE de
uma matriz dinâmica vazia (sem efeito). No QB4.5 ele zera os elementos.

Descritores lidos com `$REA_WORK/tools/ds.py <EXE> 0x<descritor> x 2` (formato: deslocamento dos
dados, segmento, 4 bytes, n. de dimensões, 40h, deslocamento, tamanho do elemento, e por dimensão
n. de elementos e limite inferior):
- VIGA DS:4B00 = 98 19 .. 01 40 98 19 04 00 03 00 00 00: SINGLE (0 TO 2) em DS:1998
  (V_1998!, V_199c! e DS:19A0, o elemento 0 de ST_19a0 no tradutor);
- VIGA DS:4B50 = 8C 1A .. 02 40 8C 1A 04 00 02 00 00 00 0E 00 00 00: SINGLE (0 TO 13, 0 TO 1) em DS:1A8C;
- VIGA DS:4B90 / DS:4BA2: SINGLE (0 TO 13) em DS:1A1C e DS:1A54;
- VPLOTA DS:3182 = FE 15 .. 02 40 FE 15 02 00 03 00 00 00 16 00 00 00: INTEGER (0 TO 21, 0 TO 2) em DS:15FE.
O ERASE vira um laço que zera só esses elementos (o tradutor declara algumas dessas matrizes maiores,
juntando escalares vizinhos; um ERASE da matriz toda zeraria também esses escalares).

Escreve em src-original/viga/correcoes.json; entradas geradas levam evidência começando por "ESTATICA".
Uso: python -I tests/retraducao/viga/gera_estaticas.py
"""
import json
import os

AQUI = os.path.dirname(os.path.abspath(__file__))
RAIZ = os.path.normpath(os.path.join(AQUI, "..", "..", ".."))
CORR = os.path.join(RAIZ, "src-original", "viga", "correcoes.json")

# EXE -> {endereço do ERASE A_<descritor>: (descritor, linhas QB64)}
ERASES = {
    "VIGA": {
        0x402c3: ("4B00", ["lift: V_1998! = 0", "lift: V_199c! = 0", "lift: ST_19a0!(0) = 0"]),
        0x41c29: ("4B50", ["FOR RT_FX% = 0 TO 27", "ST_1a8c!(RT_FX%) = 0", "NEXT RT_FX%"]),
        0x422cd: ("4B90", ["FOR RT_FX% = 0 TO 13", "ST_1a1c!(RT_FX%) = 0", "NEXT RT_FX%"]),
        0x422d6: ("4BA2", ["FOR RT_FX% = 0 TO 13", "ST_1a54!(RT_FX%) = 0", "NEXT RT_FX%"]),
    },
    "VPLOTA": {
        0x15c22: ("3182", ["FOR RT_FX% = 0 TO 65", "ST_15fe%(RT_FX%) = 0", "NEXT RT_FX%"]),
    },
}


def main():
    corr = json.load(open(CORR, encoding="utf-8"))
    for exe, tab_e in ERASES.items():
        tab = corr.setdefault(exe, {})
        for k in [k for k in tab if k.startswith("_") and str(tab[k]).startswith("ESTATICA")]:
            tab.pop(k, None)
            tab.pop(k[1:], None)
        for a, (desc, linhas) in sorted(tab_e.items()):
            k = f"0x{a:x}"
            if k in tab:
                raise SystemExit(f"{exe} {k} ja tem correcao manual; junte a mao")
            tab[k] = linhas
            tab["_" + k] = (f"ESTATICA: ERASE A_{desc.lower()} = ERASE de matriz estatica (descritor em DS:{desc}); "
                            "zera so os elementos dela (gera_estaticas.py, P3)")
        print(exe, len(tab_e), "ERASE")
    json.dump(corr, open(CORR, "w", encoding="utf-8"), indent=1, ensure_ascii=False)


if __name__ == "__main__":
    main()
