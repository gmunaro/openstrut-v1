# shellcheck shell=bash
# Parte comum dos scripts windows/, linux/ e macos/empacotar.sh (carregada com `source`).
# Lê as opções abaixo (ou as variáveis de ambiente entre parênteses):
#   --v1 PASTA      build/ da V1 (tools/build.sh): os 28 programas e o lançador
#                   OPENSTRUT, todos <NOME>.exe, e sistrut-game/ (V1_DIR)
#   --versao X      versão do pacote; padrão: data de hoje, AAAA.MM.DD (VERSAO)
#   --saida PASTA   onde ficam a árvore e o pacote; padrão: pacote/saida (SAIDA)
#   --etapa E       arvore (só monta a árvore), pacote (só gera o pacote de uma
#                   árvore já montada) ou tudo (padrão) (ETAPA)
# Os pacotes são só x64: o RT45 da V1 usa o x87 (src-original/comum/RT45X87.h).
set -euo pipefail

PACOTE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
V1_DIR="${V1_DIR:-}"
VERSAO="${VERSAO:-$(date +%Y.%m.%d)}"
SAIDA="${SAIDA:-$PACOTE/saida}"
ETAPA="${ETAPA:-tudo}"
# a V2 é web (PWA); os pacotes só levam um atalho para ela
# shellcheck disable=SC2034 # usada pelos empacotar.sh
V2_URL="https://gmunaro.github.io/openstrut/"

while [ $# -gt 0 ]; do
    case "$1" in
        --v1) V1_DIR="$2"; shift 2 ;;
        --versao) VERSAO="$2"; shift 2 ;;
        --saida) SAIDA="$2"; shift 2 ;;
        --etapa) ETAPA="$2"; shift 2 ;;
        *) echo "opção desconhecida: $1" >&2; exit 2 ;;
    esac
done

case "$ETAPA" in arvore | pacote | tudo) ;; *) echo "etapa inválida: $ETAPA" >&2; exit 2 ;; esac
mkdir -p "$SAIDA"
SAIDA="$(cd "$SAIDA" && pwd)"

erro() {
    echo "erro: $*" >&2
    exit 1
}

# os 28 programas da V1 (um por EXE do original) e o lançador
PROGRAMAS_V1="SISTRUT SISEDIT LAJE LAJEGEOM LAJECALC LAJEMONT LAJEGRAV LAJEPROC VIGA VPLOTA
ARMADURA PILAR PILAREDI PILGEEDI PIPROEDI PIGRAEDI FORMA FORMEDCA FORMIMP FORMINIT FORMPLOT
DESENHO DESDIM DESEDCAO DESEDITA DESGRAF DESIMP DESINIT OPENSTRUT"

# confere a entrada da etapa "arvore": os 29 executáveis e a instalação do original
conferir_entradas() {
    local p
    [ -n "$V1_DIR" ] || erro "informe a pasta da V1 (--v1 ou V1_DIR)"
    for p in $PROGRAMAS_V1; do
        [ -f "$V1_DIR/$p.exe" ] || erro "V1 sem $p.exe em $V1_DIR (rode tools/build.sh)"
    done
    [ -f "$V1_DIR/sistrut-game/SISTRUT.INI" ] || erro "V1 sem sistrut-game/SISTRUT.INI em $V1_DIR"
}

# copia os programas e a instalação do original para a pasta $1
copiar_v1() {
    local p
    mkdir -p "$1"
    for p in $PROGRAMAS_V1; do cp "$V1_DIR/$p.exe" "$1/"; done
    rm -rf "${1:?}/sistrut-game"
    cp -R "$V1_DIR/sistrut-game" "$1/sistrut-game"
}
