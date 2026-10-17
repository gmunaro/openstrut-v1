#!/usr/bin/env bash
# Monta o caso do oraculo $ORACULO/casos/retrad_laje_<nome>.txt a partir do sufixo
# tests/retraducao/laje/<nome>.sufixo.txt (entrada pelo gerenciador + sufixo) e copia a obra
# de partida (<pasta da obra>, opcional) para casos/retrad_laje_<nome>.dados/.
# Uso: mkcaso.sh <nome> [pasta da obra]
#   ORACULO = pasta do oraculo (DOSBox-X com o original), obrigatoria.
set -eu
ORACULO="${ORACULO:?defina ORACULO=<pasta do oraculo>}"
nome="$1"; obra="${2:-}"
aqui="$(cd "$(dirname "$0")" && pwd)"
caso="$ORACULO/casos/retrad_laje_$nome.txt"
{
  echo '# exe: PATH C:\SISTRUT;Z:\|CD \|SISTRUT\SISTRUT'
  echo "# Caso retraducao/LAJE ($nome) no ORIGINAL (ORACULO_BASE=/orig/instalado)."
  echo "# Gerado por tests/retraducao/laje/mkcaso.sh a partir de $nome.sufixo.txt."
  echo '{ESPERA Configuracao|60}{LIMITE 400}L{ENTER}{ESPERA escolha opcao}{PAUSA 2}'
  cat "$aqui/$nome.sufixo.txt"
} > "$caso"
if [ -n "$obra" ]; then
  mkdir -p "$ORACULO/casos/retrad_laje_$nome.dados"
  cp "$obra"/E2E.* "$ORACULO/casos/retrad_laje_$nome.dados/"
fi
echo "$caso"
