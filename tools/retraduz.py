#!/usr/bin/env python3
"""Rascunho QB64 a partir do pseudo-BASIC recuperado do original (*.lift.txt).

Uso:
  python -I tools/retraduz.py LAJEPROC [--familia laje] [--dump <REA_WORK>/dump]
         [--saida src-original] [--mixt] [--marca openstrut|original]

Lê dump/<EXE>/index.json e os .lift.txt (pseudo-BASIC recuperado do EXE original, fora do repositório;
--dump ou a variável REA_WORK, com o dump em $REA_WORK/dump) e escreve:
  src-original/<familia>/<EXE>.BAS      programa (nível de módulo + SUBs do módulo principal)
  src-original/<familia>/<EXE>.NOMES.txt variáveis do EXE (endereço DS, tipo, onde aparece)
  --mixt: src-original/comum/MIXT.BI e MIXT.BM a partir do módulo MIXT deste EXE.

Convenções: docs/RETRADUCAO.md. Resumo do que a tradução faz:
- cada comando sai com o endereço do original no fim: `... '@1a2b3`;
- variáveis mantêm o nome do lift (V_0e54!, A_10cc!(i, j), L_BP0c%); apelidos opcionais
  em src-original/<familia>/nomes.json viram V_0e54_apelido!;
- expressões de ponto flutuante são promovidas para _FLOAT (FX##), como o x87 do original,
  e constantes SINGLE não exatas saem como o decimal exato do float (0.85000002384185791015625##);
- comandos do runtime (B$...) que o QB64 não faz igual viram chamadas RT_* (comum/RT45.BM);
- o que o tradutor não resolve sai comentado com `'RETRAD?` para conserto à mão (CORRECOES);
- --marca openstrut (padrão) troca os textos de marca do original pelos do OpenStrut, pela tabela
  src-original/marca.json (mesma largura); --marca original deixa o texto do SISTRUT 4.0.
"""
import argparse
import json
import os
import re
import struct
import sys
from fractions import Fraction

# ------------------------------------------------------------------ correções à mão
# endereço -> lista de linhas QB64 (substitui o comando do lift naquele endereço).
# Cada entrada documenta a evidência; ver docs/RETRADUCAO.md, seção "Correções manuais".
P = "PROTECAO"   # comenta o comando (verificação de licença do original, desativada; ver RETRADUCAO.md)
CORRECOES = {
    # LAJEPROC 0x1919a..0x191c3: SWAP inline de dois DOUBLE (MOV/XCHG palavra a palavra de
    # DS:15FC com DS:1604), que o lift mostra como "?? 31 bytes" (dump/LAJEPROC/0164ba_F_164ba.asm
    # linhas 4364-4378).
    ("LAJEPROC", 0x191a7): ["SWAP V_15fc#, V_1604#"],
    # ---- trechos de verificação de licença do original, desativados (decisão do dono)
    ("LAJEPROC", 0x101a2): ["GOTO L_101f2   ' PROTECAO: verificacao de licenca do original desativada"],
    ("LAJEPROC", 0x101b9): P, ("LAJEPROC", 0x101c7): P, ("LAJEPROC", 0x101d5): P, ("LAJEPROC", 0x101e3): P,
    ("LAJEGRAV", 0x10116): ["GOTO L_10166   ' PROTECAO: verificacao de licenca do original desativada"],
    ("LAJEGRAV", 0x1012d): P, ("LAJEGRAV", 0x1013b): P, ("LAJEGRAV", 0x10149): P, ("LAJEGRAV", 0x10157): P,
    ("LAJE", 0x104fa): ["' PROTECAO: verificacao de licenca do original desativada"],
    ("LAJE", 0x10632): P, ("LAJE", 0x10640): P, ("LAJE", 0x1064e): P, ("LAJE", 0x1065c): P,
    ("LAJE", 0x20073): P, ("LAJE", 0x200e5): P, ("LAJE", 0x20157): P, ("LAJE", 0x201c9): P,
    ("LAJE", 0x2023b): ["GOTO L_2025c   ' PROTECAO: verificacao de licenca do original desativada"],
    ("LAJE", 0x20252): P, ("LAJE", 0x2025c): P, ("LAJE", 0x20277): P, ("LAJE", 0x202a4): P,
    ("LAJE", 0x202b2): ["GOTO L_202e0   ' PROTECAO: verificacao de licenca do original desativada"],
    ("LAJE", 0x202c9): P, ("LAJE", 0x202d1): P,
    # ---- limites do lift (corrigidos pelo .asm). Linhas "lift: ..." passam pelo tradutor.
    # DESINIT 0x4ce7c: AND de LONG (AND AX,[BP-436h]; AND DX,[BP-434h]; OR AX,DX; JNZ), que o lift
    # leu como dois INTEGER e um "??valor" (dump/DESINIT/0401ce_F_401ce.asm, 0x4cee2..0x4cef3).
    ("DESINIT", 0x4ce7c): ["lift: IF NOT ((CLNG(A_1af2!(CINT(V_0e30!), 3) - 8.0 - (A_1af2!(CINT(V_0e30!), 2) + "
                           "A_1af2!(CINT(V_0e14!), 3)) / 2.0) AND L_BP436&) <> 0) THEN GOTO L_4cfe7"],
    # DESENHO 0x38ebb, 0x38f11, 0x3942a, 0x39480 (Bf/Hf da secao: (i > 0) * (i < n + 1) * b): o .asm
    # converte cada comparacao com B$FIL2 e multiplica no x87 (FMULP, depois FMUL da largura), e o
    # lift mostra um produto de INTEGER (dump/DESENHO/038c4a_FUN_3000_8c4a.asm). No balanco (i = 0 ou
    # n + 1), 0.0 * -1.0 = -0: o original grava Bf = Hf = -0 (00 00 00 80) no .SEC (caso
    # v2par_des_especial). Os unicos produtos de duas comparacoes nos 27 EXE. O BC 4.5 do qb40, com o
    # mesmo texto, faz IMUL e da +0 (sonda tests/retraducao/QB45_T21.BAS).
    ("DESENHO", 0x38ebb): ["lift: A_1232!(L_BP0e%, 2) = CSNG(L_BP0e% > 0) * CSNG(L_BP0e% < V_0ddc! + 1.0) * V_0e9a!"],
    ("DESENHO", 0x38f11): ["lift: A_1232!(L_BP0e%, 3) = CSNG(L_BP0e% > 0) * CSNG(L_BP0e% < V_0ddc! + 1.0) * V_0e9e!"],
    ("DESENHO", 0x3942a): ["lift: A_1232!(L_BP10%, 2) = CSNG(L_BP10% > 0) * CSNG(L_BP10% < V_0ddc! + 1.0) * V_0e9a!"],
    ("DESENHO", 0x39480): ["lift: A_1232!(L_BP10%, 3) = CSNG(L_BP10% > 0) * CSNG(L_BP10% < V_0ddc! + 1.0) * V_0e9e!"],
}

NL, CRLF = chr(10), chr(13) + chr(10)

# --------------------------------------------------------------------- tipos
SNG, DBL, INT, LNG, STR = "!", "#", "%", "&", "$"
RANK = {INT: 0, LNG: 1, SNG: 2, DBL: 3}
FLOAT = (SNG, DBL)


def maxtype(a, b):
    if a == STR or b == STR:
        return STR
    a = a or SNG
    b = b or SNG
    return a if RANK[a] >= RANK[b] else b


def f32(x):
    return struct.unpack("<f", struct.pack("<f", float(x)))[0]


def exato(fr):
    """Decimal exato de uma fração diádica (valor de float/double)."""
    fr = Fraction(fr)
    sinal = "-" if fr < 0 else ""
    fr = abs(fr)
    inteiro = fr.numerator // fr.denominator
    resto = fr - inteiro
    dig = []
    while resto:
        resto *= 10
        d = resto.numerator // resto.denominator
        dig.append(str(d))
        resto -= d
    return sinal + str(inteiro) + ("." + "".join(dig) if dig else "")


# --------------------------------------------------------------------- léxico
TOK = re.compile(r'''
  (?P<str>"[^"]*")
 |(?P<hex>&H[0-9A-Fa-f]+&?)
 |(?P<num>(?:\d+\.\d*|\.\d+|\d+)(?:[ED][+-]?\d+)?[!#%&]?)
 |(?P<id>[A-Za-z_][A-Za-z0-9_]*[$!#%&]?)
 |(?P<op><=|>=|<>|[-+*/\\^=<>(),;:])
 |(?P<sp>\s+)
 |(?P<x>.)
''', re.X)


def lexar(s):
    out = []
    for m in TOK.finditer(s):
        k = m.lastgroup
        if k == "sp":
            continue
        out.append((k, m.group()))
    return out


# --------------------------------------------------------------------- AST
class N:
    __slots__ = ("k", "v", "a", "t")

    def __init__(self, k, v=None, a=None, t=None):
        self.k, self.v, self.a, self.t = k, v, a or [], t


BIN_PREC = {"IMP": 1, "EQV": 2, "XOR": 3, "OR": 4, "AND": 5,
            "=": 7, "<>": 7, "<": 7, ">": 7, "<=": 7, ">=": 7,
            "+": 8, "-": 8, "MOD": 9, "\\": 10, "*": 11, "/": 11, "^": 13}
REL = {"=", "<>", "<", ">", "<=", ">="}
LOGIC = {"AND", "OR", "XOR", "EQV", "IMP"}


class Parser:
    def __init__(self, toks):
        self.t = toks
        self.i = 0

    def peek(self, d=0):
        j = self.i + d
        return self.t[j] if j < len(self.t) else (None, None)

    def take(self):
        x = self.peek()
        self.i += 1
        return x

    def expr(self, minp=0):
        left = self.unary()
        while True:
            k, v = self.peek()
            op = v.upper() if v else None
            if op not in BIN_PREC or k == "str":
                break
            p = BIN_PREC[op]
            if p < minp:
                break
            self.take()
            # ^ é associativo à esquerda no QB; os demais também
            right = self.expr(p + 1)
            left = N("bin", op, [left, right])
        return left

    def unary(self):
        k, v = self.peek()
        if v == "-":
            self.take()
            return N("neg", None, [self.expr(12)])
        if v == "+":
            self.take()
            return self.expr(12)
        if v and v.upper() == "NOT":
            self.take()
            return N("not", None, [self.expr(6)])
        return self.atom()

    def atom(self):
        k, v = self.take()
        if k is None:
            raise SyntaxError("fim inesperado")
        if v == "(":
            e = self.expr()
            self.expect(")")
            return N("par", None, [e])
        if k == "str":
            return N("str", v, t=STR)
        if k == "num":
            return N("num", v)
        if k == "hex":
            return N("num", v)
        if k == "id":
            if self.peek()[1] == "(":
                self.take()
                args = []
                if self.peek()[1] != ")":
                    while True:
                        args.append(self.expr())
                        if self.peek()[1] == ",":
                            self.take()
                            continue
                        break
                self.expect(")")
                return N("call", v, args)
            return N("var", v)
        raise SyntaxError(f"token inesperado {v!r}")

    def expect(self, v):
        k, x = self.take()
        if x != v:
            raise SyntaxError(f"esperava {v!r}, veio {x!r}")


def parse_expr(s):
    p = Parser(lexar(s))
    e = p.expr()
    if p.i != len(p.t):
        raise SyntaxError(f"sobra na expressão: {p.t[p.i:]}")
    return e


# --------------------------------------------------------------------- tradução de expressões
FUNC_T = {  # resultado
    "CINT": INT, "CLNG": LNG, "LEN": INT, "INSTR": INT, "ASC": INT, "VAL": DBL, "FRE": LNG,
    "PEEK": INT, "SGN": INT, "LOF": LNG, "EOF": INT, "LOC": LNG, "POS": INT, "CSRLIN": INT,
    "FREEFILE": INT, "LBOUND": INT, "UBOUND": INT, "CVI": INT, "CVL": LNG, "CVS": SNG, "CVD": DBL,
    "TIMER": SNG, "POINT": INT, "SCREEN": INT, "LPOS": INT, "ERR": INT, "ERL": INT,
    "CSNG": SNG, "CDBL": DBL,
}
FUNC_STR = {"STR$", "MID$", "LEFT$", "RIGHT$", "LTRIM$", "RTRIM$", "UCASE$", "LCASE$", "CHR$",
            "STRING$", "SPACE$", "INKEY$", "INPUT$", "HEX$", "OCT$", "MKS$", "MKD$", "MKI$",
            "MKL$", "DATE$", "TIME$", "ENVIRON$", "COMMAND$"}
FUNC_MAT = {"SQR", "SIN", "COS", "TAN", "ATN", "EXP", "LOG", "ABS", "INT", "FIX"}
VARLIKE = ("var", "call")


def divide_atrib(s):
    """'destino = expressão' dividido no primeiro '=' de nível zero, fora de strings."""
    nivel, dentro = 0, False
    for i, ch in enumerate(s):
        if ch == '"':
            dentro = not dentro
        elif not dentro:
            if ch == "(":
                nivel += 1
            elif ch == ")":
                nivel -= 1
            elif ch == "=" and nivel == 0 and s[i - 1:i + 2] == " = ":
                return s[:i - 1], s[i + 2:]
    return None


def sem_par(c):
    """Tira um par de parênteses externo, se ele envolver a expressão inteira."""
    if not (c.startswith("(") and c.endswith(")")):
        return c
    nivel, dentro = 0, False
    for i, ch in enumerate(c):
        if ch == '"':
            dentro = not dentro
        elif not dentro:
            if ch == "(":
                nivel += 1
            elif ch == ")":
                nivel -= 1
                if nivel == 0 and i != len(c) - 1:
                    return c
    return c[1:-1]


