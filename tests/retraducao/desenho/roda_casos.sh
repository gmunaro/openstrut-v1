#!/usr/bin/env bash
# Roda os casos da familia DESENHO na V1 retraduzida e compara com a execucao mais recente do oraculo.
# Uso: roda_casos.sh <pasta dos EXE> <pasta de trabalho> [caso ...]
#   caso = nome do sufixo; sem caso, roda todos os *.sufixo.txt.
#   Pasta C: = <trabalho>/c_<caso>: obra de casos/retrad_des_<caso>.dados (se existir) e a
#   configuracao da instalacao oficial: SISTRUT/SISTRUT.INI e SISTRUT/EXEC40 (copia em $DES_C_BASE
#   do disco C: da instalacao oficial, tirada de runs/instalacao_oficial-20261013-145616/c.tar.gz, sem os .EXE).
#   Arquivos gravados: compara_obra.py compara a obra final das duas execucoes.
# Variaveis de ambiente (obrigatorias):
#   ORACULO    = pasta do oraculo (casos/ e runs/).
#   DES_C_BASE = disco C: base da familia (SISTRUT/SISTRUT.INI e SISTRUT/EXEC40), preparado a mao.
set -u
ORACULO="${ORACULO:?defina ORACULO=<pasta do oraculo>}"
DES_C_BASE="${DES_C_BASE:?defina DES_C_BASE=<disco C: base da familia DESENHO>}"
bin="$1"; trab="$2"; shift 2
mkdir -p "$trab"
aqui="$(cd "$(dirname "$0")" && pwd)"
raiz="$(cd "$aqui/../../.." && pwd)"
casos="$*"
[ -z "$casos" ] && casos=$(cd "$aqui" && ls *.sufixo.txt | sed 's/\.sufixo\.txt$//')
for c in $casos; do
  cdir="$trab/c_$c"; rm -rf "$cdir"; cp -r "$DES_C_BASE" "$cdir"
  d="$ORACULO/casos/retrad_des_$c.dados"; [ -d "$d" ] && cp "$d"/* "$cdir/"
  mkdir -p "$trab/ini_$c"; rm -rf "$trab/ini_$c"/*; cp -r "$cdir"/. "$trab/ini_$c/"
  out="$trab/run_$c"
  bash "$raiz/tools/roda_retrad.sh" "$bin" DESENHO "$aqui/$c.sufixo.txt" "$out" "$cdir" 400 >/dev/null
  o=$(ls -d "$ORACULO"/runs/retrad_des_$c-* 2>/dev/null | tail -1)
  echo "##### $c (oraculo: ${o:-nenhum})"
  [ -n "$o" ] && bash "$aqui/compara.sh" "$o" "$out"
  [ -n "$o" ] && python -I "$aqui/compara_obra.py" "$o/obra" "$trab/ini_$c" "$cdir"
done
