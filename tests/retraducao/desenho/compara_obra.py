#!/usr/bin/env python3
"""Compara, byte a byte, os arquivos gravados pelo original (runs/<caso>/obra) com os gravados
pela V1 (arquivos da pasta C: da V1 que mudaram em relação à cópia inicial).

Uso: python -I compara_obra.py <obra do oráculo> <C: inicial da V1> <C: final da V1>
Ignora SISTRUT/ (configuração) e os arquivos de troca do RT45.
"""
import os
import sys


def arquivos(raiz):
    out = {}
    for d, _, fs in os.walk(raiz):
        for f in fs:
            p = os.path.join(d, f)
            rel = os.path.relpath(p, raiz).replace("\\", "/")
            if rel.upper().startswith("SISTRUT/"):
                continue
            out[rel.upper()] = p
    return out


def main():
    orac, ini, fim = sys.argv[1:4]
    o = arquivos(orac) if os.path.isdir(orac) else {}
    a = arquivos(ini)
    b = arquivos(fim)
    v = {k: p for k, p in b.items()
         if k not in a or open(a[k], "rb").read() != open(p, "rb").read()}
    nomes = sorted(set(o) | set(v))
    if not nomes:
        print("obra: nenhum arquivo gravado nos dois lados")
        return
    for k in nomes:
        if k not in o:
            print(f"obra {k}: so a V1 gravou ({os.path.getsize(v[k])} bytes)")
            continue
        if k not in v:
            print(f"obra {k}: so o original gravou ({os.path.getsize(o[k])} bytes)")
            continue
        x, y = open(o[k], "rb").read(), open(v[k], "rb").read()
        if x == y:
            print(f"obra {k}: IGUAL ({len(x)} bytes)")
            continue
        dif = [i for i in range(min(len(x), len(y))) if x[i] != y[i]]
        pri = dif[0] if dif else min(len(x), len(y))
        print(f"obra {k}: DIFERENTE (original {len(x)} bytes, V1 {len(y)} bytes, "
              f"{len(dif)} bytes diferentes no trecho comum; primeiro em {pri}: "
              f"orig {x[pri:pri + 16]!r} V1 {y[pri:pri + 16]!r})")


if __name__ == "__main__":
    main()
