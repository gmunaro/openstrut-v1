#!/usr/bin/env python3
"""Gera tests/retraducao/laje/CHECKLIST.md: cada divergência dos livros U31..U45 x conferência no oráculo.

Uso: python -I checklist.py <pasta de cobertura> > CHECKLIST.md
  REA_WORK = pasta do trabalho de engenharia reversa (variável de ambiente obrigatória; lê $REA_WORK/ledger e $REA_WORK/dump).

<pasta de cobertura>/<caso>.txt = endereços executados pela V1 instrumentada (cobertura.py) no caso.
Os resultados da comparação de cada caso com o oráculo estão em CASOS (abaixo), preenchidos à mão a
partir de tools/compara_retrad.py (roda_casos.sh).

Critério: uma divergência foi "conferida" quando algum endereço que o livro cita para ela (o
endereço da divergência, os endereços 0x1xxxx do texto "original", as "linhas N-M" do lift da
rotina, ou os deslocamentos de GOSUB "0xNNNN" somados ao segmento da rotina) rodou na V1 num caso
cuja saída bateu com o oráculo. Endereço só da entrada da rotina (o livro não diz onde) conta como
"rotina": a rotina rodou, mas o ponto exato não está localizado.
"""
import bisect
import glob
import json
import os
import re
import sys

REA_WORK = os.environ.get("REA_WORK") or sys.exit("defina REA_WORK=<pasta do trabalho de engenharia reversa> (dump em $REA_WORK/dump, livros em $REA_WORK/ledger)")
LEDGER = os.path.join(REA_WORK, "ledger")
DUMP = os.path.join(REA_WORK, "dump")
UNIDADES = {31: "LAJE", 32: "LAJECALC", 33: "LAJECALC", 34: "LAJECALC", 35: "LAJECALC",
            36: "LAJEGEOM", 37: "LAJEGEOM", 38: "LAJEGEOM", 39: "LAJEGEOM", 40: "LAJEGRAV",
            41: "LAJEMONT", 42: "LAJEMONT", 43: "LAJEMONT", 44: "LAJEMONT", 45: "LAJEPROC"}

# divergências que tratam da verificação de licença do original (desativada pelas marcas PROTECAO do correcoes.json)
LICENCA = {"U31-003", "U36-001"}

# caso -> (resultado da comparação, True se a saída bateu com o oráculo fora de FRE/P10/pisca)
CASOS = json.load(open(os.path.join(os.path.dirname(os.path.abspath(__file__)), "casos.json"), encoding="utf-8"))


def lift_linhas(exe):
    """rotina (nome) -> lista de (n da linha, endereço ou None) do .lift.txt."""
    out = {}
    for f in glob.glob(os.path.join(DUMP, exe, "*.lift.txt")):
        nome = os.path.basename(f)[7:-9]
        linhas = []
        for i, l in enumerate(open(f, encoding="utf-8", errors="replace"), 1):
            m = re.match(r"^0x([0-9a-f]{5})\s", l)
            linhas.append((i, int(m.group(1), 16) if m else None))
        out[nome] = linhas
    return out


def rot_de(div):
    m = re.match(r"\s*([A-Za-z0-9_]+)", str(div.get("rotina", "")))
    return m.group(1) if m else ""


def refs(div, exe, lifts):
    """Endereços (de comando) citados pela divergência e se só a entrada da rotina foi citada.

    Vale o que o texto "original" cita: endereços 0x1xxxx, "linhas N-M" do lift da rotina e
    deslocamentos de GOSUB 0xNNNN (somados ao segmento da rotina). O campo "endereco" só entra
    quando o texto não cita nada; se ele for a entrada da rotina, a conferência é só da rotina."""
    txt = " ".join(str(div.get(k, "")) for k in ("original", "rotina", "bloco"))
    rot = rot_de(div)
    seg = None
    ent_rot = None
    m = re.search(r"_([0-9a-f]{5})$", rot)
    if m:
        ent_rot = int(m.group(1), 16)
    m = re.search(r"FUN_([0-9a-f])000_([0-9a-f]{4})$", rot)
    if m:
        ent_rot = (int(m.group(1), 16) << 16) + int(m.group(2), 16)
    if rot.startswith("M_"):
        ent_rot = 0x10030
    if ent_rot is not None:
        seg = ent_rot & 0xF0000
    a = set()
    for h in re.findall(r"0x([0-9a-fA-F]{5})\b", txt):
        a.add(int(h, 16))
    if seg is not None:
        for h in re.findall(r"(?:GOSUB|em|@)\s*0x([0-9a-fA-F]{3,4})\b", txt):
            a.add(seg + int(h, 16))
    orig = str(div.get("original", ""))
    if rot in lifts:
        for m in re.finditer(r"[Ll]inhas?\s+([\d\-, e]+)", orig):
            for p in re.findall(r"(\d+)(?:-(\d+))?", m.group(1)):
                i, j = int(p[0]), int(p[1] or p[0])
                for n, e in lifts[rot]:
                    if i <= n <= j and e is not None:
                        a.add(e)
    # cada endereço vira o do comando que começa nele ou logo depois (rótulo de GOSUB, entrada de
    # rotina); endereços fora do código do programa (MIXT, runtime) saem
    cmds = sorted({e for L in lifts.values() for n, e in L if e is not None})

    def cmd(x):
        k = bisect.bisect_left(cmds, x)
        return cmds[k] if k < len(cmds) and cmds[k] - x <= 0x10 else None
    a = {cmd(x) for x in a} - {None}
    if a:
        return a, False
    m = re.match(r"0x([0-9a-fA-F]{5})$", str(div.get("endereco", "")).strip())
    if not m:
        return set(), True
    e = int(m.group(1), 16)
    return {cmd(e)} - {None}, e == ent_rot


