#!/usr/bin/env bash
# roda_testes.sh - testes nativos do x87_zen2 contra o x87 desta maquina (clang do QB64, x86_64).
# Uso: bash web/tests/x87/roda_testes.sh [n por distribuicao, padrao 25000 (200 mil por operacao)] [semente] [op...]
#   1. teste_nucleo: soma/produto/divisao da aritmetica de trabalho contra FADD/FMUL/FDIV (4 modos)
#   2. testa_x87: cada instrucao (4 modos de RC) e funcao da libm, 8 distribuicoes de entrada
set -euo pipefail
aqui="$(cd "$(dirname "$0")" && pwd)"
CXX="${QB64_CXX:-/c/qb64pe/qb64pe/internal/c/c_compiler/bin/c++.exe}"
dir="${X87_TMP:-${TMPDIR:-/tmp}/x87zen2}"
mkdir -p "$dir"
n="${1:-25000}"; sem="${2:-1}"; shift $(( $# > 2 ? 2 : $# )) || true
"$CXX" -O2 -std=c++17 -static "$aqui/teste_nucleo.cpp" -o "$dir/teste_nucleo.exe"
"$CXX" -O2 -std=c++17 -static "$aqui/testa_x87.cpp" -o "$dir/testa_x87.exe"
"$dir/teste_nucleo.exe"
"$dir/testa_x87.exe" "$n" "$sem" "$@" | grep -v '^      ' || true
