#!/usr/bin/env bash
# Atalho para o Windows local: gera saida/OpenStrut-V1-Setup-windows-x64.exe com
# windows/empacotar.sh a partir de build/. Não recompila: rode antes
# `bash tools/build.sh` se o fonte mudou. Variáveis (opcionais):
#   V1_DIR   build da V1; padrão: ../build (deste repositório)
#   VERSAO   padrão: data de hoje
# Os outros sistemas usam linux/empacotar.sh e macos/empacotar.sh (ver comum.sh).
set -euo pipefail
AQUI="$(cd "$(dirname "$0")" && pwd)"
V1_DIR="${V1_DIR:-$AQUI/../build}"
bash "$AQUI/windows/empacotar.sh" --v1 "$V1_DIR" "$@"