class Tradutor:
    def __init__(self, tipos, nomes, matrizes):
        self.ctx = {}               # tipos dos locais/parâmetros da rotina em tradução
        self.funcao = None          # nome da rotina -> nome QB64 da FUNCTION (ou None)
        self.alias = {}             # endereço DS -> (base ST_, índice, sufixo): elemento de matriz estática
        self.fixas = None           # endereço -> tamanho das strings fixas (campos de registro)
        self.recente = {}           # último tipo visto de cada local (o compilador reaproveita [BP-xx])
        self.tipos = tipos          # nome base (sem sufixo) -> sufixo
        self.nomes = nomes          # nome com sufixo -> apelido
        self.matrizes = matrizes    # nome base de matriz

    # nome final de uma variável do lift
    def nome(self, ident):
        base, suf = (ident[:-1], ident[-1]) if ident[-1] in "$!#%&" else (ident, "")
        if self.alias and re.match(r"^V_[0-9a-f]{4}$", base):
            al = self.alias.get(int(base[2:], 16))
            if al and (not suf or suf == al[2]):
                return f"ST_{al[0]:04x}{al[2]}({al[1]})", al[2]
        if not suf:
            suf = self.recente.get(base) or self.ctx.get(base) or self.tipos.get(base, "")
        apel = self.nomes.get(base)
        return (base + ("_" + apel if apel else "")) + suf, suf

    def tipo_num(self, txt):
        t = txt.upper()
        if t.startswith("&H"):
            return LNG if t.endswith("&") else INT
        if t[-1] in "!#%&":
            return {"!": SNG, "#": DBL, "%": INT, "&": LNG}[t[-1]]
        if "." in t or "E" in t:
            return SNG
        if "D" in t:
            return DBL
        return INT if abs(int(t)) <= 32767 else LNG

    # devolve (código, tipo, ext)
    def ex(self, n):
        k = n.k
        if k == "str":
            return n.v, STR, False
        if k == "par":
            c, t, e = self.ex(n.a[0])
            return "(" + c + ")", t, e
        if k == "num":
            t = self.tipo_num(n.v)
            if t == SNG:
                txt = n.v.rstrip("!")
                v = f32(float(txt))
                if Fraction(v) == Fraction(txt):
                    return txt, SNG, False
                return exato(Fraction(v)) + "##", SNG, True
            return n.v, t, False
        if k == "var":
            U = n.v.upper()
            if U == "INKEY$":
                return "RT_INKEY$", STR, False
            if U in ("TIMER", "DATE$", "TIME$"):   # relógio do RT45 (SISTRUT_DATA)
                return "RT_" + U, STR if U.endswith("$") else SNG, False
            if U in ("CSRLIN", "ERR", "ERL", "FREEFILE", "COMMAND$"):
                return U, STR if U.endswith("$") else FUNC_T.get(U, INT), False
            nm, suf = self.nome(n.v)
            return nm, suf or SNG, False
        if k == "neg":
            c, t, e = self.ex(n.a[0])
            return "-" + self.par(n.a[0], c, 12), t, e
        if k == "not":
            c, t, e = self.ex(n.a[0])
            return "NOT " + self.par(n.a[0], c, 6), INT if t != LNG else LNG, False
        if k == "call":
            return self.call(n)
        if k == "bin":
            return self.binop(n)
        raise ValueError(k)

    def prec(self, n):
        if n.k == "bin":
            return BIN_PREC[n.v]
        if n.k == "neg":
            return 12
        if n.k == "not":
            return 6
        return 99

    def par(self, filho, code, p, direita=False):
        q = self.prec(filho)
        if q < p or (direita and q == p):
            if not code.startswith("("):
                return "(" + code + ")"
        return code

    def fx(self, code):
        return "FX##(" + code + ")"

    def binop(self, n):
        op = n.v
        l, r = n.a
        cl, tl, el = self.ex(l)
        cr, tr, er = self.ex(r)
        p = BIN_PREC[op]
        cl = self.par(l, cl, p)
        cr = self.par(r, cr, p, direita=True)
        if op in REL:
            if tl == STR:
                return f"{cl} {op} {cr}", INT, False
            fl, fr = tl in FLOAT, tr in FLOAT
            # O QB64 compara no tipo MENOS preciso dos dois lados (SINGLE x DOUBLE em SINGLE,
            # _FLOAT x DOUBLE em DOUBLE, LONG x SINGLE em SINGLE; teste T5/T6Q); o x87 do QB4.5
            # compara exato. Com tipos diferentes, todo lado de ponto flutuante que ainda não é
            # _FLOAT vira FX##(...). INTEGER x SINGLE/DOUBLE já é exato no QB64.
            kl, kr = ("F" if el else tl), ("F" if er else tr)
            if (fl or fr) and kl != kr and not (INT in (kl, kr) and {kl, kr} - {INT} <= {SNG, DBL}):
                if fl and not el:
                    cl = self.fx(sem_par(cl))
                if fr and not er:
                    cr = self.fx(sem_par(cr))
            return f"{cl} {op} {cr}", INT, False
        if op in ("\\", "MOD") and not re.fullmatch(r"\(?-?[1-9]\d*[%&]?\)?", cr):
            # divisor zero: o QB4.5 dá erro 11 e o QB64 trava (sonda T17/T18Q)
            t = LNG if LNG in (tl, tr) or (tl in FLOAT or tr in FLOAT) else INT
            f = {"\\": "IDIV", "MOD": "IMOD"}[op] + ("I%" if t == INT else "L&")
            return f"RT_{f}({self.inteiro(cl, tl, el, t)}, {self.inteiro(cr, tr, er, t)})", t, False
        if op in LOGIC or op in ("\\", "MOD"):
            t = LNG if LNG in (tl, tr) else INT
            return f"{cl} {op} {cr}", t, False
        if op == "+" and tl == STR:
            return f"{cl} + {cr}", STR, False
        t = maxtype(tl, tr)
        if op in ("/", "^") and t in (INT, LNG):
            t = SNG
        if t in FLOAT:
            if not (el or er):
                if op == "^" or l.k in VARLIKE or l.k == "par" or r.k not in VARLIKE:
                    cl = self.fx(sem_par(cl))
                else:
                    cr = self.fx(sem_par(cr))
            if op == "^":   # 0 ^ negativo: erro 5 no QB4.5 (sonda T13/T17); base negativa e expoente fracionário já dão 5 nos dois
                return f"RT_POT##(({sem_par(cl)}), ({sem_par(cr)}))", t, True
            return f"{cl} {op} {cr}", t, True
        return f"{cl} {op} {cr}", t, False

    def inteiro(self, c, t, e, alvo):
        """Operando inteiro (por referência) de uma rotina do RT45: ponto flutuante passa pelo
        FISTP do x87 (RT_CINT%/RT_CLNG&); inteiro vai entre parênteses."""
        if t in FLOAT or e:
            f = "RT_CINT%" if alvo == INT else "RT_CLNG&"
            return f"{f}({c if e else 'FX##(' + sem_par(c) + ')'})"
        return f"({c})"

    def call(self, n):
        nome = n.v
        U = nome.upper()
        base = nome[:-1] if nome[-1] in "$!#%&" else nome
        if base in self.matrizes:
            nm, suf = self.nome(nome)
            idx = [self.ex(a)[0] for a in n.a]
            return f"{nm}({', '.join(idx)})", suf or SNG, False
        fn = self.funcao(nome) if self.funcao else None
        if fn:
            ar = []
            for a in n.a:
                if a.k == "var":
                    ar.append(self.nome(a.v)[0])
                else:
                    c, t, e = self.ex(a)
                    ar.append(self.cast(c, t, e))
            return f"{fn}({', '.join(ar)})", fn[-1], False
        args = [self.ex(a) for a in n.a]
        if U == "FIXSTR$":
            alvo = n.a[0].v
            tam = int(n.a[1].v)
            if re.match(r"^V_[0-9a-f]{4}$", alvo) and self.fixas is not None and not alvo.startswith("L_"):
                self.fixas.setdefault(int(alvo[2:], 16), tam)
            nm = self.nome(alvo + "$")[0] if not alvo.endswith("$") else self.nome(alvo)[0]
            return f"RT_FIXL$({nm}, {tam})", STR, False
        if U == "CDBL" and len(n.a) == 1 and n.a[0].k == "num":
            v = f32(float(n.a[0].v.rstrip("!")))
            return exato(Fraction(v)) + "##", DBL, True
        if U in FUNC_MAT:
            c, t, e = args[0]
            if t in FLOAT and not e:
                c = self.fx(c)
            if U in ("ABS", "INT", "FIX"):
                rt = t
            else:
                rt = DBL if t == DBL else SNG
            if U == "EXP":   # estouro: infinito sem erro, como o x87 (sonda T17); o EXP do QB64 dá erro 6
                return f"RT_EXP##({c if t in FLOAT else '(' + c + ')'})", rt, True
            if U in ("SIN", "COS", "TAN"):   # |x| >= 2^31: erro 5 no BRUN45 (sonda T19)
                return f"RT_{U}##({c if t in FLOAT else '(' + c + ')'})", rt, True
            if U == "SQR":   # negativo: NaN sem erro, como o FSQRT do x87 do oráculo (PILAR P12)
                return f"RT_SQR##({c if t in FLOAT else '(' + c + ')'})", rt, True
            return f"{U}({c})", rt, True
        if U == "STR$":
            c, t, e = args[0]
            if t == DBL:   # B$STR8: 16 algarismos significativos (VPLOTA R10)
                return f"RT_STR8$({self.cast(c, t, e)})", STR, False
            return f"STR$({self.cast(c, t, e)})", STR, False
        # R11: argumentos que o QB4.5 recusa com erro 5 (T11 no oráculo) e o QB64 aceita
        if U in ("MID$", "LEFT$", "RIGHT$", "SPACE$", "STRING$") or (U == "INSTR" and len(args) == 3):
            ar = [f"({a[0]})" for a in args]
            if U == "MID$":
                return (f"RT_MID$({', '.join(ar)})" if len(ar) == 3 else f"RT_MID2$({', '.join(ar)})"), STR, False
            if U == "STRING$":
                return (f"RT_STRINGS$({', '.join(ar)})" if args[1][1] == STR else f"RT_STRINGC$({', '.join(ar)})"), STR, False
            if U == "INSTR":
                return f"RT_INSTR%({', '.join(ar)})", INT, False
            return f"RT_{U[:-1]}$({', '.join(ar)})", STR, False
        if U == "INPUT$" and len(args) == 1:
            return f"RT_INPUT$({args[0][0]})", STR, False
        if U == "INPUT$":
            return "INPUT$(" + ", ".join(a[0] for a in args) + ")", STR, False
        if U == "INKEY$":
            return "RT_INKEY$", STR, False
        if U == "PMAP" and len(n.a) == 2:   # RT45GFX: conversão do BRUN45
            return f"RT_PMAP!({self.arg_sng_no(n.a[0])}, {self.arg_int_no(n.a[1])})", SNG, False
        if U == "FRE":
            if args and args[0][1] == STR:
                return "RT_FRE&(" + args[0][0] + ")", LNG, False
            return "RT_FREN&(" + args[0][0] + ")", LNG, False
        if U in ("CINT", "CLNG") and len(args) == 1 and (args[0][1] in FLOAT or args[0][2]):
            # estouro e NaN (SQR de negativo) viram o "inteiro indefinido" do x87, sem erro
            # (PILAR P12; sondas T17 e T19: CINT(1E10) = -32768, CLNG(1E20) = -2147483648)
            c = args[0][0]
            return f"RT_{U}{'%' if U == 'CINT' else '&'}({c if args[0][2] else 'FX##(' + c + ')'})", FUNC_T[U], False
        txt = f"{U}(" + ", ".join(a[0] for a in args) + ")"
        if U in FUNC_STR or U.endswith("$"):
            return txt, STR, False
        return txt, FUNC_T.get(U, SNG), False

    def cast(self, c, t, e):
        """Valor tipado como no QB4.5 (FSTP para o tipo da expressão)."""
        if not e:
            return c
        # CSNG/CDBL de um _FLOAT no QB64 só muda o tipo para o compilador: passado a um parâmetro
        # DOUBLE (RT_PU#) o valor chega sem arredondar (LAJECALC 0x13589: 0,18 em vez de 0,17).
        # RT_SNG!/RT_DBL# (RT45) gravam o valor numa variável do tipo, como o FSTP do QB4.5.
        if t == SNG:
            return f"RT_SNG!({c})"
        if t == DBL:
            return f"RT_DBL#({c})"
        return c

    def expr(self, s):
        return self.ex(parse_expr(s))

    def expr_tipada(self, s):
        c, t, e = self.expr(s)
        return self.cast(c, t, e), t

    def arg_sng_no(self, n):
        c, t, e = self.ex(n)
        if t == SNG and not e and n.k in ("var", "call") and re.fullmatch(r"[A-Za-z_]\w*!(\(.*\))?", c):
            return c
        return f"RT_SNG!({c})" if e else f"({c})"

    def arg_int_no(self, n):
        c, t, e = self.ex(n)
        if re.fullmatch(r"-?\d+", c) or (t == INT and not e and re.fullmatch(r"([A-Za-z_]\w*%|CINT)(\(.*\))?", c)):
            return c
        return f"({c})" if t == INT and not e else f"CINT({c})"

    def arg_sng(self, s):
        """Argumento SINGLE por referência (RT45GFX): variável/elemento SINGLE vai direto; expressão
        estendida passa por RT_SNG! (o B$N1R4 recebe o valor arredondado para SINGLE); o resto vai
        entre parênteses (o QB64 converte a expressão para o parâmetro)."""
        c, t, e = self.expr(s)
        if t == SNG and not e and re.fullmatch(r"[A-Za-z_]\w*!(\(.*\))?", c):
            return c
        if e:
            return f"RT_SNG!({c})"
        return c if re.fullmatch(r"-?\d+(\.\d+)?", c) else f"({c})"

    def arg_int(self, s):
        """Argumento INTEGER por referência (cor, f, estilo)."""
        c, t, e = self.expr(s)
        if (t == INT and not e and re.fullmatch(r"([A-Za-z_]\w*%|CINT)(\(.*\))?", c)) or re.fullmatch(r"-?\d+", c):
            return c
        return f"({c})" if t == INT and not e else f"CINT({c})"

    def coord(self, s):
        """Coordenada gráfica: o QB4.5 passa SINGLE por valor (B$N1R4/B$N2R4)."""
        c, t, e = self.expr(s)
        if e or t == DBL:
            return f"CSNG({c})"
        return c


# --------------------------------------------------------------------- leitura do lift
RE_LIN = re.compile(r"^0x([0-9a-f]+)  (.*)$")
RE_ROT = re.compile(r"^(L_[0-9a-f]+):(.*)$")


def separa_comentario(s):
    """Divide 'comando   ' comentário' respeitando strings."""
    dentro = False
    for i, ch in enumerate(s):
        if ch == '"':
            dentro = not dentro
        elif ch == "'" and not dentro:
            return s[:i].rstrip(), s[i + 1:].strip()
    return s.rstrip(), ""


def le_rotina(caminho):
    cab, itens = [], []
    for linha in open(caminho, encoding="utf-8"):
        linha = linha.rstrip("\n")
        if linha.startswith("' "):
            cab.append(linha[2:])
            continue
        m = RE_ROT.match(linha)
        if m:
            itens.append(("rot", None, m.group(1), m.group(2).strip().lstrip("'").strip()))
            continue
        m = RE_LIN.match(linha)
        if m:
            cmd, com = separa_comentario(m.group(2))
            itens.append(("cmd", int(m.group(1), 16), cmd.replace("{COMMON?}", ""), com.replace("{COMMON?}", "")))
    return cab, itens


RE_JUNTA = re.compile(r"^(.+?) = \?\?\{(ST0|AX) = (.*) \| (.*)\}$")


def resolve_juncoes(rotinas):
    """Valor que chega a um rótulo por dois caminhos (FOR com STEP variável e parecidos).
    O lift mostra 'v = ??{ST0 = a | b}': 'a' vem dos GOTO marcados 'leva ST0 = a', 'b' de quem
    cai no rótulo. Vira: nos GOTO, 'v = a: GOTO L_x_v'; no rótulo, 'v = b' seguido de L_x_v:.
    Devolve a lista de (endereço, texto) resolvidos."""
    feitos = []
    alvos = {}   # rótulo -> (variável, valor de quem salta)
    for r in rotinas:
        it = r["itens"]
        for i, (k, a, c, com) in enumerate(it):
            m = RE_JUNTA.match(c) if k == "cmd" else None
            if not m:
                continue
            rots = []
            j = i - 1
            while j >= 0 and it[j][0] == "rot":
                rots.append(it[j][2])
                j -= 1
            if not rots:
                continue
            for rot in rots:
                alvos[rot] = (m.group(1), m.group(3), m.group(2))
            novo = f"L_{a:x}_v"
            it[i] = ("cmd", a, f"{m.group(1)} = {m.group(4)}", com.replace("'??", "").strip())
            it.insert(i + 1, ("rot", None, novo, "junção: valor vindo dos GOTO 'leva'"))
            for rot in rots:
                alvos[rot] = alvos[rot] + (novo,)
            feitos.append((a, c))
    # 'leva ST0 = a' para um rótulo cujo 1o comando é 'v = ...' sem a junção no lift (VPLOTA
    # 0x56477 -> 0x583d4 'V_1470! = V_1470! + 1.0': o salto cai no FSTP do FOR e grava o valor
    # inicial; quem cai no rótulo soma o passo). O GOTO grava o valor e pula a atribuição.
    levas = set()
    for r in rotinas:
        for k, a, c, com in r["itens"]:
            m = re.match(r"^GOTO (L_[0-9a-f]+)$", c) if k == "cmd" else None
            if m and m.group(1) not in alvos and re.search(r"leva ST0 = ", com):
                levas.add(m.group(1))
    for r in rotinas:
        it = r["itens"]
        for i, (k, a, c, com) in enumerate(it):
            if k != "rot" or it[i][2] not in levas:
                continue
            j = i + 1
            while j < len(it) and it[j][0] == "rot":
                j += 1
            if j >= len(it) or it[j][0] != "cmd":
                continue
            ma = re.match(r"^([VL]_\w+[!#]) = (.+)$", it[j][2])
            if not ma:
                continue
            novo = f"L_{it[j][1]:x}_v"
            it.insert(j + 1, ("rot", None, novo, "junção: valor vindo dos GOTO 'leva'"))
            alvos[it[i][2]] = (ma.group(1), None, "ST0", novo)
            feitos.append((it[j][1], it[j][2]))
    for r in rotinas:
        it = r["itens"]
        i = 0
        while i < len(it):
            k, a, c, com = it[i]
            m = re.match(r"^GOTO (L_[0-9a-f]+)$", c) if k == "cmd" else None
            mm = re.search(r"leva (ST0|AX) = (.*)$", com) if m else None
            if m and mm and m.group(1) in alvos:
                var, _, reg, novo = alvos[m.group(1)]
                com2 = com[:mm.start()].strip()
                it[i] = ("cmd", a, f"{var} = {mm.group(2).strip()}", com2)
                it.insert(i + 1, ("cmd", a, f"GOTO {novo}", "valor da junção"))
                i += 1
            i += 1
    return feitos


# --------------------------------------------------------------------- tradução de comandos
RE_ID = re.compile(r"\b([VALP]_(?:BP)?[0-9a-fA-F]{2,5}|ST_[0-9a-f]+)([$!#%&]?)")


