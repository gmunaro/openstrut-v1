#!/usr/bin/env bash
# Roda todos os roteiros de teste de uso (roteiros/*.txt, exceto README/BRIEF
# e as sondagens *_probe*, que param de proposito no meio para ver uma tela)
# e resume: um por linha com o codigo de saida. Saida 0 = todos terminaram
# normalmente (codigo 0).
# Uso: tools/roteiros.sh [filtro]   ex.: tools/roteiros.sh lajcal_
DIST="$(cd "$(dirname "$0")/.." && pwd)"
ok=0; falha=0; linhas=""
for r in "$DIST"/roteiros/*"${1:-}"*.txt; do
    n="$(basename "$r" .txt)"
    case "$n" in README|BRIEF|*_probe*) continue ;; esac
    bash "$DIST/tools/roteiro.sh" "$r" "" 120 > /dev/null 2>&1
    rc=$?
    if [ "$rc" -eq 0 ]; then ok=$((ok + 1)); linhas="$linhas"$'\n'"OK   $n"
    else falha=$((falha + 1)); linhas="$linhas"$'\n'"FAIL $n (saida $rc)"; fi
done
printf '%s\n\nroteiros: %d OK, %d FAIL\n' "$linhas" "$ok" "$falha"
[ "$falha" -eq 0 ]
