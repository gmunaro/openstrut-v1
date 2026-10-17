// x87_zen2.cpp - modelos das instrucoes transcendentes do x87 do Zen 2 (x87_zen2.h, x87_zen2.md).
#include "x87_zen2.h"

#include <string.h>

typedef unsigned __int128 u128;

// ================================================================ numeros de trabalho
// Valor = (-1)^s * m * 2^e, m normalizado com o bit 127 ligado (m = 0: zero).
struct Nx {
    int s;
    int e;
    u128 m;
};

static inline int clz128(u128 v) {
    uint64_t hi = (uint64_t)(v >> 64);
    if (hi)
        return __builtin_clzll(hi);
    uint64_t lo = (uint64_t)v;
    return lo ? 64 + __builtin_clzll(lo) : 128;
}

static inline Nx nx_zero(int s = 0) { return Nx{s, 0, 0}; }

// mantissa de ate 128 bits (hi:lo) * 2^e, exata
static Nx nx_bits(int s, uint64_t hi, uint64_t lo, int e) {
    u128 m = ((u128)hi << 64) | lo;
    if (!m)
        return nx_zero(s);
    int z = clz128(m);
    return Nx{s, e - z, m << z};
}
static Nx nx_int(int64_t v) {
    int s = v < 0;
    uint64_t a = s ? 0 - (uint64_t)v : (uint64_t)v;
    return nx_bits(s, 0, a, 0);
}
static inline Nx nx_neg(Nx a) {
    a.s ^= 1;
    return a;
}

// Arredonda (-1)^s * (H * 2^128 + Lw) * 2^e, com "st" = algo nao nulo abaixo de Lw, para P bits
// (1 <= P <= 128) no modo rc.
static Nx arred(int s, u128 H, u128 Lw, int e, bool st, int P, int rc) {
    if (!H) {
        if (!Lw)
            return nx_zero(s);
        H = Lw;
        Lw = 0;
        e -= 128;
    }
    int z = clz128(H);
    if (z) {
        H = (H << z) | (Lw >> (128 - z));
        Lw <<= z;
        e -= z;
    }
    int ee = e + 128; // peso do bit 0 de H
    u128 q, resto, meio;
    bool st2;
    int lsb;
    if (P == 128) {
        q = H;
        resto = Lw;
        meio = (u128)1 << 127;
        st2 = st;
        lsb = (int)(q & 1);
    } else {
        u128 mascara = ((u128)1 << (128 - P)) - 1;
        q = H & ~mascara;
        resto = H & mascara;
        meio = (u128)1 << (127 - P);
        st2 = st || Lw != 0;
        lsb = (int)((q >> (128 - P)) & 1);
    }
    bool algum = resto != 0 || st2;
    bool sobe;
    switch (rc) {
    case 0: sobe = resto > meio || (resto == meio && (st2 || lsb)); break;
    case 1: sobe = s && algum; break;
    case 2: sobe = !s && algum; break;
    default: sobe = false;
    }
    if (sobe) {
        u128 inc = P == 128 ? (u128)1 : ((u128)1 << (128 - P));
        q += inc;
        if (q == 0) { // passou de 2^128
            q = (u128)1 << 127;
            ee++;
        }
    }
    return Nx{s, ee, q};
}
static inline Nx arred1(const Nx &a, int P, int rc) { return a.m ? arred(a.s, 0, a.m, a.e, false, P, rc) : a; }

// produto exato arredondado
static Nx nx_mul(const Nx &a, const Nx &b, int P, int rc = 0) {
    int s = a.s ^ b.s;
    if (!a.m || !b.m)
        return nx_zero(s);
    uint64_t a1 = (uint64_t)(a.m >> 64), a0 = (uint64_t)a.m, b1 = (uint64_t)(b.m >> 64), b0 = (uint64_t)b.m;
    u128 p00 = (u128)a0 * b0, p01 = (u128)a0 * b1, p10 = (u128)a1 * b0, p11 = (u128)a1 * b1;
    u128 meio = (p00 >> 64) + (uint64_t)p01 + (uint64_t)p10;
    u128 lo = (meio << 64) | (uint64_t)p00;
    u128 hi = p11 + (p01 >> 64) + (p10 >> 64) + (meio >> 64);
    return arred(s, hi, lo, a.e + b.e, false, P, rc);
}

