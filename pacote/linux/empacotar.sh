#!/usr/bin/env bash
# Gera o pacote do Linux: saida/OpenStrut-V1-linux-x64.tar.gz. Roda no Linux.
# Opções em ../comum.sh. Exemplo:
#   linux/empacotar.sh --v1 build --versao 2026.10.16
# Etapa "arvore": monta saida/arvore-linux-x64/OpenStrut/
#   *.exe            os 28 programas e o lançador OPENSTRUT.exe (executáveis ELF;
#                    o .exe é o nome que o CHAIN do RT45 procura)
#   sistrut-game/    INI e parametrizações da instalação do original
#   openstrut-v1.png, instalar.sh, desinstalar.sh, LEIA-ME.txt, VERSAO
# Etapa "pacote": empacota essa árvore num .tar.gz que abre na pasta OpenStrut/.
# shellcheck source=../comum.sh
source "$(dirname "$0")/../comum.sh"

RAIZ="$SAIDA/arvore-linux-x64"
ARVORE="$RAIZ/OpenStrut"
ARQUIVO="$SAIDA/OpenStrut-V1-linux-x64.tar.gz"

if [ "$ETAPA" != pacote ]; then
    conferir_entradas
    echo "== árvore em $ARVORE"
    rm -rf "${ARVORE:?}"
    copiar_v1 "$ARVORE"
    cp "$PACOTE/icones/png/v1/256.png" "$ARVORE/openstrut-v1.png"
    cp "$PACOTE/linux/instalar.sh" "$PACOTE/linux/desinstalar.sh" "$ARVORE/"
    cp "$PACOTE/leia-me/linux.txt" "$ARVORE/LEIA-ME.txt"
    echo "$VERSAO" > "$ARVORE/VERSAO"
    # permissões fixas: artefatos do CI chegam sem o bit de execução e cópias
    # vindas do Windows chegam com ele em tudo
    chmod -R u=rwX,go=rX "$ARVORE"
    find "$ARVORE" -type f -exec chmod 644 {} +
    chmod 755 "$ARVORE"/*.exe "$ARVORE/instalar.sh" "$ARVORE/desinstalar.sh"
fi

if [ "$ETAPA" != arvore ]; then
    [ -f "$ARVORE/OPENSTRUT.exe" ] || erro "árvore não montada em $ARVORE (rode a etapa arvore)"
    echo "== pacote"
    tar -C "$RAIZ" --owner=0 --group=0 -czf "$ARQUIVO" OpenStrut
    ls -l "$ARQUIVO"
fi
