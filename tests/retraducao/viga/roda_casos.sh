#!/usr/bin/env bash
# Roda os casos da familia VIGA na V1 retraduzida e compara com a execucao mais recente do oraculo.
# Uso: roda_casos.sh <pasta dos EXE> <pasta de trabalho> [caso ...]
#   caso = nome do sufixo; sem caso, roda todos os *.sufixo.txt.
#   Caso do oraculo: casos/retrad_viga_<caso>, ou casos/retrad_<caso> para os vpl_* (mkcaso.sh).
#   Pasta "C:" do caso: <trabalho>/c_<caso>, com casos/<caso do oraculo>.dados na raiz (se existir)
#   e os .INI da instalacao do oraculo em SISTRUT/EXEC40 ($ORACULO/orig, os mesmos do /orig/instalado).
#   SISTRUT\SISTRUT.INI: o gravado pelo INSTALAR no oraculo (copia em $VIGA_BASE, vinda do
#   disco C: da instalacao oficial), lido pelo gerenciador quando o F2 volta a ele (caso k1).
#   Se existir <pasta dos EXE>/../bin_<caso>, usa essa (caso k1: VIGA + SISTRUT, para o RUN do F2).
# Variaveis de ambiente (obrigatorias):
#   ORACULO   = pasta do oraculo (orig/, casos/ e runs/).
#   VIGA_BASE = pasta com o SISTRUT.INI gravado pelo INSTALAR no oraculo, preparada a mao.
set -u
ORACULO="${ORACULO:?defina ORACULO=<pasta do oraculo>}"
VIGA_BASE="${VIGA_BASE:?defina VIGA_BASE=<pasta com o SISTRUT.INI da instalacao oficial>}"
bin="$1"; trab="$2"; shift 2
aqui="$(cd "$(dirname "$0")" && pwd)"
raiz="$(cd "$aqui/../../.." && pwd)"
casos="$*"
[ -z "$casos" ] && casos=$(cd "$aqui" && ls *.sufixo.txt | sed 's/\.sufixo\.txt$//')
for c in $casos; do
  cdir="$trab/c_$c"; rm -rf "$cdir"; mkdir -p "$cdir/SISTRUT/EXEC40"
  cp "$ORACULO"/orig/*.INI "$ORACULO"/orig/SISTRUT.* "$cdir/SISTRUT/EXEC40/" 2>/dev/null
  cp "$VIGA_BASE/SISTRUT.INI" "$cdir/SISTRUT/" 2>/dev/null
  case "$c" in vpl_*) base="retrad_$c" ;; *) base="retrad_viga_$c" ;; esac
  d="$ORACULO/casos/$base.dados"; [ -d "$d" ] && cp "$d"/* "$cdir/"
  b="$bin"; [ -d "$bin/../bin_$c" ] && b="$bin/../bin_$c"
  exe=VIGA; head -1 "$aqui/$c.sufixo.txt" | grep -q "modulo: VPLOTA" && exe=VPLOTA
  out="$trab/run_$c"
  bash "$raiz/tools/roda_retrad.sh" "$b" $exe "$aqui/$c.sufixo.txt" "$out" "$cdir" 150 >/dev/null
  o=$(ls -d "$ORACULO"/runs/$base-* 2>/dev/null | tail -1)
  echo "##### $c (oraculo: ${o:-nenhum})"
  [ -n "$o" ] && bash "$aqui/compara.sh" "$o" "$out" && true; [ -n "$o" ] && python -I "$aqui/compara_obra.py" "$o" "$cdir"
done