// soma exata arredondada (zero exato: +0, ou -0 se os dois sao -0)
static Nx nx_add(const Nx &a, const Nx &b, int P, int rc = 0) {
    if (!b.m) {
        if (!a.m)
            return nx_zero(a.s & b.s);
        return arred1(a, P, rc);
    }
    if (!a.m)
        return arred1(b, P, rc);
    const Nx *g = &a, *p = &b;
    if (a.e < b.e || (a.e == b.e && a.m < b.m)) {
        g = &b;
        p = &a;
    }
    int d = g->e - p->e; // >= 0 (mesma normalizacao: compara expoentes)
    // g em H (bits 128..255), p deslocado d bits para baixo
    u128 GH = g->m, GL = 0, PH, PL;
    bool st = false;
    if (d == 0) {
        PH = p->m;
        PL = 0;
    } else if (d < 128) {
        PH = p->m >> d;
        PL = p->m << (128 - d);
    } else if (d < 256) {
        PH = 0;
        PL = d == 128 ? p->m : p->m >> (d - 128);
        st = d > 128 && (p->m << (256 - d)) != 0;
    } else {
        PH = 0;
        PL = 0;
        st = true;
    }
    int e = g->e - 128;
    if (g->s == p->s) {
        u128 L = GL + PL;
        u128 c = L < GL;
        u128 H = GH + PH + c;
        bool carry = H < GH || (c && H == GH);
        if (carry) { // passa de 2^256: desloca 1
            st = st || (L & 1);
            L = (L >> 1) | (H << 127);
            H = (H >> 1) | ((u128)1 << 127);
            e++;
        }
        return arred(g->s, H, L, e, st, P, rc);
    }
    // g >= p em magnitude: G - P (o sticky de p subtrai um pouco: empresta 1 e marca sticky)
    u128 L = GL - PL;
    u128 b0 = GL < PL;
    if (st) {
        b0 += L == 0;
        L -= 1;
    }
    u128 H = GH - PH - b0;
    if (!H && !L && !st)
        return nx_zero(rc == 1 ? 1 : 0);
    return arred(g->s, H, L, e, st, P, rc);
}
static inline Nx nx_sub(const Nx &a, const Nx &b, int P, int rc = 0) { return nx_add(a, nx_neg(b), P, rc); }

// divisao corretamente arredondada
static Nx nx_div(const Nx &a, const Nx &b, int P, int rc = 0) {
    int s = a.s ^ b.s;
    if (!a.m)
        return nx_zero(s);
    // q = floor(a.m * 2^128 / b.m) em [2^127, 2^129): bit 128 em qh, o resto em q
    u128 r = a.m, q = 0, qh = 0;
    if (r >= b.m) {
        qh = 1;
        r -= b.m;
    }
    for (int i = 0; i < 128; i++) {
        bool topo = r >> 127; // r < b.m; 2r pode passar de 2^128
        r <<= 1;
        q <<= 1;
        if (topo || r >= b.m) {
            r -= b.m; // modular: certo mesmo com o bit 128 perdido
            q |= 1;
        }
    }
    return arred(s, qh, q, a.e - b.e - 128, r != 0, P, rc);
}

// ---------------------------------------------------------------- estendido <-> Nx
static Nx de_x87(x87e x) {
    int s = x.se >> 15, ex = x.se & 0x7FFF;
    if (!x.m)
        return nx_zero(s);
    return nx_bits(s, 0, x.m, (ex ? ex : 1) - 16383 - 63);
}
// arredonda para o estendido (64 bits, expoente do x87; denormais com a mesma regra do x87:
// arredonda na grade denormal; sem tratamento de estouro alem de infinito)
static x87e para_x87(const Nx &v, int rc) {
    x87e r;
    if (!v.m) {
        r.m = 0;
        r.se = (uint16_t)(v.s << 15);
        return r;
    }
    Nx a = arred1(v, 64, rc);
    int ex = a.e + 127 + 16383; // expoente com vies do bit 127
    if (ex >= 1) {
        if (ex >= 0x7FFF) {
            bool inf = rc == 0 || (rc == 1 && a.s) || (rc == 2 && !a.s);
            r.m = inf ? 0x8000000000000000ULL : ~0ULL;
            r.se = (uint16_t)((a.s << 15) | (inf ? 0x7FFF : 0x7FFE));
            return r;
        }
        r.m = (uint64_t)(a.m >> 64);
        r.se = (uint16_t)((a.s << 15) | ex);
        return r;
    }
    // denormal: P = 64 - (1 - ex) bits
    int P = 64 - (1 - ex);
    if (P < 1) {
        // abaixo da metade do menor denormal (ou arredonda para ele)
        bool sobe = false;
        if (rc == 1 && v.s) sobe = true;
        if (rc == 2 && !v.s) sobe = true;
        if (rc == 0 && P == 0) { // valor em [2^-16446, 2^-16445): meio do menor denormal ou acima
            sobe = v.m > ((u128)1 << 127) ? true : false;
            if (v.m == ((u128)1 << 127))
                sobe = false; // empate: ao par (zero)
        }
        r.m = sobe ? 1 : 0;
        r.se = (uint16_t)(v.s << 15);
        return r;
    }
    Nx b = arred1(v, P, rc);
    int exb = b.e + 127 + 16383;
    if (exb >= 1) { // arredondou para o menor normal
        r.m = (uint64_t)(b.m >> 64);
        r.se = (uint16_t)((b.s << 15) | exb);
        return r;
    }
    // m * 2^(e) com e = -16382 - 63 na grade denormal
    int sh = (1 - exb); // deslocamento adicional
    r.m = (uint64_t)(b.m >> 64) >> sh;
    r.se = (uint16_t)(b.s << 15);
    return r;
}

