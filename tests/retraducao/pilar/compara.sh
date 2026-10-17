#!/usr/bin/env bash
# Compara a saida do oraculo com a da V1 (tools/compara_retrad.py: telas, atributos, PNG e
# impressora.prn byte a byte). Oraculo e V1 rodam com o relogio fixo (2026-10-14 12:00:00), entao a
# data e a hora impressas entram na comparacao.
# Uso: compara.sh <runs/CASO do oraculo> <saida da V1> [--ignora REGEX ...]
set -eu
aqui="$(cd "$(dirname "$0")" && pwd)"
python -I "$aqui/../../../tools/compara_retrad.py" "$@"
