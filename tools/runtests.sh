#!/usr/bin/env bash
# Compila e roda os testes que nao dependem do original e resume PASS/FAIL:
#   tests/T_*.BAS    testes de unidade da versao anterior (src-reconstructed), rodados com
#                    o jogo de dados; passa se sair com 0 em ate 60 s e imprimir
#                    "RESULT n checks, 0 failures".
#   SONDA_T20        tests/retraducao/QB64_T20.BAS: potencias e raizes do RT45 da V1
#                    (src-original/comum) contra os bits gravados no original
#                    (QB45_T20.saida.bin); passa se a saida for igual a versionada em
#                    tests/retraducao/QB64_T20.saida.txt.
#   SEM_DISQUETE     casos de DESENHO e FORMA por tools/roda_retrad.sh num C: montado so com o
#                    repositorio; passa se as cadeias terminam sem apontar para A:/B: nem avisar copia.
# Uso: tools/runtests.sh [filtro]   ex.: tools/runtests.sh ASSERT, tools/runtests.sh SONDA
# Exit 0 se todos passaram; exit 1 se algum falhou, nao compilou ou nao havia testes.

DIST="$(cd "$(dirname "$0")/.." && pwd)"
# staging proprio por execucao, numa pasta temporaria sem espacos (o qb64pe nao aceita):
# varias execucoes simultaneas nao se apagam
STAGE="${TMPDIR:-/tmp}"
STAGE="${STAGE%/}/sistrut-build-$$"
STAGE_WIN="$(cygpath -m "$STAGE" 2>/dev/null || echo "$STAGE")"
case "$STAGE" in *" "*) echo "pasta temporaria com espaco ($STAGE): defina TMPDIR" >&2; exit 1 ;; esac
trap 'rm -rf "$STAGE"' EXIT
DATA_WIN="$STAGE_WIN/sistrut-game"
FILTER="${1:-}"

mkdir -p "$STAGE" "$STAGE/out" || exit 1
cp -r "$DIST/src-reconstructed" "$DIST/src-original" "$DIST/tests" "$DIST/sistrut-game" "$STAGE/" || exit 1

# timeout do GNU; no macOS (sem coreutils) o alarme do perl, com o mesmo codigo 124
limite() {
    local s="$1"; shift
    if command -v timeout > /dev/null; then timeout "$s" "$@"; return; fi
    if command -v gtimeout > /dev/null; then gtimeout "$s" "$@"; return; fi
    perl -e 'alarm shift; exec @ARGV' "$s" "$@"
    local rc=$?
    [ "$rc" -eq 142 ] && return 124
    return "$rc"
}

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
        rows="$rows"$'\n'"$(tr '\r' '\n' < "$clog" | grep -v '^[[:space:]]*$' | tr -d '\033' | sed -e 's/\[[0-9;]*[mA]//g' | grep -v '^\[[. ]*\]' | tail -n 8 | sed 's/^/     | /')"
        continue
    fi

    limite 60 "$exe" "$DATA_WIN" < /dev/null > "$rlog" 2>&1
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

# Sonda T20: o programa le QB45_T20.saida.bin e grava QB64_T20.saida.txt na pasta do EXE
if [ -z "$FILTER" ] || [[ SONDA_T20 == *"$(echo "$FILTER" | tr '[:lower:]' '[:upper:]')"* ]]; then
    total=$((total + 1))
    sd="$STAGE/sonda"
    mkdir -p "$sd"
    cp "$DIST/tests/retraducao/QB45_T20.saida.bin" "$sd/"
    if ! bash "$DIST/tools/qbcompile.sh" "$STAGE_WIN/tests/retraducao/QB64_T20.BAS" "$STAGE_WIN/sonda/QB64_T20.exe" > "$sd/compile.log" 2>&1 ||
        [ ! -f "$sd/QB64_T20.exe" ]; then
        fail=$((fail + 1))
        rows="$rows"$'\n'"FAIL SONDA_T20 (nao compilou)"
        rows="$rows"$'\n'"$(tr '\r' '\n' < "$sd/compile.log" | grep -v '^[[:space:]]*$' | tr -d '\033' | sed -e 's/\[[0-9;]*[mA]//g' | grep -v '^\[[. ]*\]' | tail -n 8 | sed 's/^/     | /')"
    else
        (cd "$sd" && limite 60 ./QB64_T20.exe < /dev/null > run.log 2>&1)
        rrc=$?
        if [ "$rrc" -eq 0 ] && diff <(tr -d '\r' < "$DIST/tests/retraducao/QB64_T20.saida.txt") \
            <(tr -d '\r' < "$sd/QB64_T20.saida.txt" 2> /dev/null) > "$sd/diff.txt"; then
            pass=$((pass + 1))
            rows="$rows"$'\n'"PASS SONDA_T20  $(grep -m1 '^potencias' "$sd/QB64_T20.saida.txt" | tr -d '\r')"
        else
            fail=$((fail + 1))
            rows="$rows"$'\n'"FAIL SONDA_T20 (rc=$rrc; saida diferente de tests/retraducao/QB64_T20.saida.txt)"
            rows="$rows"$'\n'"$(head -n 20 "$sd/diff.txt" | sed 's/^/     | /')"
        fi
    fi