// ---------------------------------------------------------------- especiais
static const int EXP_MAX = 0x7FFF;
static inline int ex_de(x87e x) { return x.se & 0x7FFF; }
static inline bool e_nan(x87e x) { return ex_de(x) == EXP_MAX && (x.m << 1) != 0; }
static inline bool e_inf(x87e x) { return ex_de(x) == EXP_MAX && (x.m << 1) == 0; }
static inline bool e_zero(x87e x) { return x.m == 0 && ex_de(x) == 0; }
static inline int sinal(x87e x) { return x.se >> 15; }
static x87e nan_padrao() { return x87e{0xC000000000000000ULL, 0xFFFF}; } // indefinido do x87
static x87e nan_quieto(x87e x) {
    x.m |= 0x4000000000000000ULL;
    return x;
}
// NaN de dois operandos: o de maior mantissa (regra do x87), quieto
static x87e nan_de2(x87e a, x87e b) {
    if (e_nan(a) && e_nan(b)) {
        uint64_t ma = a.m, mb = b.m; // compara as mantissas originais
        if (ma != mb) return nan_quieto(ma > mb ? a : b);
        return nan_quieto((a.se & 0x8000) == 0 ? a : b); // empate: o positivo
    }
    return nan_quieto(e_nan(a) ? a : b);
}
static x87e x_zero(int s) { return x87e{0, (uint16_t)(s << 15)}; }
static x87e x_inf(int s) { return x87e{0x8000000000000000ULL, (uint16_t)((s << 15) | 0x7FFF)}; }

// pi com 66 bits do x87 (0x3243F6A8885A308D3 * 2^-64) e pi/2
static Nx pi66() { return nx_bits(0, 0x3, 0x243F6A8885A308D3ULL, -64); }
static Nx pi66_2() { return nx_bits(0, 0x3, 0x243F6A8885A308D3ULL, -65); }
// pi com 128 bits (para os valores exatos arredondados)
static Nx pi128() { return nx_bits(0, 0xc90fdaa22168c234ULL, 0xc4c6628b80dc1cd1ULL, -126); }

// valor inteiro (|v| < 2^63) de um Nx inteiro
static int64_t nx_para_int(const Nx &v) {
    if (!v.m) return 0;
    int sh = -v.e; // v = m * 2^e, m < 2^128
    uint64_t a = sh >= 128 ? 0 : (uint64_t)(v.m >> sh);
    return v.s ? -(int64_t)a : (int64_t)a;
}
// arredonda para inteiro (ao par)
static Nx nx_rint(const Nx &v) {
    if (!v.m) return v;
    int bits = v.e + 128; // bits inteiros
    if (bits >= 128) return v;
    if (bits < 0) return nx_zero(v.s);
    if (bits == 0) { // |v| < 1: 0 ou 1
        bool sobe = v.m > ((u128)1 << 127);
        return sobe ? nx_bits(v.s, 0, 1, 0) : nx_zero(v.s);
    }
    return arred1(v, bits, 0);
}

// ================================================================ FSIN, FCOS (Zen 2)
// Coeficientes de 68 bits (formato Nx: sinal, mantissa de 128 bits normalizada, expoente).
struct Coef {
    int s;
    uint64_t hi, lo;
    int e;
};
static inline Nx cf(const Coef &c) { return Nx{c.s, c.e, ((u128)c.hi << 64) | c.lo}; }

// sin r = r - c, c = r68(r68(|r| * z) * p(z)), z = r68(r^2), p por Horner em 68 bits
static const Coef SIN_Q[] = {
    // <SIN_Q>
    {0, 0xaaaaaaaaaaaaaa97ULL, 0xd000000000000000ULL, -130}, // q0
    {1, 0x88888888888858c9ULL, 0x7000000000000000ULL, -134}, // q1
    {0, 0xd00d00d00c5de2caULL, 0xd000000000000000ULL, -140}, // q2
    {1, 0xb8ef1d29b051861dULL, 0x7000000000000000ULL, -146}, // q3
    {0, 0xd73229834fa2e98aULL, 0xf000000000000000ULL, -153}, // q4
    {1, 0xb0909ea662105d97ULL, 0x0000000000000000ULL, -160}, // q5
    {0, 0xd5e6aaef0a78cc9eULL, 0xc000000000000000ULL, -168}, // q6
    {1, 0x875992691947eb59ULL, 0x3000000000000000ULL, -176}, // q7
    {0, 0xcb1681deb551e2e4ULL, 0xa000000000000000ULL, -178}, // q8
    {1, 0xb8dc77b6e7ab8c5fULL, 0x8000000000000000ULL, -193}, // q9
    // </SIN_Q>
};
// cos r = 1 - c, c = r68(z * p(z))
static const Coef COS_Q[] = {
    // <COS_Q>
    {0, 0x8000000000000000ULL, 0x0000000000000000ULL, -128}, // q0
    {1, 0xaaaaaaaaaaaaaaadULL, 0xa000000000000000ULL, -132}, // q1
    {0, 0xb60b60b60b60be5aULL, 0x2000000000000000ULL, -137}, // q2
    {1, 0xd00d00d00d176dbaULL, 0xb000000000000000ULL, -143}, // q3
    {0, 0x93f27dbbe77e141eULL, 0xe000000000000000ULL, -149}, // q4
    {1, 0x8f76c7bcf786d4f9ULL, 0x6000000000000000ULL, -156}, // q5
    {0, 0xc9cc217351bc4f89ULL, 0xa000000000000000ULL, -164}, // q6
    {1, 0xd7c4245f838e475eULL, 0xc000000000000000ULL, -172}, // q7
    {0, 0xed0b06575d7361ddULL, 0x8000000000000000ULL, -180}, // q8
    // </COS_Q>
};

