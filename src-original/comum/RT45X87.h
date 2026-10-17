/* RT45X87.h - potencia (B$POW4/B$POW8 do BRUN45) e FSQRT do x87 para o RT45 (RT_POT##, RT_SQR##).
   Docs: docs/RETRADUCAO.md, "Ponto flutuante", regras 9 e 10.

   Modelo fixo em software, o mesmo da OpenStrut V2 (src/calculo/sistrut/base/x87.ts): o
   resultado nao depende do processador. Precisao estendida (64 bits de mantissa, ao par).
   - FYL2X(y, x) = arredonda64(y * L(x)), L(x) o log2 interno de 68 bits do x87 do Zen 2
     (AMD Ryzen 5 3600, o processador do oraculo), cada operacao arredondada ao par em 68 bits:
       x = 2^k * m, m em [1, 2); m > raiz de 2 (mantissa > 0xb504f333f9de6484): m = m / 2, k + 1
       s = r68((m - 1) / (m + 1)); z = r68(s * s)
       q = a10; q = r68(r68(q * z) + a_i), i = 9..1
       R = r68(z * r68(s * q)); L = r68(r68(k + r68(s * C)) + R), C = r68(2 / ln 2)
   - F2XM1(x) = 2^x - 1 exato arredondado ao par em 64 bits (o Zen 2 difere em ~2,5 %).
   - FRNDINT, a subtracao, FLD1/FADDP, FDIVRP, FSCALE e FSQRT: exatos com arredondamento ao par.
   Inteiros de tamanho fixo (palavras de 64 bits, unsigned __int128 nos produtos). */
#ifndef RT45X87_H
#define RT45X87_H
#include <stdint.h>
#include <string.h>

typedef unsigned __int128 rt45_u128;

/* ------------------------------------------------------------ inteiros de 384 bits */
#define RT45_NL 6
typedef struct { uint64_t w[RT45_NL]; } rt45_u;