fi

# SEM_DISQUETE: a V1 roda de um disco rigido, sem o disquete do original. Compila as familias
# sistema, desenho e forma e roda dois casos da retraducao com tools/roda_retrad.sh (o mesmo
# executor dos casos do oraculo), com um C: montado so com o repositorio: SISTRUT\SISTRUT.INI e
# SISTRUT\EXEC40 de sistrut-game/ e, no caso da forma, a obra de tests/retraducao/forma/obra2.
# Passa se cada cadeia termina ("<EXE>: fim" no log) com telas gravadas e nenhuma tela aponta
# para os drives A: ou B: nem traz "COPIA ILEGAL" ou "Acesso nao permitido". O pedido
# "Coloque o Disco de Dados no Drive C:\" e a tela normal do original para o nome da obra.
if [ -z "$FILTER" ] || [[ SEM_DISQUETE == *"$(echo "$FILTER" | tr '[:lower:]' '[:upper:]')"* ]]; then
    total=$((total + 1))
    sq="$STAGE/sem_disquete"
    sq_win="$STAGE_WIN/sem_disquete"
    mkdir -p "$sq/build" || exit 1
    sd_fail=""
    sd_rows=""
    sd_info=""
    for fam in sistema desenho forma; do
        for bas in "$STAGE/src-original/$fam"/*.BAS; do
            m="$(basename "$bas" .BAS)"
            bash "$DIST/tools/qbcompile.sh" "$STAGE_WIN/src-original/$fam/$m.BAS" "$sq_win/build/$m.exe" \
                > "$sq/$m.compile.log" 2>&1
            [ -f "$sq/build/$m.exe" ] || { sd_fail="$sd_fail $m"; sd_rows="$sd_rows"$'\n'"     | $m nao compilou"; }
        done
    done
    if [ -z "$sd_fail" ]; then
        for caso in "DESENHO:desenho/menu:" "FORMA:forma/edita:forma/obra2"; do
            exe="${caso%%:*}"; resto="${caso#*:}"; suf="${resto%%:*}"; obra="${resto#*:}"
            c="$sq/c_$exe"; saida="$sq/saida_$exe"
            rm -rf "$c"; mkdir -p "$c/SISTRUT/EXEC40" || exit 1
            cp "$DIST/sistrut-game/SISTRUT.INI" "$c/SISTRUT/" || exit 1
            cp "$DIST/sistrut-game"/* "$c/SISTRUT/EXEC40/" || exit 1
            [ -n "$obra" ] && { cp "$DIST/tests/retraducao/$obra"/* "$c/" || exit 1; }
            bash "$DIST/tools/roda_retrad.sh" "$sq/build" "$exe" "$DIST/tests/retraducao/$suf.sufixo.txt" \
                "$saida" "$c" 150 > "$sq/$exe.roda.log" 2>&1
            rc=$?
            telas="$(ls "$saida"/telas/*.txt 2>/dev/null | grep -v -c -E '\.(atr|realce)\.txt$')"
            fim="$(tail -1 "$saida/log.txt" 2>/dev/null | tr -d '\r' | grep -c ': fim$')"
            achados="$(LC_ALL=C grep -l -i -E 'COPIA ILEGAL|Acesso n.{1,2}o permitido|Drive [AB]:|em [AB]:' "$saida"/telas/*.txt | xargs -r -n1 basename | tr '\n' ' ')"
            sd_info="$sd_info; $exe $telas telas"
            if [ "$rc" -ne 0 ] || [ "$telas" -eq 0 ] || [ "$fim" -eq 0 ] || [ -n "$achados" ]; then
                sd_fail="$sd_fail $exe"
                sd_rows="$sd_rows"$'\n'"     | $exe: saida $rc, $telas telas, fim no log: $fim, telas com A:/B: ou copia: ${achados:-nenhuma}"
            fi
        done
    fi
    if [ -z "$sd_fail" ]; then
        pass=$((pass + 1))
        rows="$rows"$'\n'"PASS SEM_DISQUETE  ${sd_info#; }, sem A:/B: nem aviso de copia"
    else
        fail=$((fail + 1))
        rows="$rows"$'\n'"FAIL SEM_DISQUETE (${sd_fail# })"
        rows="$rows$sd_rows"
    fi
fi

printf '%s\n' "$rows"
echo
echo "testes: $pass PASS, $fail FAIL (de $total)"

if [ "$total" -eq 0 ]; then
    echo "nenhum teste${FILTER:+ para o filtro '$FILTER'}" >&2
    exit 1
fi
[ "$fail" -eq 0 ]