static Nx horner68(const Coef *q, int n, const Nx &z) {
    Nx p = cf(q[n - 1]);
    for (int i = n - 2; i >= 0; i--) p = nx_add(nx_mul(p, z, 68), cf(q[i]), 68);
    return p;
}
// c do seno de a = |r| (a > 0)
static Nx sin_c(const Nx &a) {
    Nx z = nx_mul(a, a, 68);
    Nx p = horner68(SIN_Q, (int)(sizeof SIN_Q / sizeof SIN_Q[0]), z);
    return nx_mul(nx_mul(a, z, 68), p, 68);
}
static Nx cos_c(const Nx &a) {
    Nx z = nx_mul(a, a, 68);
    Nx p = horner68(COS_Q, (int)(sizeof COS_Q / sizeof COS_Q[0]), z);
    return nx_mul(z, p, 68);
}

// reducao do x87: |x| = k * (pi66 / 2) + r, k o inteiro mais proximo, r exato (|r| <= ~pi/4)
static Nx reduz(const Nx &ax, int64_t *k) {
    Nx P = pi66_2();
    Nx q = nx_rint(nx_div(ax, P, 128));
    *k = nx_para_int(q);
    if (!*k) return ax;
    return nx_sub(ax, nx_mul(q, P, 128), 128); // exato: r cabe em 66 bits
}

// resultado final: (neg ? -1 : 1) * (a - b), um arredondamento para 64 bits
static x87e fecha(const Nx &a, const Nx &b, bool neg, int rc) {
    Nx A = a, B = b;
    if (neg) { A.s ^= 1; B.s ^= 1; }
    return para_x87(nx_sub(A, B, 64, rc), rc);
}
// sin (f = 0) ou cos (f = 1) de r (sinal em r), multiplicado por (neg ? -1 : 1)
static x87e sc_de_r(int f, Nx r, bool neg, int rc) {
    if (f == 0) {
        if (!r.m) { r.s ^= neg; return para_x87(r, rc); }
        bool n2 = neg ^ (r.s != 0);
        r.s = 0;
        return fecha(r, sin_c(r), n2, rc);
    }
    r.s = 0;
    if (!r.m) return para_x87(nx_bits(neg, 0, 1, 0), rc);
    return fecha(nx_int(1), cos_c(r), neg, rc);
}

static bool trig_especial(x87e x, x87e *res, int *fora) {
    if (fora) *fora = 0;
    if (e_nan(x)) { *res = nan_quieto(x); return true; }
    if (e_inf(x)) { *res = nan_padrao(); return true; }
    if (ex_de(x) >= 16383 + 63) { // |x| >= 2^63: fora da faixa, st0 intacto
        if (fora) *fora = 1;
        *res = x;
        return true;
    }
    return false;
}

x87e zen2_fsin(x87e x, int rc, int *fora) {
    x87e res;
    if (trig_especial(x, &res, fora)) return res;
    if (e_zero(x)) return x;
    Nx X = de_x87(x), ax = X;
    ax.s = 0;
    int64_t k;
    Nx r = reduz(ax, &k);
    int q = (int)(k & 3);
    bool neg = X.s != 0;
    // sin(k pi/2 + r): 0 sin r, 1 cos r, 2 -sin r, 3 -cos r
    return sc_de_r(q & 1, r, neg ^ (q >= 2), rc);
}
x87e zen2_fcos(x87e x, int rc, int *fora) {
    x87e res;
    if (trig_especial(x, &res, fora)) return res;
    Nx X = de_x87(x), ax = X;
    ax.s = 0;
    if (!ax.m) return x87e{0x8000000000000000ULL, 0x3FFF};
    int64_t k;
    Nx r = reduz(ax, &k);
    int q = (int)(k & 3);
    // cos(k pi/2 + r): 0 cos r, 1 -sin r, 2 -cos r, 3 sin r
    if (q & 1) return sc_de_r(0, r, q == 1, rc);
    return sc_de_r(1, r, q == 2, rc);
}

