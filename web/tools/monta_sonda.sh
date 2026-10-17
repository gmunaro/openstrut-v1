#!/usr/bin/env bash
# Monta o site da sonda do CHAIN (familia sistema, roda_sistema.sh): o SISTRUT de <dist> e a sonda
# tests/retraducao/sistema/SONDA_CHAIN.BAS no lugar de cada modulo que o SISTRUT chama. A sonda e
# compilada uma vez; cada copia so troca o nome da fabrica (V1_<EXE>) e do .wasm no .js.
# Uso: web/tools/monta_sonda.sh <dist com o SISTRUT> <saida (web/dist_sonda)>
#   mesmo ambiente do build.sh (QB64_DIR, EMSDK, WEB_BUILD, WEB_ASYNC...)
set -euo pipefail
aqui="$(cd "$(dirname "$0")" && pwd)"
raiz="$(cd "$aqui/../.." && pwd)"
dist="$(cd "$1" && pwd)"; out="$2"
tmp="$(mktemp -d)"; trap 'rm -rf "$tmp"' EXIT
WEB_DIST="$tmp" bash "$aqui/build.sh" "$raiz/tests/retraducao/sistema/SONDA_CHAIN.BAS"
rm -rf "$out"; mkdir -p "$out"
cp "$dist/SISTRUT.js" "$dist/SISTRUT.wasm" "$out/"
for m in PORTICO LAJE VIGA PILAR ARMADURA FORMA DESENHO VPLOTA SISEDIT; do
    sed "s/V1_SONDA_CHAIN/V1_$m/g; s/SONDA_CHAIN\.wasm/$m.wasm/g" "$tmp/SONDA_CHAIN.js" > "$out/$m.js"
    cp "$tmp/SONDA_CHAIN.wasm" "$out/$m.wasm"
done
# pagina, modulos.json e instalacao inicial (build.sh sem programas so monta o site)
WEB_DIST="$out" bash "$aqui/build.sh"
