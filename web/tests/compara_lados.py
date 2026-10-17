#!/usr/bin/env python3
"""compara_lados.py - compara byte a byte a saida de uma familia rodada no nativo e na web.

Uso: compara_lados.py <pasta nativa da familia> <pasta web da familia>

Compara todo arquivo das pastas de caso (telas, impressora.prn, arquivos do drive C: final),
ignorando o que nao e saida do programa: log.txt (hora do relogio do computador), semente.chn,
roteiro.txt, resumos e comparacoes dos scripts. Nomes sem diferenca de maiusculas (o DOS e o
Windows nao diferenciam; a web grava o drive C: em maiusculas).
"""
import os
import sys

IGNORA_NOME = {'log.txt', 'semente.chn', 'roteiro.txt', 'resumo.out', 'resumo.txt', 'v1web.dist'}


def arquivos(raiz):
    r = {}
    for d, _, fs in os.walk(raiz):
        rel_d = os.path.relpath(d, raiz)
        if rel_d.split(os.sep)[0] in ('sis-bin', 'sis-bin-sonda'):
            continue
        for f in fs:
            if f in IGNORA_NOME or f.startswith('compara_') or (f.startswith('sonda_') and f.endswith('.txt')) or f.endswith('.exe'):
                continue
            rel = os.path.normpath(os.path.join(rel_d, f))
            r[rel.lower()] = os.path.join(d, f)
    return r


def main(nat, web):
    a, b = arquivos(nat), arquivos(web)
    iguais = 0
    dif, so_nat, so_web = [], [], []
    for k in sorted(a):
        if k not in b:
            so_nat.append(k)
        elif open(a[k], 'rb').read() == open(b[k], 'rb').read():
            iguais += 1
        else:
            dif.append(k)
    so_web = [k for k in sorted(b) if k not in a]
    print('  nativo x web: %d iguais, %d diferentes, %d so no nativo, %d so na web' % (iguais, len(dif), len(so_nat), len(so_web)))
    for rot, lista in (('DIFERE', dif), ('SO NATIVO', so_nat), ('SO WEB', so_web)):
        for k in lista[:15]:
            print('    %s %s' % (rot, k))
        if len(lista) > 15:
            print('    ... mais %d' % (len(lista) - 15))
    return 1 if dif or so_nat or so_web else 0


if __name__ == '__main__':
    sys.exit(main(sys.argv[1], sys.argv[2]))