static void rt45u_zero(rt45_u *a) { memset(a, 0, sizeof *a); }
static void rt45u_set(rt45_u *a, uint64_t hi, uint64_t lo) { rt45u_zero(a); a->w[0] = lo; a->w[1] = hi; }
static int rt45u_iszero(const rt45_u *a) { for (int i = 0; i < RT45_NL; i++) if (a->w[i]) return 0; return 1; }
static int rt45u_bits(const rt45_u *a) {
    for (int i = RT45_NL - 1; i >= 0; i--) if (a->w[i]) return i * 64 + 64 - __builtin_clzll(a->w[i]);
    return 0;
}
static int rt45u_bit(const rt45_u *a, int i) { return (i < 0 || i >= 64 * RT45_NL) ? 0 : (int)((a->w[i / 64] >> (i % 64)) & 1); }
/* algum bit abaixo da posicao k (bits 0..k-1) */
static int rt45u_abaixo(const rt45_u *a, int k) {
    for (int i = 0; i < RT45_NL && k > 0; i++, k -= 64) {
        uint64_t m = k >= 64 ? ~(uint64_t)0 : (((uint64_t)1 << k) - 1);
        if (a->w[i] & m) return 1;
    }
    return 0;
}
static void rt45u_shl(rt45_u *r, const rt45_u *a, int n) {
    rt45_u t; rt45u_zero(&t);
    int q = n / 64, b = n % 64;
    for (int i = RT45_NL - 1; i >= q; i--) {
        uint64_t v = a->w[i - q] << b;
        if (b && i - q - 1 >= 0) v |= a->w[i - q - 1] >> (64 - b);
        t.w[i] = v;
    }
    *r = t;
}
static void rt45u_shr(rt45_u *r, const rt45_u *a, int n) {
    rt45_u t; rt45u_zero(&t);
    int q = n / 64, b = n % 64;
    for (int i = 0; i + q < RT45_NL; i++) {
        uint64_t v = a->w[i + q] >> b;
        if (b && i + q + 1 < RT45_NL) v |= a->w[i + q + 1] << (64 - b);
        t.w[i] = v;
    }
    *r = t;
}
static int rt45u_cmp(const rt45_u *a, const rt45_u *b) {
    for (int i = RT45_NL - 1; i >= 0; i--) if (a->w[i] != b->w[i]) return a->w[i] < b->w[i] ? -1 : 1;
    return 0;
}
static void rt45u_add(rt45_u *r, const rt45_u *a, const rt45_u *b) {
    uint64_t c = 0;
    for (int i = 0; i < RT45_NL; i++) { rt45_u128 s = (rt45_u128)a->w[i] + b->w[i] + c; r->w[i] = (uint64_t)s; c = (uint64_t)(s >> 64); }
}
static void rt45u_sub(rt45_u *r, const rt45_u *a, const rt45_u *b) { /* a >= b */
    uint64_t emp = 0;
    for (int i = 0; i < RT45_NL; i++) {
        uint64_t x = a->w[i], y = b->w[i];
        uint64_t d = x - y - emp;
        emp = (x < y) || (x - y < emp);
        r->w[i] = d;
    }
}
static void rt45u_inc(rt45_u *a) { for (int i = 0; i < RT45_NL; i++) if (++a->w[i]) break; }
static void rt45u_mul(rt45_u *r, const rt45_u *a, const rt45_u *b) { /* produto truncado a 384 bits */
    uint64_t t[RT45_NL] = {0};
    for (int i = 0; i < RT45_NL; i++) {
        if (!a->w[i]) continue;
        uint64_t c = 0;
        for (int j = 0; i + j < RT45_NL; j++) {
            rt45_u128 p = (rt45_u128)a->w[i] * b->w[j] + t[i + j] + c;
            t[i + j] = (uint64_t)p; c = (uint64_t)(p >> 64);
        }
    }
    memcpy(r->w, t, sizeof t);
}
/* divisao longa bit a bit: q = a / b, resto != 0 em *sobra */
static void rt45u_div(rt45_u *q, int *sobra, const rt45_u *a, const rt45_u *b) {
    rt45_u r, qq; rt45u_zero(&r); rt45u_zero(&qq);
    for (int i = rt45u_bits(a) - 1; i >= 0; i--) {
        rt45u_shl(&r, &r, 1);
        r.w[0] |= (uint64_t)rt45u_bit(a, i);
        if (rt45u_cmp(&r, b) >= 0) { rt45u_sub(&r, &r, b); qq.w[i / 64] |= (uint64_t)1 << (i % 64); }
    }
    *q = qq; *sobra = !rt45u_iszero(&r);
}

/* ------------------------------------------------------------ numeros m * 2^e com sinal */
typedef struct { int s; rt45_u m; int e; } rt45_num;   /* m = 0: zero (com sinal) */

static rt45_num rt45_n(int s, uint64_t hi, uint64_t lo, int e) { rt45_num r; r.s = s; rt45u_set(&r.m, hi, lo); r.e = e; return r; }
static int rt45n_topo(const rt45_num *a) { return a->e + rt45u_bits(&a->m); }

/* arredonda ao par o valor exato n * 2^e para prec bits; sticky: o valor exato fica um pouco
   acima de n (resto de divisao), so desempata */
