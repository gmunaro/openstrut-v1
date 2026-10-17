// qb_f80.h - o _FLOAT do QB64 (long double de 80 bits do x87) em software.
//
// No build web, web/tools/f80iza.py troca "long double" por "qb_f80" no C++ gerado pelo qb64pe e
// na libqb. Em wasm o long double do compilador e quad (113 bits), e a V1 depende do estendido
// de 64 bits de mantissa do x87 em toda expressao (docs/RETRADUCAO.md, "Ponto flutuante").
//
// O que o tipo reproduz, como o C++ nativo do V1 (clang do QB64, x87 com palavra de controle
// 0x37F: 64 bits de mantissa, arredondamento ao par):
// - + - * / e raiz corretamente arredondadas em 64 bits, conversoes de e para float/double e
//   comparacoes: Berkeley SoftFloat 3e com a especializacao 8086 (NaN padrao negativo, inteiro
//   indefinido 0x80...0 no estouro).
// - Leiaute de memoria do x87 (8 bytes de mantissa e 2 de sinal/expoente, 16 bytes ao todo):
//   o RT45X87.h le os bits pelo memcpy de 10 bytes e funciona sem mudanca.
// - Conversao para inteiro: truncamento (o cast do C++); qbr() da libqb arredonda ao par.
// - Funcoes da libm (sin, cos, tan, atan, exp, log): no nativo sao as instrucoes do x87 do
//   processador (FSIN, FPATAN, F2XM1, FYL2X...), que nao arredondam certo; aqui, o modelo do
//   Zen 2 (Ryzen 5 3600, a maquina do oraculo) em x87_zen2.cpp. Taxas: x87_zen2.md.
#pragma once

#include <stdint.h>
#include <string.h>
#include <type_traits>

// mesmas opcoes do build do SoftFloat (web/third_party/softfloat-3e/LEIAME.md)
#ifndef SOFTFLOAT_FAST_INT64
#    define SOFTFLOAT_FAST_INT64
#endif
#ifndef LITTLEENDIAN
#    define LITTLEENDIAN 1 // sem isso o softfloat_types.h inverte os campos do extFloat80_t
#endif
extern "C" {
#include "softfloat.h"
}

struct qb_f80 {
    uint64_t m;       // mantissa com o bit inteiro explicito
    uint16_t se;      // sinal (bit 15) e expoente com vies 16383
    uint16_t pad_[3]; // completa 16 bytes, como o long double do x86-64

    qb_f80() = default;

    // valor pelos bits (constantes geradas por f80iza.py)
    static constexpr qb_f80 bits(uint16_t se, uint64_t m) {
        qb_f80 r{};
        r.m = m;
        r.se = se;
        return r;
    }

    template <typename T, typename std::enable_if<std::is_arithmetic<T>::value, int>::type = 0> qb_f80(T v) { *this = de(v); }

    template <typename T, typename std::enable_if<std::is_arithmetic<T>::value, int>::type = 0> operator T() const { return para<T>(*this); }

    explicit operator bool() const { return !e_zero(); }

    // ---------------------------------------------------------------- ponte com o SoftFloat
    extFloat80_t sf() const {
        extFloat80_t r;
        r.signif = m;
        r.signExp = se;
        return r;
    }
    static qb_f80 de_sf(extFloat80_t v) {
        qb_f80 r{};
        r.m = v.signif;
        r.se = v.signExp;
        return r;
    }

    bool e_zero() const { return (se & 0x7FFF) == 0 && m == 0; }
    bool e_nan() const { return (se & 0x7FFF) == 0x7FFF && (m << 1) != 0; }

    template <typename T> static qb_f80 de(T v) {
        if constexpr (std::is_same<T, float>::value) {
            float32_t x;
            memcpy(&x.v, &v, 4);
            return de_sf(f32_to_extF80(x));
        } else if constexpr (std::is_same<T, double>::value) {
            float64_t x;
            memcpy(&x.v, &v, 8);
            return de_sf(f64_to_extF80(x));
        } else if constexpr (std::is_same<T, long double>::value) {
            return de_ld(v);
        } else if constexpr (std::is_same<T, bool>::value) {
            return de_sf(i32_to_extF80(v ? 1 : 0));
        } else if constexpr (std::is_signed<T>::value) {
            return de_sf(i64_to_extF80((int64_t)v));
        } else {
            return de_sf(ui64_to_extF80((uint64_t)v));
        }
    }

