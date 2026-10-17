// hw.h - instrucoes do x87 de verdade (asm em linha), para os testes nativos (x86_64, clang do QB64).
#pragma once
#include <stdint.h>
#include <string.h>
#include "../../runtime/x87_zen2.h"

typedef long double ld;
static inline ld hw_ld(x87e v) { ld r = 0; memcpy(&r, &v.m, 8); memcpy((char *)&r + 8, &v.se, 2); return r; }
static inline x87e hw_x(ld v) { x87e r; memcpy(&r.m, &v, 8); memcpy(&r.se, (char *)&v + 8, 2); return r; }
static inline uint16_t hw_cw(int rc) { return (uint16_t)(0x37F | (rc << 10)); }

#define HW_UM(nome, ins)                                                                                                                                      \
    static inline x87e nome(x87e a, int rc, uint16_t *sw = nullptr) {                                                                                         \
        ld x = hw_ld(a), r; uint16_t cw = hw_cw(rc), cw0, s;                                                                                                   \
        __asm__ volatile("fnstcw %0" : "=m"(cw0));                                                                                                             \
        __asm__ volatile("fclex; fldcw %2; fldt %3; " ins "; fnstsw %1; fstpt %0; fldcw %4" : "=m"(r), "=m"(s) : "m"(cw), "m"(x), "m"(cw0));                 \
        if (sw) *sw = s;                                                                                                                                       \
        return hw_x(r);                                                                                                                                        \
    }
#define HW_DOIS(nome, ins)                                                                                                                                    \
    static inline x87e nome(x87e b, x87e a, int rc, uint16_t *sw = nullptr) {                                                                                 \
        ld x = hw_ld(a), y = hw_ld(b), r; uint16_t cw = hw_cw(rc), cw0, s;                                                                                    \
        __asm__ volatile("fnstcw %0" : "=m"(cw0));                                                                                                             \
        __asm__ volatile("fclex; fldcw %2; fldt %4; fldt %3; " ins "; fnstsw %1; fstpt %0; fldcw %5" : "=m"(r), "=m"(s) : "m"(cw), "m"(x), "m"(y), "m"(cw0)); \
        if (sw) *sw = s;                                                                                                                                       \
        return hw_x(r);                                                                                                                                        \
    }
// st0 = a, st1 = b; resultado em st0 depois do pop
HW_UM(hw_fsin, "fsin")
HW_UM(hw_fcos, "fcos")
HW_UM(hw_f2xm1, "f2xm1")
HW_UM(hw_frndint, "frndint")
HW_DOIS(hw_fpatan, "fpatan")       // atan(b / a)
HW_DOIS(hw_fyl2x, "fyl2x")         // b * log2(a)
HW_DOIS(hw_fyl2xp1, "fyl2xp1")     // b * log2(1 + a)
HW_DOIS(hw_fadd, "faddp")
HW_DOIS(hw_fmul, "fmulp")
HW_DOIS(hw_fdiv, ".byte 0xde, 0xf9") // b / a
HW_DOIS(hw_fsub, ".byte 0xde, 0xe9") // b - a (Intel FSUBP st(1), st0)

// FPTAN: empilha 1.0 (descartado); fora da faixa (C2) nao empilha
static inline x87e hw_fptan(x87e a, int rc, uint16_t *sw = nullptr) {
    ld x = hw_ld(a), r;
    uint16_t cw = hw_cw(rc), cw0, s;
    __asm__ volatile("fnstcw %0" : "=m"(cw0));
    __asm__ volatile("fclex; fldcw %2; fldt %3; fptan; fnstsw %%ax; movw %%ax, %1; testw $0x400, %%ax; jnz 1f; fstp %%st(0); 1: fstpt %0; fldcw %4"
                     : "=m"(r), "=m"(s) : "m"(cw), "m"(x), "m"(cw0) : "ax");
    if (sw) *sw = s;
    return hw_x(r);
}
