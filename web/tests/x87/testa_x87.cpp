// testa_x87.cpp - confere os modelos de x87_zen2.cpp contra o x87 desta maquina, bit a bit.
// Nativo (clang do QB64, x86_64):
//   C:/qb64pe/qb64pe/internal/c/c_compiler/bin/c++.exe -O2 -std=c++17 -static testa_x87.cpp -o testa_x87.exe
//   testa_x87.exe [n por distribuicao] [semente] [op...]
// Para cada operacao e distribuicao de entradas: casos e diferencas (RN; as instrucoes tambem em
// RD/RU/RZ), mais ate 3 exemplos. Sai com codigo 1 se houver diferenca.
#include "../../runtime/x87_zen2.cpp"
#include "hw.h"
#include <cmath>
#include <map>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <string>

static uint64_t est = 1;
static uint64_t rnd() {
    est ^= est << 13;
    est ^= est >> 7;
    est ^= est << 17;
    return est;
}
static double unif() { return (rnd() >> 11) * (1.0 / 9007199254740992.0); }
static x87e bits(uint16_t se, uint64_t m) { return x87e{m, se}; }

// distribuicoes
enum { D_FLOAT, D_DOUBLE, D_EXT, D_ENG, D_ZERO, D_UM, D_PI4, D_ESPECIAL, D_N };
static const char *nome_d[D_N] = {"float", "double", "estendido", "engenharia", "perto_de_0", "perto_de_1", "mult_pi/4", "especiais"};

// x na escala de uma faixa [lo, hi] em magnitude (expoente do estendido entre elo e ehi)
static x87e gera(int d, int elo, int ehi) {
    x87e v;
    int s = (int)(rnd() & 1);
    switch (d) {
    case D_FLOAT: {
        float f;
        uint32_t u = (uint32_t)rnd() & 0x007FFFFF;
        int e = elo + (int)(rnd() % (uint64_t)(ehi - elo + 1)); // expoente sem vies
        if (e < -126) e = -126;
        if (e > 127) e = 127;
        u |= (uint32_t)(e + 127) << 23;
        memcpy(&f, &u, 4);
        v = hw_x((ld)f);
        break;
    }
    case D_DOUBLE: {
        double f;
        uint64_t u = rnd() & 0x000FFFFFFFFFFFFFULL;
        int e = elo + (int)(rnd() % (uint64_t)(ehi - elo + 1));
        if (e < -1022) e = -1022;
        if (e > 1023) e = 1023;
        u |= (uint64_t)(e + 1023) << 52;
        memcpy(&f, &u, 8);
        v = hw_x((ld)f);
        break;
    }
    case D_EXT: {
        int e = elo + (int)(rnd() % (uint64_t)(ehi - elo + 1));
        v = bits((uint16_t)(e + 16383), rnd() | 0x8000000000000000ULL);
        break;
    }
    case D_ENG: { // poucos digitos decimais, como os dados de projeto (SINGLE)
        float f = (float)((double)(rnd() % 100000) / std::pow(10.0, (double)(rnd() % 6)));
        v = hw_x((ld)f);
        break;
    }
    case D_ZERO: {
        int e = -(int)(rnd() % 80) - 1;
        v = bits((uint16_t)(e + 16383), rnd() | 0x8000000000000000ULL);
        break;
    }
    case D_UM: { // 1 +- poucos ulps a 2^-10
        int e = -(int)(rnd() % 60) - 3;
        ld d1 = std::ldexp((ld)(rnd() >> 11), e - 53);
        v = hw_x(1.0L + (s ? -d1 : d1));
        s = 0;
        break;
    }
    case D_PI4: { // k * pi/4 + delta pequeno
        ld k = (ld)(int64_t)(rnd() % 4096);
        ld base = k * 0.785398163397448309615660845819875721L;
        int e = -(int)(rnd() % 66);
        ld d1 = std::ldexp((ld)(rnd() >> 11), e - 53);
        v = hw_x(base + ((rnd() & 1) ? d1 : -d1));
        break;
    }
    default: {
        switch (rnd() % 10) {
        case 0: v = bits(0, 0); break;
        case 1: v = bits(0, rnd() >> (1 + rnd() % 63)); break;                           // denormal
        case 2: v = bits(0x7FFF, 0x8000000000000000ULL); break;                           // inf
        case 3: v = bits(0x7FFF, 0xC000000000000000ULL | (rnd() >> 2)); break;            // qNaN
        case 4: v = bits(0x7FFF, 0x8000000000000000ULL | ((rnd() >> 2) | 1)); break;      // sNaN
        case 5: v = bits(0x7FFE, rnd() | 0x8000000000000000ULL); break;                   // enorme
        case 6: v = bits((uint16_t)(1 + rnd() % 3), rnd() | 0x8000000000000000ULL); break; // menor normal
        case 7: v = bits(0x3FFF, 0x8000000000000000ULL); break;                           // 1
        case 8: v = bits((uint16_t)(16383 + 62 + rnd() % 3), rnd() | 0x8000000000000000ULL); break; // perto de 2^63
        default: v = hw_x((ld)(int)(rnd() % 2001 - 1000)); break;
        }
    }
    }
    if (s) v.se ^= 0x8000;
    return v;
}

