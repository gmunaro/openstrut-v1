// x87_zen2.h - instrucoes transcendentes do x87 do AMD Zen 2 (Ryzen 5 3600) em software, bit a bit.
//
// Documentacao (algoritmos, constantes, taxas de acerto contra o hardware): x87_zen2.md.
// C++ portatil: inteiros de 64 bits e unsigned __int128, sem long double. Compila no em++ (wasm)
// e no clang nativo (testes em web/tests/x87).
//
// Estendido: m = mantissa com o bit inteiro explicito, se = sinal (bit 15) e expoente com vies 16383,
// o mesmo leiaute do qb_f80 e do long double do x87.
// rc: modo de arredondamento da palavra de controle (0 ao par, 1 para baixo, 2 para cima, 3 para zero).
// A precisao (PC) nao muda estas instrucoes no Zen 2.
#pragma once

#include <stdint.h>

struct x87e {
    uint64_t m;
    uint16_t se;
};

enum { X87_RN = 0, X87_RD = 1, X87_RU = 2, X87_RZ = 3 };

// ---------------------------------------------------------------- instrucoes
// FSIN, FCOS: st0 = sin/cos(st0). |x| >= 2^63: o x87 nao reduz (C2 = 1) e deixa st0 intacto;
// aqui *fora (se nao nulo) recebe 1 nesse caso.
x87e zen2_fsin(x87e x, int rc, int *fora = nullptr);
x87e zen2_fcos(x87e x, int rc, int *fora = nullptr);
// FPTAN: st0 = tan(st0) e empilha 1.0 (devolvido o tan).
x87e zen2_fptan(x87e x, int rc, int *fora = nullptr);
// FPATAN: atan(y / x) com o quadrante de (x, y).
x87e zen2_fpatan(x87e y, x87e x, int rc);
// F2XM1: 2^x - 1, |x| <= 1.
x87e zen2_f2xm1(x87e x, int rc);
// FYL2X: y * log2(x).  FYL2XP1: y * log2(1 + x).
x87e zen2_fyl2x(x87e y, x87e x, int rc);
x87e zen2_fyl2xp1(x87e y, x87e x, int rc);

// ---------------------------------------------------------------- libm do mingw-w64 (x86_64)
// Mesma sequencia de instrucoes das funcoes long double do mingw (palavra de controle 0x37F).
x87e mingw_sinl(x87e x);
x87e mingw_cosl(x87e x);
x87e mingw_tanl(x87e x);
x87e mingw_atanl(x87e x);
x87e mingw_atan2l(x87e y, x87e x);
x87e mingw_expl(x87e x);
x87e mingw_logl(x87e x);

// ---------------------------------------------------------------- ponte para o qb_f80
// x, y, r apontam para estendidos no leiaute do x87 (8 bytes de mantissa e 2 de sinal/expoente),
// como o qb_f80. O qb_f80.cpp declara estas duas funcoes no corpo das suas (sem incluir este .h).
enum { X87Z_SIN, X87Z_COS, X87Z_TAN, X87Z_ATAN, X87Z_EXP, X87Z_LOG };
void x87z_f(int f, const void *x, void *r);
void x87z_atan2(const void *y, const void *x, void *r);
