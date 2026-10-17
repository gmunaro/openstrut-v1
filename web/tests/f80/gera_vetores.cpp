// gera_vetores.cpp - vetores do long double do x87 no nativo, para conferir o qb_f80 do build web.
// Compila com o clang do QB64 (o mesmo do V1 nativo):
//   C:/qb64pe/qb64pe/internal/c/c_compiler/bin/c++.exe -O0 gera_vetores.cpp -o gera_vetores.exe
//   gera_vetores.exe <saida.txt> [n por operacao] [semente]
// Formato: uma linha por caso, "op a b r", estendidos em hexadecimal (4 digitos de sinal/expoente
// e 16 de mantissa), float/double/inteiros em hexadecimal dos bits, textos entre aspas.
#include <cmath>
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>

typedef long double ld;

static uint64_t estado = 88172645463325252ULL;
static uint64_t rnd() {
    estado ^= estado << 13;
    estado ^= estado >> 7;
    estado ^= estado << 17;
    return estado;
}
static double unif() { return (rnd() >> 11) * (1.0 / 9007199254740992.0); }

static void hx(FILE *f, ld v) {
    unsigned char b[16] = {0};
    memcpy(b, &v, 10);
    uint64_t m;
    uint16_t se;
    memcpy(&m, b, 8);
    memcpy(&se, b + 8, 2);
    fprintf(f, " %04x%016llx", se, (unsigned long long)m);
}
static ld de_bits(uint16_t se, uint64_t m) {
    ld v = 0;
    unsigned char b[16] = {0};
    memcpy(b, &m, 8);
    memcpy(b + 8, &se, 2);
    memcpy(&v, b, 10);
    return v;
}

// valores como os do programa: SINGLE e DOUBLE alargados, estendidos quaisquer, especiais
static ld valor(int faixa) {
    int k = rnd() % 10;
    if (k < 3) { // float
        float x;
        uint32_t u;
        do {
            u = (uint32_t)rnd();
            if (faixa) // expoente moderado
                u = (u & 0x807FFFFF) | ((uint32_t)(127 - 30 + rnd() % 60) << 23);
            memcpy(&x, &u, 4);
        } while (!std::isfinite(x));
        return x;
    }
    if (k < 5) { // double
        double x;
        uint64_t u;
        do {
            u = rnd();
            if (faixa)
                u = (u & 0x800FFFFFFFFFFFFFULL) | ((uint64_t)(1023 - 40 + rnd() % 80) << 52);
            memcpy(&x, &u, 8);
        } while (!std::isfinite(x));
        return x;
    }
    if (k < 8) { // estendido qualquer
        uint64_t m = rnd() | 0x8000000000000000ULL;
        int e = faixa ? (int)(16383 - 40 + rnd() % 80) : (int)(1 + rnd() % 32765);
        return de_bits((uint16_t)(e | ((rnd() & 1) << 15)), m);
    }
    if (k < 9) { // numero "de engenharia": poucos digitos, como SINGLE
        float x = (float)((double)(rnd() % 100000) / std::pow(10.0, (double)(rnd() % 6)));
        if (rnd() & 1)
            x = -x;
        return x;
    }
    switch (rnd() % 8) {
    case 0: return 0.0L;
    case 1: return -0.0L;
    case 2: return (ld)INFINITY;
    case 3: return -(ld)INFINITY;
    case 4: return de_bits(0xFFFF, 0xC000000000000000ULL); // NaN indefinido
    case 5: return de_bits(0x0000, rnd() >> 1);              // denormal
    case 6: return (ld)(int)(rnd() % 2000) - 1000;
    default: return de_bits(0x7FFE, rnd() | 0x8000000000000000ULL);
    }
}

static int64_t fistp(ld v) {
    int64_t i;
    __asm__("fldt %1; fistpll %0" : "=m"(i) : "m"(v));
    return i;
}
static ld fsin_hw(ld v) {
    ld r;
    __asm__("fsin" : "=t"(r) : "0"(v));
    return r;
}

