#!/usr/bin/env bash
# Compila o lançador da V2 para um sistema. Uso:
#   lancador/compilar.sh <alvo> <arquivo de saída>
# alvo: windows-x64, linux-x64, linux-arm64, darwin-x64 ou darwin-arm64.
# O Bun compila para qualquer alvo a partir de qualquer sistema; só as opções
# de ícone e console do Windows exigem rodar no Windows.
set -euo pipefail
LANCADOR="$(cd "$(dirname "$0")" && pwd)"
alvo="${1:?informe o alvo (windows-x64, linux-x64, linux-arm64, darwin-x64, darwin-arm64)}"
saida="${2:?informe o arquivo de saída}"

case "$alvo" in
    windows-x64)
        bun build --compile --minify --target=bun-windows-x64 \
            --windows-hide-console \
            --windows-icon="$LANCADOR/../icones/openstrut-v2.ico" \
            --windows-title="OpenStrut V2" \
            "$LANCADOR/openstrut-v2.ts" --outfile "$saida"
        ;;
    linux-x64 | linux-arm64 | darwin-x64 | darwin-arm64)
        bun build --compile --minify --target="bun-$alvo" \
            "$LANCADOR/openstrut-v2.ts" --outfile "$saida"
        ;;
    *)
        echo "alvo desconhecido: $alvo" >&2
        exit 1
        ;;
esac