static rt45_num rt45_arred(int s, const rt45_u *n, int e, int prec, int sticky) {
    rt45_num r; r.s = s;
    if (rt45u_iszero(n)) { rt45u_zero(&r.m); r.e = 0; return r; }
    int b = rt45u_bits(n);
    if (b <= prec) { rt45u_shl(&r.m, n, prec - b); r.e = e - (prec - b); return r; }
    int sh = b - prec;
    rt45u_shr(&r.m, n, sh);
    int meio = rt45u_bit(n, sh - 1), abaixo = rt45u_abaixo(n, sh - 1);
    if (meio && (abaixo || sticky || (r.m.w[0] & 1))) rt45u_inc(&r.m);
    r.e = e + sh;
    if (rt45u_bits(&r.m) > prec) { rt45u_shr(&r.m, &r.m, 1); r.e++; }
    return r;
}
static rt45_num rt45_mul(const rt45_num *a, const rt45_num *b, int prec) {
    rt45_u p; rt45u_mul(&p, &a->m, &b->m);
    return rt45_arred(a->s ^ b->s, &p, a->e + b->e, prec, 0);
}
static rt45_num rt45_div(const rt45_num *a, const rt45_num *b, int prec) {
    int g = prec + 2 + (rt45u_bits(&b->m) > rt45u_bits(&a->m) ? rt45u_bits(&b->m) - rt45u_bits(&a->m) : 0);
    rt45_u n, q; int sobra;
    rt45u_shl(&n, &a->m, g);
    rt45u_div(&q, &sobra, &n, &b->m);
    return rt45_arred(a->s ^ b->s, &q, a->e - g - b->e, prec, sobra);
}
static rt45_num rt45_neg(rt45_num a) { a.s ^= 1; return a; }
/* soma exata arredondada; +0 quando a soma exata e zero */
static rt45_num rt45_soma(const rt45_num *a, const rt45_num *b, int prec) {
    if (rt45u_iszero(&b->m)) {
        if (rt45u_iszero(&a->m)) { rt45_num z = *a; z.s = a->s & b->s; z.e = 0; return z; }
        return rt45_arred(a->s, &a->m, a->e, prec, 0);
    }
    if (rt45u_iszero(&a->m)) return rt45_arred(b->s, &b->m, b->e, prec, 0);
    const rt45_num *g = a, *p0 = b;
    if (rt45n_topo(a) < rt45n_topo(b)) { g = b; p0 = a; }
    rt45_num p = *p0;
    int limite = g->e - prec - 8;   /* parcela muito menor so desempata */
    if (rt45n_topo(p0) < limite) p = rt45_n(p0->s, 0, 1, limite - 2);
    int k = g->e < p.e ? g->e : p.e;
    rt45_u G, P, v;
    rt45u_shl(&G, &g->m, g->e - k);
    rt45u_shl(&P, &p.m, p.e - k);
    int s;
    if (g->s == p.s) { rt45u_add(&v, &G, &P); s = g->s; }
    else {
        int c = rt45u_cmp(&G, &P);
        if (c == 0) { rt45_num z; z.s = 0; rt45u_zero(&z.m); z.e = 0; return z; }
        if (c > 0) { rt45u_sub(&v, &G, &P); s = g->s; } else { rt45u_sub(&v, &P, &G); s = p.s; }
    }
    return rt45_arred(s, &v, k, prec, 0);
}

/* ------------------------------------------------------------ log2 interno do FYL2X (Zen 2) */
static rt45_num rt45_log2_interno(const rt45_num *x) {   /* x > 0, mantissa de 64 bits */
    static const uint64_t coef[10][2] = {
        {0xf, 0x6384ee1d01feb564ULL}, {0x9, 0x3bb62877ce08b8eaULL}, {0xd, 0x30bb153d63406bbfULL},
        {0xa, 0x42589ec186c86d13ULL}, {0x8, 0x64d42456b2ab3a5dULL}, {0xe, 0x347ab5994498e0b8ULL},
        {0xc, 0x4fa08aa62a7ec09bULL}, {0xa, 0xdc9d22ad49452b54ULL}, {0x9, 0xb354f1dc588dd58dULL},
        {0x9, 0xa234407e917b3a77ULL}};
    static const int coefe[10] = {-68, -68, -69, -69, -69, -70, -70, -70, -70, -70};
    const rt45_num C68 = rt45_n(0, 0xb, 0x8aa3b295c17f0bbcULL, -66);
    const rt45_num UM = rt45_n(0, 0, 1, 0);
    int k = x->e + 63;
    rt45_num m = *x; m.s = 0; m.e = -63;
    if (x->m.w[0] > 0xb504f333f9de6484ULL) { m.e = -64; k++; }
    rt45_num K = rt45_n(k < 0, 0, (uint64_t)(k < 0 ? -k : k), 0);
    rt45_num mUM = rt45_neg(UM);
    rt45_num nu = rt45_soma(&m, &mUM, 68), de = rt45_soma(&m, &UM, 68);
    rt45_num s = rt45_div(&nu, &de, 68);
    if (rt45u_iszero(&s.m)) return rt45_arred(K.s, &K.m, 0, 68, 0);
    rt45_num z = rt45_mul(&s, &s, 68);
    rt45_num q = rt45_n(0, coef[9][0], coef[9][1], coefe[9]);
    for (int i = 8; i >= 0; i--) {
        rt45_num a = rt45_n(0, coef[i][0], coef[i][1], coefe[i]);
        rt45_num t = rt45_mul(&q, &z, 68);
        q = rt45_soma(&t, &a, 68);
    }
    rt45_num sq = rt45_mul(&s, &q, 68), R = rt45_mul(&z, &sq, 68);
    rt45_num sc = rt45_mul(&s, &C68, 68), ks = rt45_soma(&K, &sc, 68);
    return rt45_soma(&ks, &R, 68);
}
/* FYL2X: y * log2(x), x > 0 */
static rt45_num rt45_fyl2x_m(const rt45_num *y, const rt45_num *x) {
    rt45_num L = rt45_log2_interno(x);
    rt45_u p; rt45u_mul(&p, &L.m, &y->m);
    return rt45_arred(L.s ^ y->s, &p, L.e + y->e, 64, 0);
}

