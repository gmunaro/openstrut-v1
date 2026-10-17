#!/usr/bin/env bash
# Roda casos da familia PILAR na V1 retraduzida e compara com a execucao mais recente do oraculo.
# Uso: roda_casos.sh <pasta dos EXE> <pasta de trabalho> [caso ...]
#   caso = nome do sufixo (tests/retraducao/pilar/<caso>.sufixo.txt); sem caso, roda todos.
#   Oraculo: ref_pilaredi -> runs/caso_c_pilaredi-*,
#            outro -> runs/retrad_pil_<caso>-*.
#   Pasta C: de cada caso = <trabalho>/c_<caso>: configuracao da instalacao oficial (SISTRUT/EXEC40,
#   copia de $PIL_C_BASE) + a obra de partida do caso no oraculo (casos/<caso>.dados).
#   A V1 comeca no PILAR com a tela que o gerenciador deixa (tools/troca_semente.py --modulo PILAR).
#   trava: limite de 40 s e os EXE da pasta de binarios que sobrarem sao mortos (laco sem fim do original).
#   Comparacao: compara.sh (tools/compara_retrad.py) e, se o oraculo gravou arquivos, cmp de cada um.
# Variaveis de ambiente (obrigatorias):
#   ORACULO    = pasta do oraculo (casos/ e runs/).
#   PIL_C_BASE = disco C: base da familia PILAR (SISTRUT/EXEC40 da instalacao oficial), preparado a mao.
set -u
ORACULO="${ORACULO:?defina ORACULO=<pasta do oraculo>}"
PIL_C_BASE="${PIL_C_BASE:?defina PIL_C_BASE=<disco C: base da familia PILAR>}"
bin="$1"; trab="$2"; shift 2
aqui="$(cd "$(dirname "$0")" && pwd)"
raiz="$(cd "$aqui/../../.." && pwd)"
casos="$*"
[ -z "$casos" ] && casos=$(cd "$aqui" && ls *.sufixo.txt | sed 's/\.sufixo\.txt$//')
for c in $casos; do
  case "$c" in
    ref_pilaredi) oc=caso_c_pilaredi ;;
    *) oc="retrad_pil_$c" ;;
  esac
  cdir="$trab/c_$c"; rm -rf "$cdir"; mkdir -p "$cdir"
  cp -r "$PIL_C_BASE"/* "$cdir/"
  d="$ORACULO/casos/$oc.dados"; [ -d "$d" ] && cp -r "$d"/* "$cdir/"
  out="$trab/run_$c"
  lim=400; [ "$c" = trava ] && lim=40   # trava: o original e a V1 ficam em laco sem fim (CHECKLIST.md)
  bash "$raiz/tools/roda_retrad.sh" "$bin" PILAR "$aqui/$c.sufixo.txt" "$out" "$cdir" $lim >/dev/null
  if ! tail -1 "$out/log.txt" 2>/dev/null | grep -q ': fim'; then
    # programa ainda rodando: mata so os EXE desta pasta de binarios (PID pelo caminho)
    powershell -NoProfile -Command "Get-Process PILAR,PILAREDI,PILGEEDI,PIPROEDI,PIGRAEDI -ErrorAction SilentlyContinue | Where-Object { \$_.Path -like '$(cygpath -w "$bin")\*' } | Stop-Process -Force"
  fi
  o=$(ls -d "$ORACULO"/runs/$oc-* 2>/dev/null | tail -1)
  echo "##### $c (oraculo: ${o:-nenhum})"
  [ -n "$o" ] || continue
  bash "$aqui/compara.sh" "$o" "$out" > "$trab/compara_$c.txt" 2>&1
  tail -1 "$trab/compara_$c.txt"
  if [ -d "$o/obra" ]; then
    (cd "$o/obra" && find . -type f) | while read -r f; do
      if [ -f "$cdir/$f" ]; then
        if cmp -s "$o/obra/$f" "$cdir/$f"; then echo "arquivo $f: igual"; else echo "arquivo $f: DIFERE"; fi
      else echo "arquivo $f: nao gravado pela V1"; fi
    done
  fi
done
