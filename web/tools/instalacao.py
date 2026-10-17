#!/usr/bin/env python3
r"""instalacao.py - arquivos iniciais do drive C: do site (instalacao.json) e as sementes.

Uso: instalacao.py <pasta sistrut-game> <pasta de saida> [EXE ...]
  instalacao.json: C:\SISTRUT\SISTRUT.INI e C:\SISTRUT\EXEC40\ com os arquivos de sistrut-game
  (como o README manda montar a instalacao), em base64.
  semente_<EXE>.chn: tela de entrada do gerenciador para abrir um modulo direto (?prog=EXE),
  feita pelo tools/troca_semente.py, como no tools/roda_retrad.sh.
"""
import base64
import json
import os
import subprocess
import sys


def main(jogo, saida, exes):
    lista = [{'caminho': '/C', 'pasta': True}, {'caminho': '/C/SISTRUT', 'pasta': True}, {'caminho': '/C/SISTRUT/EXEC40', 'pasta': True}]
    for n in sorted(os.listdir(jogo)):
        p = os.path.join(jogo, n)
        if not os.path.isfile(p):
            continue
        b64 = base64.b64encode(open(p, 'rb').read()).decode()
        lista.append({'caminho': '/C/SISTRUT/EXEC40/' + n.upper(), 'b64': b64})
        if n.upper() == 'SISTRUT.INI':
            lista.append({'caminho': '/C/SISTRUT/SISTRUT.INI', 'b64': b64})
    with open(os.path.join(saida, 'instalacao.json'), 'w') as f:
        json.dump(lista, f)
    raiz = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
    for exe in exes:
        if exe.startswith('W_') or exe in ('SISTRUT', 'SISEDIT'):
            continue
        subprocess.check_call([sys.executable, '-I', os.path.join(raiz, 'tools', 'troca_semente.py'),
                               os.path.join(saida, 'semente_%s.chn' % exe), '--modulo', exe, '--marca', 'openstrut'], stdout=subprocess.DEVNULL)


if __name__ == '__main__':
    if len(sys.argv) < 3:
        sys.exit(__doc__)
    main(sys.argv[1], sys.argv[2], sys.argv[3:])
