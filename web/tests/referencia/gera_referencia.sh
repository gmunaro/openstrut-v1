#!/usr/bin/env bash
# gera_referencia.sh - grava a saida do NATIVO dos casos de casos.json (telas em texto e atributo,
# impressora.prn e os arquivos que o programa criou ou mudou no drive C:), que o CI compara com a
# web (web/tests/referencia.cjs).
# Uso: web/tests/referencia/gera_referencia.sh <pasta dos EXE nativos> [caso ...]
set -euo pipefail
bin="$1"; shift
aqui="$(cd "$(dirname "$0")" && pwd)"; raiz="$(cd "$aqui/../../.." && pwd)"
# caminho para o Python: no Windows (Git Bash) o Python nao abre /c/...
nat() { cygpath -w "$1" 2>/dev/null || echo "$1"; }
if command -v python >/dev/null 2>&1; then PY=python; else PY=python3; fi
casos="${*:-$($PY -I -c "import json, sys; print(' '.join(c['nome'] for c in json.load(open(sys.argv[1]))))" "$(nat "$aqui/casos.json")")}"
[ -n "$casos" ] || { echo "gera_referencia: nenhum caso em casos.json" >&2; exit 1; }
t="$(mktemp -d)"; trap 'rm -rf "$t"' EXIT
feitos=0
for c in $casos; do
  IFS=$'\t' read -r exe rot < <($PY -I "$(nat "$aqui/monta_c.py")" "$c" "$(nat "$t/c_$c")")
  rot="${rot%$'\r'}"   # o print do Python no Windows termina em CR LF
  [ -n "$exe" ] || { echo "gera_referencia: caso $c nao montado" >&2; exit 1; }
  bash "$raiz/tools/roda_retrad.sh" "$bin" "$exe" "$rot" "$t/run_$c" "$t/c_$c" 300 >/dev/null || true
  ls "$t/run_$c"/telas/*.txt >/dev/null 2>&1 || { echo "gera_referencia: $c nao gravou telas (log: $(tail -1 "$t/run_$c/log.txt" 2>/dev/null))" >&2; exit 1; }
  d="$aqui/$c"; rm -rf "$d"; mkdir -p "$d/telas" "$d/c"
  cp "$t/run_$c"/telas/*.txt "$d/telas/"
  rm -f "$d"/telas/*.realce.txt
  [ -f "$t/run_$c/impressora.prn" ] && cp "$t/run_$c/impressora.prn" "$d/"
  # do drive C: final, so o que o programa criou ou mudou (as entradas podem mudar sem mexer no caso)
  $PY -I "$(nat "$aqui/monta_c.py")" "$c" "$(nat "$t/ini_$c")" >/dev/null
  (cd "$t/c_$c" && find . -type f) | while read -r f; do
    cmp -s "$t/c_$c/$f" "$t/ini_$c/$f" 2>/dev/null && continue
    mkdir -p "$d/c/$(dirname "$f")"; cp "$t/c_$c/$f" "$d/c/$f"
  done
  feitos=$((feitos + 1))
  echo "$c: $(ls "$d/telas" | wc -l) arquivos de tela, impressora $(stat -c %s "$d/impressora.prn" 2>/dev/null || echo 0) bytes, $( (cd "$d/c" && find . -type f) | wc -l) arquivos no C:"
done
[ "$feitos" -gt 0 ] || { echo "gera_referencia: nenhum caso rodou" >&2; exit 1; }
