#!/usr/bin/env bash
# Gera o pacote do Linux: saida/OpenStrut-linux-<arch>.tar.gz. Roda no Linux,
# com Bun (para compilar o lançador). Opções em ../comum.sh. Exemplo:
#   linux/empacotar.sh --v1 build --v2 ../openstrut/dist --versao 2026.10.13 --arch x64
# Etapa "arvore": monta saida/arvore-linux-<arch>/OpenStrut/
#   V1/        executáveis (sem extensão), .INI e parametrizações
#   V2/        OpenStrut-V2 (lançador) + www/ (build da V2)
#   icones/    PNG 256 px dos atalhos
#   instalar.sh, desinstalar.sh, LEIA-ME.txt, VERSAO
# Etapa "pacote": empacota essa árvore num .tar.gz que abre na pasta OpenStrut/.
# shellcheck source=../comum.sh
source "$(dirname "$0")/../comum.sh"

RAIZ="$SAIDA/arvore-linux-$ARCH"
ARVORE="$RAIZ/OpenStrut"
ARQUIVO="$SAIDA/OpenStrut-linux-$ARCH.tar.gz"

if [ "$ETAPA" != pacote ]; then
    conferir_entradas OPENSTRUT
    echo "== árvore em $ARVORE"
    rm -rf "${ARVORE:?}"
    mkdir -p "$ARVORE/V1" "$ARVORE/V2" "$ARVORE/icones"
    cp "$V1_DIR"/* "$ARVORE/V1/"
    cp -r "$V2_DIST" "$ARVORE/V2/www"
    bash "$PACOTE/lancador/compilar.sh" "linux-$ARCH" "$ARVORE/V2/OpenStrut-V2"
    cp "$PACOTE/icones/png/v1/256.png" "$ARVORE/icones/openstrut-v1.png"
    cp "$PACOTE/icones/png/v2/256.png" "$ARVORE/icones/openstrut-v2.png"
    cp "$PACOTE/linux/instalar.sh" "$PACOTE/linux/desinstalar.sh" "$ARVORE/"
    cp "$PACOTE/leia-me/linux.txt" "$ARVORE/LEIA-ME.txt"
    echo "$VERSAO" > "$ARVORE/VERSAO"
    # permissões fixas: artefatos do CI chegam sem o bit de execução e cópias
    # vindas do Windows chegam com ele em tudo
    chmod -R u=rwX,go=rX "$ARVORE"
    find "$ARVORE" -type f -exec chmod 644 {} +
    for f in "$ARVORE"/V1/*; do
        if eh_programa_v1 "$f"; then chmod 755 "$f"; fi
    done
    chmod 755 "$ARVORE/V2/OpenStrut-V2" "$ARVORE/instalar.sh" "$ARVORE/desinstalar.sh"
fi

if [ "$ETAPA" != arvore ]; then
    [ -f "$ARVORE/V1/OPENSTRUT" ] || erro "árvore não montada em $ARVORE (rode a etapa arvore)"
    echo "== pacote"
    tar -C "$RAIZ" --owner=0 --group=0 -czf "$ARQUIVO" OpenStrut
    ls -l "$ARQUIVO"
fi
