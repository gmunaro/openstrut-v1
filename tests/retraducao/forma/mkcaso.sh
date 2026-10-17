#!/usr/bin/env bash
# Monta o caso do oraculo $ORACULO/casos/retrad_frm_<nome>.txt a partir do sufixo
# tests/retraducao/forma/<nome>.sufixo.txt (entrada pelo gerenciador: F = Forma) e copia a obra
# de partida tests/retraducao/forma/<obra>/ (linha "# obra:" do sufixo; padrao obra/, gravada pelo original, ver CHECKLIST.md) para
# casos/retrad_frm_<nome>.dados/.
# Uso: mkcaso.sh <nome>
#   ORACULO = pasta do oraculo (DOSBox-X com o original), obrigatoria.
set -eu
ORACULO="${ORACULO:?defina ORACULO=<pasta do oraculo>}"
nome="$1"
aqui="$(cd "$(dirname "$0")" && pwd)"
# obra de partida: linha "# obra: <pasta>" do sufixo (padrao: obra)
ob=$(sed -n 's/^# obra: *//p' "$aqui/$nome.sufixo.txt" | head -1); ob="${ob:-obra}"
caso="$ORACULO/casos/retrad_frm_$nome.txt"
{
  echo '# exe: PATH C:\SISTRUT;Z:\|CD \|SISTRUT\SISTRUT'
  echo "# Caso retraducao/FORMA ($nome) no ORIGINAL (ORACULO_BASE=/orig/instalado)."
  echo "# Gerado por tests/retraducao/forma/mkcaso.sh a partir de $nome.sufixo.txt."
  echo '{ESPERA Configuracao|60}{LIMITE 400}F{ENTER}'
  grep -v '^#' "$aqui/$nome.sufixo.txt"
} > "$caso"
rm -rf "$ORACULO/casos/retrad_frm_$nome.dados"
mkdir -p "$ORACULO/casos/retrad_frm_$nome.dados"
cp "$aqui/$ob"/* "$ORACULO/casos/retrad_frm_$nome.dados/"
echo "$caso"
