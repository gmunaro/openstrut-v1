// ajusta_sin.cpp - estrutura de avaliacao do FSIN (|x| < pi/4) contra o hardware.
//   ajusta_sin <estrutura> <n> <arquivo de coeficientes d (2^-70, sobre Taylor)> [P]
#include "../../runtime/x87_zen2.cpp"
#include "hw.h"
#include "ref.h"
#include <stdio.h>
#include <stdlib.h>
#include <vector>

static uint64_t est = 99;
static uint64_t rnd() { est ^= est << 13; est ^= est >> 7; est ^= est << 17; return est; }

static int P = 68;
static std::vector<Nx> Q;
static Nx r_(const Nx &a) { return arred1(a, P, 0); }

static Nx modelo(int est_, const Nx &x, int rc, Nx *Vout) {
    Nx z = nx_mul(x, x, P);
    int n = (int)Q.size();
    Nx p = Q[n - 1];
    for (int i = n - 2; i >= 0; i--) p = nx_add(nx_mul(p, z, P), Q[i], P);
    Nx V;
    switch (est_) {
    case 0: V = nx_sub(x, nx_mul(nx_mul(x, z, P), p, P), 128); break;          // c = r(r(x z) p)
    case 1: V = nx_sub(x, nx_mul(x, nx_mul(z, p, P), P), 128); break;          // c = r(x r(z p))
    case 2: V = nx_sub(x, nx_mul(z, nx_mul(x, p, P), P), 128); break;          // c = r(z r(x p))
    case 3: { // V = x * (1 - r(z p)) fundido
        Nx t = nx_mul(z, p, P);
        Nx u = nx_sub(nx_int(1), t, P);
        V = nx_mul(x, u, 128);
        break; }
    case 4: { // V = x - x*t fundido, t = r(z p)
        Nx t = nx_mul(z, p, P);
        Nx xt = nx_mul(x, t, 128);
        V = nx_sub(x, xt, 128);
        break; }
    case 5: { // c sem arredondar o produto final: x - (x z) p exato
        Nx xz = nx_mul(x, z, P);
        V = nx_sub(x, nx_mul(xz, p, 128), 128);
        break; }
    }
    *Vout = V;
    return V;
}

int main(int argc, char **argv) {
    int e_ = atoi(argv[1]), n = atoi(argv[2]);
    if (argc > 4) P = atoi(argv[4]);
    FILE *f = fopen(argv[3], "r");
    double d;
    int i = 0;
    while (fscanf(f, "%lf", &d) == 1) {
        // T_i = (-1)^i / (2i+3)!
        Nx t = nx_int(1);
        for (int k = 2; k <= 2 * i + 3; k++) t = nx_div(t, nx_int(k), 128);
        t.s = i & 1;
        // d * 2^-70
        int64_t dm = (int64_t)(d * 1048576.0); // d * 2^20
        Nx dd = nx_int(dm);
        dd.e -= 90;
        Q.push_back(arred1(nx_add(t, dd, 128), P, 0));
        i++;
    }
    long ok = 0, okrn = 0;
    for (int k = 0; k < n; k++) {
        double xd = 0.02 + (0.7854 - 0.02) * ((rnd() >> 11) * (1.0 / 9007199254740992.0));
        x87e x = hw_x((ld)xd);
        x.m ^= rnd() & 0xFFFFF;
        Nx X = de_x87(x), V;
        modelo(e_, X, 0, &V);
        bool tudo = true;
        for (int rc = 0; rc < 3; rc++) {
            x87e h = hw_fsin(x, rc), m = para_x87(V, rc);
            bool ig = h.m == m.m && h.se == m.se;
            if (rc == 0 && ig) okrn++;
            tudo &= ig;
        }
        ok += tudo;
    }
    printf("estrutura %d P=%d: RN igual %ld/%d, os 3 modos %ld\n", e_, P, okrn, n, ok);
}