    // long double do compilador: quad em wasm, o proprio estendido no x86 (testes nativos)
    static qb_f80 de_ld(long double v) {
        if constexpr (sizeof(long double) == 16 && __LDBL_MANT_DIG__ == 113) {
            float128_t x;
            memcpy(&x, &v, 16);
            return de_sf(f128_to_extF80(x));
        } else if constexpr (__LDBL_MANT_DIG__ == 64) {
            qb_f80 r{};
            memcpy(&r, &v, 10);
            return r;
        } else {
            return de((double)v);
        }
    }
    static long double para_ld(qb_f80 a) {
        long double v;
        if constexpr (sizeof(long double) == 16 && __LDBL_MANT_DIG__ == 113) {
            float128_t x = extF80_to_f128(a.sf());
            memcpy(&v, &x, 16);
        } else if constexpr (__LDBL_MANT_DIG__ == 64) {
            memset(&v, 0, sizeof v);
            memcpy(&v, &a, 10);
        } else {
            v = (double)a;
        }
        return v;
    }

    template <typename T> static T para(qb_f80 a) {
        if constexpr (std::is_same<T, float>::value) {
            float32_t x = extF80_to_f32(a.sf());
            float r;
            memcpy(&r, &x.v, 4);
            return r;
        } else if constexpr (std::is_same<T, double>::value) {
            float64_t x = extF80_to_f64(a.sf());
            double r;
            memcpy(&r, &x.v, 8);
            return r;
        } else if constexpr (std::is_same<T, long double>::value) {
            return para_ld(a);
        } else if constexpr (std::is_same<T, bool>::value) {
            return !a.e_zero();
        } else if constexpr (std::is_signed<T>::value && sizeof(T) <= 2) {
            // cast do C++ (truncamento): o clang usa FISTP de 16 bits, que da 0x8000 fora da faixa
            int32_t v = extF80_to_i32(a.sf(), softfloat_round_minMag, false);
            if (v < -32768 || v > 32767)
                v = -32768;
            return (T)v;
        } else if constexpr (std::is_signed<T>::value && sizeof(T) <= 4) {
            // cast do C++ (truncamento); fora da faixa: inteiro indefinido do x87 (0x80000000)
            return (T)extF80_to_i32(a.sf(), softfloat_round_minMag, false);
        } else if constexpr (std::is_signed<T>::value) {
            return (T)extF80_to_i64(a.sf(), softfloat_round_minMag, false);
        } else if constexpr (sizeof(T) <= 4) {
            // o clang converte para int64 com sinal e corta (FISTTP de 64 bits)
            return (T)extF80_to_i64(a.sf(), softfloat_round_minMag, false);
        } else {
            // uint64: como o clang no x87 (subtrai 2^63 quando passa de INT64_MAX)
            if (extF80_lt_quiet(a.sf(), qb_f80::dois63().sf()))
                return (T)extF80_to_i64(a.sf(), softfloat_round_minMag, false);
            qb_f80 b = de_sf(extF80_sub(a.sf(), qb_f80::dois63().sf()));
            return (T)((uint64_t)extF80_to_i64(b.sf(), softfloat_round_minMag, false) ^ 0x8000000000000000ULL);
        }
    }

    static qb_f80 dois63() { return bits(0x403E, 0x8000000000000000ULL); }

    qb_f80 operator-() const {
        qb_f80 r = *this;
        r.se ^= 0x8000;
        return r;
    }
    qb_f80 operator+() const { return *this; }
    bool operator!() const { return e_zero(); }

    qb_f80 &operator+=(qb_f80 b);
    qb_f80 &operator-=(qb_f80 b);
    qb_f80 &operator*=(qb_f80 b);
    qb_f80 &operator/=(qb_f80 b);
    qb_f80 &operator++() { return *this += qb_f80(1); }
    qb_f80 &operator--() { return *this -= qb_f80(1); }
};

static_assert(sizeof(qb_f80) == 16, "qb_f80 precisa de 16 bytes");
static_assert(std::is_trivially_copyable<qb_f80>::value, "qb_f80 precisa ser copiavel por memcpy");
static_assert(std::is_trivially_default_constructible<qb_f80>::value, "qb_f80 entra em union");

// ------------------------------------------------------------------- aritmetica
static inline qb_f80 qb_f80_add(qb_f80 a, qb_f80 b) { return qb_f80::de_sf(extF80_add(a.sf(), b.sf())); }
static inline qb_f80 qb_f80_sub(qb_f80 a, qb_f80 b) { return qb_f80::de_sf(extF80_sub(a.sf(), b.sf())); }
static inline qb_f80 qb_f80_mul(qb_f80 a, qb_f80 b) { return qb_f80::de_sf(extF80_mul(a.sf(), b.sf())); }
static inline qb_f80 qb_f80_div(qb_f80 a, qb_f80 b) { return qb_f80::de_sf(extF80_div(a.sf(), b.sf())); }

