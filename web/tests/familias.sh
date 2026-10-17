#!/usr/bin/env bash
# familias.sh - roda os roteiros de cada familia (tests/retraducao/<familia>/roda_casos.sh, sem
# mudanca) no nativo e na web e compara: o resumo contra o oraculo dos dois lados e, byte a byte,
# a saida nativa contra a web (telas, impressora.prn e o drive C: final de cada caso).
# Uso: web/tests/familias.sh <pasta dos EXE nativos> <pasta do site web> <trabalho> [familia ...]
#   familias: armacao desenho forma laje pilar viga sistema extras (padrao: todas)
#   SO_WEB=1: nao roda o nativo (usa <trabalho>/nat de uma rodada anterior); SO_NAT=1: so o nativo
#   V1_WEB_EXECUTOR=node: web no Node em vez do Chrome headless
#   ORACULO, SIS_C_BASE e LAJE_C_E2E: as mesmas variaveis dos roda_casos.sh (cada familia pede as suas)
set -u
natbin="$(cd "$1" && pwd)"; dist="$(cd "$2" && pwd)"; trab="$3"; shift 3
aqui="$(cd "$(dirname "$0")" && pwd)"; raiz="$(cd "$aqui/../.." && pwd)"
fams="${*:-armacao desenho forma laje pilar viga sistema extras}"
mkdir -p "$trab/nat" "$trab/web"
trab="$(cd "$trab" && pwd)"

# sistema: a sonda (SONDA_CHAIN.BAS com o nome de cada modulo) fica em pastas proprias
prepara_sistema() {  # <lado: nat|web>
    local lado="$1"; local b="$trab/$lado/sis-bin" s="$trab/$lado/sis-bin-sonda"
    rm -rf "$b" "$s"; mkdir -p "$b" "$s"
    if [ "$lado" = nat ]; then
        cp "$natbin"/SISTRUT.exe "$natbin"/SISEDIT.exe "$natbin"/LAJE.exe "$b/"
        cp "$natbin"/SISTRUT.exe "$s/"
        for m in PORTICO LAJE VIGA PILAR ARMADURA FORMA DESENHO VPLOTA SISEDIT; do cp "$natbin/SONDA_CHAIN.exe" "$s/$m.exe"; done
    else
        echo "$dist" > "$b/v1web.dist"
        echo "${V1_WEB_SONDA:-$dist/../dist_sonda}" > "$s/v1web.dist"
    fi
}

roda_familia() {  # <familia> <lado>
    local f="$1" lado="$2"; local o="$trab/$lado/$f"
    rm -rf "$o"; mkdir -p "$o"
    local env=""; [ "$lado" = web ] && env="V1_WEB=$dist"
    case "$f" in
        sistema)
            prepara_sistema "$lado"
            env $env bash "$raiz/tests/retraducao/sistema/roda_sistema.sh" "$trab/$lado/sis-bin" "$trab/$lado/sis-bin-sonda" "${SIS_C_BASE:?defina SIS_C_BASE}" "$o" > "$o/resumo.out" 2>&1 ;;
        extras)
            # roteiros soltos de tests/retraducao (piloto LAJEPROC, ON KEY, RUN, EXEC32)
            : "${LAJE_C_E2E:?defina LAJE_C_E2E}" "${SIS_C_BASE:?defina SIS_C_BASE}" "${ORACULO:?defina ORACULO}"
            for c in piloto:LAJE:lajeproc_e2e.sufixo.txt:laje onkey:LAJE:onkey_lajeproc.txt:laje \
                     run_sisedit:SISTRUT:run_sisedit.txt:sis exec32:SISTRUT:exec32_laje.txt:sis; do
                IFS=: read -r nome exe rot base <<< "$c"
                if [ "$base" = laje ]; then base="$LAJE_C_E2E"; else base="$SIS_C_BASE"; fi
                rm -rf "$o/c_$nome"; cp -r "$base" "$o/c_$nome"
                env $env bash "$raiz/tools/roda_retrad.sh" "$natbin" "$exe" "$raiz/tests/retraducao/$rot" "$o/run_$nome" "$o/c_$nome" 300 >/dev/null 2>&1
                echo "##### $nome"
                [ "$nome" = piloto ] && python -I "$raiz/tools/compara_retrad.py" "$(ls -d "$ORACULO"/runs/retrad_lajeproc-* | tail -1)" "$o/run_$nome" | tail -1
            done > "$o/resumo.out" 2>&1 ;;
        *)
            env $env bash "$raiz/tests/retraducao/$f/roda_casos.sh" "$natbin" "$o" > "$o/resumo.out" 2>&1 ;;
    esac
}

for f in $fams; do
    t0=$(date +%s)
    [ -z "${SO_WEB:-}" ] && roda_familia "$f" nat
    t1=$(date +%s)
    [ -n "${SO_NAT:-}" ] && { echo "=================== $f (nativo $((t1 - t0)) s; web nao rodada)"; continue; }
    roda_familia "$f" web
    t2=$(date +%s)
    echo "=================== $f (nativo $((t1 - t0)) s, web $((t2 - t1)) s)"
    # resumo contra o oraculo, por caso, dos dois lados
    for r in resumo.out resumo.txt; do
        [ -f "$trab/nat/$f/$r" ] && python -I "$aqui/compara_resumos.py" "$trab/nat/$f/$r" "$trab/web/$f/$r"
    done
    # nativo x web, byte a byte: telas, impressora e os arquivos do drive C: final
    python -I "$aqui/compara_lados.py" "$trab/nat/$f" "$trab/web/$f"
done
