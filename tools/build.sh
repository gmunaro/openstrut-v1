#!/usr/bin/env bash
# Compila a OpenStrut V1 com o QB64 PE em build/: os 28 programas de
# src-original/<familia>/*.BAS e o lancador (pacote/lancador/OPENSTRUT.BAS).
# Uso: tools/build.sh [filtro]   ex.: tools/build.sh laje/
# O filtro e uma substring do caminho do fonte (src-original/laje/LAJE.BAS,
# pacote/lancador/OPENSTRUT.BAS).
#
# build/ sai pronta para instalar (e o que os pacotes de pacote/ copiam):
#   <PROGRAMA>.exe  os 28 programas e o OPENSTRUT.exe. Com .exe tambem no Linux e no
#                   macOS: o CHAIN/RUN do RT45 (RT_ACHA_EXE) procura <nome>.exe na
#                   pasta do executavel.
#   sistrut-game/   INI e parametrizacoes da instalacao do original; o lancador os
#                   copia para a pasta C: do usuario.
# Compila a partir de uma pasta temporaria (o qb64pe nao aceita espaco no caminho).
# Exit 0 se tudo compilou; 1 se algum falhou ou nao havia fontes.

DIST="$(cd "$(dirname "$0")/.." && pwd)"
# staging proprio por execucao, numa pasta temporaria sem espacos (o qb64pe nao aceita):
# varias execucoes simultaneas nao se apagam
STAGE="${TMPDIR:-/tmp}"
STAGE="${STAGE%/}/sistrut-build-$$"
STAGE_WIN="$(cygpath -m "$STAGE" 2>/dev/null || echo "$STAGE")"
case "$STAGE" in *" "*) echo "pasta temporaria com espaco ($STAGE): defina TMPDIR" >&2; exit 1 ;; esac
trap 'rm -rf "$STAGE"' EXIT
FILTER="${1:-}"

mkdir -p "$STAGE/out" "$STAGE/pacote" "$DIST/build" || exit 1
cp -r "$DIST/src-original" "$STAGE/" || exit 1
cp -r "$DIST/pacote/lancador" "$STAGE/pacote/" || exit 1

ok=0
fail=0
total=0
rows=""

while IFS= read -r rel; do
    if [ -n "$FILTER" ] && [[ "$rel" != *"$FILTER"* ]]; then
        continue
    fi
    total=$((total + 1))
    mod="$(basename "$rel" | sed 's/\.[bB][aA][sS]$//' | tr '[:lower:]' '[:upper:]')"
    log="$STAGE/out/$mod.log"

    rm -f "$STAGE/out/$mod.exe"
    bash "$DIST/tools/qbcompile.sh" "$STAGE_WIN/$rel" "$STAGE_WIN/out/$mod.exe" > "$log" 2>&1
    rc=$?

    if [ "$rc" -eq 0 ] && [ -f "$STAGE/out/$mod.exe" ]; then
        cp "$STAGE/out/$mod.exe" "$DIST/build/$mod.exe" || rc=1
    else
        rc=1
    fi

    if [ "$rc" -eq 0 ]; then
        ok=$((ok + 1))
        rows="$rows"$'\n'"OK   $rel"
    else
        fail=$((fail + 1))
        rows="$rows"$'\n'"FAIL $rel"
        # qb64pe usa \r na barra de progresso; quebra em linhas e mostra so o fim do erro.
        tail_txt="$(tr '\r' '\n' < "$log" | grep -v '^[[:space:]]*$' | tr -d '\033' | sed -e 's/\[[0-9;]*[mA]//g' | grep -v '^\[[. ]*\]' | tail -n 12)"
        rows="$rows"$'\n'"$(printf '%s\n' "$tail_txt" | sed 's/^/     | /')"
    fi
done < <(cd "$DIST" && { find src-original -mindepth 2 -maxdepth 2 -type f -iname '*.bas' | sort; echo pacote/lancador/OPENSTRUT.BAS; })

printf '%s\n' "$rows"
echo
echo "build: $ok OK, $fail FAIL (de $total)"

# INI e parametrizacoes da instalacao do original, ao lado dos programas
rm -rf "$DIST/build/sistrut-game"
cp -r "$DIST/sistrut-game" "$DIST/build/sistrut-game" || exit 1

if [ "$total" -eq 0 ]; then
    echo "nenhum .BAS encontrado${FILTER:+ para o filtro '$FILTER'}" >&2
    exit 1
fi
[ "$fail" -eq 0 ]
