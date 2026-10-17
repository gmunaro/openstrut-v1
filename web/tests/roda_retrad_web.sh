#!/usr/bin/env bash
# roda_retrad_web.sh - o tools/roda_retrad.sh para a V1 web: mesmos argumentos, mesma saida
# (telas/, impressora.prn, log.txt) e o drive C: final gravado de volta em <pasta "C:">.
# Chamado pelo tools/roda_retrad.sh quando V1_WEB aponta para a pasta do site (web/dist).
# V1_WEB_EXECUTOR=navegador (padrao; Chrome headless, paridade_navegador.cjs) ou node (roda_node.cjs).
# Uso: roda_retrad_web.sh <ignorado> <EXE inicial> <roteiro> <pasta de saida> <pasta "C:"> [limite s]
set -u
aqui="$(cd "$(dirname "$0")" && pwd)"
exe="$2"; rot="$3"; out="$4"; drive_c="$5"; lim="${6:-120}"
# <pasta dos EXE> com um arquivo v1web.dist: o site e o que ele aponta (scripts que alternam pastas
# de binarios, como a sonda do roda_sistema.sh); sem ele, V1_WEB
[ -f "$1/v1web.dist" ] && V1_WEB="$(cat "$1/v1web.dist")"
case "${V1_WEB_EXECUTOR:-navegador}" in
    node) node ${V1_NODE_FLAGS:-} "$aqui/roda_node.cjs" "$V1_WEB" "$exe" "$rot" "$out" "$drive_c" "$lim" --grava-c ;;
    *) node "$aqui/paridade_navegador.cjs" "$V1_WEB" "$exe" "$rot" "$out" "$drive_c" "$lim" --grava-c ;;
esac
