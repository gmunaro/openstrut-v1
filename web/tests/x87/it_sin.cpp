// it_sin.cpp - restricoes lineares do FSIN/FCOS corrigidas pelo ruido de arredondamento da estrutura.
//   it_sin <sin|cos> <estrutura> <n> <semente> <xmin> <xmax> <coef d.txt> <grau> [P]
// Saida (texto): "lo hi phi_0..phi_g" ; e no stderr a taxa de acerto da estrutura com os coeficientes dados.
#include "../../runtime/x87_zen2.cpp"
#include "hw.h"
#include "ref.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <vector>

static uint64_t est = 99;
static uint64_t rnd() { est ^= est << 13; est ^= est >> 7; est ^= est << 17; return est; }
static int P = 68;
static int RCI = 0, RCC = 0; // rc das contas intermediarias e do c final
static bool SIN = true;
static std::vector<Nx> Q;

// T_i: sin: (-1)^i/(2i+3)! ; cos: (-1)^i/(2i+2)!
static Nx taylor(int i) {
    Nx t = nx_int(1);
    int top = SIN ? 2 * i + 3 : 2 * i + 2;
    for (int k = 2; k <= top; k++) t = nx_div(t, nx_int(k), 128);
    t.s = i & 1;
    return t;
}

// V do modelo: sin x = x - c, cos x = 1 - c
static int K = 72;
// arredonda para a grade absoluta 2^-K
static Nx abs_(const Nx &a, int rc = 0) {
    if (!a.m) return a;
    int bits = a.e + 127 + K + 1;
    if (bits <= 0) return nx_zero(a.s);
    if (bits > 128) return a;
    return arred1(a, bits, rc);
}
static Nx modelo(int e_, const Nx &x) {
    if (e_ >= 7) {
        Nx z = e_ == 8 ? abs_(nx_mul(x, x, 128), RCI) : nx_mul(x, x, P, RCI);
        int n = (int)Q.size();
        Nx p = Q[n - 1];
        for (int i = n - 2; i >= 0; i--)
            p = e_ == 8 ? abs_(nx_add(abs_(nx_mul(p, z, 128), RCI), Q[i], 128), RCI) : nx_add(nx_mul(p, z, P, RCI), Q[i], P, RCI);
        Nx w = e_ == 8 ? abs_(nx_mul(z, p, 128), RCI) : abs_(nx_mul(z, p, 128), RCI);
        Nx B = SIN ? x : nx_int(1);
        Nx c = SIN ? nx_mul(x, w, P, RCC) : arred1(w, P, RCC);
        return nx_sub(B, c, 128);
    }
    Nx z = nx_mul(x, x, P, RCI);
    int n = (int)Q.size();
    Nx p = Q[n - 1];
    for (int i = n - 2; i >= 0; i--) p = nx_add(nx_mul(p, z, P, RCI), Q[i], P, RCI);
    Nx B = SIN ? x : nx_int(1);
    Nx c;
    if (SIN) {
        switch (e_) {
        case 0: c = nx_mul(nx_mul(x, z, P, RCI), p, P, RCC); break;
        case 1: c = nx_mul(x, nx_mul(z, p, P, RCI), P, RCC); break;
        case 2: c = nx_mul(z, nx_mul(x, p, P, RCI), P, RCC); break;
        case 4: c = nx_mul(x, nx_mul(z, p, P), 128); break;
        case 5: c = nx_mul(nx_mul(x, z, P), p, 128); break;
        case 6: c = nx_mul(nx_mul(x, z, 128), p, 128); break; // so Horner arredonda
        }
    } else {
        switch (e_) {
        case 0: c = nx_mul(z, p, P, RCC); break;
        case 1: c = nx_mul(z, p, 128); break;
        case 2: case 4: { // c = r68(z/2 + t), t = r68(z * r68(z * p')), p' = Horner(q1..)
            Nx pp = Q[n - 1];
            for (int i = n - 2; i >= 1; i--) pp = nx_add(nx_mul(pp, z, P), Q[i], P);
            Nx t = e_ == 2 ? nx_mul(z, nx_mul(z, pp, P), P) : nx_mul(nx_mul(z, z, P), pp, P);
            Nx h = nx_mul(z, Q[0], 128);
            c = nx_add(h, t, P);
            break; }
        case 3: c = nx_mul(nx_mul(x, x, 128), p, P); break;
        }
    }
    return nx_sub(B, c, 128);
}
// V linear exato: B - base * sum q_i z^i com z = x^2 exato
static Nx linear(const Nx &x) {
    Nx z = nx_mul(x, x, 128);
    int n = (int)Q.size();
    Nx p = Q[n - 1];
    for (int i = n - 2; i >= 0; i--) p = nx_add(nx_mul(p, z, 128), Q[i], 128);
    Nx B = SIN ? x : nx_int(1);
    Nx base = SIN ? nx_mul(x, z, 128) : z;
    return nx_sub(B, nx_mul(base, p, 128), 128);
}
static Nx meio(const Nx &a, const Nx &b) { Nx s = nx_add(a, b, 128); s.e--; return s; }

