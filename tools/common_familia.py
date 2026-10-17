#!/usr/bin/env python3
"""Gera o bloco COMMON de uma família de programas a partir dos .lift.txt.

Uso:
  python -I tools/common_familia.py laje 0x0dc0 0x1342 LAJE LAJEGEOM LAJECALC LAJEMONT LAJEGRAV LAJEPROC
         [--dump <REA_WORK>/dump] [--saida src-original]
  O dump do original fica fora do repositorio: --dump ou a variavel REA_WORK (dump em $REA_WORK/dump).

No QuickBASIC 4.5 o COMMON em branco fica no início da área de variáveis do programa
(DGROUP), no mesmo deslocamento em todos os EXE que declaram o mesmo COMMON; o CHAIN
preserva esse bloco. O limite do bloco é o maior intervalo em que todos os EXE da família
usam cada endereço com o mesmo tipo (ver docs/RETRADUCAO.md, "COMMON e CHAIN").

Escreve:
  <saida>/<familia>/COMUM_<FAMILIA>.json  variáveis (endereço, tipo, n. de índices, EXEs que usam)
  <saida>/<familia>/COMUM_<FAMILIA>.BI    DIM SHARED / REDIM SHARED das variáveis do bloco
  <saida>/<familia>/COMUM_<FAMILIA>.BM    SUB RT_COMMON_GRAVA e RT_COMMON_LE (arquivo de troca)
  Com --nome NOME: COMUM_<NOME>.* na mesma pasta da família (família com mais de um bloco).
"""
import argparse
import collections
import glob
import json
import os
import re
import sys

TIPO_QB = {"!": "SINGLE", "#": "DOUBLE", "%": "INTEGER", "&": "LONG", "$": "STRING"}
TAM = {"!": 4, "#": 8, "%": 2, "&": 4, "$": 4}


def coleta(dump, exe):
    """endereço -> {sufixo, n. de índices} usados no EXE."""
    out = collections.defaultdict(lambda: {"suf": set(), "nd": 0})
    pat = re.compile(r"\b([VA])_([0-9a-f]{4})([!#%&$]?)(\()?")
    for f in glob.glob(os.path.join(dump, exe, "*.lift.txt")):
        for linha in open(f, encoding="utf-8"):
            if not linha.startswith("0x"):
                continue
            cod = linha.split("'", 1)[0] if '"' not in linha else linha
            # matriz sem sufixo no lift: o tipo vem do tamanho do elemento do DIM/REDIM (como no
            # tradutor; 4 bytes = SINGLE) e o uso, dos argumentos crus de B$GGET/B$GPUT, que ficam
            # no comentário (DESENHO D3: A_1d76, A_1da4, A_1dd2, telas passadas pelo CHAIN)
            md = re.match(r"^0x[0-9a-f]+\s+(?:DIM|REDIM) A_([0-9a-f]{4})\((.*?)\)\s+'.*elemento (\d+) bytes", linha)
            if md and md.group(3) in ("2", "4", "8"):
                e = out[(int(md.group(1), 16), "A")]
                e.setdefault("suf_dim", set()).add({"2": "%", "4": "!", "8": "#"}[md.group(3)])
                nivel, nd = 0, 1   # vírgulas no nível zero (o limite pode ter índice: A_1044%(0, 0))
                for ch in md.group(2):
                    nivel += {"(": 1, ")": -1}.get(ch, 0)
                    nd += ch == "," and nivel == 0
                e["nd"] = max(e["nd"], nd)
            for mg in re.finditer(r"B\$G(?:GET|PUT)\(([^']*)", linha):
                for ma in re.finditer(r"\bA_([0-9a-f]{4})\(", mg.group(1)):
                    e = out[(int(ma.group(1), 16), "A")]
                    e["nd"] = max(e["nd"], 1)
            for m in pat.finditer(cod):
                k, a, suf, par = m.groups()
                e = out[(int(a, 16), k)]
                if suf:
                    e["suf"].add(suf)
                if par:
                    j, nivel, nd, dentro = m.end(), 1, 1, False
                    while j < len(cod) and nivel:
                        ch = cod[j]
                        if ch == '"':
                            dentro = not dentro
                        elif not dentro:
                            if ch == "(":
                                nivel += 1
                            elif ch == ")":
                                nivel -= 1
                            elif ch == "," and nivel == 1:
                                nd += 1
                        j += 1
                    e["nd"] = max(e["nd"], nd)
    return out


TAM_SUF = {"!": 4, "#": 8, "%": 2, "&": 4, "$": 4}


