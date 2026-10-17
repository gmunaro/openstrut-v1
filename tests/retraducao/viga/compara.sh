#!/usr/bin/env bash
# Compara uma saida do oraculo com a da V1 retraduzida (tools/compara_retrad.py). Linhas com
# "Kbytes livres" (FRE) sao ignoradas. Com VIGA_DATAS=1, troca antes data e hora (MM-DD-AAAA e
# HH:MM) por marcas fixas nas telas e na impressora (so para execucoes antigas, sem relogio fixo).
# Uso: compara.sh <runs/CASO do oraculo> <saida da V1> [--ignora REGEX ...]
set -eu
o="$1"; v="$2"; shift 2
aqui="$(cd "$(dirname "$0")" && pwd)"
t="$(mktemp -d)"
trap 'rm -rf "$t"' EXIT
mkdir -p "$t/o" "$t/v"
VIGA_DATAS="${VIGA_DATAS:-0}" python -I - "$o" "$v" "$t" <<'PY'
import os, re, shutil, sys
o, v, t = sys.argv[1:4]
normaliza = os.environ.get("VIGA_DATAS") == "1"
pat = re.compile(rb'\d\d-\d\d-\d{4}(\s+)\d\d:\d\d')
for k, src in (("o", o), ("v", v)):
    os.makedirs(os.path.join(t, k, "telas"), exist_ok=True)
    for f in os.listdir(os.path.join(src, "telas")):
        b = open(os.path.join(src, "telas", f), "rb").read()
        if f.endswith(".txt") and normaliza:
            b = pat.sub(rb'DD-DD-DDDD\1HH:MM', b)
        open(os.path.join(t, k, "telas", f), "wb").write(b)
    p = os.path.join(src, "impressora.prn")
    if os.path.exists(p):
        open(os.path.join(t, k, "impressora.prn"), "wb").write(pat.sub(rb'DD-DD-DDDD\1HH:MM', open(p, "rb").read()))
PY
[ -f "$o/telas.raw" ] && cp "$o/telas.raw" "$t/o/"
python -I "$aqui/../../../tools/compara_retrad.py" "$t/o" "$t/v" --ignora "Kbytes livres" "$@"
