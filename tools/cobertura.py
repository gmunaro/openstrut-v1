#!/usr/bin/env python3
"""Gera e compila todos os EXE retraduzidos numa pasta de trabalho e escreve COBERTURA.md.

Uso: python -I tools/cobertura.py [--saida <pasta>] [--dump <pasta>] [--so EXE,EXE] [--sem-compilar]
         [--checar]   (só gera o C++ com qb64pe -z, mais rápido que compilar)

Para cada família: copia src-original/comum para <saida>/comum, copia nomes.json e
correcoes.json da família (se existirem em src-original/<familia>, só leitura), gera o COMMON
(tools/common_familia.py, bloco automático), traduz cada EXE (tools/retraduz.py) e compila
com a trava global (como tools/qbcompile.sh). Não escreve em src-original.
--saida: padrão $V1_TRAB/cobertura (V1_TRAB: padrão <pasta temporária>/v1-retrad).
--dump: dump do original, fora do repositório (padrão: $REA_WORK/dump).
QB64_DIR: pasta do QB64 PE (padrão C:/qb64pe/qb64pe).
"""
import argparse
import json
import os
import re
import shutil
import subprocess
import sys
import tempfile
import time

AQUI = os.path.dirname(os.path.abspath(__file__))
RAIZ = os.path.dirname(AQUI)
FAMILIAS = {
    "sistema": ["SISTRUT", "SISEDIT"],
    "laje": ["LAJE", "LAJEGEOM", "LAJECALC", "LAJEMONT", "LAJEGRAV", "LAJEPROC"],
    "viga": ["VIGA", "VPLOTA"],
    "armacao": ["ARMADURA"],
    "pilar": ["PILAR", "PILAREDI", "PILGEEDI", "PIPROEDI", "PIGRAEDI"],
    "forma": ["FORMA", "FORMEDCA", "FORMIMP", "FORMINIT", "FORMPLOT"],
    "desenho": ["DESENHO", "DESDIM", "DESEDCAO", "DESEDITA", "DESGRAF", "DESIMP", "DESINIT"],
}
# COMMON: grupos que trocam COMMON por CHAIN (a pasta continua a da família). VPLOTA não é
# chamado pelo VIGA (só pelo SISTRUT) e os dois discordam já em DS:0DC0.
# PILAR: o PILAR troca com o PILAREDI só DS:0DC0..0F87; o PILAREDI troca com os filhos um bloco
# maior (DS:0DC0..1483). Cada EXE usa o último grupo em que aparece.
GRUPOS_COMMON = {"viga": [["VIGA"], ["VPLOTA"]],
                 "pilar": [["PILAR", "PILAREDI", "PILGEEDI", "PIPROEDI", "PIGRAEDI"],
                           ["PILAREDI", "PILGEEDI", "PIPROEDI", "PIGRAEDI"]]}
QB64 = os.path.join(os.environ.get("QB64_DIR") or "C:/qb64pe/qb64pe", "qb64pe.exe")
# a mesma trava de tools/qbcompile.sh
TRAVA = os.environ.get("SISTRUT_QB64_LOCK") or os.path.join(tempfile.gettempdir(), "sistrut-qb64.lock")
TRAB = os.environ.get("V1_TRAB") or os.path.join(tempfile.gettempdir(), "v1-retrad")


def run(cmd, **kw):
    return subprocess.run(cmd, capture_output=True, text=True, encoding="utf-8", errors="replace", **kw)


def trava():
    t0 = time.time()
    while True:
        try:
            os.mkdir(TRAVA)
            return
        except FileExistsError:
            try:
                if time.time() - os.stat(TRAVA).st_mtime > 300:
                    os.rmdir(TRAVA)
                    continue
            except OSError:
                pass
            if time.time() - t0 > 1800:
                raise RuntimeError("trava do qb64pe ocupada há 30 min")
            time.sleep(1)


