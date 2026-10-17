#!/usr/bin/env bash
# Gera o instalador do Windows: saida/OpenStrut-V1-Setup-windows-x64.exe.
# Roda no Windows (Git Bash), com o Inno Setup 6. Opções em ../comum.sh. Exemplo:
#   windows/empacotar.sh --v1 build --versao 2026.10.16
# Etapa "arvore": monta saida/arvore-windows-x64/OpenStrut/
#   *.exe            os 28 programas e o lançador OPENSTRUT.exe
#   sistrut-game/    INI e parametrizações da instalação do original
#   openstrut-v1.ico, LEIA-ME.txt
# Etapa "pacote": compila windows/openstrut.iss com o Inno Setup sobre essa árvore.
# O ISCC é procurado em ISCC, %LOCALAPPDATA%\Programs\Inno Setup 6 e Arquivos de
# Programas (x86) (winget install JRSoftware.InnoSetup).
# shellcheck source=../comum.sh
source "$(dirname "$0")/../comum.sh"

ARVORE="$SAIDA/arvore-windows-x64/OpenStrut"
ARQUIVO="$SAIDA/OpenStrut-V1-Setup-windows-x64.exe"

if [ "$ETAPA" != pacote ]; then
    conferir_entradas
    echo "== árvore em $ARVORE"
    rm -rf "${ARVORE:?}"
    copiar_v1 "$ARVORE"
    cp "$PACOTE/icones/openstrut-v1.ico" "$ARVORE/"
    sed 's/$/\r/' "$PACOTE/leia-me/windows.txt" > "$ARVORE/LEIA-ME.txt"
fi

if [ "$ETAPA" != arvore ]; then
    [ -f "$ARVORE/OPENSTRUT.exe" ] || erro "árvore não montada em $ARVORE (rode a etapa arvore)"
    ISCC="${ISCC:-${LOCALAPPDATA:-}/Programs/Inno Setup 6/ISCC.exe}"
    [ -f "$ISCC" ] || ISCC="/c/Program Files (x86)/Inno Setup 6/ISCC.exe"
    [ -f "$ISCC" ] || erro "Inno Setup 6 não encontrado (defina ISCC)"
    echo "== instalador"
    MSYS_NO_PATHCONV=1 "$ISCC" /Q \
        "/DVersao=$VERSAO" \
        "/DPacote=$(cygpath -w "$ARVORE")" \
        "/DSaida=$(cygpath -w "$SAIDA")" \
        "/DIcones=$(cygpath -w "$PACOTE/icones")" \
        "/DV2Url=$V2_URL" \
        "$(cygpath -w "$PACOTE/windows/openstrut.iss")"
    ls -l "$ARQUIVO"
fi
