#!/usr/bin/env bash
# Regera e compila EXE da familia DESENHO a partir do lift (tools/retraduz.py + tools/qbcompile.sh).
# Uso: gera.sh <pasta dos EXE> [EXE ...]   (sem EXE: os da familia com dump)
set -u
bin="$1"; shift
aqui="$(cd "$(dirname "$0")" && pwd)"
raiz="$(cd "$aqui/../../.." && pwd)"
exes="$*"; [ -z "$exes" ] && exes="DESENHO DESDIM DESEDITA DESGRAF DESIMP DESINIT"
# DESEDCAO: so quando pedido explicitamente (gera.sh <bin> DESEDCAO); o lift dele ainda esta sendo consertado.
mkdir -p "$bin"
for e in $exes; do
  python -I "$raiz/tools/retraduz.py" "$e" --familia desenho 2>&1 | sed 's/; conflitos de tipo.*//'
  src="$(cygpath -aw "$raiz/src-original/desenho/$e.BAS")"
  out="$(cygpath -aw "$bin/$e.exe")"
  rm -f "$bin/$e.exe"
  bash "$raiz/tools/qbcompile.sh" "$src" "$out" > "$bin/$e.compila.txt" 2>&1
  if [ -f "$bin/$e.exe" ]; then echo "$e: compila"; else echo "$e: NAO compila"; tail -5 "$bin/$e.compila.txt"; fi
done
