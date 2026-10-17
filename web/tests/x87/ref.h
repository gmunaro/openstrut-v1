// ref.h - valores de referencia (~120 bits) com a aritmetica do x87_zen2.cpp em 128 bits.
// So para os testes e o ajuste dos modelos. Inclua depois de x87_zen2.cpp.
#pragma once

static const int RP = 128;
static Nx R_PI() { return nx_bits(0, 0xc90fdaa22168c234ULL, 0xc4c6628b80dc1cd1ULL, -126); }
static Nx R_LN2() { return nx_bits(0, 0xb17217f7d1cf79abULL, 0xc9e3b39803f2f6afULL, -128); }
static Nx R_um() { return nx_int(1); }

// sin e cos por Taylor, |r| <= ~1
static Nx ref_sin(const Nx &r) {
    Nx z = nx_mul(r, r, RP), t = r, s = r;
    for (int k = 1; k < 40; k++) {
        t = nx_mul(t, z, RP);
        t = nx_div(t, nx_int((2 * k) * (2 * k + 1)), RP);
        t.s ^= 1;
        s = nx_add(s, t, RP);
        if (!t.m || t.e + 127 < s.e + 127 - 140) break;
    }
    return s;
}
static Nx ref_cos(const Nx &r) {
    Nx z = nx_mul(r, r, RP), t = nx_int(1), s = t;
    for (int k = 1; k < 40; k++) {
        t = nx_mul(t, z, RP);
        t = nx_div(t, nx_int((2 * k - 1) * (2 * k)), RP);
        t.s ^= 1;
        s = nx_add(s, t, RP);
        if (!t.m || t.e < s.e - 140) break;
    }
    return s;
}
// 1 - cos r e r - sin r sem cancelamento
static Nx ref_umcos(const Nx &r) {
    Nx z = nx_mul(r, r, RP), t = nx_int(1), s = nx_zero();
    for (int k = 1; k < 40; k++) {
        t = nx_mul(t, z, RP);
        t = nx_div(t, nx_int((2 * k - 1) * (2 * k)), RP);
        if (k > 1) t.s ^= 1;
        s = nx_add(s, t, RP);
        if (!t.m || t.e < s.e - 140) break;
    }
    return s; // 1 - cos r = z/2 - z^2/24 + ...
}
static Nx ref_sqrt(const Nx &a) {
    // Newton: y = (y + a/y)/2, partindo do double
    if (!a.m) return a;
    double d = (double)(uint64_t)(a.m >> 64) * 1.0;
    int e = a.e + 64;
    // a = d * 2^e ; sqrt = sqrt(d * 2^(e%2)) * 2^(e/2)
    if (e & 1) { d *= 2; e--; }
    double sd = __builtin_sqrt(d);
    uint64_t sm = (uint64_t)sd;
    Nx y = nx_bits(0, 0, sm, e / 2);
    for (int i = 0; i < 6; i++) {
        y = nx_add(y, nx_div(a, y, RP), RP);
        y.e--;
    }
    return y;
}
// atan por reducao t -> t / (1 + sqrt(1 + t^2)) (4 vezes) e serie
static Nx ref_atan(Nx t) {
    int s = t.s;
    t.s = 0;
    Nx um = nx_int(1);
    for (int i = 0; i < 4; i++)
        t = nx_div(t, nx_add(um, ref_sqrt(nx_add(um, nx_mul(t, t, RP), RP)), RP), RP);
    Nx z = nx_mul(t, t, RP), p = t, soma = t;
    for (int k = 1; k < 200; k++) {
        p = nx_mul(p, z, RP);
        p.s ^= 1;
        Nx termo = nx_div(p, nx_int(2 * k + 1), RP);
        soma = nx_add(soma, termo, RP);
        if (termo.e < soma.e - 140) break;
    }
    soma.e += 4;
    soma.s = s;
    return soma;
}
// e^y - 1, |y| <= 1: Taylor
static Nx ref_expm1(const Nx &y) {
    Nx t = y, s = y;
    for (int k = 2; k < 60; k++) {
        t = nx_div(nx_mul(t, y, RP), nx_int(k), RP);
        s = nx_add(s, t, RP);
        if (!t.m || t.e < s.e - 140) break;
    }
    return s;
}
static Nx ref_2xm1(const Nx &x) { return ref_expm1(nx_mul(x, R_LN2(), RP)); }
// ln(1 + x), x > -1 moderado: 2 atanh(x / (2 + x))
static Nx ref_log1p(const Nx &x) {
    Nx s = nx_div(x, nx_add(nx_int(2), x, RP), RP), z = nx_mul(s, s, RP), p = s, soma = s;
    for (int k = 1; k < 400; k++) {
        p = nx_mul(p, z, RP);
        Nx termo = nx_div(p, nx_int(2 * k + 1), RP);
        soma = nx_add(soma, termo, RP);
        if (!termo.m || termo.e < soma.e - 140) break;
    }
    soma.e++;
    return soma;
}
static Nx ref_log2_1p(const Nx &x) { return nx_div(ref_log1p(x), R_LN2(), RP); }

// Nx -> double (para diagnostico)
static double nx_d(const Nx &a) {
    if (!a.m) return 0;
    double d = (double)(uint64_t)(a.m >> 64);
    return (a.s ? -1 : 1) * __builtin_ldexp(d, a.e + 64);
}