/* ------------------------------------------------------------ F2XM1 exato (ponto flutuante de 512 bits) */
#define RT45_BL 8                       /* palavras da mantissa (512 bits, bit mais alto ligado) */
typedef struct { int s; uint64_t w[RT45_BL]; int e; int zero; } rt45_bf;   /* valor = m * 2^e */

static void rt45bf_norm(rt45_bf *r, const uint64_t *t, int n, int e) {   /* t: n palavras */
    int top = -1;
    for (int i = n - 1; i >= 0; i--) if (t[i]) { top = i * 64 + 63 - __builtin_clzll(t[i]); break; }
    if (top < 0) { r->zero = 1; memset(r->w, 0, sizeof r->w); r->e = 0; return; }
    r->zero = 0;
    int sh = top - (64 * RT45_BL - 1);   /* desloca t para a direita sh bits (sh < 0: esquerda) */
    for (int i = 0; i < RT45_BL; i++) {   /* palavra i = bits [i*64 + sh, i*64 + sh + 64) de t */
        long bitpos = (long)i * 64 + sh;
        long w0 = bitpos >= 0 ? bitpos / 64 : -((-bitpos + 63) / 64);
        int o = (int)(bitpos - w0 * 64);
        uint64_t lo = (w0 >= 0 && w0 < n) ? t[w0] : 0, hi = (w0 + 1 >= 0 && w0 + 1 < n) ? t[w0 + 1] : 0;
        r->w[i] = o ? ((lo >> o) | (hi << (64 - o))) : lo;
    }
    r->e = e + sh;
}
static rt45_bf rt45bf_de(const rt45_num *a) {   /* a com mantissa de ate 128 bits */
    rt45_bf r; uint64_t t[2] = {a->m.w[0], a->m.w[1]};
    rt45bf_norm(&r, t, 2, a->e); r.s = a->s; return r;
}
static rt45_bf rt45bf_mul(const rt45_bf *a, const rt45_bf *b) {
    rt45_bf r; uint64_t t[2 * RT45_BL] = {0};
    if (a->zero || b->zero) { r.zero = 1; r.s = 0; r.e = 0; memset(r.w, 0, sizeof r.w); return r; }
    for (int i = 0; i < RT45_BL; i++) {
        uint64_t c = 0;
        for (int j = 0; j < RT45_BL; j++) {
            rt45_u128 p = (rt45_u128)a->w[i] * b->w[j] + t[i + j] + c;
            t[i + j] = (uint64_t)p; c = (uint64_t)(p >> 64);
        }
        t[i + RT45_BL] = c;
    }
    rt45bf_norm(&r, t, 2 * RT45_BL, a->e + b->e); r.s = a->s ^ b->s; return r;
}
static rt45_bf rt45bf_divu(const rt45_bf *a, uint64_t k) {
    rt45_bf r; uint64_t t[RT45_BL + 1]; rt45_u128 resto = 0;
    if (a->zero) return *a;
    t[0] = 0; memcpy(t + 1, a->w, sizeof a->w);
    for (int i = RT45_BL; i >= 0; i--) {
        rt45_u128 v = (resto << 64) | t[i];
        t[i] = (uint64_t)(v / k); resto = v % k;
    }
    rt45bf_norm(&r, t, RT45_BL + 1, a->e - 64); r.s = a->s; return r;
}
static rt45_bf rt45bf_soma(const rt45_bf *a, const rt45_bf *b) {
    if (a->zero) return *b;
    if (b->zero) return *a;
    const rt45_bf *g = a, *p = b;   /* g: o de maior magnitude (mantissas normalizadas) */
    int bmaior = b->e > a->e;
    if (b->e == a->e)
        for (int i = RT45_BL - 1; i >= 0; i--) if (a->w[i] != b->w[i]) { bmaior = b->w[i] > a->w[i]; break; }
    if (bmaior) { g = b; p = a; }
    int d = g->e - p->e;
    if (d > 64 * RT45_BL + 64) return *g;
    /* 10 palavras: G = g << 64; P = (p << 64) >> d */
    uint64_t G[RT45_BL + 2] = {0}, P[RT45_BL + 2] = {0}, v[RT45_BL + 2];
    memcpy(G + 1, g->w, sizeof g->w);
    { int q = d / 64, bb = d % 64;
      for (int i = 0; i < RT45_BL + 2; i++) {
          int src = i + q;   /* indice em (p << 64): palavra src corresponde a p->w[src-1] */
          uint64_t lo = (src >= 1 && src <= RT45_BL) ? p->w[src - 1] : 0;
          uint64_t hi = (src + 1 >= 1 && src + 1 <= RT45_BL) ? p->w[src] : 0;
          P[i] = bb ? ((lo >> bb) | (hi << (64 - bb))) : lo;
      } }
    int s;
    if (g->s == p->s) {
        uint64_t c = 0;
        for (int i = 0; i < RT45_BL + 2; i++) { rt45_u128 x = (rt45_u128)G[i] + P[i] + c; v[i] = (uint64_t)x; c = (uint64_t)(x >> 64); }
        s = g->s;
    } else {
        int maior = 0;
        for (int i = RT45_BL + 1; i >= 0; i--) if (G[i] != P[i]) { maior = G[i] > P[i] ? 1 : -1; break; }
        const uint64_t *X = maior >= 0 ? G : P, *Y = maior >= 0 ? P : G;
        uint64_t emp = 0;
        for (int i = 0; i < RT45_BL + 2; i++) { uint64_t x = X[i], y = Y[i]; v[i] = x - y - emp; emp = (x < y) || (x - y < emp); }
        s = maior >= 0 ? g->s : p->s;
    }
    rt45_bf r; rt45bf_norm(&r, v, RT45_BL + 2, g->e - 64); r.s = s; return r;
}
static rt45_bf rt45_ln2;
static int rt45_ln2_pronto;
static void rt45_ln2_calc(void) {   /* ln 2 = 2 * soma (1/3)^(2j+1) / (2j+1) */
    rt45_num um = rt45_n(0, 0, 1, 0);
    rt45_bf t = rt45bf_de(&um);
    t = rt45bf_divu(&t, 3);
    rt45_bf soma = t;
    for (uint64_t k = 3; ; k += 2) {
        t = rt45bf_divu(&t, 9);
        rt45_bf termo = rt45bf_divu(&t, k);
        if (termo.zero || termo.e < soma.e - 64 * RT45_BL - 8) break;
        soma = rt45bf_soma(&soma, &termo);
    }
    soma.e += 1;
    rt45_ln2 = soma; rt45_ln2_pronto = 1;
}
/* F2XM1: 2^x - 1 (|x| <= 1) exato arredondado ao par em 64 bits. Erro do calculo < 2^-490
   relativo; o arredondamento so erraria a menos disso do meio ulp (2^x - 1 e irracional). */
