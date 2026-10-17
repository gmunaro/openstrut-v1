// le_L.cpp - le o valor interno L(x) de FYL2X / FYL2XP1 (y * L arredondado uma vez para 64 bits):
// varia y, intersecta os intervalos [RD/y, RU/y] e procura o unico ponto da grade de P bits.
//   le_L <fyl2x|fyl2xp1> <n> <semente> <xmin> <xmax> [P]
// Saida: "x_hex L_hex(128 bits) e" por amostra (L = m * 2^e) ou "x_hex ?" se ambiguo.
#include "../../runtime/x87_zen2.cpp"
#include "hw.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

static uint64_t est = 3;
static int NY = 256;
static uint64_t rnd() { est ^= est << 13; est ^= est >> 7; est ^= est << 17; return est; }

// le L de x; devolve false se nao isolou um ponto
bool le(bool p1, x87e x, int P, Nx *L) {
    Nx lo, hi;
    bool tem = false;
    for (int k = 0; k < NY; k++) {
        x87e y;
        y.m = rnd() | 0x8000000000000000ULL;
        y.se = 0x3FFF;
        x87e D = p1 ? hw_fyl2xp1(y, x, 1) : hw_fyl2x(y, x, 1);
        x87e U = p1 ? hw_fyl2xp1(y, x, 2) : hw_fyl2x(y, x, 2);
        Nx Y = de_x87(y), Dn = de_x87(D), Un = de_x87(U);
        // L em [D/y, U/y] (se D == U: exato)
        Nx a = nx_div(Dn, Y, 128, 1), b = nx_div(Un, Y, 128, 2);
        if (Dn.s) { Nx t = a; a = nx_div(Dn, Y, 128, 2); b = nx_div(Un, Y, 128, 1); (void)t; }
        if (!tem) { lo = a; hi = b; tem = true; }
        else {
            if (nx_sub(a, lo, 128).s == 0) lo = a;
            if (nx_sub(b, hi, 128).s == 1) hi = b;
        }
    }
    // pontos da grade de P bits em [lo, hi]
    Nx c1 = arred1(lo, P, lo.s ? 1 : 2); // primeiro ponto >= lo (em valor)
    if (lo.s) c1 = arred1(lo, P, 2);
    Nx c1b = arred1(lo, P, 2), c2 = arred1(hi, P, 1);
    // c1b = menor ponto >= lo; c2 = maior ponto <= hi
    Nx dif = nx_sub(c2, c1b, 128);
    if (!c1b.m && !c2.m) return false;
    if (dif.m == 0 && c1b.m == c2.m) { *L = c1b; return true; }
    (void)c1;
    return false;
}

int main(int argc, char **argv) {
    bool p1 = !strcmp(argv[1], "fyl2xp1");
    int n = atoi(argv[2]);
    est = strtoull(argv[3], 0, 10) * 2654435761ULL + 3;
    double xmin = atof(argv[4]), xmax = atof(argv[5]);
    int P = argc > 6 ? atoi(argv[6]) : 68;
    int ok = 0;
    for (int i = 0; i < n; i++) {
        double xd = xmin + (xmax - xmin) * ((rnd() >> 11) * (1.0 / 9007199254740992.0));
        x87e x = hw_x((ld)xd);
        x.m ^= rnd() & 0xFFFFFF;
        Nx L;
        if (le(p1, x, P, &L)) {
            ok++;
            printf("%04x%016llx %d %016llx%016llx %d\n", x.se, (unsigned long long)x.m, L.s, (unsigned long long)(L.m >> 64), (unsigned long long)L.m, L.e);
        } else
            printf("%04x%016llx ?\n", x.se, (unsigned long long)x.m);
    }
    fprintf(stderr, "%s P=%d: isolados %d de %d\n", argv[1], P, ok, n);
}
