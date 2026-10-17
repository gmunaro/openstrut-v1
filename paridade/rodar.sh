#!/usr/bin/env bash
# Paridade V2 x SISTRUT original: compara a V2 (os dois modos de calculo) com os valores
# impressos pelo original (JSON de caso) e grava paridade/saida/relatorio-<modo>.md.
# Uso: bash paridade/rodar.sh --modo original|corrigido [--v2 <raiz>] [--casos <pasta>]...
#                             [--saida <pasta>]
#   --modo      modo detalhado no relatorio e que decide o codigo de saida (padrao: original)
#   --v2        raiz do repositorio da V2 (padrao: $V2_DIR; sem os dois, erro)
#   --casos     pasta (ou arquivo) de JSON de caso; repetivel (padrao: paridade/casos)
# Saida: 0 sem problema; 1 algum valor DIFERE (original) ou diferenca inesperada (corrigido);
# 2 erro (JSON invalido, montagem da V2 falhou).
set -u
RAIZ="$(cd "$(dirname "$0")/.." && pwd)"
cd "$RAIZ" || exit 2
exec bun paridade/comparar.ts "$@"