static rt45_num rt45_f2xm1_m(const rt45_num *x) {
    if (rt45u_iszero(&x->m)) return *x;
    if (!rt45_ln2_pronto) rt45_ln2_calc();
    rt45_bf X = rt45bf_de(x);
    rt45_bf W = rt45bf_mul(&X, &rt45_ln2);
    rt45_bf v = W, t = W;
    for (uint64_t k = 2; ; k++) {
        t = rt45bf_mul(&t, &W);
        t = rt45bf_divu(&t, k);
        if (t.zero || t.e < v.e - 64 * RT45_BL - 8) break;
        v = rt45bf_soma(&v, &t);
    }
    /* 64 bits mais altos de v, ao par */
    rt45_num r; r.s = v.s; rt45u_zero(&r.m);
    r.m.w[0] = v.w[RT45_BL - 1];
    int meio = (int)(v.w[RT45_BL - 2] >> 63);
    int abaixo = (v.w[RT45_BL - 2] << 1) != 0;
    for (int i = 0; i < RT45_BL - 2 && !abaixo; i++) if (v.w[i]) abaixo = 1;
    r.e = v.e + 64 * (RT45_BL - 1);
    if (meio && (abaixo || (r.m.w[0] & 1))) {
        rt45u_inc(&r.m);
        if (r.m.w[1]) { rt45u_shr(&r.m, &r.m, 1); r.e++; }
    }
    return r;
}

