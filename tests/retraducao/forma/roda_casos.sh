#!/usr/bin/env bash
# Roda os casos da familia FORMA na V1 retraduzida e compara com a execucao mais recente do oraculo:
# telas, PNG, atributos e impressora.prn (tools/compara_retrad.py) e os arquivos da obra byte a byte
# (cada arquivo de runs/.../obra do oraculo contra o mesmo nome na pasta C: da V1).
# Uso: roda_casos.sh <pasta dos EXE> <pasta de trabalho> [caso ...]   (sem caso: todos os *.sufixo.txt)
#   ORACULO = pasta do oraculo (runs/), obrigatoria.
set -u
ORACULO="${ORACULO:?defina ORACULO=<pasta do oraculo>}"
bin="$1"; trab="$2"; shift 2
aqui="$(cd "$(dirname "$0")" && pwd)"
raiz="$(cd "$aqui/../../.." && pwd)"
casos="$*"
[ -z "$casos" ] && casos=$(cd "$aqui" && ls *.sufixo.txt | sed 's/\.sufixo\.txt$//')
for c in $casos; do
  cdir="$trab/c_$c"; rm -rf "$cdir"; mkdir -p "$cdir/SISTRUT/EXEC40"
  cp "$aqui"/ini/* "$cdir/SISTRUT/EXEC40/"
  cp "$aqui"/ini_sistrut/SISTRUT.INI "$cdir/SISTRUT/"   # o gerenciador (F2) le C:\SISTRUT\SISTRUT.INI
  ob=$(sed -n 's/^# obra: *//p' "$aqui/$c.sufixo.txt" | head -1); ob="${ob:-obra}"
  cp "$aqui/$ob"/* "$cdir/"
  out="$trab/run_$c"
  bash "$raiz/tools/roda_retrad.sh" "$bin" FORMA "$aqui/$c.sufixo.txt" "$out" "$cdir" "${LIMITE:-300}" >/dev/null
  if [ $? = 3 ]; then
    # passou do limite: mata so os EXE desta pasta de binarios (iniciados por este script)
    echo "LIMITE: V1 ainda rodando apos ${LIMITE:-300} s; ultima linha do log: $(tail -1 "$out/log.txt")"
    powershell -NoProfile -Command "Get-Process | Where-Object { \$_.Path -like '$(cygpath -aw "$bin")\*' } | ForEach-Object { taskkill /PID \$_.Id /F }" >/dev/null 2>&1
  fi
  o=$(ls -d "$ORACULO"/runs/retrad_frm_$c-* 2>/dev/null | tail -1)
  echo "##### $c (oraculo: ${o:-nenhum})"
  [ -z "$o" ] && continue
  python -I "$raiz/tools/compara_retrad.py" "$o" "$out"
  for f in "$o"/obra/*; do
    [ -e "$f" ] || continue
    n=$(basename "$f")
    if cmp -s "$f" "$cdir/$n"; then echo "OK     obra/$n ($(stat -c %s "$f") bytes)"
    else echo "DIFERE obra/$n: $(cmp "$f" "$cdir/$n" 2>&1 | head -1)"; fi
  done
  for f in "$cdir"/* "$cdir"/.[!.]*; do
    [ -e "$f" ] || continue
    n=$(basename "$f"); [ -d "$f" ] && continue
    [ -e "$o/obra/$n" ] || cmp -s "$f" "$aqui/$ob/$n" || echo "SO V1  obra/$n (gravado so pela V1)"
  done
done