inline qb_f80 &qb_f80::operator+=(qb_f80 b) { return *this = qb_f80_add(*this, b); }
inline qb_f80 &qb_f80::operator-=(qb_f80 b) { return *this = qb_f80_sub(*this, b); }
inline qb_f80 &qb_f80::operator*=(qb_f80 b) { return *this = qb_f80_mul(*this, b); }
inline qb_f80 &qb_f80::operator/=(qb_f80 b) { return *this = qb_f80_div(*this, b); }

// Operador entre qb_f80 e tipo aritmetico: o outro lado vira estendido (como long double op T no C++).
// Os templates ganham dos operadores nativos (casam exato; o nativo precisaria da conversao do qb_f80).
#define QB_F80_OP(op, fn)                                                                                                                                      \
    static inline qb_f80 operator op(qb_f80 a, qb_f80 b) { return fn(a, b); }                                                                                \
    template <typename T, typename std::enable_if<std::is_arithmetic<T>::value, int>::type = 0> static inline qb_f80 operator op(qb_f80 a, T b) {            \
        return fn(a, qb_f80(b));                                                                                                                               \
    }                                                                                                                                                          \
    template <typename T, typename std::enable_if<std::is_arithmetic<T>::value, int>::type = 0> static inline qb_f80 operator op(T a, qb_f80 b) {            \
        return fn(qb_f80(a), b);                                                                                                                               \
    }
QB_F80_OP(+, qb_f80_add)
QB_F80_OP(-, qb_f80_sub)
QB_F80_OP(*, qb_f80_mul)
QB_F80_OP(/, qb_f80_div)
#undef QB_F80_OP

// atribuicao composta em variavel float/double/inteira com lado estendido (a conta e em estendido)
template <typename T, typename std::enable_if<std::is_arithmetic<T>::value, int>::type = 0> static inline T &operator+=(T &a, qb_f80 b) {
    return a = (T)(qb_f80(a) + b);
}
template <typename T, typename std::enable_if<std::is_arithmetic<T>::value, int>::type = 0> static inline T &operator-=(T &a, qb_f80 b) {
    return a = (T)(qb_f80(a) - b);
}
template <typename T, typename std::enable_if<std::is_arithmetic<T>::value, int>::type = 0> static inline T &operator*=(T &a, qb_f80 b) {
    return a = (T)(qb_f80(a) * b);
}
template <typename T, typename std::enable_if<std::is_arithmetic<T>::value, int>::type = 0> static inline T &operator/=(T &a, qb_f80 b) {
    return a = (T)(qb_f80(a) / b);
}

// ------------------------------------------------------------------- comparacoes (NaN: nao ordenado)
static inline bool qb_f80_eq(qb_f80 a, qb_f80 b) { return extF80_eq(a.sf(), b.sf()); }
static inline bool qb_f80_lt(qb_f80 a, qb_f80 b) { return extF80_lt_quiet(a.sf(), b.sf()); }
static inline bool qb_f80_le(qb_f80 a, qb_f80 b) { return extF80_le_quiet(a.sf(), b.sf()); }

#define QB_F80_CMP(op, expr)                                                                                                                                   \
    static inline bool operator op(qb_f80 a, qb_f80 b) { return expr; }                                                                                       \
    template <typename T, typename std::enable_if<std::is_arithmetic<T>::value, int>::type = 0> static inline bool operator op(qb_f80 a, T bv) {              \
        qb_f80 b(bv);                                                                                                                                          \
        return expr;                                                                                                                                           \
    }                                                                                                                                                          \
    template <typename T, typename std::enable_if<std::is_arithmetic<T>::value, int>::type = 0> static inline bool operator op(T av, qb_f80 b) {              \
        qb_f80 a(av);                                                                                                                                          \
        return expr;                                                                                                                                           \
    }
QB_F80_CMP(==, qb_f80_eq(a, b))
QB_F80_CMP(!=, !qb_f80_eq(a, b))
QB_F80_CMP(<, qb_f80_lt(a, b))
QB_F80_CMP(<=, qb_f80_le(a, b))
QB_F80_CMP(>, qb_f80_lt(b, a))
QB_F80_CMP(>=, qb_f80_le(b, a))
#undef QB_F80_CMP

