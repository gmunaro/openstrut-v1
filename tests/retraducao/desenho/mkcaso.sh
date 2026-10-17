#!/usr/bin/env bash
# Monta o caso do oraculo $ORACULO/casos/retrad_des_<nome>.txt a partir do sufixo
# tests/retraducao/desenho/<nome>.sufixo.txt (entrada pelo gerenciador: V, seta para a direita
# = "Detalhamento & Desenho", Enter; depois o sufixo) e copia a obra de partida (opcional)
# para casos/retrad_des_<nome>.dados/.
# Uso: mkcaso.sh <nome> [pasta da obra]
#   ORACULO = pasta do oraculo (DOSBox-X com o original), obrigatoria.
set -eu
ORACULO="${ORACULO:?defina ORACULO=<pasta do oraculo>}"
nome="$1"; obra="${2:-}"
aqui="$(cd "$(dirname "$0")" && pwd)"
caso="$ORACULO/casos/retrad_des_$nome.txt"
{
  echo '# exe: PATH C:\SISTRUT;Z:\|CD \|SISTRUT\SISTRUT'
  echo "# Caso retraducao/DESENHO ($nome) no ORIGINAL (ORACULO_BASE=/orig/instalado)."
  echo "# Gerado por tests/retraducao/desenho/mkcaso.sh a partir de $nome.sufixo.txt."
  echo '{ESPERA Configuracao|60}{LIMITE 400}V{PAUSA 2}{RIGHT}{PAUSA 2}{ENTER}{ESPERA escolha opcao|60}{PAUSA 2}'
  cat "$aqui/$nome.sufixo.txt"
} > "$caso"
if [ -n "$obra" ]; then
  rm -rf "$ORACULO/casos/retrad_des_$nome.dados"
  mkdir -p "$ORACULO/casos/retrad_des_$nome.dados"
  cp "$obra"/* "$ORACULO/casos/retrad_des_$nome.dados/"
fi
echo "$caso"
