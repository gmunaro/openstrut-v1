#!/usr/bin/env python3
"""compara_resumos.py - placar contra o oraculo, por caso, do nativo e da web lado a lado.

Uso: compara_resumos.py <resumo nativo> <resumo web>

Le a saida dos roda_casos.sh (blocos "##### <caso> (...)" seguidos das linhas do
compara_retrad.py) e mostra, por caso, a linha "N iguais, M diferentes" e as linhas de obra
(OK/DIFERE/arquivo ...) dos dois lados; marca com !! os casos em que diferem.
"""
import re
import sys


def blocos(caminho):
    r, caso = {}, None
    try:
        linhas = open(caminho, encoding='utf-8', errors='replace').read().splitlines()
    except OSError:
        return r
    for l in linhas:
        m = re.match(r'#####\s+(\S+)', l)
        if m:
            caso = m.group(1)
            r[caso] = []
        elif caso and (re.search(r'\d+ iguais, \d+ diferentes', l) or re.match(r'(OK|DIFERE|SO V1)\s+obra/', l)
                       or l.startswith('arquivo ') or re.match(r'\S+ \(retrad_sis', l)):
            r[caso].append(l.strip())
    return r


def main(nat, web):
    a, b = blocos(nat), blocos(web)
    dif = 0
    for caso in list(dict.fromkeys(list(a) + list(b))):
        la, lb = a.get(caso, ['(nao rodou)']), b.get(caso, ['(nao rodou)'])
        placar = lambda ls: next((x for x in ls if 'iguais,' in x), ls[0] if ls else '')
        if la == lb:
            print('   = %-14s %s' % (caso, placar(la)))
        else:
            dif += 1
            print('  !! %-14s nativo: %s' % (caso, placar(la)))
            print('     %-14s web:    %s' % ('', placar(lb)))
            for x in sorted(set(la) ^ set(lb)):
                print('     %-14s %s %s' % ('', 'nativo' if x in la else 'web   ', x))
    return 1 if dif else 0


if __name__ == '__main__':
    sys.exit(main(sys.argv[1], sys.argv[2]))
