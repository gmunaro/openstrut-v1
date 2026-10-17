#!/usr/bin/env python3
"""monta_c.py - monta o drive C: de um caso de web/tests/referencia/casos.json.

Uso: monta_c.py <nome do caso> <pasta de destino>      (imprime: EXE e roteiro, separados por tab)
Cada item de "c" e [origem relativa a raiz do repositorio, destino relativo a C:]; pasta de origem
copia o conteudo, arquivo copia o arquivo.
"""
import json
import os
import shutil
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
RAIZ = os.path.dirname(os.path.dirname(os.path.dirname(AQUI)))


def main(nome, dest):
    caso = next(c for c in json.load(open(os.path.join(AQUI, 'casos.json'))) if c['nome'] == nome)
    if os.path.exists(dest):
        shutil.rmtree(dest)
    os.makedirs(dest)
    for orig, para in caso['c']:
        o, d = os.path.join(RAIZ, orig), os.path.normpath(os.path.join(dest, para))
        if os.path.isdir(o):
            os.makedirs(d, exist_ok=True)
            for n in os.listdir(o):
                if os.path.isfile(os.path.join(o, n)):
                    shutil.copy(os.path.join(o, n), os.path.join(d, n))
        else:
            os.makedirs(os.path.dirname(d), exist_ok=True)
            shutil.copy(o, d)
    print('%s\t%s' % (caso['exe'], os.path.join(RAIZ, caso['roteiro'])))


if __name__ == '__main__':
    main(sys.argv[1], sys.argv[2])
