#!/usr/bin/env bash
# Compila tests/T_*.BAS, roda cada um com o jogo de dados e resume PASS/FAIL.
# Uso: tools/runtests.sh [filtro]   ex.: tools/runtests.sh ASSERT
# Um teste passa se compilar, sair com 0 em ate 60 s e imprimir "RESULT n checks, 0 failures".
# Exit 0 se todos passaram; exit 1 se algum falhou, nao compilou ou nao havia testes.

DIST="$(cd "$(dirname "$0")/.." && pwd)"
# staging proprio por execucao, numa pasta temporaria sem espacos (o qb64pe nao aceita):
# varias execucoes simultaneas nao se apagam
STAGE="${TMPDIR:-/tmp}/sistrut-build-$$"
STAGE_WIN="$(cygpath -m "$STAGE" 2>/dev/null || echo "$STAGE")"
case "$STAGE" in *" "*) echo "pasta temporaria com espaco ($STAGE): defina TMPDIR" >&2; exit 1 ;; esac
trap 'rm -rf "$STAGE"' EXIT
DATA_WIN="$STAGE_WIN/sistrut-game"
FILTER="${1:-}"

mkdir -p "$STAGE" "$STAGE/out" || exit 1
rm -rf "$STAGE/src-reconstructed" "$STAGE/tests" "$STAGE/sistrut-game"
cp -r "$DIST/src-reconstructed" "$DIST/tests" "$DIST/sistrut-game" "$STAGE/" || exit 1

pass=0
fail=0
total=0
rows=""

while IFS= read -r src; do
    name="$(basename "$src" | sed 's/\.[bB][aA][sS]$//' | tr '[:lower:]' '[:upper:]')"
    if [ -n "$FILTER" ] && [[ "$name" != *"$(echo "$FILTER" | tr '[:lower:]' '[:upper:]')"* ]]; then
        continue
    fi
    total=$((total + 1))
    exe="$STAGE/out/$name.exe"
    exe_win="$STAGE_WIN/out/$name.exe"
    clog="$STAGE/out/$name.compile.log"
    rlog="$STAGE/out/$name.run.log"

    rm -f "$exe"
    bash "$DIST/tools/qbcompile.sh" "$STAGE_WIN/tests/$(basename "$src")" "$exe_win" > "$clog" 2>&1
    crc=$?
    if [ "$crc" -ne 0 ] || [ ! -f "$exe" ]; then
        fail=$((fail + 1))
        rows="$rows"$'\n'"FAIL $name (nao compilou)"
        rows="$rows"$'\n'"$(tr '\r' '\n' < "$clog" | grep -v '^[[:space:]]*$' | grep -v '\[' | tail -n 8 | sed 's/^/     | /')"
        continue
    fi

    timeout 60 "$exe" "$DATA_WIN" < /dev/null > "$rlog" 2>&1
    rrc=$?
    result="$(tr -d '\r' < "$rlog" | grep -E 'RESULT +[0-9]+ checks, +[0-9]+ failures' | tail -n 1)"
    if [ "$rrc" -eq 124 ]; then
        fail=$((fail + 1))
        rows="$rows"$'\n'"FAIL $name (timeout 60 s)"
    elif [ "$rrc" -eq 0 ] && echo "$result" | grep -qE 'checks, +0 failures'; then
        pass=$((pass + 1))
        rows="$rows"$'\n'"PASS $name  ${result# }"
    else
        fail=$((fail + 1))
        rows="$rows"$'\n'"FAIL $name (rc=$rrc)${result:+  ${result# }}"
        rows="$rows"$'\n'"$(tr -d '\r' < "$rlog" | grep -v '^[[:space:]]*$' | tail -n 10 | sed 's/^/     | /')"
    fi
done < <(find "$DIST/tests" -maxdepth 1 -type f -iname 'T_*.bas' | sort)

printf '%s\n' "$rows"
echo
echo "testes: $pass PASS, $fail FAIL (de $total)"

if [ "$total" -eq 0 ]; then
    echo "nenhum tests/T_*.BAS${FILTER:+ para o filtro '$FILTER'}" >&2
    exit 1
fi
[ "$fail" -eq 0 ]
