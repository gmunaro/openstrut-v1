#!/usr/bin/env bash
# Desinstala o OpenStrut V1 e V2 deste usuário: tira os atalhos e os programas
# de ~/.local/share/openstrut e mantém as obras e configurações da V1 (V1/) e
# os dados da V2 (dados-v2/). Para apagar tudo, apague essa pasta depois.
set -euo pipefail

DADOS="${XDG_DATA_HOME:-$HOME/.local/share}"
DESTINO="$DADOS/openstrut"
MENU="$DADOS/applications"

rm -f "$MENU/openstrut-v1.desktop" "$MENU/openstrut-v2.desktop"
command -v update-desktop-database > /dev/null && update-desktop-database "$MENU" 2> /dev/null || true
AREA="$(xdg-user-dir DESKTOP 2> /dev/null || true)"
[ -n "$AREA" ] || AREA="$HOME/Desktop"
rm -f "$AREA/openstrut-v1.desktop" "$AREA/openstrut-v2.desktop"

if [ ! -d "$DESTINO" ]; then
    echo "O OpenStrut não está instalado em $DESTINO."
    exit 0
fi

# programas da V1 que o instalar.sh copiou; o resto da pasta são obras e configurações
if [ -f "$DESTINO/.programas-v1" ]; then
    while IFS= read -r nome; do
        if [ -n "$nome" ]; then rm -f "$DESTINO/V1/$nome"; fi
    done < "$DESTINO/.programas-v1"
    rm -f "$DESTINO/.programas-v1"
fi
rm -rf "${DESTINO:?}/V2" "${DESTINO:?}/icones"
rm -f "$DESTINO/LEIA-ME.txt" "$DESTINO/VERSAO" "$DESTINO/desinstalar.sh"
rmdir "$DESTINO/V1" "$DESTINO" 2> /dev/null || true

echo "OpenStrut desinstalado."
[ -d "$DESTINO" ] && echo "As obras e os dados ficaram em $DESTINO; apague a pasta se não precisar mais deles."
exit 0
