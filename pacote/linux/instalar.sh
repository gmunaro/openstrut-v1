#!/usr/bin/env bash
# Instala o OpenStrut V1 para este usuário, sem sudo, em ~/.local/share/openstrut,
# com atalhos no menu de aplicativos e, se houver, na Área de Trabalho: "OpenStrut V1"
# (o lançador OPENSTRUT.exe) e "OpenStrut V2 (web)" (link para a V2 no navegador).
# Rode de dentro da pasta extraída do .tar.gz:
#   ./instalar.sh
# As obras ficam em ~/OpenStrut (a pasta C: do lançador), fora da instalação:
# reinstalar troca só os programas.
set -euo pipefail

ORIGEM="$(cd "$(dirname "$0")" && pwd)"
DADOS="${XDG_DATA_HOME:-$HOME/.local/share}"
DESTINO="$DADOS/openstrut"
MENU="$DADOS/applications"
V2_URL="https://gmunaro.github.io/openstrut/"

[ -f "$ORIGEM/OPENSTRUT.exe" ] && [ -f "$ORIGEM/SISTRUT.exe" ] || {
    echo "Rode o instalar.sh de dentro da pasta OpenStrut extraída do pacote." >&2
    exit 1
}
if [ "$ORIGEM" = "$DESTINO" ]; then
    echo "O OpenStrut já está instalado nesta pasta." >&2
    exit 1
fi

echo "Instalando em $DESTINO"
# a instalação só tem o que veio no pacote: troca tudo (rm antes de copiar evita
# "Text file busy" se um programa estiver aberto)
rm -rf "${DESTINO:?}"
mkdir -p "$DESTINO" "$MENU"
cp -R "$ORIGEM"/. "$DESTINO/"
chmod 755 "$DESTINO"/*.exe "$DESTINO/desinstalar.sh"
rm -f "$DESTINO/instalar.sh"

# Exec= entre aspas: \ " ` $ precisam de \\ e % vira %%
escapar_exec() {
    printf '%s' "$1" | sed -e 's/\\/\\\\\\\\/g' -e 's/["`$]/\\\\&/g' -e 's/%/%%/g'
}
# demais valores: só a barra invertida
escapar() {
    printf '%s' "$1" | sed -e 's/\\/\\\\/g'
}

cat > "$MENU/openstrut-v1.desktop" << EOF
[Desktop Entry]
Type=Application
Name=OpenStrut V1
Comment=Retradução do SISTRUT 4.0 (NB-1/78)
Exec="$(escapar_exec "$DESTINO/OPENSTRUT.exe")"
Path=$(escapar "$DESTINO")
Icon=$(escapar "$DESTINO/openstrut-v1.png")
Terminal=false
StartupNotify=false
Categories=Science;Engineering;
EOF
cat > "$MENU/openstrut-v2-web.desktop" << EOF
[Desktop Entry]
Type=Link
Name=OpenStrut V2 (web)
Comment=OpenStrut V2 no navegador (NBR 6118:2023 e NB-1/78)
URL=$V2_URL
Icon=text-html
EOF
chmod 755 "$MENU/openstrut-v1.desktop" "$MENU/openstrut-v2-web.desktop"
command -v update-desktop-database > /dev/null && update-desktop-database "$MENU" 2> /dev/null || true

# atalhos na Área de Trabalho, se ela existir
AREA="$(xdg-user-dir DESKTOP 2> /dev/null || true)"
[ -n "$AREA" ] || AREA="$HOME/Desktop"
if [ "$AREA" != "$HOME" ] && [ -d "$AREA" ]; then
    for a in openstrut-v1 openstrut-v2-web; do
        cp "$MENU/$a.desktop" "$AREA/"
        # GNOME só abre atalhos da Área de Trabalho marcados como confiáveis
        command -v gio > /dev/null && gio set "$AREA/$a.desktop" metadata::trusted true 2> /dev/null || true
    done
    echo "Atalhos criados no menu de aplicativos e em $AREA"
else
    echo "Atalhos criados no menu de aplicativos"
fi

# bibliotecas que a V1 usa e o sistema não tem
faltando=$(
    for f in "$DESTINO"/*.exe; do
        { ldd "$f" 2> /dev/null || true; } | awk '/not found/ { print $1 }'
    done | sort -u
)
if [ -n "$faltando" ]; then
    echo
    echo "ATENÇÃO: a V1 precisa destas bibliotecas, que não estão instaladas:"
    # shellcheck disable=SC2086 # uma biblioteca por linha
    printf '  %s\n' $faltando
    if command -v apt-get > /dev/null; then
        # Ubuntu 24.04 e Debian 13 renomearam alguns pacotes com o sufixo t64
        t64() { if apt-cache show "${1}t64" > /dev/null 2>&1; then echo "${1}t64"; else echo "$1"; fi; }
        pacotes=""
        desconhecidas=""
        for lib in $faltando; do
            case "$lib" in
                libGL.so.1) p=libgl1 ;;
                libGLU.so.1) p=libglu1-mesa ;;
                libOpenGL.so.0) p=libopengl0 ;;
                libX11.so.6) p=libx11-6 ;;
                libXext.so.6) p=libxext6 ;;
                libXrandr.so.2) p=libxrandr2 ;;
                libXcursor.so.1) p=libxcursor1 ;;
                libXi.so.6) p=libxi6 ;;
                libXinerama.so.1) p=libxinerama1 ;;
                libXxf86vm.so.1) p=libxxf86vm1 ;;
                libasound.so.2) p="$(t64 libasound2)" ;;
                libcurl.so.4) p="$(t64 libcurl4)" ;;
                libpng16.so.16) p="$(t64 libpng16-16)" ;;
                libfreetype.so.6) p=libfreetype6 ;;
                libz.so.1) p=zlib1g ;;
                libstdc++.so.6) p=libstdc++6 ;;
                libgcc_s.so.1) p=libgcc-s1 ;;
                *) p="" ;;
            esac
            if [ -n "$p" ]; then pacotes="$pacotes $p"; else desconhecidas="$desconhecidas $lib"; fi
        done
        [ -z "$pacotes" ] || echo "Instale com: sudo apt install$pacotes"
        [ -z "$desconhecidas" ] || echo "Para as demais, procure o pacote com: apt-file search <biblioteca>  ($desconhecidas )"
    elif command -v dnf > /dev/null; then
        printf 'Instale com: sudo dnf install'
        for lib in $faltando; do printf " '%s()(64bit)'" "$lib"; done
        echo
    else
        echo "Instale-as pelo gerenciador de pacotes da sua distribuição."
    fi
fi

echo
echo "Pronto. Abra o OpenStrut V1 pelo menu de aplicativos. As obras ficam em ~/OpenStrut."
echo "Para desinstalar: $DESTINO/desinstalar.sh"