def main():
    covdir = sys.argv[1]
    cov = {}
    for c in CASOS:
        p = os.path.join(covdir, c + ".txt")
        s = set()
        if os.path.exists(p):
            for l in open(p, encoding="ascii", errors="replace"):
                q = l.split()
                if len(q) == 2:
                    s.add((q[0], int(q[1], 16)))
        cov[c] = s
    w = print
    w("# Checklist dos livros U31..U45 (família LAJE) na retradução")
    w()
    w("Gerado por `tests/retraducao/laje/checklist.py` a partir dos livros (`$REA_WORK/ledger/U31..U45.json`), da cobertura da V1 instrumentada (`cobertura.py`) e do resultado de cada caso (`casos.json`). Não editar à mão.")
    w()
    w("As divergências dos livros comparam o original com a V1 antiga (`src-reconstructed`). Na retradução cada comando vem do original, no mesmo endereço, então todas ficam resolvidas por construção; o que falta é conferir no oráculo. Critério de \"conferido\": algum endereço que o livro cita para a divergência rodou na V1 num caso cuja saída bateu com o oráculo (\"sim\"); rodou só em caso com diferença conhecida (\"parcial\", com o pedido que explica); ou não rodou em nenhum caso (\"não\"). Quando o livro só dá a entrada da rotina, a coluna diz \"rotina\" (a rotina rodou, o ponto exato não está localizado).")
    w()
    w("## Casos")
    w()
    w("| caso | roteiro | resultado contra o oráculo |")
    w("|---|---|---|")
    for c, (res, ok, rot) in CASOS.items():
        w(f"| {c} | {rot} | {res} |")
    w()
    tot = {"sim": 0, "parcial": 0, "não": 0, "rotina": 0, "n/a": 0}
    for u in range(31, 46):
        exe = UNIDADES[u]
        d = json.load(open(os.path.join(LEDGER, f"U{u}.json"), encoding="utf-8"))
        dv = d.get("divergencias") or []
        lifts = lift_linhas(exe)
        w(f"## U{u} ({exe}{', ' + ', '.join(d['modulos']) if d.get('modulos') else ''}): {len(dv)} divergências")
        w()
        if not dv:
            w("Sem divergências no livro.")
            w()
            continue
        w("| divergência | endereço | impacto | diferença (resumo do livro) | conferido no oráculo |")
        w("|---|---|---|---|---|")
        for x in dv:
            a, so_rot = refs(x, exe, lifts)
            hit_ok = [c for c, (res, ok, rot) in CASOS.items() if ok and any((exe, e) in cov[c] for e in a)]
            hit_dif = [c for c, (res, ok, rot) in CASOS.items() if not ok and any((exe, e) in cov[c] for e in a)]
            txtx = str(x.get("diferenca", "")) + " " + str(x.get("original", ""))
            teclas = re.search(r"\bF2\b|ON KEY|\bEsc\b|Ctrl\+Alt", txtx)
            if x["id"] in LICENCA:
                st = "não se aplica: verificação de licença do original desativada (marcas PROTECAO no correcoes.json)"
                tot["n/a"] += 1
            elif teclas and hit_ok and not any((exe, e) in cov.get("teclas", set()) for e in {e for n, e in lifts.get(rot_de(x), []) if e is not None}):
                st = "parcial (o código que liga as teclas rodou em " + ", ".join(hit_ok) + "; a rotina não rodou no caso teclas, o único que manda Esc/F2)"
                tot["parcial"] += 1
            elif hit_ok:
                st = ("rotina" if so_rot else "sim") + " (" + ", ".join(hit_ok) + ")"
                tot["rotina" if so_rot else "sim"] += 1
            elif hit_dif:
                st = "parcial (" + ", ".join(f"{c}: {CASOS[c][0]}" for c in hit_dif) + ")"
                tot["parcial"] += 1
            else:
                ent_rot = {e for n, e in lifts.get(rot_de(x), []) if e is not None}
                roda = [c for c, (res, ok, r2) in CASOS.items() if any((exe, e) in cov[c] for e in ent_rot)]
                if roda and so_rot:
                    st = "rotina (" + ", ".join(roda) + ")"
                    tot["rotina"] += 1
                elif roda:
                    st = "não (a rotina rodou em " + ", ".join(roda) + "; o ponto citado, não)"
                    tot["não"] += 1
                else:
                    st = "não"
                    tot["não"] += 1
            dif = re.sub(r"\s+", " ", str(x.get("diferenca", ""))).replace("|", "/")
            if len(dif) > 160:
                dif = dif[:157] + "..."
            end = x.get("endereco", "")
            if x["id"] in LICENCA:  # o texto e o endereço do livro não entram no checklist
                dif, end = "verificação de licença do original", ""
            w(f"| {x['id']} | {end} | {x.get('impacto', '')} | {dif} | {st} |")
        w()
    w("## Totais")
    w()
    w(f"sim {tot['sim']}, rotina {tot['rotina']}, parcial {tot['parcial']}, não {tot['não']}, não se aplica {tot['n/a']}.")


if __name__ == "__main__":
    sys.stdout.reconfigure(encoding="utf-8", newline=chr(10))
    main()