/* ------------------------------------------------------------ long double <-> numero */
/* classe: 0 normal, 1 zero (ou denormal, como no FXAM do BRUN45), 2 NaN, 3 infinito */
static rt45_num rt45_de_ld(long double v, int *classe) {
    unsigned char b[16]; uint64_t mant; uint16_t se;
    memcpy(b, &v, 10); memcpy(&mant, b, 8); memcpy(&se, b + 8, 2);
    int ex = se & 0x7fff, s = se >> 15;
    rt45_num r; r.s = s; rt45u_zero(&r.m); r.e = 0;
    if (ex == 0x7fff) { *classe = (mant << 1) ? 2 : 3; return r; }
    if (ex == 0 || !(mant >> 63)) { *classe = 1; return r; }
    *classe = 0; r.m.w[0] = mant; r.e = ex - 16383 - 63;
    return r;
}
/* estende: mantissa de 64 bits; estouro vira infinito, abaixo de 2^-16382 vira zero */
static long double rt45_para_ld(rt45_num n) {
    long double v = 0; unsigned char b[16] = {0}; uint64_t mant = 0; uint16_t se;
    if (!rt45u_iszero(&n.m)) n = rt45_arred(n.s, &n.m, n.e, 64, 0);
    if (rt45u_iszero(&n.m)) se = (uint16_t)(n.s << 15);
    else {
        int topo = n.e + 63;
        if (topo > 16383) se = (uint16_t)((n.s << 15) | 0x7fff), mant = (uint64_t)1 << 63;
        else if (topo < -16382) se = (uint16_t)(n.s << 15);
        else { se = (uint16_t)((n.s << 15) | (topo + 16383)); mant = n.m.w[0]; }
    }
    memcpy(b, &mant, 8); memcpy(b + 8, &se, 2); memcpy(&v, b, sizeof v < 16 ? sizeof v : 16);
    return v;
}

