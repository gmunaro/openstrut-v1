#!/usr/bin/env bash
# Compila um programa para o build web (chamado por build.sh, que exporta o ambiente).
# Uso: build_prog.sh <caminho relativo a src-original ou um .BAS qualquer>
set -euo pipefail
bas="$1"
exe="$(basename "$bas" .BAS)"
p="$WEB_BUILD/prog/$exe"
t0=$(date +%s)
rm -rf "$p"; mkdir -p "$p/c" "$p/temp"
fonte="$raiz/src-original/$bas"; [ -f "$bas" ] && fonte="$bas"
win_bas="$(cygpath -w "$fonte" 2>/dev/null || echo "$fonte")"
bash "$aqui/gera_cpp.sh" "$win_bas" "$p/temp"
# o RT45X87.h (DECLARE LIBRARY) entra pelo caminho absoluto: copia, f80iza e aponta para a copia
cp "$raiz/src-original/comum/RT45X87.h" "$p/temp/RT45X87.h"
sed -i 's|#include "[^"]*RT45X87\.h"|#include "RT45X87.h"|' "$p/temp/regsf.txt"
if command -v python >/dev/null 2>&1; then PY=python; else PY=python3; fi
$PY -I "$aqui/f80iza.py" "$p/temp"
cp "$qbc/qbx.cpp" "$p/c/qbx.cpp"
em++ $CXXF -I"$p/temp" -c "$p/c/qbx.cpp" -o "$p/qbx.o"
t1=$(date +%s)
em++ $WEB_OPT "$p/qbx.o" "$libqb" -o "$WEB_DIST/$exe.js" \
    $ASYNC -sSTACK_SIZE=4194304 \
    -sALLOW_MEMORY_GROWTH=1 -sINITIAL_MEMORY=67108864 \
    -sMODULARIZE=1 -sEXPORT_NAME="V1_$exe" -sEXIT_RUNTIME=1 -sFORCE_FILESYSTEM=1 \
    -sEXPORTED_FUNCTIONS=_main,_qbweb_tecla,_qbweb_caractere,_malloc,_free \
    -sEXPORTED_RUNTIME_METHODS=FS,ENV,HEAPU8,callMain,UTF8ToString \
    -sINVOKE_RUN=0 -sENVIRONMENT=web,node
t2=$(date +%s)
echo "C++ $((t1 - t0)) s, link $((t2 - t1)) s"
