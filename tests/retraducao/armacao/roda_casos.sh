#!/usr/bin/env bash
# Roda os casos da familia ARMACAO na V1 retraduzida e compara com a execucao mais recente do oraculo.
# Uso: roda_casos.sh <pasta dos EXE> <pasta de trabalho> [caso ...]
#   caso = nome do sufixo (menu, secoes, uma, dim, param); sem caso, roda todos os *.sufixo.txt.
#   Disco C: = <pasta de trabalho>/c_<caso>: SISTRUT/SISTRUT.INI e SISTRUT/EXEC40 da instalacao oficial
#   ($SIS_C_BASE, da familia sistema, mais $LAJE_C_E2E, a do piloto; o ARMADURA.INI e
#   o mesmo nas duas). O caso "teclas" termina com F2 (RUN do gerenciador): a pasta dos EXE precisa
#   do SISTRUT.exe retraduzido.
# Variaveis de ambiente (obrigatorias):
#   ORACULO    = pasta do oraculo (casos/ e runs/).
#   SIS_C_BASE = disco C: da instalacao oficial (pasta com SISTRUT/), preparado a mao.
#   LAJE_C_E2E = disco C: do piloto da LAJE (pasta com SISTRUT/EXEC40), preparado a mao.
set -u
ORACULO="${ORACULO:?defina ORACULO=<pasta do oraculo>}"
SIS_C_BASE="${SIS_C_BASE:?defina SIS_C_BASE=<disco C: da instalacao oficial>}"
LAJE_C_E2E="${LAJE_C_E2E:?defina LAJE_C_E2E=<disco C: do piloto da LAJE>}"
bin="$1"; trab="$2"; shift 2
aqui="$(cd "$(dirname "$0")" && pwd)"
raiz="$(cd "$aqui/../../.." && pwd)"
casos="$*"
[ -z "$casos" ] && casos=$(cd "$aqui" && ls *.sufixo.txt | sed 's/\.sufixo\.txt$//')
for c in $casos; do
  cdir="$trab/c_$c"; rm -rf "$cdir"; mkdir -p "$cdir/SISTRUT/EXEC40"
  [ -d "$SIS_C_BASE" ] && cp -r "$SIS_C_BASE/SISTRUT" "$cdir/"
  cp "$LAJE_C_E2E"/SISTRUT/EXEC40/* "$cdir/SISTRUT/EXEC40/"
  out="$trab/run_$c"
  bash "$raiz/tools/roda_retrad.sh" "$bin" ARMADURA "$aqui/$c.sufixo.txt" "$out" "$cdir" 300 >/dev/null
  o=$(ls -d "$ORACULO"/runs/retrad_arm_$c-* 2>/dev/null | tail -1)
  echo "##### $c (oraculo: ${o:-nenhum})"
  [ -n "$o" ] && bash "$aqui/compara_arm.sh" "$o" "$out"
done
