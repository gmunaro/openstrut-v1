#!/usr/bin/env bash
# Gera o COMMON (um bloco por EXE), retraduz e compila VIGA e VPLOTA (src-original/viga).
# Uso: build.sh <pasta dos EXE> [EXE ...]   (padrao: VIGA VPLOTA)
set -eu
bin="$1"; shift
exes="${*:-VIGA VPLOTA}"
aqui="$(cd "$(dirname "$0")" && pwd)"
raiz="$(cd "$aqui/../../.." && pwd)"
tmp="$(mktemp -d)"; trap 'rm -rf "$tmp"' EXIT
mkdir -p "$bin"
for e in $exes; do
  l=$(echo "$e" | tr A-Z a-z)
  python -I "$raiz/tools/common_familia.py" "$l" auto auto "$e" --saida "$tmp" | head -1
  for x in json BI BM; do cp "$tmp/$l/COMUM_$e.$x" "$raiz/src-original/viga/"; done
  python -I "$raiz/tools/retraduz.py" "$e" --familia viga --common "$raiz/src-original/viga/COMUM_$e.json" --comum-nome "$e" | cut -c1-80
  bash "$raiz/tools/qbcompile.sh" "$(cygpath -aw "$raiz/src-original/viga/$e.BAS")" "$(cygpath -aw "$bin/$e.exe")" 2>&1 | grep -v "^\[" | tail -3
done
# pastas de EXE de casos especiais (bin_<caso>, ver roda_casos.sh) recebem a copia nova; o SISTRUT.exe
# do bin_k1 vem de src-original/sistema/SISTRUT.BAS e precisa do mesmo RT45 (arquivo de troca do RUN)
for e in $exes; do
  for d in "$bin"/../bin_*; do [ -f "$d/$e.exe" ] && cp "$bin/$e.exe" "$d/"; done
done
true
if [ -d "$bin/../bin_k1" ]; then
  bash "$raiz/tools/qbcompile.sh" "$(cygpath -aw "$raiz/src-original/sistema/SISTRUT.BAS")" "$(cygpath -aw "$bin/../bin_k1/SISTRUT.exe")" 2>&1 | grep -v "^\[" | tail -1
fi
