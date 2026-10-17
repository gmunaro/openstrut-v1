# shellcheck shell=bash
# Parte comum dos scripts windows/, linux/ e macos/empacotar.sh (carregada com `source`).
# Lê as opções abaixo (ou as variáveis de ambiente entre parênteses):
#   --v1 PASTA      executáveis, .INI e parametrizações da V1 já compilados (V1_DIR)
#   --v2 PASTA      dist/ da V2 já buildada, com index.html (V2_DIST)
#   --versao X      versão do pacote; padrão: data de hoje, AAAA.MM.DD (VERSAO)
#   --saida PASTA   onde ficam a árvore e o pacote; padrão: pacote/saida (SAIDA)
#   --arch A        x64 ou arm64; padrão: a da máquina (ARCH)
#   --etapa E       arvore (só monta a árvore), pacote (só gera o pacote de uma
#                   árvore já montada) ou tudo (padrão) (ETAPA)
set -euo pipefail

PACOTE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
V1_DIR="${V1_DIR:-}"
V2_DIST="${V2_DIST:-}"
VERSAO="${VERSAO:-$(date +%Y.%m.%d)}"
SAIDA="${SAIDA:-$PACOTE/saida}"
ETAPA="${ETAPA:-tudo}"
case "$(uname -m)" in
    arm64 | aarch64) ARCH="${ARCH:-arm64}" ;;
    *) ARCH="${ARCH:-x64}" ;;
esac

while [ $# -gt 0 ]; do
    case "$1" in
        --v1) V1_DIR="$2"; shift 2 ;;
        --v2) V2_DIST="$2"; shift 2 ;;
        --versao) VERSAO="$2"; shift 2 ;;
        --saida) SAIDA="$2"; shift 2 ;;
        --arch) ARCH="$2"; shift 2 ;;
        --etapa) ETAPA="$2"; shift 2 ;;
        *) echo "opção desconhecida: $1" >&2; exit 2 ;;
    esac
done

case "$ARCH" in x64 | arm64) ;; *) echo "arch inválida: $ARCH (use x64 ou arm64)" >&2; exit 2 ;; esac
case "$ETAPA" in arvore | pacote | tudo) ;; *) echo "etapa inválida: $ETAPA" >&2; exit 2 ;; esac
mkdir -p "$SAIDA"
SAIDA="$(cd "$SAIDA" && pwd)"

erro() {
    echo "erro: $*" >&2
    exit 1
}

# confere as entradas da etapa "arvore"; $1 é o nome do executável principal da V1
conferir_entradas() {
    [ -n "$V1_DIR" ] || erro "informe a pasta da V1 (--v1 ou V1_DIR)"
    [ -n "$V2_DIST" ] || erro "informe a pasta dist/ da V2 (--v2 ou V2_DIST)"
    [ -f "$V1_DIR/$1" ] || erro "V1 sem $1 em $V1_DIR"
    [ -f "$V2_DIST/index.html" ] || erro "V2 sem index.html em $V2_DIST"
}

# true se o arquivo é programa da V1: sem extensão (Linux, macOS) ou .exe (Windows)
eh_programa_v1() {
    case "${1##*/}" in
        *.exe | *.EXE) return 0 ;;
        *.*) return 1 ;;
        *) return 0 ;;
    esac
}
