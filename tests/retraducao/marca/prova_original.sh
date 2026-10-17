#!/usr/bin/env bash
# Prova de que a camada de marca so troca os textos de src-original/marca.json: gera os 28 .BAS com
# tools/retraduz.py --marca original e compara byte a byte com os .BAS de um commit anterior a marca
# (padrao 17ed9d4, o ultimo conferido no oraculo com o texto do SISTRUT 4.0).
# 17ed9d4 e do historico de desenvolvimento, que nao esta no repositorio publico. Depois dele as
# linhas PROTECAO passaram a sair sem o texto do comando removido, entao a prova so vale fora delas.
# Uso: bash tests/retraducao/marca/prova_original.sh <pasta de trabalho> [commit]
set -u
trab="$1"; ref="${2:-17ed9d4}"
raiz="$(cd "$(dirname "$0")/../../.." && pwd)"
rm -rf "$trab"; mkdir -p "$trab/ref"
git -C "$raiz" archive "$ref" src-original | tar -x -C "$trab/ref"
bash "$raiz/tools/regenera.sh" "$trab/gerado" --marca original > "$trab/regenera.txt"
iguais=0; difs=0
for f in "$trab/ref/src-original"/*/*.BAS; do
    r="${f#$trab/ref/src-original/}"
    if cmp -s "$f" "$trab/gerado/$r"; then iguais=$((iguais + 1)); else difs=$((difs + 1)); echo "DIFERE $r"; fi
done
echo "--marca original x $ref: $iguais .BAS iguais byte a byte, $difs diferentes"
# E o contrario: cada linha que difere entre o .BAS do commit e o de src-original (OpenStrut) tem
# que ser a mesma linha com strings literais trocadas pela tabela, fora o cabecalho.
python -I - "$trab/ref/src-original" "$raiz/src-original" "$ref" <<'PY' || difs=$((difs + 1))
import difflib, glob, os, re, sys
ref, novo, commit = sys.argv[1:]
sys.path.insert(0, os.path.join(novo, "..", "tools"))
import marca   # tools/marca.py: o texto do original pode estar so como sha256
tab = {t["sha256"]: t["openstrut"] for t in marca.trocas(os.path.join(novo, "marca.json"), originais={})}
ruins = linhas = 0
for f in sorted(glob.glob(os.path.join(ref, "*", "*.BAS"))):
    r = os.path.relpath(f, ref)
    a = open(f, encoding="cp437").read().splitlines()
    b = open(os.path.join(novo, r), encoding="cp437").read().splitlines()
    for op, i1, i2, j1, j2 in difflib.SequenceMatcher(None, a, b, autojunk=False).get_opcodes():
        if op == "equal":
            continue
        if i1 == 1 and j1 == 1:   # cabecalho: 1 linha do original vira 2 do OpenStrut
            if i2 - i1 == 1 and j2 - j1 == 2 and "OpenStrut V1" in b[j1]:
                continue
        if op == "replace" and i2 - i1 == j2 - j1:
            for x, y in zip(a[i1:i2], b[j1:j2]):
                linhas += 1
                if re.sub(r'"([^"]*)"', lambda m: '"' + tab.get(marca.sha(m.group(1)), m.group(1)) + '"', x) != y:
                    ruins += 1; print("FORA DA TABELA", r, repr(x), repr(y))
            continue
        ruins += 1; print("FORA DA TABELA", r, op, a[i1:i2], b[j1:j2])
print(f"src-original x {commit}: {linhas} linhas trocadas, todas pela tabela" if not ruins
      else f"{ruins} diferencas fora da tabela")
sys.exit(1 if ruins else 0)
PY
[ "$difs" -eq 0 ]
