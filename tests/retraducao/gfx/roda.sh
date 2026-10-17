#!/usr/bin/env bash
# Gera as sondas graficas, compila no QB64 (RT45GFX), roda e compara com o oraculo.
# Uso: bash tests/retraducao/gfx/roda.sh <obra do oraculo> [saida] [grupos]
#   sonda 1: obra de runs/retrad_gfx_s1-*, grupos "A B C D" (padrao); sonda 2: runs/retrad_gfx_s2-*, grupos "E F".
# GFX_NATIVO=1 roda com os comandos nativos do QB64 (para medir a diferenca de partida).
# V1_TRAB = pasta de trabalho descartavel (padrao ${TMPDIR:-/tmp}/v1-retrad); usa $V1_TRAB/gfx/{bin,d,o}.
set -u
aqui="$(cd "$(dirname "$0")" && pwd)"
trab="${V1_TRAB:-${TMPDIR:-/tmp}/v1-retrad}"
orc="$1"; out="${2:-$trab/gfx/o}"; quais="${3:-A B C D}"
bin="$trab/gfx/bin"; dados="$trab/gfx/d"
mkdir -p "$bin" "$dados" "$out"
cd "$aqui"
declare -A grupos=([A]="2 1,2,3,4,5,6" [B]="2 7,8,9,10,11,12,13" [C]="9 1,2,3,4,5,6" [D]="9 7,8,9,10,11,12,13"     [E]="2 14,15,16,17,18,19,20" [F]="9 14,15,16,17,18,19,20")
for q in $quais; do
    set -- $q ${grupos[$q]}
    python -I gera_sonda.py "$dados" "QB64_$1.BAS" "GFX$1" "$2" "$3" >/dev/null
    if [ -z "${SEM_COMPILAR:-}" ]; then
        bash ../../../tools/qbcompile.sh "$(cygpath -w "$aqui/QB64_$1.BAS")" "$(cygpath -w "$bin/QB64_$1.exe")" 2>&1 | grep -E "^Output|ERROR|rror|line [0-9]" || true
    fi
done
rm -f "$out"/G*.RAW "$out"/GFX*.TXT
for g in $quais; do
    ( cd "$out" && SISTRUT_SAIDA="$(cygpath -w "$out")\\" timeout 300 "$bin/QB64_$g.exe" ) || echo "QB64_$g: codigo $?"
done
python -I "$aqui/compara_gfx.py" "$orc" "$out" "$out/dif"
