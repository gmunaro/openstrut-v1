#!/usr/bin/env bash
# Compara uma saida do oraculo com a da V1 retraduzida (tools/compara_retrad.py), depois de trocar
# data e hora (MM-DD-AAAA, HH:MM[:SS]) por marcas fixas na impressora.prn das duas.
# Uso: compara.sh <runs/CASO do oraculo> <saida da V1> [--ignora REGEX ...]
set -eu
o="$1"; v="$2"; shift 2
aqui="$(cd "$(dirname "$0")" && pwd)"
t="$(mktemp -d)"
trap 'rm -rf "$t"' EXIT
mkdir -p "$t/o" "$t/v"
cp -r "$o/telas" "$t/o/"; cp -r "$v/telas" "$t/v/"
[ -f "$o/telas.raw" ] && cp "$o/telas.raw" "$t/o/"
for k in o v; do
  src="$o"; [ $k = v ] && src="$v"
  if [ -f "$src/impressora.prn" ]; then
    python -I -c "
import re,sys
b=open(sys.argv[1],'rb').read()
b=re.sub(rb'\d\d-\d\d-\d{4}', rb'DD-DD-DDDD', b)
b=re.sub(rb'\d\d:\d\d(:\d\d)?', rb'HH:MM', b)
open(sys.argv[2],'wb').write(b)" "$src/impressora.prn" "$t/$k/impressora.prn"
  fi
done
python -I "$aqui/../../../tools/compara_retrad.py" "$t/o" "$t/v" "$@"
