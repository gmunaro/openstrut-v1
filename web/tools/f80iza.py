#!/usr/bin/env python3
"""f80iza.py - troca o long double do C++ pelo qb_f80 (web/runtime/qb_f80.h) no build web.

Em wasm o long double e quad (113 bits); a V1 depende do estendido de 64 bits do x87 em toda
expressao com _FLOAT. Este script reescreve, em C/C++ (fora de strings e comentarios):
  - "long double"          -> qb_f80
  - literal decimal com L  -> qb_f80::bits(0xSSSS, 0xMMMMMMMMMMMMMMMMULL), o estendido mais
                              proximo do valor exato (ao par), como o clang le o literal no x86
  - sqrtl/fabsl/floorl... de argumento estendido: nao trocados (nao aparecem no C++ gerado)

Uso: f80iza.py <arquivo ou pasta> [...]        (reescreve no lugar)
     f80iza.py --literal 0.85E+0                (mostra a conversao de um literal)
"""
import os
import re
import sys
from fractions import Fraction

LIT = re.compile(r'(?:\d+\.\d*|\.\d+|\d+)(?:[eE][-+]?\d+)?[lL]\b')
LONG_DOUBLE = re.compile(r'\blong\s+double\b')


def para_f80(texto):
    """Literal decimal (sem o sufixo) -> (se, m) do estendido mais proximo, ao par."""
    v = Fraction(texto)
    if v == 0:
        return 0, 0
    sinal = 0
    if v < 0:
        sinal, v = 1, -v
    # expoente e com 2^e <= v < 2^(e+1)
    e = v.numerator.bit_length() - v.denominator.bit_length()
    if Fraction(2) ** e > v:
        e -= 1
    elif Fraction(2) ** (e + 1) <= v:
        e += 1
    emin = -16382
    ee = max(e, emin)  # denormal: expoente fixo, mantissa menor
    escala = Fraction(2) ** (63 - ee)
    x = v * escala
    m = x.numerator // x.denominator
    resto = x - m
    if resto > Fraction(1, 2) or (resto == Fraction(1, 2) and m & 1):
        m += 1
    if m >= 1 << 64:
        m >>= 1
        ee += 1
    if ee > 16383:
        return (sinal << 15) | 0x7FFF, 1 << 63
    if m < 1 << 63:  # denormal (ou arredondou para zero)
        return (sinal << 15), m
    return (sinal << 15) | (ee + 16383), m


def literal(texto):
    se, m = para_f80(texto[:-1])
    return 'qb_f80::bits(0x%04X, 0x%016XULL)' % (se, m)


def processa(fonte):
    saida = []
    i, n = 0, len(fonte)
    codigo = []  # trecho de codigo acumulado

    def despeja():
        if codigo:
            t = ''.join(codigo)
            t = LONG_DOUBLE.sub('qb_f80', t)
            t = substitui_literais(t)
            saida.append(t)
            codigo.clear()

    while i < n:
        c = fonte[i]
        if c == '"' or c == "'":
            despeja()
            j = i + 1
            while j < n and fonte[j] != c:
                j += 2 if fonte[j] == '\\' else 1
            saida.append(fonte[i:j + 1])
            i = j + 1
        elif fonte.startswith('//', i):
            despeja()
            j = fonte.find('\n', i)
            j = n if j < 0 else j
            saida.append(fonte[i:j])
            i = j
        elif fonte.startswith('/*', i):
            despeja()
            j = fonte.find('*/', i + 2)
            j = n if j < 0 else j + 2
            saida.append(fonte[i:j])
            i = j
        elif fonte.startswith('#include', i) or fonte.startswith('#line', i):
            despeja()  # caminhos de include e #line ficam como estao
            j = fonte.find('\n', i)
            j = n if j < 0 else j
            saida.append(fonte[i:j])
            i = j
        else:
            codigo.append(c)
            i += 1
    despeja()
    return ''.join(saida)


def substitui_literais(t):
    # nao pega numero colado a identificador (ex.: x1L) nem hexadecimal
    out, pos = [], 0
    for m in LIT.finditer(t):
        a = m.start()
        if a > 0 and (t[a - 1].isalnum() or t[a - 1] in '_.'):
            continue
        if not any(ch in m.group(0) for ch in '.eE'):
            continue  # 100L e inteiro long
        out.append(t[pos:a])
        out.append(literal(m.group(0)))
        pos = m.end()
    out.append(t[pos:])
    return ''.join(out)


def main(args):
    if args and args[0] == '--literal':
        for a in args[1:]:
            print(a, '->', literal(a + 'L'))
        return 0
    arqs = []
    for a in args:  # pasta: todos os .txt, .h, .cpp e .inc dela
        if os.path.isdir(a):
            arqs += [os.path.join(a, f) for f in sorted(os.listdir(a)) if f.endswith(('.txt', '.h', '.cpp', '.inc'))]
        else:
            arqs.append(a)
    for arq in arqs:
        with open(arq, 'r', encoding='latin-1', newline='') as f:
            s = f.read()
        t = processa(s)
        if t != s:
            with open(arq, 'w', encoding='latin-1', newline='') as f:
                f.write(t)
    return 0


if __name__ == '__main__':
    sys.exit(main(sys.argv[1:]))