// ================================================================ funcoes exatas (128 bits)
// Usadas onde o modelo do Zen 2 ainda e o valor exato arredondado (x87_zen2.md diz onde).
static const int XP = 128;
static Nx ln2_128() { return nx_bits(0, 0xb17217f7d1cf79abULL, 0xc9e3b39803f2f6afULL, -128); }
// sin e cos por Taylor, |r| <= ~1
static Nx ex_sin(const Nx &r) {
    Nx z = nx_mul(r, r, XP), t = r, s = r;
    for (int k = 1; k < 40; k++) {
        t = nx_div(nx_mul(t, z, XP), nx_int((2 * k) * (2 * k + 1)), XP);
        t.s ^= 1;
        s = nx_add(s, t, XP);
        if (!t.m || t.e < s.e - 140) break;
    }
    return s;
}
static Nx ex_cos(const Nx &r) {
    Nx z = nx_mul(r, r, XP), t = nx_int(1), s = t;
    for (int k = 1; k < 40; k++) {
        t = nx_div(nx_mul(t, z, XP), nx_int((2 * k - 1) * (2 * k)), XP);
        t.s ^= 1;
        s = nx_add(s, t, XP);
        if (!t.m || t.e < s.e - 140) break;
    }
    return s;
}
static Nx ex_sqrt(const Nx &a) {
    if (!a.m) return a;
    // aproximacao inicial pelo double, depois Newton
    int e = a.e + 64;
    double d = (double)(uint64_t)(a.m >> 64);
    if (e & 1) { d *= 2; e--; }
    Nx y = nx_bits(0, 0, (uint64_t)__builtin_sqrt(d), e / 2);
    for (int i = 0; i < 6; i++) {
        y = nx_add(y, nx_div(a, y, XP), XP);
        y.e--;
    }
    return y;
}
// atan(t), t >= 0 qualquer: atan(t) = pi/2 - atan(1/t) se t > 1; depois t -> t/(1+sqrt(1+t^2)) 3 vezes
static Nx ex_atan(Nx t) {
    if (!t.m) return t;
    bool inv = false;
    if (t.e + 127 >= 0 && !(t.e + 127 == 0 && t.m == ((u128)1 << 127))) { // t > 1
        t = nx_div(nx_int(1), t, XP);
        inv = true;
    }
    Nx um = nx_int(1);
    for (int i = 0; i < 3; i++) t = nx_div(t, nx_add(um, ex_sqrt(nx_add(um, nx_mul(t, t, XP), XP)), XP), XP);
    Nx z = nx_mul(t, t, XP), p = t, soma = t;
    for (int k = 1; k < 200; k++) {
        p = nx_mul(p, z, XP);
        p.s ^= 1;
        Nx termo = nx_div(p, nx_int(2 * k + 1), XP);
        soma = nx_add(soma, termo, XP);
        if (!termo.m || termo.e < soma.e - 140) break;
    }
    soma.e += 3;
    if (inv) {
        Nx pi2 = pi128();
        pi2.e--;
        soma = nx_sub(pi2, soma, XP);
    }
    return soma;
}
// e^y - 1, |y| < 1
static Nx ex_expm1(const Nx &y) {
    Nx t = y, s = y;
    for (int k = 2; k < 60; k++) {
        t = nx_div(nx_mul(t, y, XP), nx_int(k), XP);
        s = nx_add(s, t, XP);
        if (!t.m || t.e < s.e - 140) break;
    }
    return s;
}

// ================================================================ FPTAN
// Modelo provisorio: tan do r reduzido como no FSIN (pi66), valor exato arredondado uma vez.
x87e zen2_fptan(x87e x, int rc, int *fora) {
    x87e res;
    if (fora) *fora = 0;
    if (e_nan(x)) return nan_quieto(x);
    if (e_inf(x)) return nan_padrao();
    if (ex_de(x) >= 16383 + 63) {
        if (fora) *fora = 1;
        return x;
    }
    if (e_zero(x)) return x;
    Nx X = de_x87(x), ax = X;
    ax.s = 0;
    int64_t k;
    Nx r = reduz(ax, &k);
    Nx s = ex_sin(r), c = ex_cos(r);
    Nx t = (k & 1) ? nx_div(c, s, XP) : nx_div(s, c, XP);
    if (k & 1) t.s ^= 1;
    t.s ^= X.s;
    (void)res;
    return para_x87(t, rc);
}

// ================================================================ F2XM1
// Modelo provisorio: 2^x - 1 exato arredondado (o Zen 2 difere em parte dos casos, x87_zen2.md).
x87e zen2_f2xm1(x87e x, int rc) {
    if (e_nan(x)) return nan_quieto(x);
    if (e_inf(x)) return sinal(x) ? x87e{0x8000000000000000ULL, 0xBFFF} : x;
    if (e_zero(x)) return x;
    if (x.m == 0x8000000000000000ULL && ex_de(x) == 16383) { // +-1, medidos: -1 da -0,5 exato; 1 da um pouco menos que 1
        if (sinal(x)) return x87e{0x8000000000000000ULL, 0xBFFE};
        return para_x87(nx_sub(nx_int(1), nx_bits(0, 0, 1, -80), XP), rc);
    }
    Nx X = de_x87(x);
    Nx v = ex_expm1(nx_mul(X, ln2_128(), XP));
    return para_x87(v, rc);
}

