#!/usr/bin/env bash
# Gera o pacote do macOS: saida/OpenStrut-macos-<arch>.dmg. Roda no macOS, com
# Bun (lançador), iconutil e codesign (ícones e assinatura ad hoc) e hdiutil (.dmg).
# Opções em ../comum.sh. Exemplo:
#   macos/empacotar.sh --v1 build --v2 ../openstrut/dist --versao 2026.10.13 --arch arm64
# Etapa "arvore": monta saida/arvore-macos-<arch>/ (o conteúdo do .dmg)
#   OpenStrut V1.app/Contents/
#     MacOS/OpenStrut-V1      script que copia a V1 para ~/Library/Application
#                             Support/OpenStrut/V1 e roda o OPENSTRUT de lá
#     Resources/V1/           executáveis, .INI e parametrizações da V1
#     Resources/VERSAO, openstrut-v1.icns, Info.plist
#   OpenStrut V2.app/Contents/
#     MacOS/OpenStrut-V2      lançador (perfil em ~/Library/Application Support/OpenStrut/dados-v2)
#     Resources/www/          build da V2
#     Resources/openstrut-v2.icns, Info.plist
#   Aplicativos -> /Applications, LEIA-ME.txt
# Sem iconutil ou codesign (fora do Mac), a árvore sai sem .icns e sem assinatura,
# o que só serve para conferir a estrutura.
# Etapa "pacote": cria o .dmg com o hdiutil.
# shellcheck source=../comum.sh
source "$(dirname "$0")/../comum.sh"

RAIZ="$SAIDA/arvore-macos-$ARCH"
DMG="$SAIDA/OpenStrut-macos-$ARCH.dmg"
V1APP="$RAIZ/OpenStrut V1.app"
V2APP="$RAIZ/OpenStrut V2.app"

# Info.plist a partir do modelo: app, nome, executável, id, ícone, true/false do LSUIElement
escrever_plist() {
    sed -e "s|@NOME@|$2|g" -e "s|@EXECUTAVEL@|$3|g" -e "s|@ID@|$4|g" \
        -e "s|@ICONE@|$5|g" -e "s|@VERSAO@|$VERSAO|g" -e "s|@SEM_DOCK@|$6|g" \
        "$PACOTE/macos/Info.plist.in" > "$1/Contents/Info.plist"
    command -v plutil > /dev/null && plutil -lint "$1/Contents/Info.plist" > /dev/null
    printf 'APPL????' > "$1/Contents/PkgInfo"
}

# .icns a partir dos PNGs versionados em icones/png/<v1|v2>/
gerar_icns() {
    local v="$1" destino="$2" conjunto
    if ! command -v iconutil > /dev/null; then
        echo "aviso: sem iconutil, $destino fica sem ícone" >&2
        return 0
    fi
    conjunto="$(mktemp -d)/openstrut-$v.iconset"
    mkdir -p "$conjunto"
    for t in 16 32 128 256 512; do
        cp "$PACOTE/icones/png/$v/$t.png" "$conjunto/icon_${t}x${t}.png"
        cp "$PACOTE/icones/png/$v/$((t * 2)).png" "$conjunto/icon_${t}x${t}@2x.png"
    done
    iconutil -c icns "$conjunto" -o "$destino"
    rm -rf "$(dirname "$conjunto")"
}

if [ "$ETAPA" != pacote ]; then
    conferir_entradas OPENSTRUT
    echo "== árvore em $RAIZ"
    rm -rf "${RAIZ:?}"

    mkdir -p "$V1APP/Contents/MacOS" "$V1APP/Contents/Resources/V1"
    cp "$V1_DIR"/* "$V1APP/Contents/Resources/V1/"
    cp "$PACOTE/macos/OpenStrut-V1" "$V1APP/Contents/MacOS/OpenStrut-V1"
    echo "$VERSAO" > "$V1APP/Contents/Resources/VERSAO"
    gerar_icns v1 "$V1APP/Contents/Resources/openstrut-v1.icns"
    escrever_plist "$V1APP" "OpenStrut V1" OpenStrut-V1 io.github.gmunaro.openstrut.v1 openstrut-v1 false

    mkdir -p "$V2APP/Contents/MacOS" "$V2APP/Contents/Resources"
    bash "$PACOTE/lancador/compilar.sh" "darwin-$ARCH" "$V2APP/Contents/MacOS/OpenStrut-V2"
    cp -r "$V2_DIST" "$V2APP/Contents/Resources/www"
    gerar_icns v2 "$V2APP/Contents/Resources/openstrut-v2.icns"
    # LSUIElement: o lançador não tem janela; quem aparece no Dock é o navegador
    escrever_plist "$V2APP" "OpenStrut V2" OpenStrut-V2 io.github.gmunaro.openstrut.v2 openstrut-v2 true

    # permissões fixas: artefatos do CI chegam sem o bit de execução
    chmod -R u=rwX,go=rX "$RAIZ"
    find "$RAIZ" -type f -exec chmod 644 {} +
    for f in "$V1APP"/Contents/Resources/V1/*; do
        if eh_programa_v1 "$f"; then chmod 755 "$f"; fi
    done
    chmod 755 "$V1APP/Contents/MacOS/OpenStrut-V1" "$V2APP/Contents/MacOS/OpenStrut-V2"

    # Sem assinatura nenhuma, o macOS em Apple Silicon recusa os binários e diz
    # que o app "está danificado"; a assinatura ad hoc leva ao aviso normal do
    # Gatekeeper (desenvolvedor não identificado), que o usuário libera.
    if command -v codesign > /dev/null; then
        for f in "$V1APP"/Contents/Resources/V1/*; do
            if eh_programa_v1 "$f"; then codesign --force --sign - "$f"; fi
        done
        codesign --force --sign - "$V2APP/Contents/MacOS/OpenStrut-V2"
        codesign --force --sign - "$V1APP"
        codesign --force --sign - "$V2APP"
    else
        echo "aviso: sem codesign, os .app ficam sem assinatura ad hoc" >&2
    fi

    ln -s /Applications "$RAIZ/Aplicativos"
    cp "$PACOTE/leia-me/macos.txt" "$RAIZ/LEIA-ME.txt"
fi

if [ "$ETAPA" != arvore ]; then
    [ -x "$V1APP/Contents/MacOS/OpenStrut-V1" ] || erro "árvore não montada em $RAIZ (rode a etapa arvore)"
    command -v hdiutil > /dev/null || erro "hdiutil não encontrado: o .dmg só pode ser gerado no macOS"
    echo "== pacote"
    rm -f "$DMG"
    hdiutil create -volname "OpenStrut" -srcfolder "$RAIZ" -fs HFS+ -format UDZO -ov "$DMG"
    ls -l "$DMG"
fi
