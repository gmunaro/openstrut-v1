// lp_dados.cpp - amostras do hardware para o ajuste dos polinomios por programacao linear.
// Para cada x: intervalo do valor interno V (antes do arredondamento final), lido com RN/RD/RU,
// convertido em restricao linear lo <= sum d_i * phi_i(x) <= hi sobre a correcao d dos coeficientes.
// Saida: texto, uma linha por amostra: "x_hex lo hi phi_0 ... phi_g".
//   lp_dados <modo> <n> <grau> <semente> <xmin> <xmax> > saida.txt
// modos: sin  (c = x - sin x = x^3 * Q(z), phi_i = x^3 z^i 2^-70 / ulp)
//        cos  (c = 1 - cos x = z * Q(z),   phi_i = z^(i+1) 2^-70 / ulp)
#include "../../runtime/x87_zen2.cpp"
#include "hw.h"
#include "ref.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

static uint64_t est = 1;
static uint64_t rnd() { est ^= est << 13; est ^= est >> 7; est ^= est << 17; return est; }

static Nx meio(const Nx &a, const Nx &b) { Nx s = nx_add(a, b, 128); s.e--; return s; }

int main(int argc, char **argv) {
    const char *modo = argv[1];
    int n = atoi(argv[2]), g = atoi(argv[3]);
    est = strtoull(argv[4], 0, 10) * 2654435761ULL + 7;
    double xmin = atof(argv[5]), xmax = atof(argv[6]);
    for (int i = 0; i < n; i++) {
        double xd = xmin + (xmax - xmin) * ((rnd() >> 11) * (1.0 / 9007199254740992.0));
        x87e x = hw_x((ld)xd);
        x.m ^= rnd() & 0xFFFFF;
        if (getenv("BITS")) x.m &= ~0ULL << (64 - atoi(getenv("BITS")));
        x87e D, U, N;
        bool sin_ = !strcmp(modo, "sin"), atan_ = !strcmp(modo, "atan"), tan_ = !strcmp(modo, "tan"), f2_ = !strcmp(modo, "f2xm1");
        x87e um1 = {0x8000000000000000ULL, 0x3FFF};
        if (f2_) { N = hw_f2xm1(x, 0); D = hw_f2xm1(x, 1); U = hw_f2xm1(x, 2); }
        else if (tan_) { N = hw_fptan(x, 0); D = hw_fptan(x, 1); U = hw_fptan(x, 2); }
        else if (atan_) { N = hw_fpatan(x, um1, 0); D = hw_fpatan(x, um1, 1); U = hw_fpatan(x, um1, 2); }
        else if (sin_) { N = hw_fsin(x, 0); D = hw_fsin(x, 1); U = hw_fsin(x, 2); }
        else { N = hw_fcos(x, 0); D = hw_fcos(x, 1); U = hw_fcos(x, 2); }
        Nx Dn = de_x87(D), Un = de_x87(U), Nn = de_x87(N), Vlo, Vhi;
        if (D.m == U.m && D.se == U.se) Vlo = Vhi = Dn;
        else if (N.m == D.m && N.se == D.se) { Vlo = Dn; Vhi = meio(Dn, Un); }
        else { Vlo = meio(Dn, Un); Vhi = Un; }
        Nx X = de_x87(x), z = nx_mul(X, X, 128);
        int eu = (N.se & 0x7FFF) - 16383 - 63; // ulp do resultado
        Nx base, c0, B;
        if (f2_) { Nx t = ref_2xm1(X); B = nx_zero(); c0 = nx_neg(t); base = t; }
        else if (tan_) { Nx t = nx_div(ref_sin(X), ref_cos(X), 128); B = nx_zero(); c0 = nx_neg(t); base = t; }
        else if (atan_) { B = X; c0 = nx_sub(X, ref_atan(X), 128); base = nx_mul(nx_mul(X, X, 128), X, 128); }
        else if (sin_) { B = X; c0 = nx_sub(X, ref_sin(X), 128); base = nx_mul(nx_mul(X, X, 128), X, 128); }
        else { B = nx_int(1); c0 = ref_umcos(X); base = z; }
        // c = B - V ; rlo = (B - Vhi - c0)/u
        Nx rlo = nx_sub(nx_sub(B, Vhi, 128), c0, 128), rhi = nx_sub(nx_sub(B, Vlo, 128), c0, 128);
        rlo.e -= eu; rhi.e -= eu;
        printf("%04x%016llx %.17g %.17g", x.se, (unsigned long long)x.m, nx_d(rlo), nx_d(rhi));
        Nx p = base;
        p.e -= 70 + eu;
        if (getenv("BRUTO")) { Nx b2 = base; b2.e -= 70 + eu; printf(" %.17g %.17g\n", nx_d(b2), nx_d(z)); continue; }
        bool todas = getenv("TODAS") != nullptr; // base x^(3+k) em vez de x^3 z^k
        for (int k = 0; k <= g; k++) {
            printf(" %.17g", nx_d(p));
            p = nx_mul(p, todas ? X : z, 128);
        }
        printf("\n");
    }
}
