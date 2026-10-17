#!/usr/bin/env bash
# Atalho para o Windows local: builda a V2 e gera saida/OpenStrut-Setup-windows-x64.exe
# com windows/empacotar.sh. Não recompila a V1: rode antes `bash tools/build.sh`
# se o fonte mudou. Pastas (mude pelas variáveis de ambiente):
#   V1_DIR   build da V1; padrão: ../build (deste repositório)
#   V2_SRC   checkout da V2 (gmunaro/openstrut), obrigatória
#   VERSAO   padrão: data de hoje
# Os outros sistemas usam linux/empacotar.sh e macos/empacotar.sh (ver comum.sh).
set -euo pipefail
AQUI="$(cd "$(dirname "$0")" && pwd)"
V1_DIR="${V1_DIR:-$AQUI/../build}"
V2_SRC="${V2_SRC:?defina V2_SRC=<checkout da V2 (gmunaro/openstrut)>}"

[ -f "$V1_DIR/OPENSTRUT.exe" ] || { echo "V1 sem build em $V1_DIR (defina V1_DIR)" >&2; exit 1; }
[ -f "$V2_SRC/package.json" ] || { echo "fonte da V2 não encontrado em $V2_SRC (defina V2_SRC)" >&2; exit 1; }

echo "== build da V2"
(cd "$V2_SRC" && bun run build)

bash "$AQUI/windows/empacotar.sh" --v1 "$V1_DIR" --v2 "$V2_SRC/dist" "$@"
