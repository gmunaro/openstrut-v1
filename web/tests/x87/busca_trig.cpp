// busca_trig.cpp - busca local nos bits dos coeficientes de SIN_Q/COS_Q do x87_zen2.cpp contra o hardware.
//   busca_trig <sin|cos> <n> <passadas> [xmin xmax]
// Usa a estrutura de x87_zen2.cpp (sin_c/cos_c) com os coeficientes em memoria; imprime a tabela final.
#include "../../runtime/x87_zen2.cpp"
#include "hw.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <vector>
static uint64_t est = 77;
static int semente_ = 0;
static uint64_t rnd() { est ^= est << 13; est ^= est >> 7; est ^= est << 17; return est; }
static std::vector<Coef> Q;
static bool SIN = true;
static Nx cpoly(const Nx &a) {
    Nx z = nx_mul(a, a, 68);
    Nx p = horner68(Q.data(), (int)Q.size(), z);
    return SIN ? nx_mul(nx_mul(a, z, 68), p, 68) : nx_mul(z, p, 68);
}
struct Am { Nx x; x87e h[3]; };
static std::vector<Am> am;
static int conta() {
    int ok = 0;
    for (auto &a : am) {
        Nx c = cpoly(a.x);
        bool t = true;
        for (int r = 0; r < 3 && t; r++) {
            x87e m = SIN ? fecha(a.x, c, false, r) : fecha(nx_int(1), c, false, r);
            t = m.m == a.h[r].m && m.se == a.h[r].se;
        }
        ok += t;
    }
    return ok;
}
int main(int argc, char **argv) {
    SIN = !strcmp(argv[1], "sin");
    int n = atoi(argv[2]), pass = atoi(argv[3]);
    double xmin = argc > 4 ? atof(argv[4]) : 0.001, xmax = argc > 5 ? atof(argv[5]) : 0.7854;
    if (SIN) Q.assign(SIN_Q, SIN_Q + sizeof SIN_Q / sizeof SIN_Q[0]);
    else Q.assign(COS_Q, COS_Q + sizeof COS_Q / sizeof COS_Q[0]);
    for (int i = 0; i < n; i++) {
        double xd = xmin + (xmax - xmin) * ((rnd() >> 11) * (1.0 / 9007199254740992.0));
        x87e x = hw_x((ld)xd);
        x.m ^= rnd() & 0xFFFFF;
        Am a; a.x = de_x87(x);
        for (int r = 0; r < 3; r++) a.h[r] = SIN ? hw_fsin(x, r) : hw_fcos(x, r);
        am.push_back(a);
    }
    int best = conta();
    printf("inicial %d / %d\n", best, n);
    for (int p = 0; p < pass; p++) {
        bool mel = false;
        for (size_t i = 0; i < Q.size(); i++) {
            for (int dir = -1; dir <= 1; dir += 2) {
                for (long passo = 1; passo <= (1L << 30); passo *= 2) {
                    Coef old = Q[i];
                    Nx v = cf(Q[i]);
                    Nx u = nx_bits(dir < 0, 0, (uint64_t)passo, v.e + 127 - 67);
                    Nx w = nx_add(v, u, 68);
                    Q[i] = Coef{w.s, (uint64_t)(w.m >> 64), (uint64_t)w.m, w.e};
                    int c = conta();
                    if (c > best) { best = c; mel = true; printf("  q%zu %+d*%ld -> %d\n", i, dir, passo, c); fflush(stdout); continue; }
                    Q[i] = old;
                    if (c < best - 30) break;
                }
            }
        }
        printf("passada %d: %d\n", p, best);
        if (!mel) break;
    }
    for (size_t i = 0; i < Q.size(); i++)
        printf("    {%d, 0x%016llxULL, 0x%016llxULL, %d}, // q%zu\n", Q[i].s, (unsigned long long)Q[i].hi, (unsigned long long)Q[i].lo, Q[i].e, i);
}
