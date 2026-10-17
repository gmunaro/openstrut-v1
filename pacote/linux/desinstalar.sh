#!/usr/bin/env bash
# Desinstala o OpenStrut V1 deste usuário: tira os atalhos e a pasta
# ~/.local/share/openstrut. As obras e configurações em ~/OpenStrut (a pasta C:
# do lançador) ficam; apague-a se não precisar mais delas.
set -euo pipefail

DADOS="${XDG_DATA_HOME:-$HOME/.local/share}"
DESTINO="$DADOS/openstrut"
MENU="$DADOS/applications"

rm -f "$MENU/openstrut-v1.desktop" "$MENU/openstrut-v2-web.desktop"
command -v update-desktop-database > /dev/null && update-desktop-database "$MENU" 2> /dev/null || true
AREA="$(xdg-user-dir DESKTOP 2> /dev/null || true)"
[ -n "$AREA" ] || AREA="$HOME/Desktop"
rm -f "$AREA/openstrut-v1.desktop" "$AREA/openstrut-v2-web.desktop"

if [ -d "$DESTINO" ]; then
    rm -rf "${DESTINO:?}"
    echo "OpenStrut V1 desinstalado."
else
    echo "O OpenStrut V1 não está instalado em $DESTINO."
fi
[ -d "$HOME/OpenStrut" ] && echo "As obras e configurações ficaram em $HOME/OpenStrut; apague a pasta se não precisar mais delas."
exit 0
