#!/usr/bin/env bash
# Gera o pacote do macOS: saida/OpenStrut-V1-macos-x64.dmg. Roda no macOS, com
# iconutil e codesign (ícone e assinatura ad hoc) e hdiutil (.dmg). Opções em
# ../comum.sh. Exemplo:
#   macos/empacotar.sh --v1 build --versao 2026.10.16
# Só x64 (Intel): o RT45 usa o x87; nos Macs com Apple Silicon roda pelo Rosetta 2.
# Etapa "arvore": monta saida/arvore-macos-x64/ (o conteúdo do .dmg)
#   OpenStrut V1.app/Contents/
#     MacOS/OpenStrut-V1      script que copia a V1 para ~/Library/Application
#                             Support/OpenStrut/V1 e roda o OPENSTRUT.exe de lá
#     Resources/V1/           os 28 programas, OPENSTRUT.exe e sistrut-game/
#     Resources/VERSAO, openstrut-v1.icns; Info.plist
#   OpenStrut V2 (web).webloc  atalho para a V2 no navegador
#   Aplicativos -> /Applications, LEIA-ME.txt
# Sem iconutil ou codesign (fora do Mac), a árvore sai sem .icns e sem assinatura,
# o que só serve para conferir a estrutura.
# Etapa "pacote": cria o .dmg com o hdiutil.
# shellcheck source=../comum.sh
source "$(dirname "$0")/../comum.sh"

RAIZ="$SAIDA/arvore-macos-x64"
DMG="$SAIDA/OpenStrut-V1-macos-x64.dmg"
APP="$RAIZ/OpenStrut V1.app"

if [ "$ETAPA" != pacote ]; then
    conferir_entradas
    echo "== árvore em $RAIZ"
    rm -rf "${RAIZ:?}"

    mkdir -p "$APP/Contents/MacOS" "$APP/Contents/Resources"
    copiar_v1 "$APP/Contents/Resources/V1"
    cp "$PACOTE/macos/OpenStrut-V1" "$APP/Contents/MacOS/OpenStrut-V1"
    echo "$VERSAO" > "$APP/Contents/Resources/VERSAO"
    sed -e "s|@VERSAO@|$VERSAO|g" "$PACOTE/macos/Info.plist.in" > "$APP/Contents/Info.plist"
    if command -v plutil > /dev/null; then plutil -lint "$APP/Contents/Info.plist" > /dev/null; fi
    printf 'APPL????' > "$APP/Contents/PkgInfo"

    # .icns a partir dos PNGs versionados em icones/png/v1/
    if command -v iconutil > /dev/null; then
        conjunto="$(mktemp -d)/openstrut-v1.iconset"
        mkdir -p "$conjunto"
        for t in 16 32 128 256 512; do
            cp "$PACOTE/icones/png/v1/$t.png" "$conjunto/icon_${t}x${t}.png"
            cp "$PACOTE/icones/png/v1/$((t * 2)).png" "$conjunto/icon_${t}x${t}@2x.png"
        done
        iconutil -c icns "$conjunto" -o "$APP/Contents/Resources/openstrut-v1.icns"
        rm -rf "$(dirname "$conjunto")"
    else
        echo "aviso: sem iconutil, o app fica sem ícone" >&2
    fi

    # permissões fixas: artefatos do CI chegam sem o bit de execução
    chmod -R u=rwX,go=rX "$RAIZ"
    find "$RAIZ" -type f -exec chmod 644 {} +
    chmod 755 "$APP"/Contents/Resources/V1/*.exe "$APP/Contents/MacOS/OpenStrut-V1"

    # Sem assinatura nenhuma, o macOS recusa os binários e diz que o app "está
    # danificado"; a assinatura ad hoc leva ao aviso normal do Gatekeeper
    # (desenvolvedor não identificado), que o usuário libera.
    if command -v codesign > /dev/null; then
        for f in "$APP"/Contents/Resources/V1/*.exe; do codesign --force --sign - "$f"; done
        codesign --force --sign - "$APP"
    else
        echo "aviso: sem codesign, o app fica sem assinatura ad hoc" >&2
    fi

    cat > "$RAIZ/OpenStrut V2 (web).webloc" << EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>URL</key>
	<string>$V2_URL</string>
</dict>
</plist>
EOF
    ln -s /Applications "$RAIZ/Aplicativos"
    cp "$PACOTE/leia-me/macos.txt" "$RAIZ/LEIA-ME.txt"
fi

if [ "$ETAPA" != arvore ]; then
    [ -x "$APP/Contents/MacOS/OpenStrut-V1" ] || erro "árvore não montada em $RAIZ (rode a etapa arvore)"
    command -v hdiutil > /dev/null || erro "hdiutil não encontrado: o .dmg só pode ser gerado no macOS"
    echo "== pacote"
    rm -f "$DMG"
    hdiutil create -volname "OpenStrut V1" -srcfolder "$RAIZ" -fs HFS+ -format UDZO -ov "$DMG"
    ls -l "$DMG"
fi