class Programa:
    def __init__(self, exe, dump, familia, nomes_json=None, so_modulo=None):
        self.exe = exe
        self.dump = dump
        self.familia = familia
        idx = json.load(open(os.path.join(dump, exe, "index.json"), encoding="utf-8"))
        self.idx = idx
        self.rotinas = []
        self_avisos_pre = []
        for r in idx["rotinas"]:
            if so_modulo and r["modulo"] != so_modulo:
                continue
            base_arq = r["arquivo"][:-2] if r["arquivo"].endswith(".c") else r["arquivo"]
            arq = os.path.join(dump, exe, base_arq + ".lift.txt")
            if not os.path.exists(arq):
                self_avisos_pre.append(f"sem .lift.txt: {r['arquivo']}")
                continue
            cab, itens = le_rotina(arq)
            self.rotinas.append(dict(r, cab=cab, itens=itens, lift=os.path.basename(arq)))
        self.juncoes = resolve_juncoes(self.rotinas)
        self.gfx_estat = {}   # matriz estática só de GET/PUT gráfico: nome -> (sufixo, n. de elementos)
        self.funcoes = {}   # nome da rotina -> variável com o valor de retorno (AX = ... no B$EXSA)
        chamadas = set()
        for r in self.rotinas:
            for k, a, c, com in r["itens"]:
                if k == "cmd" and not c.startswith("CALL "):
                    chamadas |= set(re.findall(r"\b((?:FUN|F)_[0-9a-f_]+)\(", c))
        por_nome = {r["nome"]: i for i, r in enumerate(self.rotinas)}
        for nome in chamadas:
            i = por_nome.get(nome)
            while i is not None and i < len(self.rotinas):
                ret = next((mm.group(1) for k, a, c, com in self.rotinas[i]["itens"] if k == "cmd"
                            and c.startswith("END SUB") for mm in [re.search(r"AX = (\S+)", com or "")] if mm), None)
                if ret:
                    self.funcoes[nome] = ret
                    break
                i += 1
        self.nomes = {}
        if nomes_json and os.path.exists(nomes_json):
            self.nomes = {k: v for k, v in json.load(open(nomes_json, encoding="utf-8")).items()
                          if not k.startswith("_")}
        self.coleta_tipos()
        self.tr = Tradutor(self.tipos, self.nomes, self.matrizes)
        self.tr.funcao = self.nome_funcao
        self.tr.alias = self.alias
        self.fixas = {}             # endereço DS -> tamanho (strings de comprimento fixo)
        self.registros = {}         # endereço DS do registro de GET/PUT # -> tamanho
        self.usa_read = False
        self.onkey = []             # rótulos de ON KEY(n) GOSUB, na ordem (índice do ON RT_EV GOSUB)
        self.rotinas_asm = set()    # endereços lineares de rotinas em assembly chamadas (CALL SUB_x)
        self.tr.fixas = self.fixas
        self.avisos = list(self_avisos_pre)

    def coleta_tipos(self):
        tipos, conflitos, matrizes, dims = {}, {}, set(), {}
        for r in self.rotinas:
            for k, a, cmd, com in r["itens"]:
                if k != "cmd":
                    continue
                for m in RE_ID.finditer(cmd):
                    base, suf = m.group(1), m.group(2)
                    pos = m.end()
                    if pos < len(cmd) and cmd[pos] == "(" or base.startswith(("A_", "ST_")):
                        matrizes.add(base)
                    if suf:
                        if base in tipos and tipos[base] != suf:
                            conflitos.setdefault(base, {tipos[base]}).add(suf)
                        tipos.setdefault(base, suf)
                for m in re.finditer(r"\b(?:RE)?DIM (\w+)\(([^)]*)\)\s*(?:'|$)", cmd + " "):
                    dims[m.group(1)] = m.group(2)
        # matriz que só aparece em DIM/ERASE/GET gráfico: tipo pelo tamanho do elemento do DIM
        elem = {}
        for r in self.rotinas:
            for k, a, cmd, com in r["itens"]:
                m = re.match(r"^(?:RE)?DIM (\w+)\(", cmd) if k == "cmd" else None
                mm = re.search(r"elemento (\d+) bytes", com or "") if m else None
                if mm:
                    suf = {"2": "%", "4": "!", "8": "#"}.get(mm.group(1), "!")
                    elem[(r["nome"], m.group(1))] = suf
                    if m.group(1).startswith(("A_", "ST_")):
                        tipos.setdefault(m.group(1), suf)
                        matrizes.add(m.group(1))
        self.tipos, self.conflitos, self.matrizes, self.dims_lift = tipos, conflitos, matrizes, dims
        self.estaticas()
        # locais e parâmetros (L_BPxx, P_BPxx) têm tipo por rotina: o mesmo [BP-xx] muda de SUB para SUB
        self.tipos_rot = {}
        self.tipos_mat = {}   # (rotina, matriz) -> tipo do elemento, pelo uso com índice
        for r in self.rotinas:
            loc = {}
            for k, a, cmd, com in r["itens"]:
                if k == "cmd":
                    for m in re.finditer(r"\b([LP]_BP[0-9a-f]{2,3})([$!#%&])", cmd):
                        loc.setdefault(m.group(1), m.group(2))
                    for m in re.finditer(r"\b([LP]_BP[0-9a-f]{2,3})([$!#%&])\(", cmd):
                        self.tipos_mat.setdefault((r["nome"], m.group(1)), m.group(2))
            self.tipos_rot[r["nome"]] = loc
        for (rn, b), suf in elem.items():
            if b.startswith(("L_BP", "P_BP")):
                self.tipos_mat.setdefault((rn, b), suf)
        self.rot_atual = None

    # ---------------------------------------------------------- comandos
    def estaticas(self):
        """Matrizes estáticas (ST_xxxx: elemento 0 em DS:xxxx, acesso sem B$HARY). O BC do QB4.5
        acessa o elemento de índice constante como variável simples, e o lift mostra V_yyyy; os
        dois nomes são a mesma memória. Monta self.st = {base: (sufixo, n. de elementos)} e
        self.alias = {endereço: (base, índice, sufixo)}: V_yyyy com o mesmo tipo, alinhado ao
        tamanho do elemento, entre a base e a próxima variável que não é elemento (outra ST_,
        variável de outro tipo ou desalinhada, descritor de matriz)."""
        tam = {"!": 4, "#": 8, "%": 2, "&": 4, "$": 4}
        bases, usos = {}, {}
        for r in self.rotinas:
            for k, a, cmd, com in r["itens"]:
                if k != "cmd":
                    continue
                for m in re.finditer(r"\bST_([0-9a-f]+)([$!#%&])\(", cmd):
                    bases[int(m.group(1), 16)] = m.group(2)
                for m in re.finditer(r"\b([VA])_([0-9a-f]{4})([$!#%&]?)", cmd):
                    usos.setdefault(int(m.group(2), 16), set()).add((m.group(1), m.group(3)))
        # Índice i - 1 / i + 1 vira outra base, um elemento antes ou depois (VIGA: ST_19a0!(i) =
        # ST_19a4!(i - 1)). Bases do mesmo tipo a um elemento de distância são a mesma matriz, que
        # começa na menor; self.desloc = {base: (início, k)}: ST_base(x) = ST_início(k + x).
        self.desloc = {}
        ordem = []
        for b in sorted(bases):
            ant = ordem[-1] if ordem else None
            ult = max([ant] + [x for x, (ini, _) in self.desloc.items() if ini == ant]) if ant is not None else None
            if ant is not None and bases[ant] == bases[b] and b - ult == tam[bases[b]]:
                self.desloc[b] = (ant, (b - ant) // tam[bases[b]])
            else:
                ordem.append(b)
        # DIM SHARED ST_ escrito à mão em correcoes.json (contorno de família): vale o tamanho de lá
        # e o tradutor não declara de novo.
        self.st_mao = {}
        for (exe, _), linhas in CORRECOES.items():
            if exe != self.exe or not isinstance(linhas, list):
                continue
            for l in linhas:
                if l.lstrip().upper().startswith("DIM "):
                    for m in re.finditer(r"\bST_([0-9a-f]+)([$!#%&])\(0 TO (\d+)\)", l):
                        self.st_mao[int(m.group(1), 16)] = int(m.group(3)) + 1
        # variável de FOR não pode ser elemento de matriz no QB64 (e é escalar no original)
        self.for_vars = set()
        for r in self.rotinas:
            for k, a, cmd, com in r["itens"]:
                m = re.match(r"^FOR V_([0-9a-f]{4})", cmd) if k == "cmd" else None
                if m:
                    self.for_vars.add(int(m.group(1), 16))
        self.st, self.alias = {}, {}
        for i, b in enumerate(ordem):
            suf = bases[b]
            t = tam[suf]
            lim = ordem[i + 1] if i + 1 < len(ordem) else None
            if b in self.st_mao:
                lim = b + self.st_mao[b] * t if lim is None else min(lim, b + self.st_mao[b] * t)
            ultd = max([b] + [x for x, (ini, _) in self.desloc.items() if ini == b])
            d = self.descritor_de(ultd, t)
            if d:   # o descritor do BC diz onde a matriz acaba
                fim = d[0] + d[2] * t
                lim = fim if lim is None else min(lim, fim)
            fv = [e for e in self.for_vars if e > b]
            if fv:
                lim = min(fv) if lim is None else min(lim, min(fv))
            if not d and b not in self.st_mao:
                uso = self.tamanho_pelo_uso(b, suf, t)
                if uso:   # sem descritor: o tamanho que o uso garante, para não engolir escalares vizinhos
                    lim = b + uso * t if lim is None else min(lim, b + uso * t)
            n, end = 1, b + t
            maior = max([e for e in usos if e >= b], default=b)
            while end <= maior and (lim is None or end < lim):
                u = usos.get(end)
                if u is not None and u != {("V", suf)} and u != {("V", ""), ("V", suf)}:
                    break
                n += 1
                end += t
            for k in range(n):
                if b + k * t in usos:
                    self.alias[b + k * t] = (b, k, suf)
            self.st[b] = (suf, n)

    def tamanho_pelo_uso(self, b, suf, t):
        """Tamanho de uma matriz estática sem descritor no DS, pelo uso no lift (None = não dá
        para saber; vale o espaço até a variável seguinte). Índices constantes contam pelo maior;
        índice variável `v + k` conta pelo limite do FOR de v que envolve o acesso, quando os
        limites são constantes; sem FOR conhecido, um padrão de linhas `v`, `v + s`, `v + 2s`...
        (matriz de 2 dimensões com s colunas, VIGA ST_1b78!: v e v + 10) dá max(k) + s. Se um
        acesso não cabe em nenhuma dessas regras, None."""
        nomes = {b: 0}
        nomes.update({x: k for x, (ini, k) in self.desloc.items() if ini == b})
        maior, livres, desconhecido = -1, [], False
        for r in self.rotinas:
            cmds = [(a, c) for k_, a, c, com in r["itens"] if k_ == "cmd"]
            for i, (a, c) in enumerate(cmds):
                for x, desl in nomes.items():
                    nm = f"ST_{x:04x}{suf}("
                    j = 0
                    while True:
                        j = c.find(nm, j)
                        if j < 0:
                            break
                        q, nv = j + len(nm), 1
                        while q < len(c) and nv:
                            nv += {"(": 1, ")": -1}.get(c[q], 0)
                            q += 1
                        arg = c[j + len(nm):q - 1].strip()
                        j = q
                        if re.fullmatch(r"-?\d+", arg):
                            maior = max(maior, int(arg) + desl)
                            continue
                        mm = re.fullmatch(r"(?:CINT\()?([VL]_\w+[!%&#]?)(?: ([+-]) (\d+(?:\.0)?))?\)?(?: ([+-]) (\d+))?", arg)
                        if not mm:
                            desconhecido = True
                            continue
                        v = mm.group(1)
                        off = 0
                        if mm.group(3):
                            off += int(float(mm.group(3))) * (1 if mm.group(2) == "+" else -1)
                        if mm.group(5):
                            off += int(mm.group(5)) * (1 if mm.group(4) == "+" else -1)
                        teto = None
                        for i2 in range(i - 1, -1, -1):
                            fm = re.match(r"^FOR " + re.escape(v) + r" = (.*?) TO (.*?)(?: STEP .*)?$", cmds[i2][1])
                            if fm:
                                if any(cc == f"NEXT {v}" for _, cc in cmds[i + 1:]) and \
                                        re.fullmatch(r"-?\d+(\.0)?", fm.group(1)) and re.fullmatch(r"-?\d+(\.0)?", fm.group(2)):
                                    teto = int(float(fm.group(2)))
                                break
                        if teto is not None:
                            maior = max(maior, teto + off + desl)
                        else:
                            livres.append(off)
        if desconhecido:
            return None
        if livres:
            offs = sorted(set(livres))
            if len(offs) < 2:
                return None
            passo = offs[1] - offs[0]
            if passo <= 1 or any((o - offs[0]) % passo for o in offs):
                return None
            maior = max(maior, offs[-1] + passo - 1 + max(0, -offs[0]))
        return maior + 1 if maior >= 0 else None

    def ds(self):
        """Bytes do DS (DGROUP) do EXE original, pelo prep/<EXE>.prep.json do dump."""
        if getattr(self, "_ds", None) is None:
            pj = os.path.join(os.path.dirname(self.dump.rstrip("/\\")), "prep", self.exe + ".prep.json")
            try:
                pr = json.load(open(pj, encoding="utf-8"))
                self._ds = open(pr["original"], "rb").read()[pr["ds_offset_arquivo"]:]
            except (OSError, KeyError, ValueError):
                self._ds = b""
        return self._ds

    def descritor(self, a):
        """Descritor de matriz ESTÁTICA em DS:a (o operando A_xxxx do ERASE de matriz estática):
        dados (2), segmento (2), 0 (4), n. de dimensões (1), 40h (1), dados (2), tamanho do
        elemento (2) e, por dimensão, n. de elementos (2) e limite inferior (2). Devolve
        (endereço dos dados, tamanho do elemento, n. total de elementos) ou None."""
        ds = self.ds()
        if a + 14 > len(ds) or ds[a + 9] != 0x40 or not 1 <= ds[a + 8] <= 4 or ds[a + 4:a + 8] != bytes(4):
            return None
        dado, t = struct.unpack_from("<HxxxxxxxxH", ds, a)[0], struct.unpack_from("<H", ds, a + 12)[0]
        if t not in (2, 4, 8) or ds[a + 10:a + 12] != ds[a:a + 2]:
            return None
        n = 1
        for k in range(ds[a + 8]):
            n *= struct.unpack_from("<H", ds, a + 14 + 4 * k)[0]
        return (dado, t, n) if 0 < n < 16384 else None

    def descritor_de(self, b, t):
        """Descritor estático (procurado no DS) cujos dados cobrem DS:b, com elemento de t bytes."""
        if getattr(self, "_descs", None) is None:
            ds, self._descs = self.ds(), []
            for a in range(0, max(0, len(ds) - 14)):
                if ds[a + 9] == 0x40 and ds[a + 10:a + 12] == ds[a:a + 2]:
                    d = self.descritor(a)
                    if d:
                        self._descs.append(d)
        return next((d for d in self._descs if d[1] == t and d[0] <= b < d[0] + d[2] * t), None)

    def asm(self, a, antes=0, depois=40):
        """Instruções do .asm do dump em volta do endereço a: lista de (endereço, texto), com até
        `antes` instruções anteriores e `depois` a partir de a. [] se a não está em nenhum .asm."""
        if getattr(self, "_asm", None) is None:
            self._asm, self._asm_pos = [], {}
            d = os.path.join(self.dump, self.exe)
            for f in sorted(os.listdir(d)):
                if not f.endswith(".asm"):
                    continue
                ls = []
                for l in open(os.path.join(d, f), encoding="utf-8", errors="replace"):
                    m = re.match(r"^0x([0-9a-f]+): (.*?)\s*$", l)
                    if m:
                        ls.append((int(m.group(1), 16), m.group(2)))
                for i, (e, _) in enumerate(ls):
                    self._asm_pos.setdefault(e, (len(self._asm), i))
                self._asm.append(ls)
        if a not in self._asm_pos:
            return []
        f, i = self._asm_pos[a]
        return self._asm[f][max(0, i - antes):i + depois]

    def opcao_lnin(self, a):
        """Último argumento do B$LNIN do LINE INPUT em a (1 = normal, 3 = LINE INPUT ; sem CR LF)."""
        ult = None
        for e, t in self.asm(a):
            m = re.match(r"^MOV AX, 0x([0-9a-f]+)$", t)
            if m:
                ult = int(m.group(1), 16)
            elif t.startswith("XOR AX, AX"):
                ult = 0
            if "B$LNIN" in t:
                return ult
        return None

    def swap_inline(self, a, n):
        """SWAP de duas variáveis simples que o BC compila sem o runtime e o lift mostra como
        "?? n bytes": MOV SI,a / MOV BX,b / (MOV AX,[SI+k] / XCHG [BX+k],AX / MOV [SI+k],AX)...
        (global) ou MOV AX,[x] / MOV DX,[x+2] / XCHG [y],AX / XCHG [y+2],DX / MOV [x],AX / ...
        (local [BP-k] ou global [0xHHHH]). Devolve "SWAP x, y" com os nomes do lift, ou None."""
        ins = self.asm(a, antes=4, depois=24)
        ins = [(e, t) for e, t in ins if e < a + n]
        k = max([i for i, (e, t) in enumerate(ins) if e < a and "B$EVCK" in t] + [-1])
        ins = ins[k + 1:]
        if not ins or not any(t.startswith("XCHG") for _, t in ins):
            return None
        reg = {}
        orig, dest = [], []

        def ender(op):
            op = op.strip()
            m = re.match(r"^word ptr \[(SI|BX)(?: \+ 0x([0-9a-f]+))?\]$", op)
            if m:
                return ("DS", reg[m.group(1)] + int(m.group(2) or "0", 16)) if m.group(1) in reg else None
            m = re.match(r"^word ptr \[BP \+ (-?)0x([0-9a-f]+)\]$", op)
            if m:
                v = int(m.group(2), 16)
                v = -v if m.group(1) else (v - 0x10000 if v >= 0x8000 else v)
                return ("BP", v)
            m = re.match(r"^word ptr \[0x([0-9a-f]+)\]$", op)
            if m:
                return ("DS", int(m.group(1), 16))
            return None
        for _, t in ins:
            m = re.match(r"^MOV (SI|BX), 0x([0-9a-f]+)$", t)
            if m:
                reg[m.group(1)] = int(m.group(2), 16)
                continue
            m = re.match(r"^MOV (AX|DX), (.*)$", t)
            if m:
                e = ender(m.group(2))
                if e is None:
                    return None
                orig.append(e)
                continue
            m = re.match(r"^XCHG (.*), (AX|DX)$", t)
            if m:
                e = ender(m.group(1))
                if e is None:
                    return None
                dest.append(e)
                continue
            m = re.match(r"^MOV (.*), (AX|DX)$", t)
            if m and ender(m.group(1)) in orig:
                continue
            return None
        if not orig or len(orig) != len(dest) or len({x[0] for x in orig + dest}) != 1:
            return None
        tam = 2 * len(orig)
        o, d = min(x[1] for x in orig), min(x[1] for x in dest)
        if sorted(x[1] - o for x in orig) != list(range(0, tam, 2)) or sorted(x[1] - d for x in dest) != list(range(0, tam, 2)):
            return None

        def nome(seg, v):
            base = f"V_{v:04x}" if seg == "DS" else (f"L_BP{-v:x}" if v < 0 else None)
            if base is None:
                return None
            suf = {2: "%", 8: "#"}.get(tam)
            if tam == 4:
                suf = "&" if self.tipos.get(base) == "&" else "!"
            return base + suf if suf else None
        x, y = nome(orig[0][0], o), nome(dest[0][0], d)
        return f"SWAP {x}, {y}" if x and y else None

    def st_base(self, s):
        """ST_base(x) de uma base deslocada (ver estaticas) -> ST_início(k + x)."""
        if not self.desloc:
            return s

        def troca(m):
            d = self.desloc.get(int(m.group(1), 16))
            return f"ST_{d[0]:04x}{m.group(2)}({d[1]} + " if d else m.group(0)
        return re.sub(r"\bST_([0-9a-f]+)([$!#%&])\(", troca, s)

    def cmd(self, a, s, com, rot):
        self.rot_atual = rot["nome"]
        key = (self.exe, a)
        if (self.exe, a, getattr(self, "nth", 1)) in CORRECOES:
            key = (self.exe, a, self.nth)
        if key in CORRECOES:
            if CORRECOES[key] == P:
                return ["' PROTECAO (removido)"], None
            out = []
            for l in CORRECOES[key]:
                out += self._cmd(a, self.st_base(l[5:].strip()), com, rot)[0] if l.startswith("lift:") else [l]
            return out, "correcao manual"
        try:
            return self._cmd(a, self.st_base(s), com, rot)
        except Exception as e:  # noqa
            self.avisos.append(f"0x{a:x}: {e}: {s}")
            return [f"'RETRAD? {s}   ' ({e})"], None

    def lista_args(self, s):
        """Divide 'a, b, c' no nível zero de parênteses."""
        out, nivel, cur, dentro = [], 0, "", False
        for ch in s:
            if ch == '"':
                dentro = not dentro
            if not dentro:
                if ch == "(":
                    nivel += 1
                elif ch == ")":
                    nivel -= 1
                elif ch == "," and nivel == 0:
                    out.append(cur.strip())
                    cur = ""
                    continue
            cur += ch
        if cur.strip() or out:
            out.append(cur.strip())
        return out

    def itens_print(self, s):
        """Itens de PRINT: expressões separadas por ; e , (no nível zero)."""
        out, nivel, cur, dentro = [], 0, "", False
        for ch in s:
            if ch == '"':
                dentro = not dentro
            if not dentro:
                if ch == "(":
                    nivel += 1
                elif ch == ")":
                    nivel -= 1
                elif ch in ";," and nivel == 0:
                    out.append((cur.strip(), ch))
                    cur = ""
                    continue
            cur += ch
        out.append((cur.strip(), ""))
        return out

    def usando(self, ini, fmt, s):
        """[L]PRINT [#n,] USING fmt; itens. O lift põe o USING na frente, mas no .asm os
        TAB(n)/SPC(n) do começo (com o "" que segue o B$FTAB) vêm antes do B$USNG: no QB4.5 esse
        "" não consome campo do formato, e no QB64, dentro do USING, consome (erro 13 no ARMADURA
        0x247a2 e no VIGA 0x2297e). Esses itens saem num PRINT antes do PRINT USING."""
        itens = self.itens_print(s)
        # comando que termina em ";" pode continuar depois de um CALL (P4 da VIGA): guarda o canal,
        # o formato e quantos campos já foram usados
        self.using_aberto = None
        if len(itens) > 1 and itens[-1] == ("", "") and itens[-2][1] == ";":
            n = sum(1 for i, _ in itens if i and not re.match(r"^(TAB|SPC)\(", i) and i != '""')
            self.using_aberto = dict(ini=ini, fmt=fmt, n=n, a=self.a_atual, rot=self.rot_atual)
        j = 0
        while j < len(itens) and re.match(r"^(TAB|SPC)\(", itens[j][0]):
            j += 1
            if j < len(itens) and itens[j][0] == '""':
                j += 1
        pre = []
        lpt = ini == "PRINT #RT_LPT, "
        if 0 < j < len(itens):
            antes = " ".join(i + sep for i, sep in itens[:j])
            s = " ".join(i + sep for i, sep in itens[j:])
            pre = self.lp_itens(antes) if lpt else [f"{ini}{self.print_itens(antes)}"]
        # LPRINT USING: o RT45 confere a coluna da LPT1 depois (quebra na largura)
        return pre + [f"{ini}USING {fmt}; {self.print_itens(s, fmt)}"] + (["RT_LPTQUEBRA 0"] if lpt else [])

    def abre(self, nome, modo, n, ln):
        """OPEN de arquivo. Dispositivo do DOS (LPT1:, PRN... ; VPCAD 0x30e89, VIGA R9) vai para o
        arquivo da impressora do RT45 em acréscimo: RT_DISP% fecha a impressora do LPRINT e
        RT_ARQ$ devolve o nome dela."""
        if modo == "OUTPUT":
            return (f"IF RT_DISP%({nome}) THEN OPEN RT_ARQ$({nome}) FOR APPEND AS #{n} "
                    f"ELSE OPEN RT_ARQ$({nome}) FOR OUTPUT AS #{n}{ln}")
        return f"OPEN RT_ARQ$({nome}) FOR {modo} AS #{n}{ln}"

    def lp_itens(self, s):
        """Itens de LPRINT sem USING como chamadas do RT45, que contam a coluna da LPT1 como o
        BRUN45 (só caracteres >= 32 andam; CR volta a 0): TAB, SPC e "," partem dessa coluna
        (DESENHO D7: FF e ESC não contam) e o item que não cabe na linha começa na seguinte
        (VIGA R3). Número sai como no PRINT: STR$ e um espaço."""
        T = self.tr
        out = []
        itens = self.itens_print(s) if s else [("", "")]
        for item, sep in itens:
            if item:
                mm = re.match(r"^(TAB|SPC)\((.*)\)$", item)
                if mm:
                    out.append(f"RT_LP{'TAB' if mm.group(1) == 'TAB' else 'SPC'} {T.arg_int(mm.group(2))}")
                else:
                    c, t, e = T.expr(item)
                    c = T.cast(c, t, e)
                    num = f"RT_STR8$({c})" if t == DBL else f"STR$({c})"
                    out.append(f"RT_LPS {c}" if t == STR else f'RT_LPS {num} + " "')
            if sep == ",":
                out.append("RT_LPVIRG")
        if not (len(itens) > 1 and itens[-1] == ("", "") and itens[-2][1] in ";,"):
            out.append("RT_LPFIM")
        return out

    def print_itens(self, s, fmt=None, tela=False):
        partes = []
        k = 0
        itens = self.itens_print(s)
        for item, sep in itens:
            if item:
                if re.match(r"^(TAB|SPC)\(", item):
                    c, t, e = self.tr.expr(item[4:-1])
                    item_t = item[:4] + c + ")"
                else:
                    c, t, e = self.tr.expr(item)
                    c = self.tr.cast(c, t, e)
                    if fmt is not None and t != STR:
                        k += 1
                        c = f"RT_PU#({c}, {fmt}, {k})"
                    elif fmt is None and t == DBL:   # PRINT de DOUBLE: 16 algarismos, como o STR$ (R10)
                        c = f'RT_STR8$({c}) + " "'
                    item_t = c
                partes.append(item_t)
            if sep == "," and tela:
                # zona de 14 colunas: depois da coluna 66 o BRUN45 passa para a linha seguinte (sonda T15)
                partes += [";", "RT_VIRG$", ";"]
            elif sep:
                partes.append(sep)
        txt = ""
        for p in partes:
            if p in (";", ","):
                txt = txt.rstrip() + p + " "
            else:
                txt += p
        return txt.rstrip()

    def _cmd(self, a, s, com, rot):
        T = self.tr
        self.a_atual = a
        for m in re.finditer(r"\b([LP]_BP[0-9a-f]{2,3})([$!#%&])", s):
            T.recente[m.group(1)] = m.group(2)
        s = s.replace(", #32767)", ")")   # INPUT$(n, #32767) = teclado
        U = s.upper()
        if s == "":
            return [], None
        m = re.match(r"^CLOSE #?(\d+)$", s)
        if m:
            return [f"CLOSE #{m.group(1)}"], None
        m = re.match(r"^NAME (.*) AS (.*)$", s)
        if m:
            return [f"NAME RT_ARQ$({T.expr(m.group(1))[0]}) AS RT_ARQ$({T.expr(m.group(2))[0]})"], None
        # ---------- controle
        m = re.match(r"^IF NOT \((.*)\) THEN GOTO (L_[0-9a-f]+)$", s)
        if m:
            c, t, e = T.expr(m.group(1))
            return [f"IF NOT ({c}) THEN GOTO {m.group(2)}"], None
        m = re.match(r"^IF (.*) THEN GOTO (L_[0-9a-f]+)$", s)
        if m:
            c, t, e = T.expr(m.group(1))
            return [f"IF {c} THEN GOTO {m.group(2)}"], None
        m = re.match(r"^(GOTO|GOSUB) (L_[0-9a-f]+(?:_v)?)$", s)
        if m:
            return [s], None
        if s == "RETURN":
            return ["RETURN"], None
        if s.startswith("RETURN (rótulo)"):
            return ["RETURN_ROTULO"], None  # resolvido em monta(): junta com o GOTO seguinte
        m = re.match(r"^ON ERROR GOTO (L_[0-9a-f]+)$", s)
        if m:
            return [f"ON ERROR GOTO {m.group(1)}", f"RT_ONERR = &H{m.group(1)[2:]}"], None
        if s in ("RESUME NEXT", "RESUME") or re.match(r"^RESUME L_[0-9a-f]+$", s):
            return [s], None
        if s == "END":
            return ["RT_FIM"], "END: o QB64 pede tecla no END; RT_FIM fecha como o BRUN45"
        if s.startswith("END SUB / EXIT SUB"):
            return ["EXIT_SUB"], None
        m = re.match(r"^CHAIN (.*)$", s)
        if m:
            c, t, e = T.expr(m.group(1))
            return [f"RT_CHAIN {c}"], None
        m = re.match(r"^FOR (\S+) = (.*?) TO (.*?)(?: STEP (.*))?$", s)
        if m:
            v, tv = T.nome(m.group(1))
            ini = T.expr(m.group(2))[0]

            def no_tipo(x):
                # o QB4.5 guarda limite e passo no tipo da variável do FOR (T5: FOR j! = 0 TO d#
                # STEP x! dá 2 voltas; o QB64 compara com o DOUBLE e dá 1)
                c, t, e = T.expr(x)
                if (tv or SNG) == SNG and (t == DBL or e):
                    return f"RT_SNG!({c})" if e else f"RT_SNG!(FX##({c}))"
                if tv == DBL and e:
                    return f"RT_DBL#({c})"
                if tv in (INT, LNG) and t in FLOAT:
                    return f"{'CINT' if tv == INT else 'CLNG'}({c})"
                return c
            lim = no_tipo(m.group(3))
            passo = f" STEP {no_tipo(m.group(4))}" if m.group(4) else ""
            return [f"FOR {v} = {ini} TO {lim}{passo}"], None
        m = re.match(r"^NEXT (\S+)$", s)
        if m:
            return [f"NEXT {T.nome(m.group(1))[0]}"], None
        # ---------- tela
        m = re.match(r"^PRINT USING (\"[^\"]*\"|\S+?); (.*)$", s)
        if m:
            fmt = m.group(1)
            return [": ".join(self.usando("PRINT ", fmt, m.group(2)))], None
        m = re.match(r"^LPRINT USING (\"[^\"]*\"|\S+?); (.*)$", s)
        if m:
            fmt = m.group(1)
            return ["RT_LPTABRE: " + ": ".join(self.usando("PRINT #RT_LPT, ", fmt, m.group(2)))], None
        if U == "PRINT":
            return ["PRINT"], None
        m = re.match(r"^PRINT (.*)$", s)
        ua = getattr(self, "using_aberto", None)
        if m and not s.startswith("PRINT #") and ua and ua["rot"] == rot["nome"] and 0 < a - ua["a"] < 0x400                 and any("B$EVCK" in t for e, t in self.asm(ua["a"], depois=1)) \
                and not any("B$EVCK" in t or "B$PE" in t for e, t in self.asm(ua["a"], depois=400) if ua["a"] < e <= a):
            # (B$PEOS/B$PER4/...: o PRINT USING já terminou; PILAR P14)
            # o PRINT USING de antes não terminou: o BC calculou um item com CALL (MAX do MIXT) no
            # meio do comando, e o lift partiu em dois (VIGA 0x2a4bc/0x2a5a8, sem B$EVCK entre
            # eles). Continua no mesmo canal, com o formato a partir do campo seguinte.
            self.using_aberto = None
            fmt = f"RT_USING_RESTO$({ua['fmt']}, {ua['n']})"
            fim = ": RT_LPTQUEBRA 0" if ua["ini"] == "PRINT #RT_LPT, " else ""
            return [f"{ua['ini']}USING {fmt}; {self.print_itens(m.group(1), fmt)}{fim}"], "continua o PRINT USING de " + endereco_txt(ua["a"])
        if m and not s.startswith("PRINT #"):
            # SPC(n) na tela: o QB4.5 escreve os espaços e passa para a linha seguinte (VIGA 0x28b8b)
            return [f"PRINT {self.print_itens(m.group(1), tela=True)}".replace("SPC(", "RT_SPC$(").replace("TAB(", "RT_TAB$(")], None
        m = re.match(r"^LPRINT ?(.*)$", s)
        if m:
            return ["RT_LPTABRE: " + ": ".join(self.lp_itens(m.group(1)))], None
        m = re.match(r"^KEY\((.*)\) (ON|OFF|STOP)$", s)
        if m:
            n = T.expr(m.group(1))[0]
            return [f"KEY({n}) {m.group(2)}", f"RT_KEYESTADO {n}, {dict(ON=1, OFF=0, STOP=2)[m.group(2)]}"], None
        m = re.match(r"^(LOCATE|COLOR|VIEW PRINT|SCREEN|CLS|BEEP|CLOSE|SOUND)\b ?(.*)$", s)
        if m:
            kw, resto = m.group(1), m.group(2)
            if kw == "SCREEN":
                return [f"RT_SCREEN {T.expr(resto)[0]}"], None
            if kw == "VIEW PRINT":
                mm = re.match(r"^(.*) TO (.*)$", resto)
                return [f"RT_VIEWPRINT {T.expr(mm.group(1))[0]}, {T.expr(mm.group(2))[0]}"], None
            if kw == "SOUND":
                ar = [T.expr_tipada(x)[0] for x in self.lista_args(resto)]
                return ["SOUND " + ", ".join(ar)], None
            if resto and not kw.startswith("KEY("):
                ar = [T.expr(x)[0] if x else "" for x in self.lista_args(resto)]
                if kw == "CLS":   # CLS gráfico põe o último ponto no centro (G4, sonda T16)
                    return [f"RT_CLS {T.arg_int(resto)}"], None
                return [f"{kw} " + ", ".join(ar)], None
            if kw.startswith("KEY("):
                mm = re.match(r"^KEY\((.*)\) ON$", s)
                return [f"KEY({T.expr(mm.group(1))[0]}) ON"], None
            if kw == "CLOSE":
                return ["RT_CLOSE"], "CLOSE sem numero: nao fecha a impressora (LPT1) do LPRINT"
            if kw == "CLS":
                return ["RT_CLS -1"], None
            return [kw], None
        m = re.match(r"^KEY (\d+), (.*)$", s)
        if m:
            d = T.expr(m.group(2))[0]
            return [f"KEY {m.group(1)}, {d}", f"RT_KEYDEF {m.group(1)}, {d}"], None
        m = re.match(r"^ON KEY\((.*)\) GOSUB (L_[0-9a-f]+)$", s)
        if m:
            n = T.expr(m.group(1))[0]
            if m.group(2) not in self.onkey:
                self.onkey.append(m.group(2))
            return [f"ON KEY({n}) GOSUB {m.group(2)}", f"RT_ONKEY {n}, {self.onkey.index(m.group(2)) + 1}"], None
        m = re.match(r'^LINE INPUT "([^"]*)"; (.*)$', s)
        if m:
            prompt = m.group(1)
            v = T.expr(m.group(2))[0]
            if self.opcao_lnin(a) == 3:   # LINE INPUT ; (B$LNIN opção 3): o cursor fica na linha
                return [f'RT_LINEINPUTPV "{prompt}", {v}'], "LINE INPUT ; (B$LNIN 3)"
            return [f'RT_LINEINPUT "{prompt}", {v}'], None
        # ---------- gráficos
        m = re.match(r"^(PSET|PRESET|LINE|GET|PUT|CIRCLE) ?(.*)$", s)
        if m and (m.group(2).startswith("(") or m.group(2).startswith("-(") or m.group(2).startswith("STEP")):
            return self.grafico(m.group(1), m.group(2), com), None
        if s in ("WINDOW", "VIEW"):
            mm = re.search(r"B\$(WIND|VIEW)\((.*)\)", com)
            if not mm:
                return [f"RT_{s} 0" + (", 0, 0, 0, 0" if s == "WINDOW" else ", 0, 0, 0, 0, -1, -1")], "sem argumentos (B$WIN0/B$VEW0)"
            if mm.group(1) == "WIND":
                # x1, y1, x2, y2 como SINGLE por valor (par de palavras alta/baixa de constante ou
                # de variável, ou um valor já convertido), depois o indicador: diferente de 0 =
                # WINDOW SCREEN (BRUN45 017D:9F4F grava [295h])
                vals, flag = self.singles_rt(self.lista_args(mm.group(2)), 4)
                t = 1 if flag != "0" else 2
                return [f"RT_WINDOW {t}, " + ", ".join(f"({v})" for v in vals[:4])], "B$WIND decodificado"
            # VIEW: x1, y1, x2, y2 (INTEGER), cor, borda (-1 = sem), indicador (diferente de 0 =
            # VIEW SCREEN; com 0 o BRUN45 017D:41ED move a origem para o canto da janela)
            ar = self.lista_args(mm.group(2))
            xs = [T.expr(x)[0] for x in ar[:6]]
            t = 1 if ar[6] != "0" else 2
            return [f"RT_VIEW {t}, " + ", ".join(f"({v})" for v in xs)], "B$VIEW decodificado"
        # ---------- matrizes
        m = re.match(r"^(DIM|REDIM) (\w+)\((.*)\)$", s)
        if m:
            nm, suf = self.nome_matriz(m.group(2), rot)
            if not suf:
                mm = re.search(r"elemento (\d+) bytes", com)
                suf = {"2": "%", "4": "!", "8": "#"}.get(mm.group(1) if mm else "", "!")
                nm += suf
            # a matriz já foi declarada no início (REDIM SHARED no programa, REDIM na SUB): o DIM
            # do QB64 daria erro 10 (Duplicate definition) na execução. REDIM aloca e zera, como o DIM.
            kw = "REDIM"
            return [f"{kw} {nm}({m.group(3)})"], None
        m = re.match(r"^ERASE (\w+)$", s)
        if m and m.group(1).startswith(("L_BP", "P_BP")):
            return [f"ERASE {self.nome_matriz(m.group(1), rot)[0]}"], None
        if m and m.group(1).startswith("A_") and self.descritor(int(m.group(1)[2:], 16)):
            # ERASE de matriz estática: o operando é o descritor (área de constantes); zera os
            # elementos, que no QB64 são ST_(k) ou variáveis simples V_
            dado, t, n = self.descritor(int(m.group(1)[2:], 16))
            suf0 = {2: "%", 8: "#"}.get(t)
            zeros = []
            for k in range(n):
                e = dado + k * t
                v = f"V_{e:04x}"
                suf = suf0 or ("&" if self.tipos.get(v) == "&" else "!")
                st = next(((b, (e - b) // t) for b, (sf, nn) in self.st.items()
                           if sf == suf and b <= e < b + nn * t and (e - b) % t == 0), None)
                zeros.append(f"ST_{st[0]:04x}{suf}({st[1]}) = 0" if st else f"{T.nome(v + suf)[0]} = 0")
            out = [": ".join(zeros[i:i + 8]) for i in range(0, len(zeros), 8)]
            return out, f"ERASE de matriz estatica: descritor em DS:{m.group(1)[2:]} ({n} elementos de {t} bytes em DS:{dado:04X})"
        if m:
            # ERASE de matriz dinâmica do programa ou do COMMON: volta ao estado "não dimensionada"
            # do RT45 (REDIM com limite -32768). O ERASE do QB64 deixa a matriz sem limites e o
            # LBOUND do RT_COMMON_GRAVA dá erro 9 no CHAIN seguinte (PILAR P4); o sufixo e o número
            # de índices vêm do COMMON ou das declarações (PILAR P1: ERASE A_12ae sem sufixo).
            nm = T.nome(m.group(1))[0]
            return ["{ERASE_DIN " + m.group(1) + " " + nm + "}"], None
        m = re.match(r"^SWAP (.*)$", s)
        if m:
            a1, a2 = self.lista_args(m.group(1))
            return [f"SWAP {T.expr(a1)[0]}, {T.expr(a2)[0]}"], None
        # ---------- chamadas
        m = re.match(r"^(\S+) = (MAX|MIN)\((.*)\)$", s)
        if m:
            mm = re.search(r"CALL (FUN_\w+)\(", com)
            a1, a2 = self.lista_args(m.group(3))
            dst = T.expr(m.group(1))[0]
            return [f"CALL {self.nome_sub(mm.group(1))}({T.expr(a1)[0]}, {T.expr(a2)[0]}, {dst})"], None
        m = re.match(r"^CALL (\w+)\((.*)\)$", s)
        if m:
            alvo = m.group(1)
            if alvo.startswith("SUB_"):
                lin = int(alvo[4:], 16)
                self.rotinas_asm.add(lin)
                return [f"RT_ROTINA_{lin & 0xFFFF:04X}"], f"rotina em assembly ligada ao EXE ({alvo}); gerada no fim do programa"
            ar = [self.arg_call(x) for x in self.lista_args(m.group(2))] if m.group(2) else []
            nome = self.nome_sub(alvo)
            return [f"CALL {nome}" + (f"({', '.join(ar)})" if ar else "")], None
        m = re.match(r'^OPEN "([IOARB])", #(\d+), (.*?)(?:, (\d+))?$', s)
        if m:
            modo = {"I": "INPUT", "O": "OUTPUT", "A": "APPEND", "R": "RANDOM", "B": "BINARY"}[m.group(1)]
            ln = f" LEN = {m.group(4)}" if m.group(4) else ""
            return [self.abre(T.expr(m.group(3))[0], modo, m.group(2), ln)], None
        m = re.match(r"^(LINE INPUT|INPUT) #(\d+), (.*)$", s)
        if m:
            vs = [T.expr(x)[0] for x in self.lista_args(m.group(3))]
            return [f"{m.group(1)} #{m.group(2)}, " + ", ".join(vs)], None
        m = re.match(r"^PRINT #(\d+), USING (\"[^\"]*\"|\S+?); (.*)$", s)
        if m:
            return [": ".join(self.usando(f"PRINT #{m.group(1)}, ", m.group(2), m.group(3)))], None
        m = re.match(r"^(PRINT|WRITE) #(\d+),? ?(.*)$", s)
        if m:
            it = self.print_itens(m.group(3)) if m.group(3) else ""
            return [f"{m.group(1)} #{m.group(2)}, {it}".rstrip(", ")], None
        m = re.match(r"^CLOSE #?(\d+)$", s)
        if m:
            return [f"CLOSE #{m.group(1)}"], None
        m = re.match(r"^ERROR (.*)$", s)
        if m:
            return [f"ERROR {T.expr(m.group(1))[0]}"], None
        m = re.match(r"^RUN (.*)$", s)
        if m:
            return [f"RT_RUN {T.expr(m.group(1))[0]}"], None
        m = re.match(r"^(SHELL|FILES|KILL|MKDIR|RMDIR|NAME) ?(.*)$", s)
        if m:
            arg = T.expr(m.group(2))[0] if m.group(2) else ""
            if m.group(1) == "FILES":
                return [f"RT_FILES {arg or chr(34) * 2}"], "FILES: cabecalho em forma DOS (RT45)"
            if m.group(1) in ("KILL", "MKDIR", "RMDIR") and arg:
                arg = f"RT_ARQ$({arg})"
            return [f"{'RT_SHELL' if m.group(1) == 'SHELL' else m.group(1)} {arg}".rstrip()], None
        if s == "CLEAR":
            return ["RT_CLEAR"], "CLEAR zera as variaveis do programa e do COMMON, nao o estado do RT45"
        m = re.match(r"^MID\$\((\w+)(\(.*?\))?, (.*)\) = (.*)$", s)
        if m:
            alvo = m.group(1) + (m.group(2) or "")
            if not m.group(2):
                nm = T.nome(m.group(1) + "$")[0]
            else:
                nm = T.expr(alvo.replace(m.group(1), m.group(1) + "$", 1))[0]
            pos = self.lista_args(m.group(3))
            pp = [T.expr(x)[0] for x in pos]
            if len(pp) == 2 and pp[1] == "32767":
                pp = pp[:1]
            chk = f"RT_MIDCHK ({pp[0]}), " + (f"({pp[1]})" if len(pp) > 1 else "0")   # R11: erro 5 como o QB4.5
            return [f"{chk}: MID$({nm}, {', '.join(pp)}) = {T.expr(m.group(4))[0]}"], None
        m = re.match(r"^READ (.*)$", s)
        if m:
            self.usa_read = True
            return ["READ " + ", ".join(T.expr(x)[0] for x in self.lista_args(m.group(1)))], None
        if s == "RESTORE":
            return ["RESTORE"], None
        m = re.match(r"^WIDTH LPRINT (.*)$", s)
        if m:
            return [f"RT_LPTLARGURA {T.expr(m.group(1))[0]}"], None
        m = re.match(r"^WIDTH (.*)$", s)
        if m:
            return ["WIDTH " + ", ".join(T.expr(x)[0] for x in self.lista_args(m.group(1)))], None
        m = re.match(r"^ENVIRON (.*)$", s)
        if m:
            return [f"ENVIRON {T.expr(m.group(1))[0]}"], None
        m = re.match(r"^OPEN (.*) FOR modo\((\d+)\) AS #(\d+)(?:, (\d+))?$", s)
        if m:
            modo = {1: "INPUT", 2: "OUTPUT", 4: "RANDOM", 8: "APPEND", 32: "BINARY"}.get(int(m.group(2)), "RANDOM")
            ln = f" LEN = {m.group(4)}" if m.group(4) else ""
            return [self.abre(T.expr(m.group(1))[0], modo, m.group(3), ln)], None
        m = re.match(r"^(GET|PUT) #(\d+), (.*), (V_[0-9a-f]{4})$", s)
        if m:
            mm = re.search(r"registro de (\d+) bytes", com)
            base, n = int(m.group(4)[2:], 16), int(mm.group(1))
            self.registros[base] = max(n, self.registros.get(base, 0))
            reg = self.tr.expr(m.group(3))[0]
            return [f"RT_REG_{base:04X}_{'LE' if m.group(1) == 'GET' else 'GRAVA'} {m.group(2)}, {reg}"], f"registro de {n} bytes"
        m = re.match(r"^CHDIR (.*)$", s)
        if m:
            return [f"CHDIR RT_ARQ$({T.expr(m.group(1))[0]})"], None
        m = re.match(r"^DEF SEG(?: = (.*))?$", s)
        if m:
            return [f"RT_DEFSEG {m.group(1) or '-1'}"], "DEF SEG: ver RT45 (B000 do Hercules)"
        m = re.match(r"^POKE (.*)$", s)
        if m:
            a1, a2 = self.lista_args(m.group(1))
            return [f"RT_POKE {T.expr(a1)[0]}, {T.expr(a2)[0]}"], None
        m = re.match(r"^PCOPY (.*)$", s)
        if m:
            a1, a2 = self.lista_args(m.group(1))
            return [f"PCOPY {T.expr(a1)[0]}, {T.expr(a2)[0]}"], None
        # ---------- atribuição
        dv = divide_atrib(s)
        if dv and RE_ID.match(dv[0]):
            mm = re.search(r"bloco/string fixa: (\d+) -> (\d+) bytes", com)
            if mm and re.match(r"^(V_[0-9a-f]{4}|L_BP[0-9a-f]+)$", dv[0]):
                # B$ASSN: atribuição a string de comprimento fixo (campo de registro): completa
                # com espaços ou corta no tamanho, como o QB4.5
                n = int(mm.group(2))
                if dv[0].startswith("V_"):
                    self.fixas[int(dv[0][2:], 16)] = n
                dst = T.nome(dv[0] + "$")[0]
                if int(mm.group(1)) and re.match(r"^V_[0-9a-f]{4}$", dv[1]):
                    self.fixas[int(dv[1][2:], 16)] = int(mm.group(1))
                    src = T.nome(dv[1] + "$")[0]
                    return [f"{dst} = RT_FIX$({src}, {n})"], "copia de bloco/string fixa"
                c, t, e = T.expr(dv[1])
                return [f"{dst} = RT_FIX$({c}, {n})"], "string fixa"
            dst, td, _ = T.expr(dv[0])
            c, t, e = T.expr(dv[1])
            if td in (INT, LNG) and (t in FLOAT or e):
                # FISTP: fora da faixa vira -32768 / -2147483648 sem erro (sonda T19: i% = 40000#)
                c = T.inteiro(c, t, e, td)
            return [f"{dst} = {c}"], None
        raise ValueError("comando não reconhecido")

    def singles_rt(self, ar, n):
        """Argumentos crus de rotina gráfica: n SINGLE por valor e o que sobrar (indicador)."""
        T = self.tr
        out, i = [], 0
        while len(out) < n and i < len(ar):
            x = ar[i]
            if re.match(r"^-?\d+$", x) and i + 1 < len(ar) and re.match(r"^-?\d+$", ar[i + 1]):
                hi, lo = int(x) & 0xFFFF, int(ar[i + 1]) & 0xFFFF
                out.append("%g" % struct.unpack("<f", struct.pack("<HH", lo, hi))[0])
                i += 2
                continue
            m1 = re.match(r"^([VL])_(BP)?([0-9a-f]+)%$", x)
            m2 = re.match(r"^([VL])_(BP)?([0-9a-f]+)%$", ar[i + 1]) if i + 1 < len(ar) else None
            if m1 and m2 and m1.group(1) == m2.group(1):
                a1, a2 = int(m1.group(3), 16), int(m2.group(3), 16)
                # palavra alta primeiro: V_(a+2), V_a  |  locais: L_BP(b-2), L_BPb
                if m1.group(1) == "V" and a1 == a2 + 2:
                    out.append(T.nome("V_%04x!" % a2)[0])
                    i += 2
                    continue
                if m1.group(1) == "L" and a2 == a1 + 2:
                    out.append("L_BP%02x!" % a2)
                    i += 2
                    continue
            out.append(T.coord(x.rstrip("%") + "%" if x.endswith("%") else x))
            i += 1
        resto = ar[i:]
        return out, (resto[0] if resto else "0")

    def pontos(self, s):
        """'(x, y)-STEP(a, b)' -> lista de (step, x, y) e o resto do texto."""
        out, i = [], 0
        while i < len(s):
            st = False
            if s.startswith("-", i):
                i += 1
            if s.startswith("STEP", i):
                st, i = True, i + 4
            if i >= len(s) or s[i] != "(":
                break
            nivel, j, dentro = 0, i, False
            while j < len(s):
                ch = s[j]
                if ch == '"':
                    dentro = not dentro
                elif not dentro:
                    if ch == "(":
                        nivel += 1
                    elif ch == ")":
                        nivel -= 1
                        if nivel == 0:
                            break
                j += 1
            x, y = self.lista_args(s[i + 1:j])
            out.append((st, x, y))
            i = j + 1
            if not s.startswith("-", i):
                break
        return out, s[i:].strip()

    def matriz_rt(self, txt):
        """Matriz de GET/PUT gráfico no argumento cru do runtime: '5350' (descritor em DS),
        'L_BP1c' (descritor local) ou 'A_14fa(241)' (elemento)."""
        txt = txt.strip()
        if re.match(r"^-?\d+$", txt):
            nm, _ = self.tr.nome("A_%04x" % (int(txt) & 0xFFFF))
            return nm
        m = re.match(r"^([LP]_BP[0-9a-f]+)(\(.*\))?$", txt)
        if m:
            b = m.group(1)
            suf = (self.tipos_mat.get((self.rot_atual, b)) if self.rot_atual else None) or \
                next((t for (rn, x), t in self.tipos_mat.items() if x == b), None) or "%"
            if m.group(2):
                return b + suf + "(" + ", ".join(self.tr.expr(x)[0] for x in self.lista_args(m.group(2)[1:-1])) + ")"
            return b + suf
        if re.match(r"^A_[0-9a-f]+\(", txt):
            return self.tr.expr(txt)[0]
        nm, suf = self.tr.nome(txt)
        return nm + ("" if suf else "%")

    def grafico(self, kw, resto, com):
        """LINE, PSET/PRESET, CIRCLE, GET e PUT gráficos pelas rotinas do RT45GFX (traçado,
        WINDOW/VIEW e recorte bit a bit iguais ao BRUN45; tests/retraducao/gfx/GRAFICO.md e
        PEDIDOS.md). f = 1 com 1o ponto (LINE), 2 STEP no 1o/único, 4 STEP no 2o, 8 cor,
        16 B, 32 BF, 64 estilo, 128 PRESET, 256/512/1024 início/fim/aspecto do CIRCLE."""
        T = self.tr
        pts, sobra = self.pontos(resto)
        if kw == "LINE":
            mm = re.search(r"B\$LINE\((.*)\)", com)
            ar = self.lista_args(mm.group(1)) if mm else []
            f, cor, estilo = 0, "0", "0"
            if ar and ar[0] not in ("", "-1"):
                f, cor = f | 8, T.arg_int(ar[0])
            e_ = int(ar[1]) if len(ar) > 1 else -1
            if e_ != -1:
                v = e_ & 0xFFFF
                f, estilo = f | 64, str(v - 0x10000 if v >= 0x8000 else v)
            caixa = int(ar[2]) if len(ar) > 2 else 0
            f |= {0: 0, 1: 16, 2: 32}[caixa]
            if resto.startswith("-"):
                (st2, x2, y2), x1, y1 = pts[0], "0", "0"
                f |= 4 if st2 else 0
            else:
                (st1, x1, y1), (st2, x2, y2) = pts[0], pts[1]
                f |= 1 | (2 if st1 else 0) | (4 if st2 else 0)
            cs = ["0", "0"] if resto.startswith("-") else [T.arg_sng(x1), T.arg_sng(y1)]
            return [f"RT_LINE {cs[0]}, {cs[1]}, {T.arg_sng(x2)}, {T.arg_sng(y2)}, {f}, {cor}, {estilo}"]
        if kw in ("PSET", "PRESET"):
            mm = re.search(r"B\$(?:PSET|PRST|PSTC|PRSC)\((.*)\)", com)
            st, x, y = pts[0]
            f, cor = (2 if st else 0) | (128 if kw == "PRESET" else 0), "0"
            if mm and mm.group(1).strip():
                f, cor = f | 8, T.arg_int(mm.group(1))
            return [f"RT_PSET {T.arg_sng(x)}, {T.arg_sng(y)}, {f}, {cor}"]
        if kw == "CIRCLE":
            mm = re.search(r"B\$CIRC\((.*)\)", com)
            ar = self.lista_args(mm.group(1)) if mm else []
            if len(ar) >= 2 and re.match(r"^-?\d+$", ar[0]) and re.match(r"^-?\d+$", ar[1]):
                hi, lo = int(ar[0]) & 0xFFFF, int(ar[1]) & 0xFFFF
                raio, ar = "%r" % struct.unpack("<f", struct.pack("<HH", lo, hi))[0], ar[2:]
                raio = T.arg_sng(raio)
            else:
                raio, ar = T.arg_sng(ar[0]), ar[1:]
            st, x, y = pts[0]
            f, cor = 2 if st else 0, "0"
            if ar and ar[0] != "-1":
                f, cor = f | 8, T.arg_int(ar[0])
            if len(ar) > 1:
                raise ValueError(f"CIRCLE com mais argumentos: confira o .asm ({com})")
            pend = getattr(self, "circ_pend", {})
            self.circ_pend = {}
            vals = []
            for bit, chave in ((256, "inicio"), (512, "fim"), (1024, "aspecto")):
                if chave in pend:
                    f |= bit
                    vals.append(T.arg_sng(pend[chave]))
                else:
                    vals.append("0")
            return [f"RT_CIRCLE {T.arg_sng(x)}, {T.arg_sng(y)}, {raio}, {f}, {cor}, " + ", ".join(vals)]
        seg = []
        for k, (st, x, y) in enumerate(pts):
            seg.append(("STEP" if st else "") + f"({T.coord(x)}, {T.coord(y)})")
        txt = "-".join(seg)
        if resto.startswith("-"):
            txt = "-" + txt
        if kw in ("GET", "PUT"):
            mm = re.search(r"B\$G(?:GET|PUT)\((.*)\)", com)
            ar = self.lista_args(mm.group(1))
            alvo = self.matriz_rt(ar[1] if ar[0] == "ELEM" else ar[2])
            d = self.descritor(int(ar[2]) & 0xFFFF) if ar[0] == "DS" and re.fullmatch(r"-?\d+", ar[2]) else None
            if d:
                # B$GGET/B$GPUT(DS, dados, descritor): matriz estática sem DIM no código, reservada no
                # DGROUP (FORMEDCA 0x10eb1, rótulos do editor; FORMA P3). Tamanho e tipo pelo
                # descritor; o endereço dos dados diz o elemento de partida.
                dado, t, n = d
                suf = {2: "%", 4: "!", 8: "#"}[t]
                base = "A_%04x" % (int(ar[2]) & 0xFFFF)
                self.gfx_estat[base] = (suf, n)
                alvo = f"{base}{suf}({((int(ar[1]) & 0xFFFF) - dado) // t})"
            if kw == "GET":
                (st1, x1, y1), (st2, x2, y2) = pts[0], pts[1]
                f = 1 | (2 if st1 else 0) | (4 if st2 else 0)
                return [f"RT_GCAIXA {T.arg_sng(x1)}, {T.arg_sng(y1)}, {T.arg_sng(x2)}, {T.arg_sng(y2)}, {f}: "
                        f"GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), {alvo}: RT_GFIM"]
            acao = {0: "OR", 1: "AND", 2: "PRESET", 3: "PSET", 4: "XOR"}[int(ar[-1])]
            st, x, y = pts[0]
            return [f"RT_GPONTO {T.arg_sng(x)}, {T.arg_sng(y)}, {2 if st else 0}: "
                    f"PUT (RG_GX1, RG_GY1), {alvo}, {acao}: RT_GFIM"]
        raise ValueError(f"{kw} gráfico: confira o .asm ({com})")

    def nome_matriz(self, base, rot):
        """Nome de matriz em DIM/REDIM/ERASE: local pelo tipo do elemento usado na rotina."""
        if base.startswith(("L_BP", "P_BP")):
            suf = self.tipos_mat.get((rot["nome"], base))
            if suf is None:
                suf = next((t for (rn, b), t in self.tipos_mat.items() if b == base), "")
            return base + suf, suf
        return self.tr.nome(base)

    def arg_call(self, x):
        x = x.strip()
        if re.match(r"^[VLP]_(?:BP)?[0-9a-fA-F]+$", x):
            return self.tr.nome(x)[0]
        c, t, e = self.tr.expr(x)
        return self.tr.cast(c, t, e)

    def nome_funcao(self, alvo):
        """Nome QB64 (com o tipo do retorno) de uma rotina usada como FUNCTION, ou None."""
        ret = self.funcoes.get(alvo)
        if not ret:
            return None
        suf = ret[-1] if ret[-1] in "$!#%&" else "!"
        return self.nome_sub(alvo) + suf

    def nome_sub(self, alvo):
        m = re.match(r"^(?:FUN|F)_(?:([0-9a-f]{4})_)?([0-9a-f]+)$", alvo)
        if not m:
            return alvo
        if m.group(1):
            lin = int(m.group(1), 16) * 16 + int(m.group(2), 16)
        else:
            lin = int(m.group(2), 16)
        mod = self.modulo_de(lin)
        if mod == "MIXT":
            return "MIXT_%04x" % (lin & 0xFFFF) + ("_" + NOMES_MIXT[lin & 0xFFFF] if (lin & 0xFFFF) in NOMES_MIXT else "")
        apel = self.nomes.get("S_%05x" % lin)
        return "S_%05x" % lin + ("_" + apel if apel else "")

    def modulo_de(self, lin):
        seg = "%04X" % (((lin >> 4) - 0x1000) & 0xF000)
        return self.idx["modulos"].get(seg, "?")


NOMES_MIXT = {0x0049: "Le2Campos", 0x00ff: "Le3Campos", 0x021e: "Le4Campos", 0x03a6: "Le5Campos",
              0x0597: "Le6Campos", 0x07f1: "LimpaTeclado", 0x082a: "Maior", 0x0877: "Menor",
              0x08c4: "TextoGrafico", 0x0dbe: "GuardaTela"}


# --------------------------------------------------------------------- montagem do programa
def endereco_txt(a):
    return f"@{a:05x}"


def monta(prog, modulo):
    """Linhas QB64 do nível de módulo e das SUBs de um módulo QuickBASIC."""
    rot = [r for r in prog.rotinas if r["modulo"] == modulo]
    rot.sort(key=lambda r: int(r["endereco"], 16))
    nivel, subs = [], []
    atual = None   # SUB aberta
    pend_ret = False
    de_nivel = set()   # arquivos do lift traduzidos no nível de módulo
    for r in rot:
        itens = r["itens"]
        evid = [c for c in r["cab"] if c.startswith("evidence_id") or c.startswith("EXE:")]
        destino = nivel
        cab = f"' ---- {r['nome']} @{r['endereco']}  ({r['lift']}; {evid[1] if len(evid) > 1 else ''})"
        entra = any(k == "cmd" and c.startswith("' entrada de SUB") or (k == "cmd" and "entrada de SUB" in com)
                    for k, a, c, com in itens[:2])
        if atual is not None and not entra and itens and itens[0][0] == "rot":
            # trecho do nível de módulo (cadeia de GOTO até o fim do módulo) depois de uma SUB
            # que termina em laço sem END SUB: fecha a SUB
            fontes = re.findall(r"([0-9a-f]{6}_\w+)", itens[0][3] or "")
            if fontes and all(f + ".lift.txt" in de_nivel for f in fontes):
                atual = None
        if entra:
            atual = dict(nome=prog.nome_sub(r["nome"]), linhas=[], params=set(), info=itens[0][3], ender=r["endereco"],
                         funcao=prog.nome_funcao(r["nome"]), retorno=prog.funcoes.get(r["nome"]))
            subs.append(atual)
        if atual is None:
            de_nivel.add(r["lift"])
        if atual is not None:
            destino = atual["linhas"]
        destino.append(cab)
        prog.tr.ctx = prog.tipos_rot.get(r["nome"], {})
        prog.tr.recente = {}
        def dado(j):
            return 0 <= j < len(itens) and itens[j][0] == "cmd" and itens[j][2] == "" and                 re.match(r"\?\? \d+ bytes", itens[j][3] or "")
        for ii, (k, a, c, com) in enumerate(itens):
            if k == "rot":
                destino.append(f"{c}:" + (f"   ' {com}" if com else ""))
                continue
            if "??" in c and (prog.exe, a) not in CORRECOES and (dado(ii - 1) or dado(ii + 1) or dado(ii - 2) or dado(ii + 2)):
                destino.append(f"'RETRAD? {endereco_txt(a)} ?? dado (entre trechos de dado lido como codigo): {c}")
                continue
            if c == "" or c.startswith("'"):
                txt = (c[1:].strip() if c.startswith("'") else com)
                if "entrada de SUB" in txt:
                    atual["info"] = txt
                    continue
                if "B$CENP" in txt and atual is None:
                    destino.append(f"RT_FIM   ' {endereco_txt(a)} {txt}")
                    continue
                mc = re.match(r"^CIRCLE (ângulo inicial|ângulo final|aspecto) (.*)$", separa_comentario(txt)[0])
                if mc:   # B$CSTT/B$CSTO/B$CASP antes do B$CIRC: vão para o RT_CIRCLE seguinte
                    if not hasattr(prog, "circ_pend"):
                        prog.circ_pend = {}
                    prog.circ_pend[{"ângulo inicial": "inicio", "ângulo final": "fim", "aspecto": "aspecto"}[mc.group(1)]] = mc.group(2).strip()
                if txt.startswith("??") or "'??" in com or txt.startswith("?"):
                    if (prog.exe, a) in CORRECOES:
                        for l in CORRECOES[(prog.exe, a)]:
                            destino.append(f"{l}   ' {endereco_txt(a)} correção manual (ver retraduz.py CORRECOES)")
                        continue
                    mm = re.match(r"\?\? (\d+) bytes", txt)
                    sw = prog.swap_inline(a, int(mm.group(1))) if mm and "XCHG word ptr" in txt else None
                    if sw:
                        for l in prog.cmd(a, sw, com, r)[0]:
                            destino.append(f"{l}   '{endereco_txt(a)} (SWAP inline: MOV/XCHG no .asm; o lift mostra ?? {mm.group(1)} bytes)")
                        continue
                    antes = prog.asm(a, antes=1, depois=1)
                    if mm and "XCHG word ptr" in txt and len(antes) == 2 and antes[0][1].startswith(("MOV AX,", "MOV DX,")):
                        prog.avisos.append(f"0x{a:x}: ?? {mm.group(1)} bytes com XCHG (SWAP inline?) nao reconhecido")
                    if not re.match(r"\?\? \d+ bytes", txt) and (dado(ii - 1) or dado(ii + 1) or dado(ii - 2) or dado(ii + 2)):
                        txt = "?? dado (entre trechos de dado lido como codigo): " + txt[2:].strip()
                    destino.append(f"'RETRAD? {endereco_txt(a)} {txt}")
                    continue
                destino.append(f"' {endereco_txt(a)} {txt}")
                continue
            if c.startswith("RETF"):
                if atual is not None:
                    atual["retf"] = c
                    atual = None
                continue
            prog.nth = 1 + sum(1 for x in itens[:ii] if x[1] == a and x[0] == "cmd")
            linhas, nota = prog.cmd(a, c, com, r)
            ds = re.search(r"DS:([0-9a-f,]+)", com)
            sufixo = f"   '{endereco_txt(a)}" + (f" DS:{ds.group(1)}" if ds else "") + (f" ({nota})" if nota else "")
            if "'??" in com:
                sufixo += "  '?? do lift: " + com.split("'??", 1)[1].strip()
            if any("PROTECAO" in l for l in linhas):
                sufixo = ""   # verificacao de licenca do original: so a frase neutra, sem endereco nem DS
            for i, l in enumerate(linhas):
                if l == "RETURN_ROTULO":
                    pend_ret = True
                    continue
                if pend_ret and l.startswith("GOTO "):
                    l = "RETURN " + l[5:]
                    pend_ret = False
                ult = i == len(linhas) - 1
                le = re.search(r"\b(RT_INPUT\$|RT_INKEY\$|RT_LINEINPUT)", l)
                if l.startswith("GOTO ") and destino and destino[-1].split("'")[0].strip() == l[5:].strip() + ":":
                    # laço "L: GOTO L" (espera o ON KEY, ex. tela de erro do LAJEMONT 0x13304): com
                    # roteiro, pega a tecla seguinte para o ON KEY poder sair dele
                    destino.append("RT_ESPERA_EVENTO   ' {ONKEY_SUB} laco sem leitura: so o ON KEY sai dele")
                    if atual is None:
                        destino.append("IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB {ONKEY}   ' ON KEY pelo roteiro (entre comandos)")
                    else:
                        destino.append("IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE {SAI}   ' {ONKEY_SUB} ON KEY dentro da SUB")
                elif salto_para_tras(l, a):
                    # B$EVCK: o original (compilado com /V) atende o ON KEY no início de cada comando,
                    # também num laço sem leitura de teclado; todo laço passa por um salto para trás
                    if atual is None:
                        destino.append("IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB {ONKEY}   ' ON KEY no laco (B$EVCK)")
                    else:
                        destino.append("IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE {SAI}   ' {ONKEY_SUB} ON KEY no laco (B$EVCK)")
                destino.append(l + (sufixo if ult else ""))
                if atual is None and ult and (le or l.startswith("CALL ")) and not l.startswith("' "):
                    destino.append("IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB {ONKEY}   ' ON KEY pelo roteiro (entre comandos)")
                elif atual is not None and ult and (le or l.startswith("CALL MIXT_")) and not l.startswith("' "):
                    destino.append("IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE {SAI}   ' {ONKEY_SUB} ON KEY dentro da SUB")
                elif atual is not None and ult and l.startswith("CALL ") and not l.startswith("CALL MIXT_"):
                    destino.append("IF RT_EVENTO THEN {SAI}   ' {ONKEY_SUB} ON KEY que sai da SUB")
    # EXIT SUB final vira END SUB; FUNCTION grava o valor de retorno antes de sair
    for s in subs:
        if s.get("funcao"):
            ret = prog.tr.nome(s["retorno"])[0]
            s["linhas"] = [(f"{s['funcao']} = {ret}: " + l) if l.startswith("EXIT_SUB") else l for l in s["linhas"]]
            s["linhas"] = [l.replace("EXIT_SUB", "EXIT_FUNC", 1) if ": EXIT_SUB" in l else l for l in s["linhas"]]
        ls = s["linhas"]
        for i in range(len(ls) - 1, -1, -1):
            if ls[i].startswith("EXIT_SUB"):
                ls[i] = "' END SUB" + ls[i][len("EXIT_SUB"):]
                break
        s["linhas"] = [l.replace("EXIT_SUB", "EXIT SUB", 1) if l.startswith("EXIT_SUB") else l for l in ls]
        s["linhas"] = [l.replace("EXIT_FUNC", "EXIT FUNCTION", 1) for l in s["linhas"]]
        fim = [i for i, l in enumerate(s["linhas"]) if ": EXIT FUNCTION" in l]
        if fim:
            i = fim[-1]
            s["linhas"][i] = s["linhas"][i].replace(": EXIT FUNCTION", ": ' END FUNCTION", 1)
    return nivel, subs


def escopo(prog, nivel, subs):
    """GOTO/GOSUB para rótulo de outro escopo (SUB x nível de módulo) não compila no QB64 (no
    original é salto entre trechos que o lift atribuiu a escopos diferentes). Comenta a linha
    com 'RETRAD? e registra o aviso."""
    def conserta(linhas, onde):
        defs = {l.split(":")[0].strip() for l in linhas if re.match(r"^\s*L_\w+:", l)}
        for i, l in enumerate(linhas):
            cod = separa_comentario(l)[0] if not l.lstrip().startswith("'") else ""
            alvos = re.findall(r"\b(?:GOTO|GOSUB|RETURN|RESUME) (L_\w+)", cod)
            alvos += [x for x in re.findall(r"\bON ERROR GOTO (L_\w+)", cod)]
            fora = [x for x in alvos if x not in defs and not (onde != "nivel" and cod.startswith("ON ERROR"))]
            if fora:
                prog.avisos.append(f"rotulo fora do escopo ({onde}): {', '.join(fora)}: {cod.strip()[:90]}")
                linhas[i] = f"'RETRAD? rotulo {', '.join(fora)} fora do escopo ({onde}): " + l.strip()
    conserta(nivel, "nivel")
    for s in subs:
        conserta(s["linhas"], s["nome"])


def PrimeiroArg(resto):
    """Índices de 'a, b)...' até o parêntese que fecha (lista de textos)."""
    nivel, cur, out, dentro = 1, "", [], False
    for ch in resto:
        if ch == '"':
            dentro = not dentro
        elif not dentro:
            if ch == "(":
                nivel += 1
            elif ch == ")":
                nivel -= 1
                if nivel == 0:
                    break
            elif ch == "," and nivel == 1:
                out.append(cur)
                cur = ""
                continue
        cur += ch
    out.append(cur)
    return out


def params_sub(prog, s):
    """Parâmetros da SUB pela forma do RETF e pelos P_BPxx usados."""
    m = re.search(r"RETF (0x[0-9a-f]+)", s.get("retf", ""))
    usados = {}
    for l in s["linhas"]:
        for mm in re.finditer(r"\bP_BP([0-9a-f]{2})([$!#%&]?)", l):
            usados.setdefault(int(mm.group(1), 16), mm.group(2))
    # sem RETF (SUB que termina em laço): parâmetros pelo maior [BP+n] usado
    n = int(m.group(1), 16) // 2 if m else ((max(usados) - 6) // 2 + 1 if usados else 0)
    ps = []
    for i in range(n):
        off = 6 + 2 * (n - 1 - i)
        suf = usados.get(off, "") or prog.tipos.get("P_BP%02x" % off, "!")
        ps.append("P_BP%02x%s" % (off, suf))
    return ps


def locais_sub(s):
    """Variáveis locais (L_BPxx) usadas na SUB."""
    out = {}
    for l in s["linhas"]:
        for mm in re.finditer(r"\bL_BP([0-9a-f]{2})([$!#%&])", l):
            out.setdefault("L_BP" + mm.group(1), mm.group(2))
    return out


def variaveis(linhas):
    """V_xxxx e A_xxxx usados (nome base -> (sufixo, n. de índices ou 0))."""
    out = {}
    for l in linhas:
        cod = separa_comentario(l)[0] if not l.startswith("'") else ""
        for mm in re.finditer(r"\b([VA]_[0-9a-f]{4}(?:_[A-Za-z0-9]+)?)([$!#%&]?)(\()?", cod):
            base, suf, par = mm.group(1), mm.group(2), mm.group(3)
            nd = 0
            if par:
                # conta vírgulas no nível 1
                j, nivel, nd = mm.end(), 1, 1
                dentro = False
                while j < len(cod) and nivel:
                    ch = cod[j]
                    if ch == '"':
                        dentro = not dentro
                    elif not dentro:
                        if ch == "(":
                            nivel += 1
                        elif ch == ")":
                            nivel -= 1
                        elif ch == "," and nivel == 1:
                            nd += 1
                    j += 1
            ant = out.get(base)
            if ant is None or (nd and not ant[1]) or (suf and not ant[0]):
                out[base] = (suf or (ant[0] if ant else ""), nd or (ant[1] if ant else 0))
    return out


TAM = {"%": 2, "&": 4, "!": 4, "#": 8}


def registros(prog, todas, common):
    """Registros de GET/PUT # (endereço, tamanho, campos). Campos = variáveis do EXE dentro do
    registro: numéricas pelo tipo, strings de comprimento fixo pelo tamanho visto no lift."""
    vs = {}
    for b, (suf, nd) in todas.items():
        if not nd and re.match(r"^V_[0-9a-f]{4}", b):
            vs.setdefault((int(b[2:6], 16), suf or "!"), b)
    for v in common.get("vars", []):
        if v["nome"].startswith("V_"):
            vs.setdefault((v["end"], v["suf"]), v["nome"])
    out = []
    for base, n in sorted(prog.registros.items()):
        campos = []
        for (end, suf), nome in sorted(vs.items()):
            if not (base <= end < base + n):
                continue
            if suf == "$":
                tam = prog.fixas.get(end)
                if not tam:
                    continue
            else:
                tam = TAM[suf]
            campos.append((nome + suf, end - base, min(tam, base + n - end), suf))
        out.append((base, n, campos))
    return out


def datas_do_exe(prog):
    """Texto dos DATA no EXE original: registros [palavra][texto]\\0 terminados por FFFF 01h
    (ARMADURA: arquivo 0x1c410; o texto começa com o espaço que vinha depois de DATA)."""
    pj = os.path.join(os.path.dirname(prog.dump.rstrip("/\\")), "prep", prog.exe + ".prep.json")
    orig = json.load(open(pj, encoding="utf-8"))["original"]
    d = open(orig, "rb").read()
    out = []
    for m in re.finditer(rb"((?:[\x00-\xff]{2}\x20[\x20-\x7e]*\x00)+)\xff\xff\x01", d):
        bloco, i = m.group(1), 0
        while i < len(bloco):
            j = bloco.index(b"\x00", i + 2)
            out.append((m.start() + i + 2, bloco[i + 2:j].decode("cp437")))
            i = j + 1
    return out


def salto_para_tras(l, a):
    """Comando que fecha um laço: NEXT, ou GOTO (também dentro de IF) para um rótulo de endereço
    menor ou igual ao do comando. Recebe antes o RT_EVCK do B$EVCK (ON KEY no laço)."""
    cod = separa_comentario(l)[0].strip()
    if re.match(r"^NEXT\b", cod):
        return True
    m = re.match(r"^(?:IF .* THEN )?GOTO L_([0-9a-f]+)\b", cod)
    return bool(m) and int(m.group(1), 16) <= a


def onkey_fica(prog, corpo):
    """FUNCTION RT_ONKEY_FICA%(i): ON KEY atendido dentro de SUB. O BRUN45 roda o tratador (no
    nível de módulo) entre dois comandos da SUB; com RETURN simples volta para dentro da SUB, com
    RETURN rótulo/CHAIN/RUN/END sai dela. No QB64 a SUB não pode fazer GOSUB para o nível de
    módulo. Tratador que só faz BEEP/SOUND e rearma as teclas (GOSUB para um trecho só de
    ON KEY/KEY) e volta com RETURN simples roda aqui (devolve -1; o rearme é omitido porque as
    teclas continuam ligadas); os demais devolvem 0 e a SUB sai (EXIT SUB em cascata até o nível
    de módulo, onde o ON RT_EV GOSUB depois do CALL roda o tratador)."""
    def bloco(rotulo):
        i = next((k for k, l in enumerate(corpo) if l.startswith(rotulo + ":")), None)
        if i is None:
            return None
        out = []
        for l in corpo[i + 1:i + 60]:
            c = separa_comentario(l)[0].strip() if not l.lstrip().startswith("'") else ""
            if not c or re.match(r"^L_\w+:", c) or c.startswith("IF RT_ROT_ATIVO THEN RT_EVCK"):
                continue
            out.append(c)
            if c.startswith("RETURN") or c.startswith(("RT_CHAIN", "RT_RUN", "RT_FIM", "GOTO ")):
                break
        return out

    def rearme(rotulo):
        b = bloco(rotulo)
        return b is not None and b and b[-1] == "RETURN" and all(
            re.match(r"^(FOR |NEXT |ON KEY|KEY |KEY\(|RT_ONKEY|RT_KEYDEF|RT_KEYESTADO|RETURN$)", c) for c in b)
    out = ["' ON KEY dentro de SUB: -1 = o tratador i volta com RETURN simples e roda aqui; 0 = sai da SUB.",
           "FUNCTION RT_ONKEY_FICA% (i AS INTEGER)", "    SELECT CASE i"]
    for k, rot in enumerate(prog.onkey, 1):
        b = bloco(rot) or ["?"]
        simples = b[-1] == "RETURN" and all(c.startswith(("BEEP", "SOUND ")) or
                                            (c.startswith("GOSUB ") and rearme(c[6:].strip())) or c == "RETURN"
                                            for c in b)
        if simples:
            corpo_i = [c for c in b if c.startswith(("BEEP", "SOUND "))]
            out.append(f"        CASE {k}   ' {rot}: " + "; ".join(b))
            out += ["            " + c for c in corpo_i]
            out.append("            RT_ONKEY_FICA% = -1")
        else:
            out.append(f"        CASE {k}   ' {rot}: sai da SUB (" + "; ".join(b)[:80] + ")")
    out += ["    END SELECT", "END FUNCTION"]
    return out


def bas_str(b):
    """Bytes -> expressão de string do BASIC (CHR$ para os não imprimíveis)."""
    partes, txt = [], ""
    for c in b:
        if 32 <= c < 127 and c != 34:
            txt += chr(c)
        else:
            if txt:
                partes.append('"' + txt + '"')
                txt = ""
            partes.append(f"CHR$({c})")
    if txt:
        partes.append('"' + txt + '"')
    return " + ".join(partes) if partes else '""'


def rotina_asm(prog, lin):
    """SUB RT_ROTINA_xxxx para uma rotina em assembly ligada ao EXE. As conhecidas são as três
    versões da cópia da tela gráfica para a impressora (Epson, INT 17h): A = faixas de 8 linhas
    (LAJEPROC 0x30aea), B = faixas de 8 colunas, página deitada (VIGA 0x7109c), C = duas faixas
    de colunas por linha de impressão (DESIMP 0x50f20). Os parâmetros (tamanho da tela, margem,
    ESC L n, CR LF, entrelinha) são lidos do código e do DS do EXE original."""
    pj = os.path.join(os.path.dirname(prog.dump.rstrip("/\\")), "prep", prog.exe + ".prep.json")
    pr = json.load(open(pj, encoding="utf-8"))
    der = open(os.path.join(os.path.dirname(pj), prog.exe + ".EXE"), "rb").read()
    hdr = struct.unpack("<H", der[8:10])[0] * 16
    cod = der[hdr + lin - 0x10000: hdr + lin - 0x10000 + 0x220]
    orig = open(pr["original"], "rb").read()
    dsb = pr["ds_offset_arquivo"]
    nome = f"RT_ROTINA_{lin & 0xFFFF:04X}"
    out = [f"' Rotina em assembly do EXE em 0x{lin:x} (chamada por CALL SUB_{lin:x} no lift)."]
    if not cod.startswith(bytes.fromhex("b40fcd103c0674")) or cod[7] not in (0x56, 0x62, 0x68):
        prog.avisos.append(f"rotina em assembly 0x{lin:x} desconhecida: {cod[:16].hex(' ')}")
        return out + [f"SUB {nome}", "    ' RETRAD? rotina em assembly nao reconhecida (ver o .asm)", "END SUB"]
    var = {0x56: "A", 0x62: "B", 0x68: "C"}[cod[7]]
    fim_rot = cod.index(b"\xcb") + 1
    corpo = cod[:fim_rot]
    w16 = lambda o: struct.unpack_from("<H", corpo, o)[0]
    ds16 = lambda a: struct.unpack_from("<H", orig, dsb + a)[0]

    def ds_str(a):
        j = orig.index(b"$", dsb + a)
        return orig[dsb + a:j]
    # atribuições dos ramos EGA (modo 10h) e Hercules: c7 06 end val / c6 06 end val
    i_jne = corpo.index(b"\x3c\x10\x75") + 3
    alvo_her = i_jne + 1 + corpo[i_jne]
    i_bb = corpo.index(b"\xbb")

    def atribs(a, b):
        r, k = {}, a
        while k < b:
            if corpo[k:k + 2] == b"\xc7\x06":
                r[w16(k + 2)] = w16(k + 4)
                k += 6
            elif corpo[k:k + 2] == b"\xc6\x06":
                r[w16(k + 2)] = corpo[k + 4]
                k += 5
            else:
                k += 1
        return r
    ega, her = atribs(i_jne + 1, alvo_her), atribs(alvo_her, i_bb)
    import re as _re
    strs = [w16(m.start() + 1) for m in _re.finditer(b"\xbb(..)\xe8", corpo, _re.S)]
    ptrs = [w16(m.start() + 2) for m in _re.finditer(b"\x8b\x1e(..)\xe8", corpo, _re.S)]
    if var == "A":
        larg = w16(corpo.index(b"\x3b\x0e") + 2)
        alt = w16(corpo.index(b"\x3b\x16") + 2)
        meio = None
    else:
        larg = w16(corpo.index(b"\x3b\x0e") + 2) if var == "B" else None
        alt = w16(corpo.index(b"\x8b\x16") + 2)
        meio = w16(corpo.index(b"\x2b\x0e") + 2) if var == "C" else None   # sub cx,[meio]
    ini, crlf, fim = strs[0], strs[1], strs[-1]
    margem, cab = ptrs[0], ptrs[1]

    def params(sub):
        v = lambda a: sub.get(a, ds16(a)) if a is not None else 0
        return (v(larg) if larg else 0, v(alt), v(meio) if meio else 0,
                bas_str(ds_str(v(margem))), bas_str(ds_str(v(cab))))
    ini_s, crlf_s, fim_s = bas_str(ds_str(ini)), bas_str(ds_str(crlf)), bas_str(ds_str(fim))
    out.append(f"' Versao {var}; DS do original: inicio DS:{ini:04X}, CR LF DS:{crlf:04X}, fim DS:{fim:04X}, "
               f"margem em [DS:{margem:04X}], ESC L em [DS:{cab:04X}].")
    out.append(f"SUB {nome}")
    out.append("    SELECT CASE RT_MODO")
    for caso, sub in (("9", ega), ("3", her), ("ELSE", {})):
        w_, h_, m_, mg, cb = params(sub)
        out.append(f"        CASE {caso}")
        out.append(f"            RT_COPIA_TELA \"{var}\", {w_}, {h_}, {m_}, {mg}, {cb}, {ini_s}, {crlf_s}, {fim_s}")
    out.append("    END SELECT")
    out.append("END SUB")
    return out


def ascii_comentario(linha):
    """O fonte vai em CP437 (as strings do original); comentários sem acento (CP437 não tem ã/õ)."""
    import unicodedata
    cod, com = separa_comentario(linha) if not linha.lstrip().startswith("'") else ("", None)
    if com is None:
        k = linha.index("'")
        cod, com = linha[:k], linha[k + 1:]
    else:
        if not com and "'" not in linha[len(cod):]:
            return linha
        k = linha.index("'", len(cod))
        com = linha[k + 1:]
        cod = linha[:k]
    com = unicodedata.normalize("NFKD", com).encode("ascii", "ignore").decode("ascii")
    return cod + "'" + com


sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import marca as marca_tab   # noqa: E402  (tools/marca.py)

MARCA_JSON = marca_tab.MARCA_JSON
RE_ARQUIVO = re.compile(r"\b(PRINT|WRITE) #(?!RT_LPT\b)")


def le_marca(caminho):
    """Trocas de src-original/marca.json: sha256 do texto do original -> texto do OpenStrut.
    O literal é reconhecido pelo hash; o texto do original não precisa estar na tabela."""
    return {t["sha256"]: t["openstrut"] for t in marca_tab.trocas(caminho, originais={})}


def aplica_marca(linhas, trocas):
    """Troca as strings literais iguais a um texto do original (pelo sha256) pelo do OpenStrut, só no
    código (não no comentário) e fora de PRINT #/WRITE # para arquivo (formato do original).
    Devolve as linhas e a contagem de trocas por texto."""
    cont = {}

    def troca(m):
        lit = m.group(1)
        novo = trocas.get(marca_tab.sha(lit))
        if novo is None:
            return m.group(0)
        if len(novo) != len(lit):
            sys.exit(f"marca.json: largura diferente ({len(lit)} x {len(novo)}): -> {novo!r}")
        cont[lit] = cont.get(lit, 0) + 1
        return '"' + novo + '"'
    saida = []
    for l in linhas:
        if '"' not in l or l.lstrip().startswith("'"):
            saida.append(l)
            continue
        dentro, k = False, len(l)   # início do comentário (fora de string)
        for i, ch in enumerate(l):
            if ch == '"':
                dentro = not dentro
            elif ch == "'" and not dentro:
                k = i
                break
        cod = l[:k]
        if RE_ARQUIVO.search(cod):
            saida.append(l)
            continue
        saida.append(re.sub(r'"([^"]*)"', troca, cod) + l[k:])
    return saida, cont


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("exe")
    ap.add_argument("--familia", default="laje")
    ap.add_argument("--dump", default=os.path.join(os.environ["REA_WORK"], "dump") if os.environ.get("REA_WORK") else None,
                    help="pasta do dump do original (padrão: $REA_WORK/dump)")
    ap.add_argument("--saida", default=os.path.join(os.path.dirname(__file__), "..", "src-original"))
    ap.add_argument("--common", help="COMUM_<FAMILIA>.json gerado por tools/common_familia.py "
                    "(padrão: <saida>/<familia>/COMUM_<FAMILIA>.json)")
    ap.add_argument("--comum-nome", help="nome do bloco COMMON nos $INCLUDE (padrão: a família)")
    ap.add_argument("--marca", choices=("openstrut", "original"), default="openstrut",
                    help="openstrut (padrão): aplica as trocas de src-original/marca.json; "
                         "original: texto do SISTRUT 4.0, sem troca nenhuma")
    ap.add_argument("--marca-json", default=MARCA_JSON, help="tabela de marca (padrão: src-original/marca.json)")
    args = ap.parse_args()
    if not args.dump:
        sys.exit("retraduz.py: informe --dump <pasta> ou defina REA_WORK (dump em $REA_WORK/dump)")

    saida = os.path.normpath(args.saida)
    dirfam = os.path.join(saida, args.familia)
    os.makedirs(dirfam, exist_ok=True)
    fam = args.familia.upper()
    nome_comum = (args.comum_nome or args.familia).upper()
    nomes_json = os.path.join(dirfam, "nomes.json")
    # Correções da família: <familia>/correcoes.json = {"EXE": {"0x1a2b3": ["linha", ...] | "PROTECAO"}};
    # chaves que começam com "_" são evidência/comentário. Somam-se às de CORRECOES acima.
    cfam = os.path.join(dirfam, "correcoes.json")
    if os.path.exists(cfam):
        for exe, tab in json.load(open(cfam, encoding="utf-8")).items():
            if exe.startswith("_"):
                continue
            for end, linhas in tab.items():
                if not end.startswith("_"):
                    if "#" in end:   # n-ésimo comando do mesmo endereço no lift (VIGA 0x45626#2)
                        e, n = end.split("#")
                        CORRECOES[(exe.upper(), int(e, 16), int(n))] = linhas
                    else:
                        CORRECOES[(exe.upper(), int(end, 16))] = linhas
    prog = Programa(args.exe, args.dump, args.familia, nomes_json)
    principal = [m for s, m in sorted(prog.idx["modulos"].items()) if m != "MIXT"]
    cj = args.common or os.path.join(dirfam, f"COMUM_{fam}.json")
    common = json.load(open(cj, encoding="utf-8")) if os.path.exists(cj) else {"vars": []}
    em_common = {v.get("base", v["nome"]) for v in common["vars"]}

    corpo, subs = [], []
    for mod in principal:
        n, s = monta(prog, mod)
        corpo += n
        subs += s
    escopo(prog, corpo, subs)

    # variáveis do módulo
    todas = variaveis(corpo + [l for s in subs for l in s["linhas"]])
    for b in list(todas):
        if b.startswith("A_") and todas[b][1] == 0:
            todas[b] = (todas[b][0] or prog.tipos.get(b[:6], "!"), 1)   # matriz só em ERASE/GET
    meus = {b: v for b, v in todas.items() if "_".join(b.split("_")[:2]) not in em_common}
    rot_erro = sorted(set(re.findall(r"^ON ERROR GOTO (L_[0-9a-f]+)", NL.join(corpo), re.M)))
    out = []
    w = out.append
    w("' " + "=" * 76)
    if args.marca == "openstrut":
        w(f"'  {args.exe} - OpenStrut V1: engenharia reversa independente do SISTRUT 4.0 (1991),")
        w("'  retraduzido do original para QB64 PE. Textos de marca: src-original/marca.json.")
    else:
        w(f"'  {args.exe} - SISTRUT 4.0 (1991) retraduzido do original para QB64 PE")
    w(f"'  Gerado por tools/retraduz.py a partir de dump/{args.exe}/*.lift.txt (fora do repositorio).")
    w(f"'  sha256 do EXE original: {prog.idx.get('sha256_original', '?')}")
    w("'  Cada comando termina com '@xxxxx = endereco linear do comando no EXE derivado")
    w("'  (prep/, modulos realinhados a 64 KB); os nomes V_/A_xxxx sao enderecos DS:xxxx.")
    w("'  Convencoes: docs/RETRADUCAO.md. Correcoes a mao: tools/retraduz.py CORRECOES e <familia>/correcoes.json.")
    w("' " + "=" * 76)
    w("'$INCLUDE: '../comum/RT45.BI'")
    w("'$INCLUDE: '../comum/RT45GFX.BI'")
    w(f"'$INCLUDE: 'COMUM_{nome_comum}.BI'")
    w("")
    w(f"' ---- variaveis do {args.exe} fora do COMMON (DS do programa)")
    gfx = getattr(prog, "gfx_estat", {})
    for b, (suf, n) in sorted(gfx.items()):
        w(f"DIM SHARED {b}{suf}(0 TO {n - 1})   ' matriz estatica de GET/PUT grafico (descritor em DS:{b[2:].upper()})")
    for b in sorted(meus):
        suf, nd = meus[b]
        if "_".join(b.split("_")[:2]) in gfx:
            continue
        if nd:
            dims = ", ".join(["-32768 TO -32768"] * nd)
            w(f"REDIM SHARED {b}{suf or '!'}({dims})   ' matriz dinamica: ainda nao dimensionada")
        else:
            w(f"DIM SHARED {b}{suf or '!'}")
    for b, (suf, n) in sorted(prog.st.items()):
        if b not in prog.st_mao:
            w(f"DIM SHARED ST_{b:04x}{suf}(0 TO {n - 1})   ' matriz estatica em DS:{b:04X} (elementos de indice constante sao V_ no lift)")
    regs = registros(prog, todas, common)
    for base, n, campos in regs:
        w(f"DIM SHARED RG_{base:04X} AS STRING * {n}   ' registro de GET/PUT # em DS:{base:04X}")
    w("")
    w("ON ERROR GOTO RT_ERRO_FATAL   ' erro sem tratador do programa: RT_ERRO_SEM_TRATADOR (RT45)")
    w(f"RT_INICIO \"{args.exe}\"")
    out += corpo
    w("RT_FIM")
    w("")
    w("' ---- tratador de erro do modulo MIXT (nivel de modulo no original)")
    w("'$INCLUDE: '../comum/MIXT_MOD.BI'")
    w("")
    w("' ---- erro sem ON ERROR do programa: o BRUN45 escreve a mensagem e volta ao DOS")
    w("RT_ERRO_FATAL:")
    w("RT_ERRO_SEM_TRATADOR")
    w("")
    if prog.usa_read:
        datas = datas_do_exe(prog)
        w("' ---- DATA do original (texto da area de DATA do EXE, na ordem; ver RETRADUCAO.md)")
        for off, txt in datas:
            w(f"' DATA do arquivo do EXE em {off:05x}")
            w(f"DATA{txt}")
        w("")
    for base, n, campos in regs:
        w(f"' Registro de {n} bytes em DS:{base:04X} (GET/PUT #): campos pelo endereco das variaveis.")
        w(f"SUB RT_REG_{base:04X}_LE (f AS INTEGER, r AS LONG)")
        w(f"    GET #f, r, RG_{base:04X}")
        for nome, off, tam, suf in campos:
            pos = f"MID$(RG_{base:04X}, {off + 1}, {tam})"
            conv = {"%": "CVI", "&": "CVL", "!": "CVS", "#": "CVD"}.get(suf)
            w(f"    {nome} = {conv}({pos})" if conv else f"    {nome} = {pos}")
        w("END SUB")
        w(f"SUB RT_REG_{base:04X}_GRAVA (f AS INTEGER, r AS LONG)")
        for nome, off, tam, suf in campos:
            pos = f"MID$(RG_{base:04X}, {off + 1}, {tam})"
            conv = {"%": "MKI$", "&": "MKL$", "!": "MKS$", "#": "MKD$"}.get(suf)
            w(f"    {pos} = {conv}({nome})" if conv else f"    {pos} = RT_FIX$({nome}, {tam})")
        w(f"    PUT #f, r, RG_{base:04X}")
        w("END SUB")
        w("")
    for lin in sorted(prog.rotinas_asm):
        for l in rotina_asm(prog, lin):
            w(l)
        w("")
    w("' Volta o ON ERROR do modulo principal depois de uma SUB do MIXT que ligou o dela:")
    w("' no QB4.5 cada modulo tem o seu tratador; no QB64 ha um so (ver RETRADUCAO.md).")
    w("' CLEAR do original: zera as variaveis deste programa (as do COMMON: RT_COMMON_LIMPA).")
    w("SUB RT_PROG_LIMPA")
    for b, (suf, n) in sorted(prog.st.items()):
        w(f"    ERASE ST_{b:04x}{suf}")
    for b in sorted(meus):
        suf, nd = meus[b]
        if nd:
            dims = ", ".join(["-32768 TO -32768"] * nd)
            w(f"    REDIM {b}{suf or '!'}({dims})")
        elif suf == "$":
            w(f"    {b}$ = \"\"")
        else:
            w(f"    {b}{suf or '!'} = 0")
    w("END SUB")
    w("")
    if prog.onkey:
        for l in onkey_fica(prog, corpo):
            w(l)
        w("")
    w("SUB RT_REARMA_ERRO")
    w("    RT_ERRO_MIXT = 0")
    w("    SELECT CASE RT_ONERR")
    for r in rot_erro:
        w(f"        CASE &H{r[2:]}: ON ERROR GOTO {r}")
    w("        CASE ELSE: ON ERROR GOTO RT_ERRO_FATAL")
    w("    END SELECT")
    w("END SUB")
    for s in subs:
        ps = params_sub(prog, s)
        w("")
        kw = "FUNCTION" if s.get("funcao") else "SUB"
        w(f"{kw} {s.get('funcao') or s['nome']}" + (f" ({', '.join(ps)})" if ps else "") + f"   ' {s['info']} ({s['ender']})")
        loc = locais_sub(s)
        mats = {}
        for l in s["linhas"]:
            cod = separa_comentario(l)[0] if not l.lstrip().startswith("'") else ""
            for mm in re.finditer(r"\b(L_BP[0-9a-f]{2,3})([$!#%&])\(", cod):
                nd = len(PrimeiroArg(cod[mm.end():]))
                mats[mm.group(1) + mm.group(2)] = max(nd, mats.get(mm.group(1) + mm.group(2), 0))
        for nm, suf in sorted(loc.items()):
            if any(re.match(rf"^\s*(RE)?DIM {nm}", l) for l in s["linhas"]):
                continue
            if nm + suf in mats:
                continue
            w(f"    DIM {nm}{suf}")
        for l in s["linhas"]:
            mm = re.match(r"^\s*REDIM (L_BP[0-9a-f]{2,3}[$!#%&])\((.*)\)", separa_comentario(l)[0])
            if mm:
                mats[mm.group(1)] = max(mats.get(mm.group(1), 0), len(PrimeiroArg(mm.group(2) + ")")))
        for nm, nd in sorted(mats.items()):
            w(f"    REDIM {nm}({', '.join(['-32768 TO -32768'] * max(1, nd))})   ' matriz local: ainda nao dimensionada")
        sai = "EXIT FUNCTION" if s.get("funcao") else "EXIT SUB"
        for l in s["linhas"]:
            l = l.replace("{SAI}", sai)
            w(("    " + l) if not re.match(r"^L_\w+:", l) else l)
        w("END FUNCTION" if s.get("funcao") else "END SUB")
    w("")
    w("'$INCLUDE: '../comum/RT45.BM'")
    w("'$INCLUDE: '../comum/RT45GFX.BM'")
    w(f"'$INCLUDE: 'COMUM_{nome_comum}.BM'")
    w("'$INCLUDE: '../comum/MIXT.BM'")
    dims_din = {v.get("base", v["nome"]): (v["nome"], v["suf"], v["nd"]) for v in common["vars"] if v.get("nd")}
    for b, (suf, nd) in todas.items():
        if nd:
            dims_din.setdefault("_".join(b.split("_")[:2]), (b, suf or "!", nd))

    def erase_din(mm):
        nome, suf, nd = dims_din.get(mm.group(1), (None, None, 0))
        if not nd:
            return "ERASE " + mm.group(2)
        return f"REDIM {nome}{suf}(" + ", ".join(["-32768 TO -32768"] * nd) + ")"
    out = [re.sub(r"\{ERASE_DIN (\w+) ([^}]+)\}", erase_din, l) for l in out]
    if prog.onkey:
        out = [l.replace("{ONKEY}", ", ".join(prog.onkey)).replace("{ONKEY_SUB} ", "") for l in out]
    else:
        out = [l for l in out if "{ONKEY}" not in l and "{ONKEY_SUB}" not in l]
    marca = ""
    if args.marca == "openstrut":
        out, cont = aplica_marca(out, le_marca(args.marca_json))
        marca = f"; marca openstrut: {sum(cont.values())} trocas"
    dest = os.path.join(dirfam, args.exe + ".BAS")
    texto = NL.join(ascii_comentario(l) if "'" in l else l for l in out) + NL
    with open(dest, "w", encoding="cp437", newline=NL) as f:
        f.write(texto)
    print(f"{dest}: {len(out)} linhas; {len(prog.avisos)} avisos{marca}; conflitos de tipo: {prog.conflitos}")
    for a in prog.avisos:
        print("  AVISO", a)


if __name__ == "__main__":
    main()
