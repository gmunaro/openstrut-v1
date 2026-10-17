#!/usr/bin/env bash
# Gera src-original/desenho/COMUM_DESENHO.* com tools/common_familia.py (sem mudar a ferramenta).
# Contorno provisorio (PEDIDOS-TRADUTOR.md, D3): A_1d76, A_1da4 e A_1dd2 (DS:1D76/1DA4/1DD2, dentro do
# bloco) so aparecem sem sufixo (ERASE/REDIM do DESENHO, "elemento 4 bytes") e nos argumentos crus de
# B$GGET/B$GPUT (DESGRAF 0x12b40, DESEDCAO 0x109ad..0x1130f), e o common_familia.py descarta variavel sem
# tipo. Este script roda a ferramenta sobre uma copia dos .lift.txt com um arquivo a mais por EXE que
# usa as matrizes, com o uso tipado (SINGLE, como o tradutor faz com matriz que so aparece em DIM/ERASE).
# Quando o common_familia.py tratar esses casos, basta rodar a ferramenta direto sobre o dump.
# REA_WORK = pasta do trabalho de engenharia reversa (o dump fica em $REA_WORK/dump), obrigatoria.
set -eu
REA_WORK="${REA_WORK:?defina REA_WORK=<pasta do trabalho de engenharia reversa>}"
aqui="$(cd "$(dirname "$0")" && pwd)"
raiz="$(cd "$aqui/../../.." && pwd)"
exes="DESENHO DESDIM DESEDITA DESGRAF DESIMP DESINIT DESEDCAO"
tmp="${TMPDIR:-/tmp}/des_common_dump"
rm -rf "$tmp"; mkdir -p "$tmp"
for e in $exes; do
  mkdir -p "$tmp/$e"; cp "$REA_WORK"/dump/$e/*.lift.txt "$tmp/$e/"
done
# usos tipados: DESENHO 0x11b72 (ERASE/REDIM), DESGRAF 0x12b40 (GET), DESEDCAO 0x109ad (GET/PUT)
printf '0x11b72  X = A_1d76!(0) + A_1da4!(0) + A_1dd2!(0)\n' > "$tmp/DESENHO/zz_contorno_D3.lift.txt"
printf '0x12b40  X = A_1da4!(0)\n' > "$tmp/DESGRAF/zz_contorno_D3.lift.txt"
printf '0x109ad  X = A_1d76!(0) + A_1da4!(0) + A_1dd2!(0)\n' > "$tmp/DESEDCAO/zz_contorno_D3.lift.txt"
cd "$raiz"
python -I tools/common_familia.py desenho auto auto $exes --dump "$(cygpath -m "$tmp")"
rm -rf "$tmp"
