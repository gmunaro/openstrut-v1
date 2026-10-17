#!/usr/bin/env bash
# Gera o C++ de um .BAS com o qb64pe -z (sem compilar), alvo de 32 bits (wasm32), e copia o
# internal/temp para <saida>.
# Usa uma copia privada do qb64pe (QB64_GERA, padrao $WEB_BUILD/qb64pe), feita a partir de QB64_DIR
# sem o compilador C: o internal/temp da instalacao e compartilhado com outros builds e o -z apaga
# e regrava os .txt dele.
# Uso: web/tools/gera_cpp.sh <FONTE.BAS (caminho Windows sem espacos no Windows)> <pasta de saida>
set -euo pipefail
QB64_DIR="${QB64_DIR:-/c/qb64pe/qb64pe}"
WEB_BUILD="${WEB_BUILD:-${TMPDIR:-/tmp}/v1web/build}"
QB64_GERA="${QB64_GERA:-$WEB_BUILD/qb64pe}"
src="$1"; out="$2"
exe=qb64pe.exe; [ -x "$QB64_DIR/qb64pe" ] && [ ! -e "$QB64_DIR/qb64pe.exe" ] && exe=qb64pe
# um por vez (a copia e o -z): varios programas sao compilados em paralelo
mkdir -p "$(dirname "$QB64_GERA")"
LOCK="$QB64_GERA.lock"
until mkdir "$LOCK" 2>/dev/null; do sleep 1; done
trap 'rmdir "$LOCK" 2>/dev/null' EXIT
if [ ! -x "$QB64_GERA/$exe" ] || [ "$QB64_DIR/$exe" -nt "$QB64_GERA/$exe" ]; then
    rm -rf "$QB64_GERA"; mkdir -p "$QB64_GERA/internal/temp" "$QB64_GERA/internal/c/parts"
    cp "$QB64_DIR/$exe" "$QB64_GERA/"
    [ -d "$QB64_DIR/settings" ] && cp -r "$QB64_DIR/settings" "$QB64_GERA/"
    cp -r "$QB64_DIR/internal/support" "$QB64_DIR/internal/source" "$QB64_GERA/internal/"
    ( cd "$QB64_DIR/internal/c" && cp -r libqb common.h os.h libqb.cpp qbx.cpp "$QB64_GERA/internal/c/" && cp -r parts/core "$QB64_GERA/internal/c/parts/" )
    find "$QB64_GERA" -name '*.o' -delete
fi
rm -rf "$out"; mkdir -p "$out"
( cd "$QB64_GERA" && rm -f internal/temp/*.txt && "./$exe" -z -q -f:TargetBits=32 "$src" ) || exit 1
cp "$QB64_GERA"/internal/temp/*.txt "$out/"
