// sonda.cpp - roda uma instrucao do x87 (ou funcao da libm do mingw) sobre uma lista de entradas.
// Nativo, clang do QB64 (x86_64):
//   C:/qb64pe/qb64pe/internal/c/c_compiler/bin/c++.exe -O1 sonda.cpp -o sonda.exe
//   sonda.exe <op> <cw hex> <entrada.bin> <saida.bin>
// entrada: registros de 20 bytes (a, b: estendidos de 10 bytes). saida: registros de 22 bytes
// (r0, r1 estendidos, palavra de estado). Operandos: st0 = a, st1 = b.
// op: fsin fcos fsincos fptan fpatan f2xm1 fyl2x fyl2xp1 fscale frndint fprem1 fmul fadd fdiv
//     sinl cosl tanl atanl atan2l expl logl powl
#include <cmath>
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>

typedef long double ld;

int main(int argc, char **argv) {
    if (argc < 5) {
        fprintf(stderr, "uso: sonda <op> <cw> <entrada> <saida>\n");
        return 2;
    }
    const char *op = argv[1];
    unsigned short cw = (unsigned short)strtoul(argv[2], 0, 16), cw0;
    FILE *fi = fopen(argv[3], "rb"), *fo = fopen(argv[4], "wb");
    if (!fi || !fo)
        return 2;
    unsigned char in[20], out[22];
    int libm = !strcmp(op + strlen(op) - 1, "l") && strcmp(op, "fcos") != 0;
    while (fread(in, 1, 20, fi) == 20) {
        ld a = 0, b = 0, r0 = 0, r1 = 0;
        unsigned short sw = 0;
        memcpy(&a, in, 10);
        memcpy(&b, in + 10, 10);
        __asm__ volatile("fnstcw %0" : "=m"(cw0));
        if (libm) {
            __asm__ volatile("fldcw %0" ::"m"(cw));
            if (!strcmp(op, "sinl")) r0 = sinl(a);
            else if (!strcmp(op, "cosl")) r0 = cosl(a);
            else if (!strcmp(op, "tanl")) r0 = tanl(a);
            else if (!strcmp(op, "atanl")) r0 = atanl(a);
            else if (!strcmp(op, "atan2l")) r0 = atan2l(a, b);
            else if (!strcmp(op, "expl")) r0 = expl(a);
            else if (!strcmp(op, "logl")) r0 = logl(a);
            else if (!strcmp(op, "powl")) r0 = powl(a, b);
            __asm__ volatile("fnstsw %0" : "=m"(sw));
            __asm__ volatile("fldcw %0" ::"m"(cw0));
        } else {
#define UM(ins)                                                                                                                                                \
    __asm__ volatile("fclex; fldcw %3; fldt %4; " ins "; fnstsw %2; fstpt %0; fldcw %5" : "=m"(r0), "=m"(r1), "=m"(sw) : "m"(cw), "m"(a), "m"(cw0))
#define DOIS_IN(ins)                                                                                                                                           \
    __asm__ volatile("fclex; fldcw %3; fldt %5; fldt %4; " ins "; fnstsw %2; fstpt %0; fldcw %6" : "=m"(r0), "=m"(r1), "=m"(sw) : "m"(cw), "m"(a), "m"(b), "m"(cw0))
#define DOIS_OUT(ins)                                                                                                                                          \
    __asm__ volatile("fclex; fldcw %3; fldt %4; " ins "; fnstsw %2; fstpt %0; fstpt %1; fldcw %5" : "=m"(r0), "=m"(r1), "=m"(sw) : "m"(cw), "m"(a), "m"(cw0))
#define DOIS_INOUT(ins)                                                                                                                                        \
    __asm__ volatile("fclex; fldcw %3; fldt %5; fldt %4; " ins "; fnstsw %2; fstpt %0; fstpt %1; fldcw %6" : "=m"(r0), "=m"(r1), "=m"(sw) : "m"(cw), "m"(a), "m"(b), "m"(cw0))
            if (!strcmp(op, "fsin")) UM("fsin");
            else if (!strcmp(op, "fcos")) UM("fcos");
            else if (!strcmp(op, "f2xm1")) UM("f2xm1");
            else if (!strcmp(op, "frndint")) UM("frndint");
            else if (!strcmp(op, "fsincos")) DOIS_OUT("fsincos");
            else if (!strcmp(op, "fptan")) DOIS_OUT("fptan");
            else if (!strcmp(op, "fpatan")) DOIS_IN("fpatan");    // atan(b / a): st1 = b, st0 = a
            else if (!strcmp(op, "fyl2x")) DOIS_IN("fyl2x");      // b * log2(a)
            else if (!strcmp(op, "fyl2xp1")) DOIS_IN("fyl2xp1");  // b * log2(1 + a)
            else if (!strcmp(op, "fscale")) DOIS_INOUT("fscale");  // a * 2^trunc(b)
            else if (!strcmp(op, "fprem1")) DOIS_INOUT("fprem1");  // resto de a por b
            else if (!strcmp(op, "fmul")) DOIS_IN("fmulp");
            else if (!strcmp(op, "fadd")) DOIS_IN("faddp");
            else if (!strcmp(op, "fdiv")) DOIS_IN(".byte 0xde, 0xf9"); // Intel FDIVP st(1), st: b / a
            else { fprintf(stderr, "op desconhecida %s\n", op); return 2; }
        }
        memset(out, 0, sizeof out);
        memcpy(out, &r0, 10);
        memcpy(out + 10, &r1, 10);
        memcpy(out + 20, &sw, 2);
        fwrite(out, 1, 22, fo);
    }
    fclose(fo);
    return 0;
}
