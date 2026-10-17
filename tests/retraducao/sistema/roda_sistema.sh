#!/usr/bin/env bash
# Roda os casos retrad_sis_* da familia sistema na V1 retraduzida e compara com a ultima
# execucao de cada caso no oraculo ($ORACULO/runs/retrad_sis_<caso>-*). Os dois lados
# com DATE$/TIME$ congelados em 10-14-2026 12:00:00 (ORACULO_DATA / SISTRUT_DATA, padrao dos dois).
#
# Uso: bash tests/retraducao/sistema/roda_sistema.sh <bin V1> <bin sonda> <pasta C: base> <saida>
#   <bin V1>     SISTRUT.exe, SISEDIT.exe e LAJE.exe compilados de src-original
#   <bin sonda>  SISTRUT.exe e a sonda SONDA_CHAIN.BAS compilada com o nome de cada modulo
#                (PORTICO, LAJE, VIGA, PILAR, ARMADURA, FORMA, DESENHO, VPLOTA, SISEDIT .exe)
#   <pasta C: base>  SISTRUT\SISTRUT.INI e SISTRUT\EXEC40\ (INI, DSP, LAP, PIP) da instalacao
#                oficial (runs/instalacao_oficial-*/c.tar.gz do oraculo); cada caso usa uma copia
#   <saida>      uma pasta por caso (telas/, log.txt) e compara_<caso>.txt; resumo.txt
#   ORACULO      pasta do oraculo (casos/ e runs/), variavel de ambiente obrigatoria
set -u
ORACULO="${ORACULO:?defina ORACULO=<pasta do oraculo>}"
bin="$1"; sonda="$2"; cbase="$3"; out="$4"
here="$(cd "$(dirname "$0")" && pwd)"
raiz="$(cd "$here/../../.." && pwd)"
casos="$ORACULO/casos"
runs="$ORACULO/runs"
mkdir -p "$out"
: > "$out/resumo.txt"

ultima() { ls -d "$runs/retrad_sis_$1-"* 2>/dev/null | tail -1; }

roda() {  # roda <caso> <bin> <roteiro>  (roda_retrad.sh espera o "<EXE>: fim" no log)
    local c="$1" b="$2" rot="$3"
    rm -rf "$out/c_$c"; cp -r "$cbase" "$out/c_$c"
    bash "$raiz/tools/roda_retrad.sh" "$b" SISTRUT "$rot" "$out/$c" "$out/c_$c" 120 >/dev/null
}

# arquivo gravado pelo programa: byte a byte, inclusive a data e a hora
arquivo() {  # arquivo <rotulo> <oraculo> <v1>
    python -I - "$1" "$2" "$3" >> "$out/resumo.txt" <<'PY'
import sys
rot, po, pv = sys.argv[1:]
try:
    bo, bv = open(po, "rb").read(), open(pv, "rb").read()
except OSError as e:
    print(f"{rot}: FALTA ({e})"); sys.exit()
if bo == bv:
    print(f"{rot}: igual byte a byte ({len(bo)} bytes)")
else:
    lo, lv = bo.split(b"\r\n"), bv.split(b"\r\n")
    d = [(i + 1, x, y) for i, (x, y) in enumerate(zip(lo, lv)) if x != y]
    print(f"{rot}: DIFERE ({len(bo)} x {len(bv)} bytes): " + "; ".join(f"linha {i}: {x!r} x {y!r}" for i, x, y in d))
PY
}

for c in menu inexist exec32 config laje editor onkey onkey_editor onkey_editor2 chain_portico; do
    b="$bin"; [ "$c" = chain_portico ] && b="$sonda"
    roda "$c" "$b" "$casos/retrad_sis_$c.txt"
    o="$(ultima "$c")"
    python -I "$raiz/tools/compara_retrad.py" "$o" "$out/$c" > "$out/compara_$c.txt"
    echo "$c ($(basename "$o")): $(tail -1 "$out/compara_$c.txt")" >> "$out/resumo.txt"
done

arquivo "config SISTRUT.INI" "$(ultima config)/obra/SISTRUT/SISTRUT.INI" "$out/c_config/SISTRUT/SISTRUT.INI"
arquivo "onkey_editor TESTE.INI" "$(ultima onkey_editor)/obra/SISTRUT/EXEC40/TESTE.INI" "$out/c_onkey_editor/SISTRUT/EXEC40/TESTE.INI"

# o que cada modulo recebe no CHAIN (so V1, com a sonda no lugar do modulo)
for par in "LAJE:L{ENTER}" "VIGA:V{ENTER}" "PILAR:i{ENTER}" "ARMADURA:A{ENTER}" "FORMA:F{ENTER}" \
           "DESENHO:V{RIGHT}{ENTER}" "VPLOTA:V{RIGHT}{RIGHT}{ENTER}" "SISEDIT:E{ENTER}"; do
    m="${par%%:*}"; teclas="${par#*:}"
    printf '%s\n' "# sonda: CHAIN para $m" "$teclas" > "$out/sonda_$m.txt"
    roda "sonda_$m" "$sonda" "$out/sonda_$m.txt"
    k="$(echo "$m" | tr 'A-Z' 'a-z')"
    inf="$out/sonda_$m/chain_$k.info.txt"
    if [ -f "$inf" ]; then
        l4="$(sed -n 4p "$out/sonda_$m/telas/"*"_chain_$k.txt" | tr -d '\r' | sed 's/ *$//')"
        l5="$(sed -n 5p "$out/sonda_$m/telas/"*"_chain_$k.txt" | tr -d '\r' | sed 's/ *$//')"
        echo "sonda $m: '$l4' / '$l5' / $(sed -n 3p "$inf" | tr -d '\r')" >> "$out/resumo.txt"
    else
        echo "sonda $m: a sonda nao recebeu o CHAIN" >> "$out/resumo.txt"
    fi
done
cat "$out/resumo.txt"
