#!/usr/bin/env bash
# Compila um .BAS com qb64pe sob uma trava global, para que varios agentes/
# terminais possam rodar build.sh e runtests.sh ao mesmo tempo sem colidir
# em qb64pe/internal/temp.
# Uso: tools/qbcompile.sh <FONTE.BAS> <SAIDA.exe>  (caminhos absolutos sem espaco; no Windows,
#      no formato C:/...)
# QB64_DIR: pasta do QB64 PE (padrao /c/qb64pe/qb64pe).
# SISTRUT_QB64_LOCK: trava (padrao <pasta temporaria>/sistrut-qb64.lock).
QB64="${QB64_DIR:-/c/qb64pe/qb64pe}"
LOCK="${SISTRUT_QB64_LOCK:-${TMPDIR:-/tmp}/sistrut-qb64.lock}"
mkdir -p "$(dirname "$LOCK")"
waited=0
until mkdir "$LOCK" 2>/dev/null; do
    # trava orfa (processo morto) com mais de 5 min e liberada
    # (stat -c e o do GNU/Git Bash; stat -f e o do macOS)
    if [ -d "$LOCK" ] && [ $(( $(date +%s) - $(stat -c %Y "$LOCK" 2>/dev/null || stat -f %m "$LOCK" 2>/dev/null || date +%s) )) -gt 300 ]; then
        rmdir "$LOCK" 2>/dev/null
        continue
    fi
    sleep 1
    waited=$((waited + 1))
    if [ "$waited" -gt 900 ]; then echo "qbcompile: trava ocupada ha 15 min ($LOCK)" >&2; exit 2; fi
done
trap 'rmdir "$LOCK" 2>/dev/null' EXIT
exe=./qb64pe.exe; [ -x "$QB64/qb64pe.exe" ] || exe=./qb64pe
(cd "$QB64" && "$exe" -x -c "$1" -o "$2")
rc=$?
# Fora do Windows o qb64pe tira o .exe do nome de saida; a V1 precisa dele (o CHAIN do
# RT45 procura <nome>.exe na pasta do executavel), entao o nome pedido e mantido.
case "$2" in
    *.exe) if [ "$rc" -eq 0 ] && [ ! -f "$2" ] && [ -f "${2%.exe}" ]; then mv -f "${2%.exe}" "$2" || rc=1; fi ;;
esac
exit "$rc"