// ------------------------------------------------------------------- funcoes (qb_f80.cpp)
qb_f80 qb_f80_sqrt(qb_f80 x);                      // FSQRT
qb_f80 qb_f80_rint(qb_f80 x, uint_fast8_t modo);   // FRNDINT com o modo dado (softfloat_round_*)
qb_f80 qb_f80_sin(qb_f80 x);
qb_f80 qb_f80_cos(qb_f80 x);
qb_f80 qb_f80_tan(qb_f80 x);
qb_f80 qb_f80_atan(qb_f80 x);
qb_f80 qb_f80_atan2(qb_f80 y, qb_f80 x);
qb_f80 qb_f80_exp(qb_f80 x);
qb_f80 qb_f80_log(qb_f80 x);
qb_f80 qb_f80_pow(qb_f80 x, qb_f80 y);
qb_f80 qb_f80_fmod(qb_f80 x, qb_f80 y);

// decimal: valor corretamente arredondado ao par em 64 bits (o %Lf do __mingw_sscanf, VAL)
qb_f80 qb_f80_de_texto(const char *s, const char **fim = nullptr);
// "%.*Lg" / "%.*LG" do printf (o __mingw_snprintf do QB64 no Windows): devolve o comprimento
int qb_f80_formata_g(char *dst, int tam, qb_f80 v, int digitos, bool maiusculo);
// "% .*Lf" / "%.*Lf" (PRINT USING de _FLOAT: print_using_float): devolve o comprimento
int qb_f80_formata_f(char *dst, int tam, qb_f80 v, int decimais, bool espaco);

static inline qb_f80 qb_f80_fabs(qb_f80 x) {
    x.se &= 0x7FFF;
    return x;
}

// func_abs da libqb (qbmath.h) so aceita tipo aritmetico
static inline qb_f80 func_abs(qb_f80 v) { return qb_f80_fabs(v); }
static inline int32_t func_sgn(qb_f80 v) { return (qb_f80(0) < v) - (v < qb_f80(0)); } // SGN (PILAR)
// FIX de _FLOAT: os templates func_fix_float/func_fix_double da libqb so truncam quando
// std::is_floating_point<T>, que e falso para o qb_f80 (devolviam o valor sem truncar: VIGA x1)
static inline qb_f80 func_fix_float(qb_f80 v) { return v < qb_f80(0) ? qb_f80_rint(v, softfloat_round_max) : qb_f80_rint(v, softfloat_round_min); }
static inline qb_f80 func_fix_double(qb_f80 v) { return func_fix_float(v); }

namespace std {
static inline qb_f80 fabs(qb_f80 x) { return qb_f80_fabs(x); }
static inline qb_f80 abs(qb_f80 x) { return qb_f80_fabs(x); }
static inline qb_f80 sqrt(qb_f80 x) { return qb_f80_sqrt(x); }
static inline qb_f80 floor(qb_f80 x) { return qb_f80_rint(x, softfloat_round_min); }
static inline qb_f80 ceil(qb_f80 x) { return qb_f80_rint(x, softfloat_round_max); }
static inline qb_f80 trunc(qb_f80 x) { return qb_f80_rint(x, softfloat_round_minMag); }
static inline qb_f80 nearbyint(qb_f80 x) { return qb_f80_rint(x, softfloat_round_near_even); }
static inline qb_f80 rint(qb_f80 x) { return qb_f80_rint(x, softfloat_round_near_even); }
static inline qb_f80 round(qb_f80 x) { return qb_f80_rint(x, softfloat_round_near_maxMag); }
static inline qb_f80 sin(qb_f80 x) { return qb_f80_sin(x); }
static inline qb_f80 cos(qb_f80 x) { return qb_f80_cos(x); }
static inline qb_f80 tan(qb_f80 x) { return qb_f80_tan(x); }
static inline qb_f80 atan(qb_f80 x) { return qb_f80_atan(x); }
static inline qb_f80 atan2(qb_f80 y, qb_f80 x) { return qb_f80_atan2(y, x); }
static inline qb_f80 exp(qb_f80 x) { return qb_f80_exp(x); }
static inline qb_f80 log(qb_f80 x) { return qb_f80_log(x); }
static inline qb_f80 pow(qb_f80 x, qb_f80 y) { return qb_f80_pow(x, y); }
static inline qb_f80 fmod(qb_f80 x, qb_f80 y) { return qb_f80_fmod(x, y); }
static inline bool isnan(qb_f80 x) { return x.e_nan(); }
static inline bool isinf(qb_f80 x) { return (x.se & 0x7FFF) == 0x7FFF && (x.m << 1) == 0; }
static inline bool signbit(qb_f80 x) { return x.se >> 15; }
} // namespace std
