#!/usr/bin/env bash
# Gera o instalador do Windows: saida/OpenStrut-Setup-windows-x64.exe.
# Roda no Windows (Git Bash), com Bun e Inno Setup 6. Opções em ../comum.sh. Exemplo:
#   windows/empacotar.sh --v1 build --v2 ../openstrut/dist --versao 2026.10.13
# Etapa "arvore": monta saida/arvore-windows-x64/OpenStrut/
#   V1/       executáveis, .INI e parametrizações
#   V2/       OpenStrut-V2.exe (lançador) + www/ (build da V2)
#   icones/   .ico dos atalhos
#   LEIA-ME.txt
# Etapa "pacote": compila windows/openstrut.iss com o Inno Setup sobre essa árvore.
# O ISCC é procurado em ISCC, %LOCALAPPDATA%\Programs\Inno Setup 6 e Arquivos de
# Programas (x86) (winget install JRSoftware.InnoSetup).
# shellcheck source=../comum.sh
source "$(dirname "$0")/../comum.sh"
[ "$ARCH" = x64 ] || erro "o instalador do Windows é só x64"

ARVORE="$SAIDA/arvore-windows-x64/OpenStrut"

if [ "$ETAPA" != pacote ]; then
    conferir_entradas OPENSTRUT.exe
    echo "== árvore em $ARVORE"
    rm -rf "${ARVORE:?}"
    mkdir -p "$ARVORE/V1" "$ARVORE/V2" "$ARVORE/icones"
    cp "$V1_DIR"/* "$ARVORE/V1/"
    cp -r "$V2_DIST" "$ARVORE/V2/www"
    bash "$PACOTE/lancador/compilar.sh" windows-x64 "$ARVORE/V2/OpenStrut-V2.exe"
    cp "$PACOTE"/icones/*.ico "$ARVORE/icones/"
    sed 's/$/\r/' "$PACOTE/leia-me/windows.txt" > "$ARVORE/LEIA-ME.txt"
fi

if [ "$ETAPA" != arvore ]; then
    [ -f "$ARVORE/V1/OPENSTRUT.exe" ] || erro "árvore não montada em $ARVORE (rode a etapa arvore)"
    ISCC="${ISCC:-${LOCALAPPDATA:-}/Programs/Inno Setup 6/ISCC.exe}"
    [ -f "$ISCC" ] || ISCC="/c/Program Files (x86)/Inno Setup 6/ISCC.exe"
    [ -f "$ISCC" ] || erro "Inno Setup 6 não encontrado (defina ISCC)"
    echo "== instalador"
    MSYS_NO_PATHCONV=1 "$ISCC" /Q \
        "/DVersao=$VERSAO" \
        "/DPacote=$(cygpath -w "$ARVORE")" \
        "/DSaida=$(cygpath -w "$SAIDA")" \
        "/DIcones=$(cygpath -w "$PACOTE/icones")" \
        "$(cygpath -w "$PACOTE/windows/openstrut.iss")"
    ls -l "$SAIDA/OpenStrut-Setup-windows-x64.exe"
fi