// ================================================================ FPATAN
// Modelo provisorio: atan2 exato arredondado uma vez.
static x87e pi_frac(int s, int num, int den, int rc) { // s * num/den * pi
    Nx p = nx_div(nx_mul(pi128(), nx_int(num), XP), nx_int(den), XP);
    p.s = s;
    return para_x87(arred1(p, 64, rc), rc);
}
x87e zen2_fpatan(x87e y, x87e x, int rc) {
    if (e_nan(x) || e_nan(y)) return nan_de2(y, x);
    int sy = sinal(y), sx = sinal(x);
    if (e_inf(y)) {
        if (e_inf(x)) return pi_frac(sy, sx ? 3 : 1, 4, rc);
        return pi_frac(sy, 1, 2, rc);
    }
    if (e_zero(y)) {
        if (sx) return pi_frac(sy, 1, 1, rc);
        return x_zero(sy);
    }
    if (e_inf(x)) return sx ? pi_frac(sy, 1, 1, rc) : x_zero(sy);
    if (e_zero(x)) return pi_frac(sy, 1, 2, rc);
    Nx Y = de_x87(y), X = de_x87(x);
    Y.s = X.s = 0;
    // |y| > |x|: pi/2 -+ atan(|x|/|y|) com o pi de 66 bits do x87 (confere 100% para |y/x| > 2^30);
    // x < 0 e |y| <= |x|: pi66 - atan(|y|/|x|)
    Nx d = nx_sub(Y, X, XP);
    Nx a;
    if (d.m && !d.s) {
        a = ex_atan(nx_div(X, Y, 68)); // o quociente interno tem 68 bits
        a = sx ? nx_add(pi66_2(), a, XP) : nx_sub(pi66_2(), a, XP);
    } else {
        a = ex_atan(nx_div(Y, X, 68));
        if (sx) a = nx_sub(pi66(), a, XP);
    }
    a.s = sy;
    return para_x87(a, rc);
}

// ================================================================ FYL2X, FYL2XP1 (Zen 2)
// log2 interno de 68 bits (o mesmo do RT45X87.h, x87_zen2.md), resultado = arredonda64(y * L).
static const Coef LOG_A[10] = {
    {0, 0xf6384ee1d01feb56ULL, 0x4000000000000000ULL, -128}, {0, 0x93bb62877ce08b8eULL, 0xa000000000000000ULL, -128},
    {0, 0xd30bb153d63406bbULL, 0xf000000000000000ULL, -129}, {0, 0xa42589ec186c86d1ULL, 0x3000000000000000ULL, -129},
    {0, 0x864d42456b2ab3a5ULL, 0xd000000000000000ULL, -129}, {0, 0xe347ab5994498e0bULL, 0x8000000000000000ULL, -130},
    {0, 0xc4fa08aa62a7ec09ULL, 0xb000000000000000ULL, -130}, {0, 0xadc9d22ad49452b5ULL, 0x4000000000000000ULL, -130},
    {0, 0x9b354f1dc588dd58ULL, 0xd000000000000000ULL, -130}, {0, 0x9a234407e917b3a7ULL, 0x7000000000000000ULL, -130}};
static Nx log_C() { return nx_bits(0, 0xb, 0x8aa3b295c17f0bbcULL, -66); } // r68(2 / ln 2)
// L = r68(r68(k + r68(s C)) + R), R = r68(z r68(s q)), q = Horner(a_i, z), z = r68(s^2)
static Nx log2_serie(const Nx &s, int64_t k) {
    Nx z = nx_mul(s, s, 68);
    Nx q = horner68(LOG_A, 10, z);
    Nx R = nx_mul(z, nx_mul(s, q, 68), 68);
    Nx sc = nx_mul(s, log_C(), 68);
    Nx ks = k ? nx_add(nx_int(k), sc, 68) : sc;
    return nx_add(ks, R, 68);
}
// FYL2X: x > 0 finito
static Nx log2_x(const Nx &x) {
    Nx m = x;
    int64_t k = m.e + 127;
    m.e = -127; // m em [1, 2)
    if ((uint64_t)(m.m >> 64) > 0xb504f333f9de6484ULL) {
        m.e = -128;
        k++;
    }
    Nx s = nx_div(nx_sub(m, nx_int(1), 68), nx_add(m, nx_int(1), 68), 68);
    if (!s.m) return nx_int(k);
    return log2_serie(s, k);
}
// FYL2XP1: log2(1 + x), s = r68(x / r68(2 + x))
static Nx log2_1px(const Nx &x) {
    Nx s = nx_div(x, nx_add(nx_int(2), x, 68), 68);
    return log2_serie(s, 0);
}
static x87e y_vezes(const Nx &L, x87e y, int rc) {
    Nx Y = de_x87(y);
    if (!L.m || !Y.m) return x_zero(L.s ^ Y.s);
    Nx p = nx_mul(Y, L, 128);
    if (p.e + 127 + 16383 < 1) return para_x87(p, rc); // denormal: um arredondamento so, na grade denormal
    return para_x87(nx_mul(Y, L, 64, rc), rc);
}

x87e zen2_fyl2x(x87e y, x87e x, int rc) {
    if (e_nan(x) || e_nan(y)) return nan_de2(y, x);
    int sy = sinal(y);
    if (sinal(x) && !e_zero(x)) return nan_padrao(); // x < 0
    if (e_zero(x)) {
        if (e_zero(y)) return nan_padrao();
        return x_inf(!sy);
    }
    if (e_inf(x)) {
        if (e_zero(y)) return nan_padrao();
        return x_inf(sy);
    }
    bool um = ex_de(x) == 16383 && x.m == 0x8000000000000000ULL;
    if (e_inf(y)) {
        if (um) return nan_padrao();
        bool menor = ex_de(x) < 16383;
        return x_inf(sy ^ menor);
    }
    if (um) return x_zero(sy);
    return y_vezes(log2_x(de_x87(x)), y, rc);
}

