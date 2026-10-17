#!/usr/bin/env bash
# Regenera os 28 .BAS da V1 (tools/retraduz.py), uma familia por processo, em paralelo.
# Uso: bash tools/regenera.sh <saida> [argumentos do retraduz.py, ex.: --marca original]
#   <saida> = src-original regenera os fontes do repositorio. Outra pasta: recebe antes uma copia
#   de src-original (COMMON, nomes.json, correcoes.json, comum/), e os .BAS saem nela.
# O dump do original (fora do repositorio) vem de --dump <pasta> ou da variavel REA_WORK
# (dump em $REA_WORK/dump).
set -u
raiz="$(cd "$(dirname "$0")/.." && pwd)"
saida="$1"; shift
if [ "$(cd "$saida" 2>/dev/null && pwd)" != "$raiz/src-original" ]; then
    rm -rf "$saida"; cp -r "$raiz/src-original" "$saida"
fi
gen() { python -I "$raiz/tools/retraduz.py" "$1" --familia "$2" --saida "$saida" "${@:3}" | sed 's/; conflitos de tipo.*//'; }
familia() {
    case "$1" in
    sistema) for e in SISTRUT SISEDIT; do gen $e sistema "${@:2}"; done ;;
    laje)    for e in LAJE LAJEGEOM LAJECALC LAJEMONT LAJEGRAV LAJEPROC; do gen $e laje "${@:2}"; done ;;
    viga)    gen VIGA viga --common "$saida/viga/COMUM_VIGA.json" --comum-nome VIGA "${@:2}"
             gen VPLOTA viga --common "$saida/viga/COMUM_VPLOTA.json" --comum-nome VPLOTA "${@:2}" ;;
    armacao) gen ARMADURA armacao "${@:2}" ;;
    pilar)   gen PILAR pilar --common "$saida/pilar/COMUM_PILAR.json" --comum-nome PILAR "${@:2}"
             for e in PILAREDI PILGEEDI PIPROEDI PIGRAEDI; do
                 gen $e pilar --common "$saida/pilar/COMUM_PILAREDI.json" --comum-nome PILAREDI "${@:2}"
             done ;;
    forma)   for e in FORMA FORMEDCA FORMIMP FORMINIT FORMPLOT; do gen $e forma "${@:2}"; done ;;
    desenho) for e in DESENHO DESDIM DESEDCAO DESEDITA DESGRAF DESIMP DESINIT; do gen $e desenho "${@:2}"; done ;;
    esac
}
tmp="$(mktemp -d)"
for f in sistema laje viga armacao pilar forma desenho; do
    familia $f "$@" > "$tmp/$f.txt" 2>&1 &
done
wait
cat "$tmp"/{sistema,laje,viga,armacao,pilar,forma,desenho}.txt
rm -rf "$tmp"