int main(int argc, char **argv) {
    SIN = !strcmp(argv[1], "sin");
    int e_ = atoi(argv[2]), n = atoi(argv[3]);
    est = strtoull(argv[4], 0, 10) * 2654435761ULL + 7;
    double xmin = atof(argv[5]), xmax = atof(argv[6]);
    int g = atoi(argv[8]);
    if (argc > 9) P = atoi(argv[9]);
    if (getenv("KABS")) K = atoi(getenv("KABS"));
    if (getenv("RCI")) RCI = atoi(getenv("RCI"));
    if (getenv("RCC")) RCC = atoi(getenv("RCC"));
    FILE *f = fopen(argv[7], "r");
    std::vector<double> dv;
    double d;
    while (f && fscanf(f, "%lf", &d) == 1) dv.push_back(d);
    if (f) fclose(f);
    dv.resize(g + 1, 0.0);
    for (int i = 0; i <= g; i++) {
        Nx t = taylor(i);
        // d * 2^-70 com d double: d = mant * 2^ex exato
        int ex;
        double fr = __builtin_frexp(dv[i], &ex);
        Nx dd = nx_int((int64_t)__builtin_ldexp(fr, 53));
        dd.e += ex - 53 - 70;
        Q.push_back(arred1(nx_add(t, dd, 128), P, 0));
    }
    long ok3 = 0, okrn = 0;
    for (int k = 0; k < n; k++) {
        double xd = xmin + (xmax - xmin) * ((rnd() >> 11) * (1.0 / 9007199254740992.0));
        x87e x = hw_x((ld)xd);
        x.m ^= rnd() & 0xFFFFF;
        if (getenv("BITS")) x.m &= ~0ULL << (64 - atoi(getenv("BITS")));
        x87e N, D, U;
        if (SIN) { N = hw_fsin(x, 0); D = hw_fsin(x, 1); U = hw_fsin(x, 2); }
        else { N = hw_fcos(x, 0); D = hw_fcos(x, 1); U = hw_fcos(x, 2); }
        Nx X = de_x87(x);
        Nx V = modelo(e_, X), Vl = linear(X);
        x87e mN = para_x87(V, 0), mD = para_x87(V, 1), mU = para_x87(V, 2);
        bool a = mN.m == N.m && mN.se == N.se, b = mD.m == D.m && mD.se == D.se, c = mU.m == U.m && mU.se == U.se;
        okrn += a;
        if (getenv("DIAG") && !(a && b && c)) fprintf(stderr, "DIF %.17g %d%d%d\n", xd, a, b, c);
        ok3 += a && b && c;
        Nx Dn = de_x87(D), Un = de_x87(U), Vlo, Vhi;
        if (D.m == U.m && D.se == U.se) Vlo = Vhi = Dn;
        else if (N.m == D.m && N.se == D.se) { Vlo = Dn; Vhi = meio(Dn, Un); }
        else { Vlo = meio(Dn, Un); Vhi = Un; }
        int eu = (N.se & 0x7FFF) - 16383 - 63;
        // restricao sobre delta: Vlo <= V + (Vlin(q+delta) - Vlin(q)) <= Vhi ; Vlin(q+delta) - Vlin(q) = -base * sum delta_i z^i
        // => (V - Vhi) <= base*sum <= (V - Vlo)
        Nx lo = nx_sub(V, Vhi, 128), hi = nx_sub(V, Vlo, 128);
        lo.e -= eu; hi.e -= eu;
        printf("%.17g %.17g", nx_d(lo), nx_d(hi));
        Nx z = nx_mul(X, X, 128);
        Nx p = SIN ? nx_mul(z, X, 128) : z;
        p.e -= 70 + eu;
        for (int i = 0; i <= g; i++) { printf(" %.17g", nx_d(p)); p = nx_mul(p, z, 128); }
        printf("\n");
    }
    fprintf(stderr, "%s estrutura %d P=%d grau %d: RN %ld/%d (%.4f%%), 3 modos %ld\n", argv[1], e_, P, g, okrn, n, 100.0 * okrn / n, ok3);
    for (int i = 0; i <= g; i++) fprintf(stderr, "  q%d = %d %016llx%016llx e%d\n", i, Q[i].s, (unsigned long long)(Q[i].m >> 64), (unsigned long long)Q[i].m, Q[i].e);
}
