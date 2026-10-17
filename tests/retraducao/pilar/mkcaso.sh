#!/usr/bin/env bash
# Monta o caso do oraculo $ORACULO/casos/retrad_pil_<nome>.txt a partir do sufixo
# tests/retraducao/pilar/<nome>.sufixo.txt (entrada pelo gerenciador + sufixo) e copia a obra de
# partida (<pasta da obra>, opcional) para casos/retrad_pil_<nome>.dados/.
# Uso: mkcaso.sh <nome> [pasta da obra]
#   ORACULO = pasta do oraculo (DOSBox-X com o original), obrigatoria.
set -eu
ORACULO="${ORACULO:?defina ORACULO=<pasta do oraculo>}"
nome="$1"; obra="${2:-}"
aqui="$(cd "$(dirname "$0")" && pwd)"
caso="$ORACULO/casos/retrad_pil_$nome.txt"
{
  echo '# exe: PATH C:\SISTRUT;Z:\|CD \|SISTRUT\SISTRUT'
  echo "# Caso retraducao/PILAR ($nome) no ORIGINAL (ORACULO_BASE=/orig/instalado)."
  echo "# Gerado por tests/retraducao/pilar/mkcaso.sh a partir de $nome.sufixo.txt."
  echo '{ESPERA Configuracao|60}{LIMITE 400}i{ENTER}{ESPERA PILARES DE CONCRETO}{ESPERA escolha opcao}{PAUSA 2}'
  grep -v '^#' "$aqui/$nome.sufixo.txt"
} > "$caso"
if [ -n "$obra" ]; then
  mkdir -p "$ORACULO/casos/retrad_pil_$nome.dados"
  cp "$obra"/* "$ORACULO/casos/retrad_pil_$nome.dados/"
fi
echo "$caso"
