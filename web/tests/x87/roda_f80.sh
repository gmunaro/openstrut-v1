#!/usr/bin/env bash
# roda_f80.sh - confere o qb_f80 do build web (wasm) com os modelos do x87_zen2 contra os vetores
# do x87 nativo (web/tests/f80): gera os vetores com o clang do QB64, compila testa_vetores.cpp com
# em++ (qb_f80.cpp, x87_zen2.cpp, SoftFloat) e roda no Node.
# Uso: bash web/tests/x87/roda_f80.sh [n por operacao, padrao 30000] [semente] [pasta, padrao $X87_TMP/f80]
set -euo pipefail
aqui="$(cd "$(dirname "$0")" && pwd)"
web="$(cd "$aqui/../.." && pwd)"
ncasos="${1:-30000}"; sem="${2:-1}"; dir="${3:-${X87_TMP:-${TMPDIR:-/tmp}/x87zen2}/f80}"
CXX="${QB64_CXX:-/c/qb64pe/qb64pe/internal/c/c_compiler/bin/c++.exe}"
mkdir -p "$dir"
source "$web/tools/emenv.sh" # (o emenv.sh usa a variavel n)
sf="$web/third_party/softfloat-3e"
SFOPTS="-DSOFTFLOAT_FAST_INT64 -DSOFTFLOAT_ROUND_ODD -DINLINE_LEVEL=5 -DSOFTFLOAT_FAST_DIV32TO16 -DSOFTFLOAT_FAST_DIV64TO32"
"$CXX" -O0 -static "$web/tests/f80/gera_vetores.cpp" -o "$dir/gera_vetores.exe"
"$dir/gera_vetores.exe" "$dir/vetores.txt" "$ncasos" "$sem"
if [ ! -f "$dir/sf.a" ]; then
    for f in "$sf"/source/*.c "$sf"/source/8086/*.c; do
        emcc -O2 -w $SFOPTS -I"$sf" -I"$sf/source/include" -I"$sf/source/8086" -c "$f" -o "$dir/sf_$(basename "$f" .c).o"
    done
    emar rcs "$dir/sf.a" "$dir"/sf_*.o
fi
em++ -O2 -std=gnu++20 -w $SFOPTS -I"$web/runtime" -I"$sf" -I"$sf/source/include" -I"$sf/source/8086" \
    "$web/tests/f80/testa_vetores.cpp" "$web/runtime/qb_f80.cpp" "$web/runtime/x87_zen2.cpp" "$dir/sf.a" \
    -sNODERAWFS=1 -sALLOW_MEMORY_GROWTH=1 -o "$dir/testa_vetores.js"
node "$dir/testa_vetores.js" "$dir/vetores.txt"
