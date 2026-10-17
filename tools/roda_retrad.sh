#!/usr/bin/env bash
# Roda um programa retraduzido (src-original) com um roteiro no formato do oraculo e
# espera a cadeia de CHAIN terminar. Saida no mesmo formato do oraculo (telas/, impressora.prn).
# Uso: tools/roda_retrad.sh <pasta dos EXE> <EXE inicial> <roteiro> <pasta de saida> <pasta "C:"> [limite s]
#   O EXE inicial recebe uma tela de entrada como a do gerenciador (tools/troca_semente.py).
#   <pasta "C:"> faz o papel do disco C: do DOS (SISTRUT_C): obra na raiz, INI em SISTRUT\EXEC40.
#   V1_MARCA=original: tela de entrada com o texto do SISTRUT.EXE (EXE gerados com --marca
#   original); o padrao e openstrut, como o SISTRUT.BAS do repositorio.
set -u
# Roda uma copia deste script: se ele mudar durante a execucao, o bash nao le a versao nova pela metade.
if [ -z "${RODA_RETRAD_DIR:-}" ]; then
  copia="$(mktemp)"; cp "$0" "$copia"
  RODA_RETRAD_DIR="$(cd "$(dirname "$0")" && pwd)" exec bash "$copia" "$@"
fi
trap 'rm -f "$0"' EXIT
bin="$1"; exe="$2"; rot="$3"; out="$4"; drive_c="$5"; lim="${6:-120}"
here="$RODA_RETRAD_DIR"
# V1_WEB=<pasta do site web/dist>: roda a V1 web (wasm) em vez do EXE, com a mesma saida e o drive
# C: final de volta em <pasta "C:"> (web/tests/roda_retrad_web.sh); <pasta dos EXE> e ignorada.
if [ -n "${V1_WEB:-}" ]; then rm -f "$0"; exec bash "$here/../web/tests/roda_retrad_web.sh" "$@"; fi
rm -rf "$out"; mkdir -p "$out"
win() { cygpath -aw "$1"; }
python -I "$here/troca_semente.py" "$out/semente.chn" --modulo "$exe" --marca "${V1_MARCA:-openstrut}" >/dev/null
export SISTRUT_ROTEIRO="$(win "$rot")" SISTRUT_SAIDA="$(win "$out")" SISTRUT_C="$(win "$drive_c")"
export SISTRUT_LOG="$(win "$out")\\log.txt"
# relogio fixo como o do oraculo (ORACULO_DATA); SISTRUT_DATA=host = relogio do Windows
export SISTRUT_DATA="${SISTRUT_DATA:-2026-10-14 12:00:00}"
[ "$SISTRUT_DATA" = host ] && unset SISTRUT_DATA
# data e hora param em SISTRUT_DATA, o TIMER anda (como ORACULO_RELOGIO=congelado); "anda" = relogio corre
export SISTRUT_RELOGIO="${SISTRUT_RELOGIO:-congelado}"
unset SISTRUT_DATA_REF
"$bin/$exe.exe" "/CHAIN:$(win "$out/semente.chn")" &
# A cadeia acabou quando a ultima linha do log e "<EXE>: fim" (RT_FIM) e continua sendo depois
# de 3 s (entre o SYSTEM de quem faz CHAIN/RUN e o inicio do proximo o Windows chega a levar
# 5 s; nesse intervalo a ultima linha e "CHAIN ..." ou "RUN ..."). Nao olha os processos: outros
# agentes podem estar rodando EXE com o mesmo nome.
t=0
fimvisto=0
sleep 1
while :; do
    if tail -1 "$out/log.txt" 2>/dev/null | grep -q ': fim$'; then
        fimvisto=$((fimvisto + 1))
        [ $fimvisto -ge 3 ] && break
    else
        fimvisto=0
    fi
    t=$((t + 1))
    if [ $t -ge "$lim" ]; then echo "roda_retrad: limite de $lim s sem ': fim' no log" >&2; exit 3; fi
    sleep 1
done
echo "saida: $out"
tail -1 "$out/log.txt"