def compila(bas, exe, so_c):
    trava()
    try:
        args = [QB64, "-x", "-z" if so_c else "-c", bas.replace("/", "\\")]
        if not so_c:
            args += ["-o", exe.replace("/", "\\")]
        r = run(args, cwd=os.path.dirname(QB64))
    finally:
        try:
            os.rmdir(TRAVA)
        except OSError:
            pass
    txt = re.sub(r"\[\.*\s*\] \d+%", "", r.stdout + r.stderr)
    ok = ("Output:" in txt) if not so_c else (r.returncode == 0 and "ERROR" not in txt and "Caused by" not in txt)
    erro = ""
    if not ok:
        linhas = [l for l in txt.splitlines() if l.strip()]
        erro = " | ".join(linhas[-3:])
    return ok, erro


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--saida", default=os.path.join(TRAB, "cobertura"))
    ap.add_argument("--dump", default=os.path.join(os.environ["REA_WORK"], "dump") if os.environ.get("REA_WORK") else None)
    ap.add_argument("--so", default="")
    ap.add_argument("--sem-compilar", action="store_true")
    ap.add_argument("--checar", action="store_true")
    a = ap.parse_args()
    if not a.dump:
        sys.exit("cobertura.py: informe --dump <pasta> ou defina REA_WORK (dump em $REA_WORK/dump)")
    so = {x.strip().upper() for x in a.so.split(",") if x.strip()}
    os.makedirs(a.saida, exist_ok=True)
    shutil.copytree(os.path.join(RAIZ, "src-original", "comum"), os.path.join(a.saida, "comum"), dirs_exist_ok=True)
    estado_arq = os.path.join(a.saida, "cobertura.json")
    estado = json.load(open(estado_arq, encoding="utf-8")) if os.path.exists(estado_arq) else {}
    for fam, exes in FAMILIAS.items():
        dfam = os.path.join(a.saida, fam)
        os.makedirs(dfam, exist_ok=True)
        for f in ("nomes.json", "correcoes.json"):
            src = os.path.join(RAIZ, "src-original", fam, f)
            if os.path.exists(src):
                shutil.copy(src, os.path.join(dfam, f))
        presentes = [e for e in exes if os.path.exists(os.path.join(a.dump, e, "index.json"))]
        grupos = GRUPOS_COMMON.get(fam, [presentes])
        for g in grupos:
            g = [e for e in g if e in presentes]
            if not g:
                continue
            if len(grupos) > 1:   # um COMMON por grupo, com o nome do 1o EXE do grupo
                r = run([sys.executable, "-I", os.path.join(AQUI, "common_familia.py"), fam, "auto", "auto",
                         *g, "--dump", a.dump, "--saida", a.saida, "--nome", g[0]])
            else:
                r = run([sys.executable, "-I", os.path.join(AQUI, "common_familia.py"), fam, "auto", "auto", *g,
                         "--dump", a.dump, "--saida", a.saida])
            for e in g:
                estado.setdefault(e, {})["common"] = r.stdout.strip().splitlines()[0] if r.stdout.strip() else r.stderr[-200:]
        for e in exes:
            if so and e not in so:
                continue
            est = estado.setdefault(e, {})
            est["familia"] = fam
            if e not in presentes:
                est.update(gerado=False, motivo="sem dump/index.json")
                continue
            cargs = []
            if len(grupos) > 1:
                g0 = [g[0] for g in grupos if e in g][-1]
                cargs = ["--common", os.path.join(dfam, f"COMUM_{g0}.json"), "--comum-nome", g0]
            r = run([sys.executable, "-I", os.path.join(AQUI, "retraduz.py"), e, "--familia", fam, "--dump", a.dump,
                     "--saida", a.saida, *cargs])
            m = re.search(r"(\d+) linhas; (\d+) avisos", r.stdout)
            est["linhas"] = int(m.group(1)) if m else 0
            est["avisos"] = [l.strip()[6:][:300] for l in r.stdout.splitlines() if l.strip().startswith("AVISO")]
            if not m:
                est["avisos"].append("tradutor falhou: " + r.stderr[-300:])
            bas = os.path.join(dfam, e + ".BAS")
            txt = open(bas, encoding="cp437").read() if os.path.exists(bas) else ""
            dado = r"\s*'RETRAD\? @\w+ \?\? (\d+ bytes|dado)"
            est["retrad_dado"] = sum(1 for l in txt.splitlines() if re.match(dado, l))
            est["retrad_cmd"] = [l.strip()[:160] for l in txt.splitlines()
                                 if l.strip().startswith("'RETRAD?") and not re.match(dado, l)]
            est["protecao_tratada"] = sum(1 for l in txt.splitlines() if "PROTECAO" in l)
            if not a.sem_compilar:
                ok, erro = compila(bas, os.path.join(a.saida, "bin", e + ".exe"), a.checar)
                est["compila"] = ok
                est["modo"] = "C++ (-z)" if a.checar else "EXE"
                est["erro"] = erro
            json.dump(estado, open(estado_arq, "w", encoding="utf-8"), indent=1, ensure_ascii=False)
            print(f"{e}: {est.get('linhas')} linhas, {len(est['avisos'])} avisos, "
                  f"{len(est['retrad_cmd'])} RETRAD? de comando, compila={est.get('compila')} {est.get('erro', '')[:200]}",
                  flush=True)
    os.makedirs(os.path.join(a.saida, "bin"), exist_ok=True)
    escreve_relatorio(a.saida, estado)


