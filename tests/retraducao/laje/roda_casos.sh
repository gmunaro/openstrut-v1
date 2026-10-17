#!/usr/bin/env bash
# Roda os casos da familia LAJE na V1 retraduzida e compara com a execucao mais recente do oraculo.
# Uso: roda_casos.sh <pasta dos EXE> <pasta de trabalho> [caso ...]
#   caso = nome do sufixo (calc, calc2, menus, fluxo, ...); sem caso, roda todos os *.sufixo.txt.
#   Obra de partida: <pasta de trabalho>/c_<caso> (copiada de casos/retrad_laje_<caso>.dados, se existir;
#   senao vazia) com a configuracao da instalacao em SISTRUT/EXEC40 (copia de $LAJE_C_E2E, a mesma do piloto).
# Variaveis de ambiente (obrigatorias):
#   ORACULO    = pasta do oraculo (casos/ e runs/).
#   LAJE_C_E2E = disco C: do piloto da LAJE (pasta com SISTRUT/EXEC40), preparado a mao.
set -u
ORACULO="${ORACULO:?defina ORACULO=<pasta do oraculo>}"
LAJE_C_E2E="${LAJE_C_E2E:?defina LAJE_C_E2E=<disco C: do piloto da LAJE>}"
bin="$1"; trab="$2"; shift 2
aqui="$(cd "$(dirname "$0")" && pwd)"
raiz="$(cd "$aqui/../../.." && pwd)"
casos="$*"
[ -z "$casos" ] && casos=$(cd "$aqui" && ls *.sufixo.txt | sed 's/\.sufixo\.txt$//')
for c in $casos; do
  cdir="$trab/c_$c"; rm -rf "$cdir"; mkdir -p "$cdir/SISTRUT/EXEC40"
  cp "$LAJE_C_E2E"/SISTRUT/EXEC40/* "$cdir/SISTRUT/EXEC40/"
  d="$ORACULO/casos/retrad_laje_$c.dados"; [ -d "$d" ] && cp "$d"/* "$cdir/"
  out="$trab/run_$c"
  bash "$raiz/tools/roda_retrad.sh" "$bin" LAJE "$aqui/$c.sufixo.txt" "$out" "$cdir" 300 >/dev/null
  o=$(ls -d "$ORACULO"/runs/retrad_laje_$c-* 2>/dev/null | tail -1)
  echo "##### $c (oraculo: ${o:-nenhum})"
  [ -n "$o" ] && python -I "$raiz/tools/compara_retrad.py" "$o" "$out"
done