struct Conta {
    long n = 0, dif = 0;
    std::string ex;
};
static std::map<std::string, Conta> contas;
static bool igual(x87e a, x87e b) { return a.m == b.m && a.se == b.se; }
static void marca(const std::string &k, bool ok, const char *caso) {
    Conta &c = contas[k];
    c.n++;
    if (!ok && ++c.dif <= 3) c.ex += std::string("\n      ") + caso;
}
static void hx(char *b, x87e v) { sprintf(b, "%04x%016llx", v.se, (unsigned long long)v.m); }

// ---------------------------------------------------------------- operacoes
typedef x87e (*Um)(x87e, int);
struct OpUm {
    const char *nome;
    x87e (*hw)(x87e, int, uint16_t *);
    x87e (*mod)(x87e, int);
    int elo, ehi;   // faixa de expoentes das distribuicoes gerais
    bool todos_rc;  // instrucao: testa os 4 modos
};
static x87e m_fsin(x87e x, int rc) { return zen2_fsin(x, rc); }
static x87e m_fcos(x87e x, int rc) { return zen2_fcos(x, rc); }
static x87e m_fptan(x87e x, int rc) { return zen2_fptan(x, rc); }
static x87e m_f2xm1(x87e x, int rc) { return zen2_f2xm1(x, rc); }
static x87e m_sinl(x87e x, int) { return mingw_sinl(x); }
static x87e m_cosl(x87e x, int) { return mingw_cosl(x); }
static x87e m_tanl(x87e x, int) { return mingw_tanl(x); }
static x87e m_atanl(x87e x, int) { return mingw_atanl(x); }
static x87e m_expl(x87e x, int) { return mingw_expl(x); }
static x87e m_logl(x87e x, int) { return mingw_logl(x); }
static x87e h_sinl(x87e x, int, uint16_t *) { return hw_x(sinl(hw_ld(x))); }
static x87e h_cosl(x87e x, int, uint16_t *) { return hw_x(cosl(hw_ld(x))); }
static x87e h_tanl(x87e x, int, uint16_t *) { return hw_x(tanl(hw_ld(x))); }
static x87e h_atanl(x87e x, int, uint16_t *) { return hw_x(atanl(hw_ld(x))); }
static x87e h_expl(x87e x, int, uint16_t *) { return hw_x(expl(hw_ld(x))); }
static x87e h_logl(x87e x, int, uint16_t *) { return hw_x(logl(hw_ld(x))); }

static OpUm OPS[] = {
    {"fsin", hw_fsin, m_fsin, -40, 20, true},
    {"fcos", hw_fcos, m_fcos, -40, 20, true},
    {"fptan", hw_fptan, m_fptan, -40, 20, true},
    {"f2xm1", hw_f2xm1, m_f2xm1, -40, -1, true},
    {"sinl", h_sinl, m_sinl, -40, 20, false},
    {"cosl", h_cosl, m_cosl, -40, 20, false},
    {"tanl", h_tanl, m_tanl, -40, 20, false},
    {"atanl", h_atanl, m_atanl, -60, 60, false},
    {"expl", h_expl, m_expl, -40, 13, false},
    {"logl", h_logl, m_logl, -200, 200, false},
};

// dois operandos: st1 = b (y), st0 = a (x)
struct OpDois {
    const char *nome;
    x87e (*hw)(x87e, x87e, int, uint16_t *);
    x87e (*mod)(x87e, x87e, int);
    int elo, ehi;
    bool todos_rc;
};
static x87e m_fpatan(x87e y, x87e x, int rc) { return zen2_fpatan(y, x, rc); }
static x87e m_fyl2x(x87e y, x87e x, int rc) { return zen2_fyl2x(y, x, rc); }
static x87e m_fyl2xp1(x87e y, x87e x, int rc) { return zen2_fyl2xp1(y, x, rc); }
static x87e m_atan2l(x87e y, x87e x, int) { return mingw_atan2l(y, x); }
static x87e h_atan2l(x87e y, x87e x, int, uint16_t *) { return hw_x(atan2l(hw_ld(y), hw_ld(x))); }
static OpDois OPS2[] = {
    {"fpatan", hw_fpatan, m_fpatan, -60, 60, true},
    {"fyl2x", hw_fyl2x, m_fyl2x, -200, 200, true},
    {"fyl2xp1", hw_fyl2xp1, m_fyl2xp1, -60, -2, true},
    {"atan2l", h_atan2l, m_atan2l, -60, 60, false},
};