int main(int argc, char **argv) {
    if (argc < 2) {
        fprintf(stderr, "uso: gera_vetores <saida> [n] [semente]\n");
        return 2;
    }
    int n = argc > 2 ? atoi(argv[2]) : 20000;
    if (argc > 3)
        estado = strtoull(argv[3], 0, 10) * 2654435761ULL + 1;
    FILE *f = fopen(argv[1], "w");
    volatile ld a, b, r;
    for (int i = 0; i < n; i++) {
        a = valor(0);
        b = valor(0);
        r = a + b; fprintf(f, "add"); hx(f, a); hx(f, b); hx(f, r); fputc('\n', f);
        r = a - b; fprintf(f, "sub"); hx(f, a); hx(f, b); hx(f, r); fputc('\n', f);
        r = a * b; fprintf(f, "mul"); hx(f, a); hx(f, b); hx(f, r); fputc('\n', f);
        r = a / b; fprintf(f, "div"); hx(f, a); hx(f, b); hx(f, r); fputc('\n', f);
        fprintf(f, "cmp"); hx(f, a); hx(f, b); fprintf(f, " %d%d%d%d\n", a < b, a <= b, a == b, a != b);
        r = std::sqrt((ld)a); fprintf(f, "sqrt"); hx(f, a); hx(f, 0); hx(f, r); fputc('\n', f);
        r = std::floor((ld)a); fprintf(f, "floor"); hx(f, a); hx(f, 0); hx(f, r); fputc('\n', f);
        {
            float x = (float)a; uint32_t u; memcpy(&u, &x, 4);
            fprintf(f, "tof32"); hx(f, a); fprintf(f, " %08x\n", u);
            double y = (double)a; uint64_t v; memcpy(&v, &y, 8);
            fprintf(f, "tof64"); hx(f, a); fprintf(f, " %016llx\n", (unsigned long long)v);
        }
        if (std::isfinite((ld)a) && std::fabs((ld)a) < 1e20L) {
            ld c = a;
            fprintf(f, "toi32"); hx(f, a); fprintf(f, " %08x\n", (uint32_t)(int32_t)c);
            fprintf(f, "toi16"); hx(f, a); fprintf(f, " %04x\n", (uint16_t)(int16_t)c);
            fprintf(f, "toi64"); hx(f, a); fprintf(f, " %016llx\n", (unsigned long long)(int64_t)c);
            fprintf(f, "tou64"); hx(f, a); fprintf(f, " %016llx\n", (unsigned long long)(uint64_t)c);
            fprintf(f, "tou32"); hx(f, a); fprintf(f, " %08x\n", (uint32_t)c);
            fprintf(f, "qbr"); hx(f, a); fprintf(f, " %016llx\n", (unsigned long long)fistp(c));
        }
        // libm em faixa moderada (como os programas)
        a = valor(1);
        ld x = a;
        r = std::sin(x); fprintf(f, "sin"); hx(f, a); hx(f, 0); hx(f, r); fputc('\n', f);
        r = fsin_hw(x); fprintf(f, "fsin"); hx(f, a); hx(f, 0); hx(f, r); fputc('\n', f);
        r = std::cos(x); fprintf(f, "cos"); hx(f, a); hx(f, 0); hx(f, r); fputc('\n', f);
        r = std::tan(x); fprintf(f, "tan"); hx(f, a); hx(f, 0); hx(f, r); fputc('\n', f);
        r = std::atan(x); fprintf(f, "atan"); hx(f, a); hx(f, 0); hx(f, r); fputc('\n', f);
        {
            ld e = x;
            if (std::fabs(e) > 11000) e = std::fmod(e, 11000.0L);
            r = std::exp(e); fprintf(f, "exp"); hx(f, e); hx(f, 0); hx(f, r); fputc('\n', f);
        }
        r = std::log(std::fabs(x)); fprintf(f, "log"); hx(f, std::fabs(x)); hx(f, 0); hx(f, r); fputc('\n', f);
        // decimal -> estendido (o %Lf do __mingw_sscanf, que o VAL usa)
        {
            char t[128];
            int nd = 1 + rnd() % 25, p = 0;
            if (rnd() & 1) t[p++] = '-';
            t[p++] = (char)('1' + rnd() % 9);
            t[p++] = '.';
            for (int k = 1; k < nd; k++) t[p++] = (char)('0' + rnd() % 10);
            int ex = (rnd() % 10 == 0) ? (int)(rnd() % 9800) - 4900 : (int)(rnd() % 60) - 30;
            p += sprintf(t + p, "E%d", ex);
            t[p] = 0;
            ld v = 0;
            __mingw_sscanf(t, "%Lf", &v);
            fprintf(f, "dec \"%s\"", t); hx(f, v); fputc('\n', f);
        }
        // estendido -> texto (%.*LG do _TOSTR$)
        {
            ld v = valor(rnd() & 1);
            int dg = 1 + rnd() % 19;
            char t[128];
            __mingw_snprintf(t, sizeof t, "%.*LG", dg, v);
            fprintf(f, "fmtg %d", dg); hx(f, v); fprintf(f, " \"%s\"\n", t);
        }
        // estendido -> "% .*Lf" (PRINT USING de _FLOAT: print_using_float usa 255 casas)
        {
            ld v = valor(1);
            int dg = (rnd() % 4 == 0) ? 255 : (int)(rnd() % 40);
            static char t[2048];
            __mingw_snprintf(t, sizeof t, "% .*Lf", dg, v);
            fprintf(f, "fmtf %d", dg); hx(f, v); fprintf(f, " \"%s\"\n", t);
        }
    }
    fclose(f);
    return 0;
}