def limite_auto(dump, exes, ini=0x0DC0):
    """Fim do bloco COMMON: primeiro endereço (a partir de DS:0DC0, onde começam as variáveis
    do programa em todos os EXE) em que dois EXE da família discordam: tipo diferente no mesmo
    endereço, ou um endereço de um EXE caindo dentro de uma variável escalar de outro.
    Família de um EXE só: bloco vazio (ninguém com quem compartilhar; o RUN de volta ao
    gerenciador não passa COMMON)."""
    if len(exes) < 2:
        return ini, ini, "familia de um EXE: sem COMMON compartilhado"
    por = {}
    for exe in exes:
        m = {}
        for (end, k), e in coleta(dump, exe).items():
            if end < ini or not e["suf"]:
                continue
            m[end] = (k, sorted(e["suf"])[0])
        por[exe] = m
    ends = sorted({e for m in por.values() for e in m})
    for end in ends:
        tipos = {por[x][end] for x in exes if end in por[x]}
        if len(tipos) > 1:
            return ini, end, f"tipos diferentes em DS:{end:04X}: {sorted(tipos)}"
        for x in exes:
            for y in exes:
                if x == y or end not in por[x]:
                    continue
                for e2, (k2, s2) in por[y].items():
                    if k2 == "V" and e2 < end < e2 + TAM_SUF[s2]:
                        return ini, e2, f"DS:{end:04X} de {x} cai dentro de DS:{e2:04X} de {y}"
    return ini, (ends[-1] + 8) if ends else ini, "sem conflito"


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("familia")
    ap.add_argument("ini")
    ap.add_argument("fim")
    ap.add_argument("exes", nargs="+")
    ap.add_argument("--dump", default=os.path.join(os.environ["REA_WORK"], "dump") if os.environ.get("REA_WORK") else None)
    ap.add_argument("--saida", default=os.path.join(os.path.dirname(__file__), "..", "src-original"))
    ap.add_argument("--nome", help="nome do bloco (COMUM_<NOME>.*; padrão: a família). Uma família pode ter "
                    "mais de um bloco: PILAR <-> PILAREDI e PILAREDI <-> filhos (PILAR P5)")
    a = ap.parse_args()
    if not a.dump:
        sys.exit("common_familia.py: informe --dump <pasta> ou defina REA_WORK (dump em $REA_WORK/dump)")
    if a.ini == "auto" or a.fim == "auto":
        ini, fim, motivo = limite_auto(a.dump, a.exes)
        print(f"bloco automatico: DS:{ini:04X}..DS:{fim:04X} ({motivo})")
        a.ini, a.fim = "0x%04x" % ini, "0x%04x" % fim
    ini, fim = int(a.ini, 16), int(a.fim, 16)
    uso = {}
    for exe in a.exes:
        for (end, k), e in coleta(a.dump, exe).items():
            if not (ini <= end < fim):
                continue
            u = uso.setdefault((end, k), {"suf": set(), "nd": 0, "exes": []})
            u["suf"] |= e["suf"]
            u.setdefault("suf_dim", set()).update(e.get("suf_dim", ()))
            u["nd"] = max(u["nd"], e["nd"])
            u["exes"].append(exe)
    vars_, conflitos = [], []
    nj = os.path.join(os.path.normpath(a.saida), a.familia, "nomes.json")
    apel = {k: v for k, v in json.load(open(nj, encoding="utf-8")).items() if not k.startswith("_")}         if os.path.exists(nj) else {}
    for (end, k), u in sorted(uso.items()):
        if len(u["suf"]) > 1:
            conflitos.append(("%04x" % end, sorted(u["suf"])))
        if not u["suf"] and k == "A" and len(u.get("suf_dim", ())) == 1:
            u["suf"] = set(u["suf_dim"])   # matriz só com DIM sem sufixo (tamanho do elemento) e GET/PUT
        if not u["suf"]:
            continue  # só aparece como argumento sem tipo; o tipo vem de outro uso
        suf = sorted(u["suf"])[0]
        base = f"{k}_{end:04x}"
        vars_.append({"nome": base + ("_" + apel[base] if base in apel else ""), "base": base, "end": end, "suf": suf, "nd": u["nd"] if k == "A" else 0,
                      "exes": u["exes"]})
    fam = (a.nome or a.familia).upper()
    d = os.path.join(os.path.normpath(a.saida), a.familia)
    os.makedirs(d, exist_ok=True)
    json.dump({"familia": a.familia, "ini": a.ini, "fim": a.fim, "exes": a.exes, "conflitos": conflitos,
               "vars": vars_}, open(os.path.join(d, f"COMUM_{fam}.json"), "w", encoding="utf-8"), indent=1)

    bi = [f"' COMMON da familia {fam}: DS:{ini:04X} a DS:{fim - 1:04X} nos EXE {', '.join(a.exes)}.",
          "' Gerado por tools/common_familia.py. Cada variavel tem o nome do endereco DS no original.",
          "' Matrizes comecam 'nao dimensionadas' (limite -32768): o original da erro 9 se usar antes do DIM."]
    for v in vars_:
        n = v["nome"] + v["suf"]
        if v["nome"].startswith("A_"):
            dims = ", ".join(["-32768 TO -32768"] * max(1, v["nd"]))
            bi.append(f"REDIM SHARED {n}({dims})   ' usada em {', '.join(v['exes'])}")
        else:
            bi.append(f"DIM SHARED {n}   ' usada em {', '.join(v['exes'])}")
    open(os.path.join(d, f"COMUM_{fam}.BI"), "w", encoding="cp437", newline="\n").write("\n".join(bi) + "\n")

    bm = [f"' Grava/le o COMMON da familia {fam} no arquivo de troca do CHAIN (ver comum/RT45.BM).",
          "' Formato de cada item: deslocamento no bloco COMMON (LONG; DS:%04X = 0), tipo (1 byte:" % ini,
          "' ! # % & $), n. de dimensoes (INTEGER),",
          "' limites (LONG inferior, LONG superior por dimensao), tamanho dos dados (LONG), dados.",
          "' Strings: LONG com o comprimento e os bytes. Matrizes nao dimensionadas nao sao gravadas.",
          "",
          "SUB RT_COMMON_GRAVA (f AS INTEGER)"]
    for v in vars_:
        n, suf, nd = v["nome"] + v["suf"], v["suf"], v["nd"]
        h = f"&H{v['end'] - ini:04X}"
        if v["nome"].startswith("A_"):
            nd = max(1, nd)
            bm.append(f"    IF LBOUND({n}, 1) <> -32768 THEN")
            lim = ", ".join(f"LBOUND({n}, {i}), UBOUND({n}, {i})" for i in range(1, nd + 1))
            bm.append(f"        RT_CG_MATRIZ f, {h}, \"{suf}\", {nd}, {lim}" + (", 0, 0" * (3 - nd) if nd < 3 else ""))
            ind = [f"i{i}" for i in range(1, nd + 1)]
            for i in range(nd, 0, -1):
                bm.append("        " + "    " * (nd - i) + f"FOR i{i} = LBOUND({n}, {i}) TO UBOUND({n}, {i})")
            el = f"{n}({', '.join(ind)})"
            put = f"RT_CG_STR f, {el}" if suf == "$" else f"PUT #f, , {el}"
            bm.append("        " + "    " * nd + put)
            for i in range(1, nd + 1):
                bm.append("        " + "    " * (nd - i) + "NEXT")
            bm.append("        RT_CG_FECHA f")
            bm.append("    END IF")
        else:
            if suf == "$":
                bm.append(f"    RT_CG_ITEM f, {h}, \"$\", 4 + LEN({n}): RT_CG_STR f, {n}")
            else:
                bm.append(f"    RT_CG_ITEM f, {h}, \"{suf}\", {TAM[suf]}: PUT #f, , {n}")
    bm.append("END SUB")
    bm.append("")
    bm.append("' CLEAR do original: zera o COMMON (matrizes voltam a 'nao dimensionadas').")
    bm.append("SUB RT_COMMON_LIMPA")
    for v in vars_:
        n, suf, nd = v["nome"] + v["suf"], v["suf"], v["nd"]
        if v["nome"].startswith("A_"):
            bm.append(f"    REDIM {n}({', '.join(['-32768 TO -32768'] * max(1, nd))})")
        elif suf == "$":
            bm.append(f"    {n} = \"\"")
        else:
            bm.append(f"    {n} = 0")
    bm.append("END SUB")
    bm.append("")
    bm.append("SUB RT_COMMON_LE (f AS INTEGER)")
    bm.append("    DIM ender AS LONG, tipo AS STRING * 1, nd AS INTEGER, lb(1 TO 3) AS LONG, ub(1 TO 3) AS LONG")
    bm.append("    DIM tam AS LONG, prox AS LONG")
    bm.append("    DO WHILE RT_CL_ITEM(f, ender, tipo, nd, lb(), ub(), tam)")
    bm.append("        prox = SEEK(f) + tam")
    bm.append("        SELECT CASE ender")
    for v in vars_:
        n, suf, nd = v["nome"] + v["suf"], v["suf"], v["nd"]
        h = f"&H{v['end'] - ini:04X}"
        bm.append(f"        CASE {h}   ' {v['nome']}")
        bm.append(f"            IF tipo = \"{suf}\" THEN")
        if v["nome"].startswith("A_"):
            nd = max(1, nd)
            lim = ", ".join(f"lb({i}) TO ub({i})" for i in range(1, nd + 1))
            bm.append(f"                REDIM {n}({lim})")
            ind = [f"i{i}" for i in range(1, nd + 1)]
            for i in range(nd, 0, -1):
                bm.append("                " + "    " * (nd - i) + f"FOR i{i} = lb({i}) TO ub({i})")
            el = f"{n}({', '.join(ind)})"
            get = f"{el} = RT_CL_STR$(f)" if suf == "$" else f"GET #f, , {el}"
            bm.append("                " + "    " * nd + get)
            for i in range(1, nd + 1):
                bm.append("                " + "    " * (nd - i) + "NEXT")
        else:
            bm.append(f"                {n} = RT_CL_STR$(f)" if suf == "$" else f"                GET #f, , {n}")
        bm.append("            END IF")
    bm.append("        END SELECT")
    bm.append("        SEEK #f, prox")
    bm.append("    LOOP")
    bm.append("END SUB")
    open(os.path.join(d, f"COMUM_{fam}.BM"), "w", encoding="cp437", newline="\n").write("\n".join(bm) + "\n")
    print(f"{len(vars_)} variaveis no COMMON {fam}; conflitos de tipo: {conflitos}")


if __name__ == "__main__":
    main()
