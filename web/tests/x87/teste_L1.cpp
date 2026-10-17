// teste_L1.cpp - modelos candidatos do log2 interno do FYL2XP1 contra L lido do hardware (le_L).
#include "../../runtime/x87_zen2.cpp"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
static const uint64_t coef[10][2] = {
    {0xf, 0x6384ee1d01feb564ULL}, {0x9, 0x3bb62877ce08b8eaULL}, {0xd, 0x30bb153d63406bbfULL},
    {0xa, 0x42589ec186c86d13ULL}, {0x8, 0x64d42456b2ab3a5dULL}, {0xe, 0x347ab5994498e0b8ULL},
    {0xc, 0x4fa08aa62a7ec09bULL}, {0xa, 0xdc9d22ad49452b54ULL}, {0x9, 0xb354f1dc588dd58dULL},
    {0x9, 0xa234407e917b3a77ULL}};
static const int coefe[10] = {-68, -68, -69, -69, -69, -70, -70, -70, -70, -70};
static Nx A(int i) { return nx_bits(0, coef[i][0], coef[i][1], coefe[i]); }
static Nx C68() { return nx_bits(0, 0xb, 0x8aa3b295c17f0bbcULL, -66); }
static Nx r(const Nx &a) { return arred1(a, 68, 0); }

static Nx serie(const Nx &s, int var) {
    Nx z = nx_mul(s, s, 68);
    Nx q = A(9);
    for (int i = 8; i >= 0; i--) q = nx_add(nx_mul(q, z, 68), A(i), 68);
    Nx R = nx_mul(z, nx_mul(s, q, 68), 68);
    Nx sc = nx_mul(s, C68(), 68);
    if (var == 1) return nx_add(nx_mul(s, C68(), 128), R, 68);
    return nx_add(sc, R, 68);
}
static bool FYL2X = false;
static Nx log2i(const Nx &x) { // FYL2X do RT45X87.h
    Nx m = x; int k = m.e + 127; m.e = -127;
    if ((uint64_t)(m.m >> 64) > 0xb504f333f9de6484ULL) { m.e = -128; k++; }
    Nx s = nx_div(nx_sub(m, nx_int(1), 68), nx_add(m, nx_int(1), 68), 68);
    Nx z = nx_mul(s, s, 68);
    Nx q = A(9);
    for (int i = 8; i >= 0; i--) q = nx_add(nx_mul(q, z, 68), A(i), 68);
    Nx R = nx_mul(z, nx_mul(s, q, 68), 68);
    return nx_add(nx_add(nx_int(k), nx_mul(s, C68(), 68), 68), R, 68);
}
static Nx modelo(const Nx &x, int var) {
    if (FYL2X) return log2i(x);
    Nx dois = nx_int(2);
    Nx s;
    switch (var) {
    case 0: case 1: s = nx_div(x, nx_add(dois, x, 68), 68); break;
    case 2: s = nx_div(x, nx_add(dois, x, getenv("PD") ? atoi(getenv("PD")) : 128, getenv("RD") ? atoi(getenv("RD")) : 0), 68); break;
    case 3: { // como o FYL2X: m = 1 + x arredondado a 68, s = (m-1)/(m+1)
        Nx m = nx_add(nx_int(1), x, 68);
        s = nx_div(nx_sub(m, nx_int(1), 68), nx_add(m, nx_int(1), 68), 68); break; }
    }
    return serie(s, var);
}
int main(int argc, char **argv) {
    FILE *f = fopen(argv[1], "r");
    FYL2X = argc > 2;
    char xs[64], ls[64];
    int ok[4] = {0}, n = 0, sgn, e;
    while (fscanf(f, "%s %s", xs, ls) == 2) {
        if (ls[0] == '?') continue;
        char mh[64];
        if (fscanf(f, "%s %d", mh, &e) != 2) break;
        sgn = atoi(ls);
        char t[17] = {0};
        x87e x; memcpy(t, xs, 4); t[4] = 0; x.se = (uint16_t)strtoul(t, 0, 16); x.m = strtoull(xs + 4, 0, 16);
        char h1[17] = {0}; memcpy(h1, mh, 16);
        Nx L = nx_bits(sgn, strtoull(h1, 0, 16), strtoull(mh + 16, 0, 16), e + 0);
        L.e = e; L.m = ((u128)strtoull(h1, 0, 16) << 64) | strtoull(mh + 16, 0, 16); L.s = sgn;
        Nx X = de_x87(x);
        n++;
        for (int v = 0; v < 4; v++) {
            Nx M = modelo(X, v);
            if (M.m == L.m && M.e == L.e && M.s == L.s) ok[v]++;
            else if (v == 0 && getenv("DIAG")) {
                Nx d = nx_sub(M, L, 128);
                printf("x=%s dif %.3g ulp68\n", xs, d.m ? (d.s ? -1.0 : 1.0) * __builtin_ldexp((double)(uint64_t)(d.m >> 64), d.e + 64 - (L.e + 127 - 67)) : 0.0);
            }
        }
    }
    for (int v = 0; v < 4; v++) printf("variante %d: %d / %d\n", v, ok[v], n);
}
