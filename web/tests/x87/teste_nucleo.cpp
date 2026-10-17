// teste_nucleo.cpp - confere a aritmetica de trabalho do x87_zen2.cpp (soma, produto, divisao,
// arredondamento para 64 bits) contra fadd/fmul/fdiv do hardware nos 4 modos.
#include "../../runtime/x87_zen2.cpp"
#include "hw.h"
#include <stdio.h>

static uint64_t est = 12345;
static uint64_t rnd() { est ^= est << 13; est ^= est >> 7; est ^= est << 17; return est; }
static x87e alea() {
    x87e v;
    v.m = rnd() | 0x8000000000000000ULL;
    if (rnd() % 4 == 0) v.m &= ~((1ULL << (rnd() % 60)) - 1);
    v.se = (uint16_t)(16383 - 70 + rnd() % 140) | (uint16_t)((rnd() & 1) << 15);
    return v;
}
int main() {
    long n = 0, dif[3] = {0, 0, 0};
    for (int i = 0; i < 2000000; i++) {
        x87e a = alea(), b = alea();
        if (rnd() % 3 == 0) { b.se = (a.se & 0x7FFF) - rnd() % 70 + 35 | (b.se & 0x8000); }
        int rc = rnd() % 4;
        Nx A = de_x87(a), B = de_x87(b);
        x87e h[3] = {hw_fadd(b, a, rc), hw_fmul(b, a, rc), hw_fdiv(b, a, rc)};
        x87e m[3] = {para_x87(nx_add(B, A, 128, 0), rc), para_x87(nx_mul(B, A, 64, rc), rc), para_x87(nx_div(B, A, 64, rc), rc)};
        // soma: arredonda direto a 64 (sem passar por 128) para nao arredondar duas vezes
        m[0] = para_x87(nx_add(B, A, 64, rc), rc);
        for (int k = 0; k < 3; k++)
            if (h[k].m != m[k].m || h[k].se != m[k].se) {
                if (++dif[k] <= 3)
                    printf("op%d rc%d a=%04x%016llx b=%04x%016llx hw=%04x%016llx mod=%04x%016llx\n", k, rc, a.se, (unsigned long long)a.m, b.se,
                           (unsigned long long)b.m, h[k].se, (unsigned long long)h[k].m, m[k].se, (unsigned long long)m[k].m);
            }
        n++;
    }
    printf("%ld casos; diferencas soma %ld produto %ld divisao %ld\n", n, dif[0], dif[1], dif[2]);
    return dif[0] + dif[1] + dif[2] != 0;
}
