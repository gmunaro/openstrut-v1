#!/usr/bin/env bash
# Sondagem do original (oraculo) para a familia FORMA, segura para uso concorrente:
# cada chamada usa o caso casos/retrad_frm_sonda_<tag>.txt (e .dados) proprio.
# Uso: sonda_frm.sh <tag> '<teclas no formato do roteiro>' [n telas, padrao 3] [limite s] [pasta da obra]
#   A obra de partida (opcional) vai para C:\ (copia para casos/retrad_frm_sonda_<tag>.dados).
#   Mostra as ultimas n telas e o log; REALCE=1 mostra tambem o realce.
#   ORACULO = pasta do oraculo (com rodar.sh, casos/ e runs/), obrigatoria.
set -u
ORACULO="${ORACULO:?defina ORACULO=<pasta do oraculo>}"
tag="$1"; teclas="$2"; n="${3:-3}"; lim="${4:-300}"; obra="${5:-}"
cd "$ORACULO"
caso="casos/retrad_frm_sonda_$tag.txt"
{
  echo '# exe: PATH C:\SISTRUT;Z:\|CD \|SISTRUT\SISTRUT'
  echo "# Sondagem da familia FORMA (tests/retraducao/forma/sonda_frm.sh)."
  echo "{ESPERA Configuracao|60}$teclas"
} > "$caso"
rm -rf "casos/retrad_frm_sonda_$tag.dados"
if [ -n "$obra" ]; then mkdir -p "casos/retrad_frm_sonda_$tag.dados"; cp -r "$obra"/* "casos/retrad_frm_sonda_$tag.dados/"; fi
saida=$(ORACULO_BASE=/orig/instalado bash rodar.sh "$caso" "" "$lim" 2>&1)
echo "$saida" | grep -E "fim:|ERRO|pasta|arquivos|docker:"
d=$(echo "$saida" | sed -n 's/^pasta: //p' | tail -1)
d=$(cygpath -u "$d" 2>/dev/null || echo "$d")
[ -f "$d/log.txt" ] || { echo "sonda: execucao falhou (sem log.txt)"; exit 1; }
grep -E "arquivos|ESPERA|abort|ABORT" "$d/log.txt" | head -5
for f in $(ls $d/telas/*.txt 2>/dev/null | grep -v realce | tail -n "$n"); do
  echo "== $(basename $f)"; grep -v '^ *$' "$f"
  [ -n "${REALCE:-}" ] && { echo "-- realce"; grep -v '^ *$' "${f%.txt}.realce.txt"; }
done
