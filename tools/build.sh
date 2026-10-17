#!/usr/bin/env bash
# Compila src-reconstructed/**/*.BAS (exceto .BI/.BM) com qb64pe.
# Uso: tools/build.sh [filtro]   ex.: tools/build.sh laje/
# O filtro e um padrao de substring sobre o caminho relativo a src-reconstructed/.
# Compila a partir de uma pasta temporaria (sem espacos no caminho) e copia o .exe para build/.
# Exit 0 se tudo compilou; exit 1 se algum falhou ou nao havia fontes.

DIST="$(cd "$(dirname "$0")/.." && pwd)"
# staging proprio por execucao, numa pasta temporaria sem espacos (o qb64pe nao aceita):
# varias execucoes simultaneas nao se apagam
STAGE="${TMPDIR:-/tmp}/sistrut-build-$$"
STAGE_WIN="$(cygpath -m "$STAGE" 2>/dev/null || echo "$STAGE")"
case "$STAGE" in *" "*) echo "pasta temporaria com espaco ($STAGE): defina TMPDIR" >&2; exit 1 ;; esac
trap 'rm -rf "$STAGE"' EXIT
FILTER="${1:-}"

# Staging: recopia as fontes para evitar caminhos com espaco no qb64pe.
mkdir -p "$STAGE" "$STAGE/out" "$DIST/build" || exit 1
rm -rf "$STAGE/src-reconstructed" "$STAGE/tests" "$STAGE/sistrut-game"
cp -r "$DIST/src-reconstructed" "$DIST/tests" "$DIST/sistrut-game" "$STAGE/" || exit 1

LOGDIR="$STAGE/out"
ok=0
fail=0
total=0
rows=""

while IFS= read -r src; do
    rel="${src#"$DIST/src-reconstructed/"}"
    if [ -n "$FILTER" ] && [[ "$rel" != *"$FILTER"* ]]; then
        continue
    fi
    total=$((total + 1))
    mod="$(basename "$rel" | sed 's/\.[bB][aA][sS]$//' | tr '[:lower:]' '[:upper:]')"
    stage_src="$STAGE_WIN/src-reconstructed/$rel"
    stage_exe="$STAGE_WIN/out/$mod.exe"
    log="$LOGDIR/$mod.log"

    rm -f "$STAGE/out/$mod.exe"
    bash "$DIST/tools/qbcompile.sh" "$stage_src" "$stage_exe" > "$log" 2>&1
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
        tail_txt="$(tr '\r' '\n' < "$log" | grep -v '^[[:space:]]*$' | grep -v '\[' | tail -n 12)"
        rows="$rows"$'\n'"$(printf '%s\n' "$tail_txt" | sed 's/^/     | /')"
    fi
done < <(find "$DIST/src-reconstructed" -type f -iname '*.bas' | sort)

printf '%s\n' "$rows"
echo
echo "build: $ok OK, $fail FAIL (de $total)"

# Deixa dist/build pronta para rodar: configuracoes e parametrizacoes originais
# (INI, LAP, PIP, FOP, DSP, PLOTER.INI). Nao sobrescreve as que ja existem,
# para preservar ajustes feitos pelo usuario.
for cfg in "$DIST"/sistrut-game/*.INI "$DIST"/sistrut-game/*.LAP "$DIST"/sistrut-game/*.PIP "$DIST"/sistrut-game/*.FOP "$DIST"/sistrut-game/*.DSP; do
    [ -f "$cfg" ] || continue
    [ -f "$DIST/build/$(basename "$cfg")" ] || cp "$cfg" "$DIST/build/"
done

if [ "$total" -eq 0 ]; then
    echo "nenhum .BAS encontrado${FILTER:+ para o filtro '$FILTER'}" >&2
    exit 1
fi
[ "$fail" -eq 0 ]
