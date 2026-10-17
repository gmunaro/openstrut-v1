#!/usr/bin/env bash
# Compila uma copia de depuracao de src-original/viga/<EXE>.BAS em $V1_TRAB/viga/dbgsrc:
# cada rotulo alvo de ON ERROR GOTO ganha um RT_LOG com ERR e _ERRORLINE (linha da copia,
# igual a do .BAS gerado mais o numero de linhas inseridas antes). Nao muda o fonte do repositorio.
# Uso: dbg_build.sh <EXE> <saida.exe>
#   V1_TRAB = pasta de trabalho descartavel (padrao ${TMPDIR:-/tmp}/v1-retrad).
set -eu
e="$1"; out="$2"
aqui="$(cd "$(dirname "$0")" && pwd)"; raiz="$(cd "$aqui/../../.." && pwd)"
d="${V1_TRAB:-${TMPDIR:-/tmp}/v1-retrad}/viga/dbgsrc"; rm -rf "$d"; mkdir -p "$d/viga" "$d/comum"
cp "$raiz"/src-original/comum/* "$d/comum/"; cp "$raiz"/src-original/viga/COMUM_* "$d/viga/"
python -I - "$raiz/src-original/viga/$e.BAS" "$d/viga/$e.BAS" <<'PY'
import re, sys
src = open(sys.argv[1], encoding="cp437").read().split("\n")
alvos = set(re.findall(r"ON ERROR GOTO (L_[0-9a-f]+)", "\n".join(src)))
out = []
for l in src:
    out.append(l)
    m = re.match(r"^(L_[0-9a-f]+):", l)
    if m and m.group(1) in alvos:
        out.append('RT_LOG "DBG ERRO" + STR$(ERR) + " em" + STR$(_ERRORLINE) + " incl=" + _INCLERRORFILE$ + STR$(_INCLERRORLINE) + " -> ' + m.group(1) + '"')
open(sys.argv[2], "w", encoding="cp437", newline="\n").write("\n".join(out))
PY
bash "$raiz/tools/qbcompile.sh" "$(cygpath -aw "$d/viga/$e.BAS")" "$(cygpath -aw "$out")" 2>&1 | grep -v "^\[" | tail -2