x87e zen2_fyl2xp1(x87e y, x87e x, int rc) {
    if (e_nan(x) || e_nan(y)) return nan_de2(y, x);
    int sy = sinal(y), sx = sinal(x);
    if (e_zero(x)) {
        if (e_inf(y)) return nan_padrao();
        return x_zero(sy ^ sx);
    }
    if (e_inf(x)) {
        if (sx || e_zero(y)) return nan_padrao();
        return x_inf(sy);
    }
    // x <= -1: o Zen 2 devolve x (fora do dominio)
    Nx X = de_x87(x);
    Nx um = nx_int(1);
    // x <= -1: devolve x; y = +-0 ou +-inf: -y (medido no Zen 2)
    if (sx && (nx_sub(X, nx_neg(um), XP).s == 1 || nx_sub(X, nx_neg(um), XP).m == 0)) {
        if (e_zero(y) || e_inf(y)) {
            y.se ^= 0x8000;
            return y;
        }
        return x;
    }
    if (e_inf(y)) return x_inf(sy ^ sx);
    // |x| < 1 - raiz(2)/2: serie direta; fora disso, o caminho do FYL2X sobre 1 + x exato
    // (bate ~98% em 0,29 < |x| < 0,5 e 100% acima de 0,5; dominio do logl e so o primeiro)
    if (ex_de(x) < 16383 - 2 || (ex_de(x) == 16383 - 2 && x.m <= 0x95f619980c4336f7ULL))
        return y_vezes(log2_1px(X), y, rc);
    Nx M = nx_add(um, X, XP);
    int64_t k = M.e + 127;
    M.e = -127;
    if ((uint64_t)(M.m >> 64) > 0xb504f333f9de6484ULL) {
        M.e = -128;
        k++;
    }
    Nx s = nx_div(nx_sub(M, um, 68), nx_add(M, um, 68), 68);
    return y_vezes(s.m ? log2_serie(s, k) : nx_int(k), y, rc);
}

// ================================================================ libm do mingw-w64 (x86_64)
// Cada funcao segue o codigo de maquina da libm long double do mingw (llvm-mingw do QB64 PE),
// palavra de controle 0x37F: cada operacao arredonda para 64 bits ao par, salvo onde a sequencia
// muda o RC.
static const x87e X_UM = {0x8000000000000000ULL, 0x3FFF};
static const x87e X_QNAN = {0xC000000000000000ULL, 0x7FFF}; // NaN positivo das constantes float da libm
static x87e op_add(x87e a, x87e b, int rc = 0) { return para_x87(nx_add(de_x87(a), de_x87(b), 64, rc), rc); }
static x87e op_sub(x87e a, x87e b, int rc = 0) { return para_x87(nx_sub(de_x87(a), de_x87(b), 64, rc), rc); }
static x87e op_mul(x87e a, x87e b, int rc = 0) { return para_x87(nx_mul(de_x87(a), de_x87(b), 64, rc), rc); }
// FRNDINT no modo rc (finito)
static x87e op_rndint(x87e a, int rc) {
    if (e_zero(a) || ex_de(a) >= 16383 + 63) return a;
    Nx v = de_x87(a);
    int bits = v.e + 128; // bits da parte inteira
    if (bits <= 0) { // |a| < 1
        bool um = false;
        if (rc == 0) um = bits == 0 && v.m > ((u128)1 << 127);
        if (rc == 1) um = v.s;
        if (rc == 2) um = !v.s;
        return um ? x87e{0x8000000000000000ULL, (uint16_t)((v.s << 15) | 0x3FFF)} : x_zero(v.s);
    }
    return para_x87(arred1(v, bits, rc), rc);
}
// FSCALE: a * 2^trunc(b), b inteiro aqui
static x87e op_scale(x87e a, x87e b) {
    Nx v = de_x87(a);
    int64_t n = nx_para_int(de_x87(b));
    if (!v.m) return a;
    if (n > 40000) n = 40000;
    if (n < -40000) n = -40000;
    v.e += (int)n;
    return para_x87(v, 0);
}
// FPREM1 de |x| >= 2^63 por 2 * pi64 (o "fldpi; fadd st, st" da libm): resto exato ao par
static x87e op_prem1_2pi(x87e x) {
    // y = 2 * pi64 = 0xC90FDAA22168C235 * 2^-61
    const uint64_t my = 0xC90FDAA22168C235ULL;
    int ex = ex_de(x) - 16383 - 63; // x = mx * 2^ex, ex >= 0 aqui
    int sh = ex + 61;               // x / y = mx * 2^sh / my
    // R = mx * 2^sh mod my
    u128 r = x.m % my, p = 1, b = 2;
    for (int e = sh; e > 0; e >>= 1) {
        if (e & 1) p = (p * b) % my;
        b = (b * b) % my;
    }
    r = (r * p) % my;
    // resto mais proximo: r ou r - my (empate: tanto faz para o seno; nao ocorre com y irracional na pratica)
    bool menos = 2 * r > (u128)my;
    Nx R = nx_bits(0, 0, (uint64_t)r, -61);
    if (menos) R = nx_sub(R, nx_bits(0, 0, my, -61), 128);
    if (sinal(x)) R.s ^= 1;
    if (!R.m) return x_zero(sinal(x));
    return para_x87(R, 0); // exato
}