static bool quer(int argc, char **argv, const char *nome) {
    if (argc <= 3) return true;
    for (int i = 3; i < argc; i++)
        if (!strcmp(argv[i], nome)) return true;
    return false;
}

int main(int argc, char **argv) {
    long n = argc > 1 ? atol(argv[1]) : 20000;
    est = (argc > 2 ? strtoull(argv[2], 0, 10) : 1) * 2654435761ULL + 12345;
    char caso[256], a1[32], a2[32], a3[32], a4[32];
    for (auto &op : OPS) {
        if (!quer(argc, argv, op.nome)) continue;
        for (int d = 0; d < D_N; d++) {
            for (long i = 0; i < n; i++) {
                x87e x = gera(d, op.elo, op.ehi);
                if (!strcmp(op.nome, "f2xm1") && (ex_de(x) >= 16383 && !(ex_de(x) == 16383 && x.m == 0x8000000000000000ULL)) && !e_nan(x) && !e_inf(x))
                    x.se = (uint16_t)((x.se & 0x8000) | 16382); // |x| <= 1
                if (!strcmp(op.nome, "logl") && d != D_ESPECIAL) x.se &= 0x7FFF;
                if (!strcmp(op.nome, "expl") && d != D_ESPECIAL && ex_de(x) > 16383 + 13) x.se = (uint16_t)((x.se & 0x8000) | (16383 + 13));
                int nrc = op.todos_rc ? 4 : 1;
                for (int rc = 0; rc < nrc; rc++) {
                    int r = op.todos_rc ? rc : 0;
                    x87e h = op.hw(x, r, nullptr), m = op.mod(x, r);
                    hx(a1, x), hx(a2, h), hx(a3, m);
                    sprintf(caso, "x=%s rc=%d hw=%s modelo=%s", a1, r, a2, a3);
                    marca(std::string(op.nome) + (r ? "/rc" + std::to_string(r) : "") + " " + nome_d[d], igual(h, m), caso);
                }
            }
        }
    }
    for (auto &op : OPS2) {
        if (!quer(argc, argv, op.nome)) continue;
        for (int d = 0; d < D_N; d++) {
            for (long i = 0; i < n; i++) {
                x87e x = gera(d, op.elo, op.ehi), y;
                if (!strcmp(op.nome, "fyl2x") || !strcmp(op.nome, "fyl2xp1")) {
                    // y como no logl (ln 2), ou qualquer
                    y = (rnd() & 1) ? x87e{0xB17217F7D1CF79ACULL, 0x3FFE} : gera(rnd() % 4 == 0 ? D_ESPECIAL : D_EXT, -20, 20);
                    if (!strcmp(op.nome, "fyl2x") && d != D_ESPECIAL) x.se &= 0x7FFF;
                    if (!strcmp(op.nome, "fyl2xp1") && d != D_ESPECIAL && ex_de(x) > 16383 - 2) x.se = (uint16_t)((x.se & 0x8000) | (16383 - 3));
                } else
                    y = gera(rnd() % 8 == 0 ? D_ESPECIAL : d, op.elo, op.ehi);
                int nrc = op.todos_rc ? 4 : 1;
                for (int rc = 0; rc < nrc; rc++) {
                    x87e h = op.hw(y, x, rc, nullptr), m = op.mod(y, x, rc);
                    hx(a1, y), hx(a2, x), hx(a3, h), hx(a4, m);
                    sprintf(caso, "y=%s x=%s rc=%d hw=%s modelo=%s", a1, a2, rc, a3, a4);
                    marca(std::string(op.nome) + (rc ? "/rc" + std::to_string(rc) : "") + " " + nome_d[d], igual(h, m), caso);
                }
            }
        }
    }
    long tot = 0, dif = 0;
    for (auto &kv : contas) {
        printf("%-28s %8ld casos %8ld iguais %6ld dif (%.4f%%)%s\n", kv.first.c_str(), kv.second.n, kv.second.n - kv.second.dif, kv.second.dif,
               100.0 * (kv.second.n - kv.second.dif) / kv.second.n, kv.second.ex.c_str());
        tot += kv.second.n;
        dif += kv.second.dif;
    }
    // resumo por operacao (todas as distribuicoes)
    std::map<std::string, Conta> res;
    for (auto &kv : contas) {
        std::string op = kv.first.substr(0, kv.first.find(' '));
        res[op].n += kv.second.n;
        res[op].dif += kv.second.dif;
    }
    printf("\nresumo por operacao:\n");
    for (auto &kv : res)
        printf("  %-12s %8ld casos %6ld dif  %.4f%% iguais\n", kv.first.c_str(), kv.second.n, kv.second.dif, 100.0 * (kv.second.n - kv.second.dif) / kv.second.n);
    printf("total %ld casos, %ld diferentes\n", tot, dif);
    return dif != 0;
}
