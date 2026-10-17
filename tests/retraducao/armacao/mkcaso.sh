#!/usr/bin/env bash
# Monta o caso do oraculo $ORACULO/casos/retrad_arm_<nome>.txt a partir do sufixo
# tests/retraducao/armacao/<nome>.sufixo.txt: entrada pelo gerenciador (A = Armacao) + sufixo.
# O ARMADURA nao le obra (so o ARMADURA.INI da instalacao); nao ha pasta .dados.
# Uso: mkcaso.sh <nome>
#   ORACULO = pasta do oraculo (DOSBox-X com o original), obrigatoria.
set -eu
ORACULO="${ORACULO:?defina ORACULO=<pasta do oraculo>}"
nome="$1"
aqui="$(cd "$(dirname "$0")" && pwd)"
caso="$ORACULO/casos/retrad_arm_$nome.txt"
{
  echo '# exe: PATH C:\SISTRUT;Z:\|CD \|SISTRUT\SISTRUT'
  echo "# Caso retraducao/ARMACAO ($nome) no ORIGINAL (ORACULO_BASE=/orig/instalado)."
  echo "# Gerado por tests/retraducao/armacao/mkcaso.sh a partir de $nome.sufixo.txt."
  echo '{ESPERA Configuracao|60}{LIMITE 400}A{ENTER}{ESPERA FLEXAO SIMPLES|60}{ESPERA escolha opcao}{PAUSA 2}'
  cat "$aqui/$nome.sufixo.txt"
} > "$caso"
echo "$caso"