x87e mingw_sinl(x87e x) {
    if (ex_de(x) == EXP_MAX) return e_nan(x) ? x : X_QNAN;
    int fora;
    x87e r = zen2_fsin(x, 0, &fora);
    if (fora) r = zen2_fsin(op_prem1_2pi(x), 0);
    return r;
}
x87e mingw_cosl(x87e x) {
    if (ex_de(x) == EXP_MAX) return e_nan(x) ? x : X_QNAN;
    int fora;
    x87e r = zen2_fcos(x, 0, &fora);
    if (fora) r = zen2_fcos(op_prem1_2pi(x), 0);
    return r;
}
x87e mingw_tanl(x87e x) {
    int fora;
    x87e r = zen2_fptan(x, 0, &fora);
    if (fora) r = zen2_fptan(op_prem1_2pi(x), 0);
    return r;
}
x87e mingw_atanl(x87e x) { return zen2_fpatan(x, X_UM, 0); }
x87e mingw_atan2l(x87e y, x87e x) { return zen2_fpatan(y, x, 0); }

x87e mingw_expl(x87e x) {
    if (ex_de(x) == EXP_MAX) {
        if (e_nan(x)) return x;
        return sinal(x) ? x_zero(0) : x_inf(0);
    }
    if (e_zero(x)) return X_UM;
    static const x87e LIM_SUP = {0xB17217F7D1CF79ACULL, 0x400C}, LIM_INF = {0xB16C8C671210EB30ULL, 0xC00C};
    Nx X = de_x87(x);
    Nx d1s = nx_sub(X, de_x87(LIM_SUP), 128), d1i = nx_sub(de_x87(LIM_INF), X, 128);
    if (d1s.m && !d1s.s) return x_inf(0);  // x > limite: +inf (ERANGE)
    if (d1i.m && !d1i.s) return x_zero(0); // x < limite inferior: 0
    static const x87e L2E = {0xB8AA3B295C17F0BCULL, 0x3FFF}; // FLDL2E ao par
    static const x87e C0 = {0xB8AA000000000000ULL, 0x3FFF}, C1 = {0xECA5705FC2EEFA20ULL, 0x3FED};
    x87e t = op_mul(L2E, x);
    x87e n = op_rndint(t, 3), xi = op_rndint(x, 3);
    x87e d1 = op_sub(op_mul(xi, C0), n);
    x87e xf = op_sub(x, xi);
    x87e f1 = op_add(d1, op_mul(C0, xf));
    x87e f = op_add(f1, op_mul(C1, x));
    x87e h = op_add(zen2_f2xm1(f, 0), X_UM);
    return op_scale(h, n);
}

x87e mingw_logl(x87e x) {
    if (ex_de(x) == EXP_MAX) {
        if (e_nan(x)) return x;
        return sinal(x) ? X_QNAN : x_inf(0);
    }
    if (x.m == 0) return x_inf(1); // +-0 (e pseudo-zeros)
    if (sinal(x)) return X_QNAN;
    static const x87e LN2 = {0xB17217F7D1CF79ACULL, 0x3FFE}; // FLDLN2 ao par
    x87e t = op_sub(x, X_UM);
    // |t| > 0.29 (double 0x3fd28f5c28f5c28f): FYL2X; senao FYL2XP1
    static const x87e LIM = {0x947AE147AE147800ULL, 0x3FFD};
    Nx at = de_x87(t);
    at.s = 0;
    Nx d = nx_sub(at, de_x87(LIM), 128);
    if (d.m && d.s == 0) return zen2_fyl2x(LN2, x, 0);
    return zen2_fyl2xp1(LN2, t, 0);
}

// ---------------------------------------------------------------- ponte para o qb_f80
static x87e le10(const void *p) {
    x87e v;
    memcpy(&v.m, p, 8);
    memcpy(&v.se, (const char *)p + 8, 2);
    return v;
}
static void grava10(void *p, x87e v) {
    memcpy(p, &v.m, 8);
    memcpy((char *)p + 8, &v.se, 2);
}
void x87z_f(int f, const void *x, void *r) {
    x87e a = le10(x), v;
    switch (f) {
    case X87Z_SIN: v = mingw_sinl(a); break;
    case X87Z_COS: v = mingw_cosl(a); break;
    case X87Z_TAN: v = mingw_tanl(a); break;
    case X87Z_ATAN: v = mingw_atanl(a); break;
    case X87Z_EXP: v = mingw_expl(a); break;
    default: v = mingw_logl(a); break;
    }
    grava10(r, v);
}
void x87z_atan2(const void *y, const void *x, void *r) { grava10(r, mingw_atan2l(le10(y), le10(x))); }
