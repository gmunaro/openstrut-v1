#!/usr/bin/env bash
# Instala o OpenStrut V1 e V2 para este usuário, sem sudo, em
# ~/.local/share/openstrut, com atalhos no menu de aplicativos e, se houver, na
# Área de Trabalho. Rode de dentro da pasta extraída do .tar.gz:
#   ./instalar.sh
# Reinstalar atualiza os programas e mantém as obras da V1, os .INI já
# existentes e os dados da V2 (dados-v2).
set -euo pipefail

ORIGEM="$(cd "$(dirname "$0")" && pwd)"
DADOS="${XDG_DATA_HOME:-$HOME/.local/share}"
DESTINO="$DADOS/openstrut"
MENU="$DADOS/applications"

[ -f "$ORIGEM/V1/OPENSTRUT" ] && [ -f "$ORIGEM/V2/OpenStrut-V2" ] || {
    echo "Rode o instalar.sh de dentro da pasta OpenStrut extraída do pacote." >&2
    exit 1
}
if [ "$ORIGEM" = "$DESTINO" ]; then
    echo "O OpenStrut já está instalado nesta pasta." >&2
    exit 1
fi

echo "Instalando em $DESTINO"
mkdir -p "$DESTINO/V1" "$MENU"

# V1: programas (sem extensão) sempre; .INI e parametrizações só se ainda não
# existem, para manter as configurações. As obras não vêm no pacote, então ficam.
# A lista dos programas instalados serve ao desinstalar.sh.
: > "$DESTINO/.programas-v1"
for f in "$ORIGEM"/V1/*; do
    nome="${f##*/}"
    case "$nome" in
        *.*) [ -e "$DESTINO/V1/$nome" ] || cp "$f" "$DESTINO/V1/" ;;
        *)
            rm -f "$DESTINO/V1/$nome" # evita "Text file busy" se estiver aberto
            cp "$f" "$DESTINO/V1/"
            chmod 755 "$DESTINO/V1/$nome"
            echo "$nome" >> "$DESTINO/.programas-v1"
            ;;
    esac
done

# V2: troca a pasta inteira (os assets têm hash no nome e se acumulariam)
rm -rf "${DESTINO:?}/V2" "${DESTINO:?}/icones"
cp -R "$ORIGEM/V2" "$ORIGEM/icones" "$DESTINO/"
chmod 755 "$DESTINO/V2/OpenStrut-V2"
cp "$ORIGEM/LEIA-ME.txt" "$ORIGEM/VERSAO" "$DESTINO/"
cp "$ORIGEM/desinstalar.sh" "$DESTINO/"
chmod 755 "$DESTINO/desinstalar.sh"

# Exec= entre aspas: \ " ` $ precisam de \\ e % vira %%
escapar_exec() {
    printf '%s' "$1" | sed -e 's/\\/\\\\\\\\/g' -e 's/["`$]/\\\\&/g' -e 's/%/%%/g'
}
# demais valores: só a barra invertida
escapar() {
    printf '%s' "$1" | sed -e 's/\\/\\\\/g'
}

# escreve um .desktop: arquivo, nome, comentário, executável, pasta de trabalho, ícone
escrever_desktop() {
    cat > "$1" <<EOF
[Desktop Entry]
Type=Application
Name=$2
Comment=$3
Exec="$(escapar_exec "$4")"
Path=$(escapar "$5")
Icon=$(escapar "$6")
Terminal=false
StartupNotify=false
Categories=Science;Engineering;
EOF
    chmod 755 "$1"
}

escrever_desktop "$MENU/openstrut-v1.desktop" "OpenStrut V1" \
    "Reconstrução do SISTRUT 4.0 (NB-1/78)" \
    "$DESTINO/V1/OPENSTRUT" "$DESTINO/V1" "$DESTINO/icones/openstrut-v1.png"
escrever_desktop "$MENU/openstrut-v2.desktop" "OpenStrut V2" \
    "OpenStrut V2 (NBR 6118:2023 e NB-1/78)" \
    "$DESTINO/V2/OpenStrut-V2" "$DESTINO/V2" "$DESTINO/icones/openstrut-v2.png"
command -v update-desktop-database > /dev/null && update-desktop-database "$MENU" 2> /dev/null || true

# atalhos na Área de Trabalho, se ela existir
AREA="$(xdg-user-dir DESKTOP 2> /dev/null || true)"
[ -n "$AREA" ] || AREA="$HOME/Desktop"
if [ "$AREA" != "$HOME" ] && [ -d "$AREA" ]; then
    for v in v1 v2; do
        cp "$MENU/openstrut-$v.desktop" "$AREA/"
        # GNOME só abre atalhos da Área de Trabalho marcados como confiáveis
        command -v gio > /dev/null && gio set "$AREA/openstrut-$v.desktop" metadata::trusted true 2> /dev/null || true
    done
    echo "Atalhos criados no menu de aplicativos e em $AREA"
else
    echo "Atalhos criados no menu de aplicativos"
fi

# bibliotecas que a V1 usa e o sistema não tem
faltando=$(
    for f in "$DESTINO"/V1/*; do
        [ "$(head -c 4 "$f" | tail -c 3)" = ELF ] || continue
        { ldd "$f" 2> /dev/null || true; } | awk '/not found/ { print $1 }'
    done | sort -u
)
if [ -n "$faltando" ]; then
    echo
    echo "ATENÇÃO: a V1 precisa destas bibliotecas, que não estão instaladas:"
    # shellcheck disable=SC2086 # uma biblioteca por linha
    printf '  %s\n' $faltando
    if command -v apt-get > /dev/null; then
        pacotes=""
        desconhecidas=""
        for lib in $faltando; do
            case "$lib" in
                libGL.so.1) p=libgl1 ;;
                libGLU.so.1) p=libglu1-mesa ;;
                libX11.so.6) p=libx11-6 ;;
                libXext.so.6) p=libxext6 ;;
                libXrandr.so.2) p=libxrandr2 ;;
                libXcursor.so.1) p=libxcursor1 ;;
                libXi.so.6) p=libxi6 ;;
                libXxf86vm.so.1) p=libxxf86vm1 ;;
                libasound.so.2) p=libasound2 ;;
                libcurl.so.4) p=libcurl4 ;;
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
        case "$(uname -m)" in x86_64 | aarch64) sufixo="(64bit)" ;; *) sufixo="" ;; esac
        printf 'Instale com: sudo dnf install'
        for lib in $faltando; do printf " '%s()%s'" "$lib" "$sufixo"; done
        echo
    else
        echo "Instale-as pelo gerenciador de pacotes da sua distribuição."
    fi
fi

echo
echo "Pronto. Abra o OpenStrut V1 ou V2 pelo menu de aplicativos."
echo "Para desinstalar: $DESTINO/desinstalar.sh"
