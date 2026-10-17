// busca_log.cpp - busca local nos coeficientes do log2 interno (FYL2X/FYL2XP1) contra L lido do hardware.
//   busca_log <L_fyl2x.txt> <L_fyl2xp1.txt> <passadas> [coef.txt]
// coef.txt: 10 linhas "hi lo e" (mantissa hex de 68 bits e expoente). Sem ele, os do RT45X87.h.
#include "../../runtime/x87_zen2.cpp"
#include "ref.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <vector>

static Nx A[10];
static int FR = 0; // bits extras dos coeficientes na busca
static Nx C68() { return nx_bits(0, 0xb, 0x8aa3b295c17f0bbcULL, -66); }
struct Am { bool p1; Nx x, L; };
static std::vector<Am> am;

static int VAR = 0, PR = 68, PSC = 68, PKS = 68, PZ = 68, PH = 68, PSQ = 68;
static int PS = 68, PS2 = 68, RCZ = 0, RCH = 0, RCH2 = 0, RCSQ = 0, RCR = 0; static Nx sL;
static Nx serie(const Nx &s, const Nx &K) {
    Nx z = nx_mul(s, s, PZ, RCZ);
    Nx q = A[9];
    for (int i = 8; i >= 0; i--) q = nx_add(nx_mul(q, z, PH, RCH), A[i], PH, RCH2);
    Nx R = nx_mul(z, nx_mul(s, q, PSQ, RCSQ), PR, RCR);
    Nx sc = nx_mul(PS != 68 ? sL : s, C68(), PSC);
    Nx ks = K.m ? nx_add(K, sc, PKS) : arred1(sc, PKS, 0);
    if (VAR == 9) { // empate: para o impar
        Nx pre = nx_add(ks, R, 128), M = arred1(pre, 68, 0);
        Nx d = nx_sub(pre, M, 128);
        if (d.m && d.e + 127 == M.e + 127 - 68) { // |pre - M| = meio ulp
            Nx u = nx_bits(d.s, 0, 1, M.e + 127 - 67);
            return nx_add(M, u, 68);
        }
        return M;
    }
    return nx_add(ks, R, 68);
}
static Nx L_fyl2x(const Nx &x) {
    Nx m = x; int k = m.e + 127; m.e = -127;
    if ((uint64_t)(m.m >> 64) > 0xb504f333f9de6484ULL) { m.e = -128; k++; }
    Nx s = nx_div(nx_sub(m, nx_int(1), 68), nx_add(m, nx_int(1), 68), PS2);
    sL = nx_div(nx_sub(m, nx_int(1), 68), nx_add(m, nx_int(1), 68), PS);
    if (!s.m) return nx_int(k);
    return serie(s, nx_int(k));
}
static Nx L_fyl2xp1(const Nx &x) {
    Nx s = nx_div(x, nx_add(nx_int(2), x, 68), PS2);
    sL = nx_div(x, nx_add(nx_int(2), x, 68), PS);
    return serie(s, nx_zero());
}
static int conta() {
    int ok = 0;
    for (auto &a : am) {
        Nx M = a.p1 ? L_fyl2xp1(a.x) : L_fyl2x(a.x);
        ok += M.m == a.L.m && M.e == a.L.e && M.s == a.L.s;
    }
    return ok;
}
static void le(const char *arq, bool p1) {
    FILE *f = fopen(arq, "r");
    char xs[64], ls[64], mh[64];
    int e;
    while (fscanf(f, "%s %s", xs, ls) == 2) {
        if (ls[0] == '?') continue;
        if (fscanf(f, "%s %d", mh, &e) != 2) break;
        char t[17] = {0};
        x87e x; memcpy(t, xs, 4); x.se = (uint16_t)strtoul(t, 0, 16); x.m = strtoull(xs + 4, 0, 16);
        char h1[17] = {0}; memcpy(h1, mh, 16);
        Am a; a.p1 = p1; a.x = de_x87(x);
        a.L.s = atoi(ls); a.L.e = e; a.L.m = ((u128)strtoull(h1, 0, 16) << 64) | strtoull(mh + 16, 0, 16);
        am.push_back(a);
    }
    fclose(f);
}
int main(int argc, char **argv) {
    static const uint64_t coef[10][2] = {
        {0xf, 0x6384ee1d01feb564ULL}, {0x9, 0x3bb62877ce08b8eaULL}, {0xd, 0x30bb153d63406bbfULL},
        {0xa, 0x42589ec186c86d13ULL}, {0x8, 0x64d42456b2ab3a5dULL}, {0xe, 0x347ab5994498e0b8ULL},
        {0xc, 0x4fa08aa62a7ec09bULL}, {0xa, 0xdc9d22ad49452b54ULL}, {0x9, 0xb354f1dc588dd58dULL},
        {0x9, 0xa234407e917b3a77ULL}};
    static const int coefe[10] = {-68, -68, -69, -69, -69, -70, -70, -70, -70, -70};
    for (int i = 0; i < 10; i++) A[i] = nx_bits(0, coef[i][0], coef[i][1], coefe[i]);
    if (argc > 4) {
        FILE *f = fopen(argv[4], "r");
        for (int i = 0; i < 10; i++) {
            unsigned long long hi, lo; int e;
            if (fscanf(f, "%llx %llx %d", &hi, &lo, &e) == 3) A[i] = nx_bits(0, hi, lo, e);
        }
        fclose(f);
    }
    le(argv[1], false);
    le(argv[2], true);
    int pass = atoi(argv[3]);
    if (getenv("DELTA")) { // soma delta_i * 2^-90 aos coeficientes
        FILE *f = fopen(getenv("DELTA"), "r");
        for (int i = 0; i < 10; i++) {
            double d; if (fscanf(f, "%lf", &d) != 1) break;
            int ex; double fr = __builtin_frexp(d, &ex);
            Nx dd = nx_int((int64_t)__builtin_ldexp(fr, 53)); dd.e += ex - 53 - 90;
            A[i] = nx_add(A[i], dd, 68);
        }
        fclose(f);
        printf("com delta: %d / %zu\n", conta(), am.size());
        FILE *g = fopen("coef_log.txt", "w");
        for (int i = 0; i < 10; i++) { u128 m = A[i].m >> 60; fprintf(g, "%llx %016llx %d\n", (unsigned long long)(m >> 64), (unsigned long long)m, A[i].e + 60); }
        fclose(g);
        return 0;
    }
    if (getenv("LPOUT")) {
        FILE *g = fopen(getenv("LPOUT"), "w");
        for (auto &a : am) {
            Nx s, K = nx_zero();
            if (a.p1) s = nx_div(a.x, nx_add(nx_int(2), a.x, 68), 68);
            else { Nx m = a.x; int k = m.e + 127; m.e = -127; if ((uint64_t)(m.m >> 64) > 0xb504f333f9de6484ULL) { m.e = -128; k++; } s = nx_div(nx_sub(m, nx_int(1), 68), nx_add(m, nx_int(1), 68), 68); K = nx_int(k); }
            if (!s.m) continue;
            Nx z = nx_mul(s, s, 68); Nx q = A[9];
            for (int i = 8; i >= 0; i--) q = nx_add(nx_mul(q, z, 68), A[i], 68);
            Nx R = nx_mul(z, nx_mul(s, q, 68), 68);
            Nx sc = nx_mul(s, C68(), 68);
            Nx ks = K.m ? nx_add(K, sc, 68) : sc;
            Nx pre = nx_add(ks, R, 128);
            int eu = a.L.e + 127 - 67; // ulp de L
            Nx lo = nx_sub(a.L, pre, 128), hi = lo;
            lo.e -= eu; hi.e -= eu;
            double l = nx_d(lo) - 0.5, h = nx_d(hi) + 0.5;
            fprintf(g, "%.17g %.17g", l, h);
            Nx p = nx_mul(s, z, 128); p.e -= 90 + eu;
            for (int i = 0; i < 10; i++) { fprintf(g, " %.17g", nx_d(p)); p = nx_mul(p, z, 128); }
            fprintf(g, "\n");
        }
        fclose(g);
        return 0;
    }
    if (getenv("DIAG")) {
        for (auto &a : am) {
            Nx M = a.p1 ? L_fyl2xp1(a.x) : L_fyl2x(a.x);
            if (M.m == a.L.m && M.e == a.L.e && M.s == a.L.s) continue;
            // pre-arredondamento: recalcula a soma final exata
            Nx s, K = nx_zero();
            if (a.p1) s = nx_div(a.x, nx_add(nx_int(2), a.x, 68), 68);
            else { Nx m = a.x; int k = m.e + 127; m.e = -127; if ((uint64_t)(m.m >> 64) > 0xb504f333f9de6484ULL) { m.e = -128; k++; } s = nx_div(nx_sub(m, nx_int(1), 68), nx_add(m, nx_int(1), 68), 68); K = nx_int(k); }
            Nx z = nx_mul(s, s, 68); Nx q = A[9];
            for (int i = 8; i >= 0; i--) q = nx_add(nx_mul(q, z, 68), A[i], 68);
            Nx R = nx_mul(z, nx_mul(s, q, 68), 68);
            Nx sc = nx_mul(s, C68(), 68);
            Nx ks = K.m ? nx_add(K, sc, 68) : sc;
            Nx pre = nx_add(ks, R, 128);
            Nx d = nx_sub(pre, M, 128);
            double ulp = __builtin_ldexp(1.0, M.e + 127 - 67);
            Nx dh = nx_sub(a.L, M, 128);
            printf("%s s=%.6f k=%d pre-M=%.4f ulp  hw-M=%.2f ulp  R/L=%.3g\n", a.p1 ? "p1" : "l2", nx_d(s), K.m ? (int)nx_d(K) : 0, nx_d(d) / ulp, nx_d(dh) / ulp, nx_d(R) / nx_d(M));
        }
        return 0;
    }
    if (getenv("VAR")) VAR = atoi(getenv("VAR"));
    if (getenv("FR")) FR = atoi(getenv("FR"));
    if (getenv("RCZ")) RCZ = atoi(getenv("RCZ"));
    if (getenv("RCH")) RCH = atoi(getenv("RCH"));
    if (getenv("RCH2")) RCH2 = atoi(getenv("RCH2"));
    if (getenv("RCSQ")) RCSQ = atoi(getenv("RCSQ"));
    if (getenv("RCR")) RCR = atoi(getenv("RCR"));
    if (getenv("PS")) PS = atoi(getenv("PS"));
    if (getenv("PS2")) PS2 = atoi(getenv("PS2"));
    if (getenv("PR")) PR = atoi(getenv("PR"));
    if (getenv("PSC")) PSC = atoi(getenv("PSC"));
    if (getenv("PKS")) PKS = atoi(getenv("PKS"));
    if (getenv("PZ")) PZ = atoi(getenv("PZ"));
    if (getenv("PH")) PH = atoi(getenv("PH"));
    if (getenv("PSQ")) PSQ = atoi(getenv("PSQ"));
    int best = conta();
    printf("inicial %d / %zu\n", best, am.size());
    // passos em ulps de 68 bits de cada coeficiente
    for (int p = 0; p < pass; p++) {
        bool melhorou = false;
        for (int i = 0; i < 10; i++) {
            for (int dir = -1; dir <= 1; dir += 2) {
                for (int passo = 1; passo <= (1 << 20); passo *= 2) {
                    Nx old = A[i];
                    Nx u = nx_bits(0, 0, (uint64_t)passo, A[i].e + 127 - 67 - FR);
                    u.s = dir < 0;
                    A[i] = nx_add(A[i], u, 68 + FR);
                    int c = conta();
                    if (c > best) { best = c; melhorou = true; printf("  a%d %+d*%d -> %d\n", i, dir, passo, c); fflush(stdout); passo /= 2; if (passo < 1) passo = 1; continue; }
                    A[i] = old;
                    if (c < best - 40) break;
                }
            }
        }
        printf("passada %d: %d / %zu\n", p, best, am.size());
        if (!melhorou) break;
    }
    FILE *f = fopen("coef_log.txt", "w");
    for (int i = 0; i < 10; i++) {
        // mantissa de 68 bits: m >> 60
        u128 m = A[i].m >> 60;
        fprintf(f, "%llx %016llx %d\n", (unsigned long long)(m >> 64), (unsigned long long)m, A[i].e + 60);
    }
    fclose(f);
}