def escreve_relatorio(saida, estado):
    L = ["# Cobertura do tradutor (tools/cobertura.py)", "",
         f"Gerado em {time.strftime('%Y-%m-%d %H:%M')} em `{saida}`. Fontes em `<familia>/<EXE>.BAS`, EXE em `bin/`.",
         "",
         "| EXE | família | linhas | avisos | `'RETRAD?` de comando | `'RETRAD?` de dado | compila | linhas PROTECAO |",
         "|---|---|---|---|---|---|---|---|"]
    for fam, exes in FAMILIAS.items():
        for e in exes:
            s = estado.get(e, {})
            if not s.get("linhas"):
                L.append(f"| {e} | {fam} | — | — | — | — | não ({s.get('motivo', 'não gerado')}) | — |")
                continue
            comp = {True: "sim", False: "NÃO", None: "não testado"}[s.get("compila")]
            if s.get("modo") == "C++ (-z)" and s.get("compila"):
                comp = "sim (C++)"
            L.append(f"| {e} | {fam} | {s['linhas']} | {len(s['avisos'])} | {len(s['retrad_cmd'])} | "
                     f"{s['retrad_dado']} | {comp} | {s.get('protecao_tratada', 0)} |")
    L += ["", "## COMMON por família", ""]
    vistos = set()
    for fam, exes in FAMILIAS.items():
        for e in exes:
            c = estado.get(e, {}).get("common")
            if c and (fam, c) not in vistos:
                vistos.add((fam, c))
                L.append(f"- {fam} ({e}): {c}")
    L += ["", "## Detalhe por EXE", ""]
    for fam, exes in FAMILIAS.items():
        for e in exes:
            s = estado.get(e, {})
            if not s.get("linhas"):
                continue
            L.append(f"### {e}")
            if s.get("erro"):
                L.append(f"- erro de compilação: `{s['erro'][:400]}`")
            for x in s["avisos"]:
                L.append(f"- aviso: `{x[:200]}`")
            for x in s["retrad_cmd"]:
                L.append(f"- RETRAD?: `{x}`")
            L.append("")
    open(os.path.join(saida, "COBERTURA.md"), "w", encoding="utf-8").write("\n".join(L) + "\n")


if __name__ == "__main__":
    main()