/* ------------------------------------------------------------ potencia (B$POW4/B$POW8) */
static int rt45_pot_err;
/* a ^ b como o BRUN45, resultado em estendido; erro em rt45_pot_erro() (0, 5 ou 6) */
static long double rt45_pot(long double a, long double b) {
    int ca, cb;
    rt45_num A = rt45_de_ld(a, &ca), B = rt45_de_ld(b, &cb), r;
    rt45_pot_err = 0;
    if (ca >= 2 || cb >= 2) { rt45_pot_err = 5; return 0; }        /* NaN ou infinito */
    if (cb == 1) return 1.0L;                                          /* expoente 0 */
    if (ca == 1) { if (B.s) { rt45_pot_err = 5; return 0; } return 0.0L; }
    int impar = 0;
    if (A.s) {   /* base negativa: expoente inteiro, 1 <= |b| < 2^64 (DS:0B2A) */
        int topo = B.e + 63;
        if (topo < 0 || topo >= 64) { rt45_pot_err = 5; return 0; }
        if (B.e < 0 && rt45u_abaixo(&B.m, -B.e)) { rt45_pot_err = 5; return 0; }
        impar = B.e <= 0 && rt45u_bit(&B.m, -B.e);
    }
    rt45_num X = A; X.s = 0;
    rt45_num t = rt45_fyl2x_m(&B, &X);                                 /* FYL2X */
    rt45_num lim = rt45_n(1, 0, 65535, -1), ta = t; ta.s = 0;          /* |t| >= 32767,5 (DS:0B16) */
    if (!rt45u_iszero(&t.m) && rt45_soma(&ta, &lim, 80).s == 0) {
        if (t.s) return 0.0L;
        rt45_pot_err = 6; return 0;
    }
    /* FRNDINT ao par */
    int64_t n = 0;
    if (!rt45u_iszero(&t.m)) {
        if (t.e >= 0) n = (int64_t)(t.m.w[0] << t.e);
        else if (t.e >= -65) {
            rt45_u q; rt45u_shr(&q, &t.m, -t.e);
            int meio = rt45u_bit(&t.m, -t.e - 1), abaixo = rt45u_abaixo(&t.m, -t.e - 1);
            n = (int64_t)q.w[0];
            if (meio && (abaixo || (n & 1))) n++;
        }
        if (t.s) n = -n;
    }
    rt45_num N = rt45_n(n < 0, 0, (uint64_t)(n < 0 ? -n : n), 0), mN = rt45_neg(N);
    rt45_num f = rt45_soma(&t, &mN, 64);                                /* f = t - n (exato) */
    rt45_num fa = f; fa.s = 0;
    rt45_num g = rt45_f2xm1_m(&fa), UM = rt45_n(0, 0, 1, 0);
    rt45_num p = rt45_soma(&g, &UM, 64);                                /* FLD1, FADDP */
    if (f.s && !rt45u_iszero(&f.m)) p = rt45_div(&UM, &p, 64);         /* FLD1, FDIVRP */
    r = p; r.s = impar; r.e = p.e + (int)n;                             /* FSCALE, FCHS */
    return rt45_para_ld(r);
}
static int16_t rt45_pot_erro(void) { return (int16_t)rt45_pot_err; }

/* FSQRT: raiz em estendido, corretamente arredondada ao par (IEEE: igual em qualquer x87) */
static long double rt45_fsqrt(long double x) {
#if defined(__EMSCRIPTEN__)
    /* build web (web/README.md): o long double vira o qb_f80 (web/runtime/qb_f80.h) e a raiz e a do
       SoftFloat, tambem corretamente arredondada ao par em 64 bits */
    return std::sqrt(x);
#else
    long double r; unsigned short velho, novo = 0x137F;
    __asm__ volatile ("fnstcw %0" : "=m"(velho));
    __asm__ volatile ("fldcw %0" : : "m"(novo));
    __asm__ volatile ("fsqrt" : "=t"(r) : "0"(x));
    __asm__ volatile ("fldcw %0" : : "m"(velho));
    return r;
#endif
}

/* para os testes: as duas instrucoes do modelo, de long double para long double */
static long double rt45_fyl2x(long double y, long double x) {
    int cy, cx; rt45_num Y = rt45_de_ld(y, &cy), X = rt45_de_ld(x, &cx);
    if (cy || cx || X.s) return 0; /* so normais, x > 0 */
    return rt45_para_ld(rt45_fyl2x_m(&Y, &X));
}
static long double rt45_f2xm1(long double x) {
    int c; rt45_num X = rt45_de_ld(x, &c);
    if (c) return x;
    return rt45_para_ld(rt45_f2xm1_m(&X));
}
#endif
