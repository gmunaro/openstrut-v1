#!/usr/bin/env bash
# Teste de fumaca da V1 compilada, sem o original: roda o lancador (OPENSTRUT.exe) como o
# atalho do pacote, com uma pasta de usuario vazia e um roteiro de teclas (SISTRUT_ROTEIRO):
# o gerenciador abre, "L{ENTER}" faz o CHAIN para o LAJE, a tela do LAJE e gravada e o
# roteiro acaba (o RT45 encerra o programa, RT_FIM). Confere que:
#   - o lancador montou a pasta C: do usuario (SISTRUT.INI e EXEC40/ com os INI);
#   - o SISTRUT e o LAJE iniciaram, o CHAIN aconteceu e o LAJE terminou ("LAJE: fim");
#   - a tela gravada do LAJE e o menu do modulo.
# Uso: tools/fumaca.sh [pasta dos EXE | OpenStrut V1.app] [limite em s, padrao 60]
#   pasta dos EXE: padrao build/ (ou a pasta instalada por um pacote)
#   .app (macOS): roda o executavel do app, que copia a V1 para ~/Library/Application
#                 Support/OpenStrut/V1 (na pasta de usuario do teste) e abre o lancador de la
# No Linux sem tela, rode sob xvfb-run. Exit 0 se tudo conferiu.
set -u
DIST="$(cd "$(dirname "$0")/.." && pwd)"
alvo="$(cd "${1:-$DIST/build}" && pwd)" || exit 2
lim="${2:-60}"
T="$(mktemp -d)"
case "$alvo" in
    *.app)
        lancador="$alvo/Contents/MacOS/OpenStrut-V1"
        bin="$T/usuario/Library/Application Support/OpenStrut/V1"
        ;;
    *)
        lancador="$alvo/OPENSTRUT.exe"
        bin="$alvo"
        ;;
esac
[ -f "$lancador" ] || { echo "fumaca: $lancador nao existe (rode tools/build.sh)" >&2; exit 2; }

# caminho para o programa: C:/... no Windows (Git Bash), o mesmo fora dele
nativo() { cygpath -m "$1" 2>/dev/null || echo "$1"; }
windows=0; command -v cygpath > /dev/null && windows=1

mkdir -p "$T/usuario" "$T/saida"
printf '%s\n' "# fumaca: gerenciador -> LAJE (CHAIN) -> fim do roteiro" "L{ENTER}{TELA laje}" > "$T/roteiro.txt"

# Pasta do usuario vazia: o lancador cria <usuario>/OpenStrut. Sem SISTRUT_C herdado.
unset SISTRUT_C SISTRUT_DATA SISTRUT_DATA_REF
if [ "$windows" = 1 ]; then USERPROFILE="$(cygpath -w "$T/usuario")"; export USERPROFILE; else export HOME="$T/usuario"; fi
SISTRUT_ROTEIRO="$(nativo "$T/roteiro.txt")"
SISTRUT_SAIDA="$(nativo "$T/saida")/"
SISTRUT_LOG="$(nativo "$T/saida")/log.txt"
export SISTRUT_ROTEIRO SISTRUT_SAIDA SISTRUT_LOG
log="$T/saida/log.txt"

"$lancador"
rc=$?

# A cadeia acabou quando a ultima linha do log e "LAJE: fim" (como o tools/roda_retrad.sh).
t=0
while [ "$t" -lt "$lim" ]; do
    tail -1 "$log" 2> /dev/null | tr -d '\r' | grep -q 'LAJE: fim$' && break
    sleep 1
    t=$((t + 1))
done

if [ "$t" -ge "$lim" ]; then
    # encerra o que sobrou, so os processos desta pasta de EXE
    if [ "$windows" = 1 ]; then
        powershell -NoProfile -Command "Get-CimInstance Win32_Process | Where-Object { \$_.ExecutablePath -like '$(cygpath -w "$bin")\\*' } | ForEach-Object { Stop-Process -Id \$_.ProcessId -Force }"
    else
        pkill -f "$bin/" 2> /dev/null
    fi
fi

falhas=0
confere() {  # confere <descricao> <comando...>
    local d="$1"; shift
    if "$@" > /dev/null 2>&1; then echo "OK   $d"; else echo "FAIL $d"; falhas=$((falhas + 1)); fi
}
c="$T/usuario/OpenStrut"
tela="$(ls "$T"/saida/telas/*_laje.txt 2> /dev/null | head -1)"
confere "lancador saiu com 0 (saiu com $rc)" test "$rc" -eq 0
confere "programas em $bin" test -f "$bin/SISTRUT.exe"
confere "pasta C: com SISTRUT/SISTRUT.INI" test -f "$c/SISTRUT/SISTRUT.INI"
confere "pasta C: com SISTRUT/EXEC40/LAJE.INI" test -f "$c/SISTRUT/EXEC40/LAJE.INI"
confere "SISTRUT iniciou" grep -q 'SISTRUT: inicio' "$log"
confere "CHAIN do SISTRUT para o LAJE" grep -q 'SISTRUT: CHAIN .*LAJE\.exe' "$log"
confere "LAJE iniciou e terminou em ate $lim s" grep -q 'LAJE: fim' "$log"
confere "tela do LAJE gravada" test -s "$tela"
confere "tela do LAJE com o menu do modulo" grep -q 'LAJES EM REGIME DE RUPTURA' "$tela"

echo
echo "-- log"
tr -d '\r' < "$log" 2> /dev/null
if [ -n "$tela" ]; then
    echo "-- tela $(basename "$tela")"
    # a tela e CP437: LC_ALL=C para o tr e o sed do macOS aceitarem os bytes
    LC_ALL=C tr -d '\r' < "$tela" | LC_ALL=C sed 's/ *$//' | grep -a -v '^$' | head -25
fi
echo
if [ "$falhas" -eq 0 ]; then
    rm -rf "$T"
    echo "fumaca: OK"
else
    echo "fumaca: $falhas falha(s) (arquivos em $T)"
    exit 1
fi
