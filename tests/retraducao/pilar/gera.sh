#!/usr/bin/env bash
# Regera a familia PILAR em src-original/pilar a partir dos lifts (so usa tools/, nao edita).
# Dois blocos COMMON (ver tests/retraducao/pilar/CHECKLIST.md, "COMMON e CHAIN"):
#   COMUM_PILAR    DS:0DC0..0F87  PILAR <-> PILAREDI (DS:0F8A do PILAR cai dentro de DS:0F88 do PILAREDI)
#   COMUM_PILAREDI DS:0DC0..1483  PILAREDI <-> PILGEEDI/PIPROEDI/PIGRAEDI (V_107e$ "VOLTA ...",
#                  V_11a6% n. de colunas, matrizes A_11c8..A_141e das colunas; DS:1484 ja diverge)
# Uso: bash tests/retraducao/pilar/gera.sh [EXE ...]   (sem EXE: os cinco)
set -eu
raiz="$(cd "$(dirname "$0")/../../.." && pwd)"
cd "$raiz"
exes="${*:-PILAR PILAREDI PILGEEDI PIPROEDI PIGRAEDI}"
python -I tools/common_familia.py pilar auto auto PILAR PILAREDI PILGEEDI PIPROEDI PIGRAEDI
python -I tools/common_familia.py pilar 0x0dc0 0x1484 PILAREDI PILGEEDI PIPROEDI PIGRAEDI --nome pilaredi
for e in $exes; do
  if [ "$e" = PILAR ]; then
    python -I tools/retraduz.py PILAR --familia pilar
  else
    python -I tools/retraduz.py "$e" --familia pilar --common src-original/pilar/COMUM_PILAREDI.json --comum-nome pilaredi
  fi
done
