#!/usr/bin/env bash
# Monta o caso do oraculo $ORACULO/casos/retrad_viga_<nome>.txt a partir do sufixo
# tests/retraducao/viga/<nome>.sufixo.txt (entrada pelo gerenciador + sufixo) e copia a obra
# de partida (<pasta da obra>, opcional) para casos/retrad_viga_<nome>.dados/.
# O sufixo comeca no menu do modulo. A 1a linha "# modulo: VPLOTA" escolhe o VPLOTA
# (gerenciador: V e duas setas para a direita, "Plotagem" da linha Viga); sem ela, VIGA.
# Sufixo com nome vpl_<x> (casos do VPLOTA com arquivos de plotagem) vira casos/retrad_vpl_<x>.
# Uso: mkcaso.sh <nome> [pasta da obra]
#   ORACULO = pasta do oraculo (DOSBox-X com o original), obrigatoria.
set -eu
ORACULO="${ORACULO:?defina ORACULO=<pasta do oraculo>}"
nome="$1"; obra="${2:-}"
aqui="$(cd "$(dirname "$0")" && pwd)"
case "$nome" in vpl_*) base="retrad_$nome" ;; *) base="retrad_viga_$nome" ;; esac
caso="$ORACULO/casos/$base.txt"
suf="$aqui/$nome.sufixo.txt"
if head -1 "$suf" | grep -q "modulo: VPLOTA"; then
  entra='V{PAUSA 1}{RIGHT}{PAUSA 1}{RIGHT}{PAUSA 1}{ENTER}'
else
  entra='V{ENTER}'
fi
{
  echo '# exe: PATH C:\SISTRUT;Z:\|CD \|SISTRUT\SISTRUT'
  echo "# Caso retraducao/VIGA ($nome) no ORIGINAL (ORACULO_BASE=/orig/instalado)."
  echo "# Gerado por tests/retraducao/viga/mkcaso.sh a partir de $nome.sufixo.txt."
  echo "{ESPERA Configuracao|60}{LIMITE 400}$entra{ESPERA escolha opcao}{PAUSA 2}"
  cat "$suf"
} > "$caso"
if [ -n "$obra" ]; then
  mkdir -p "$ORACULO/casos/$base.dados"
  cp "$obra"/* "$ORACULO/casos/$base.dados/"
fi
echo "$caso"
