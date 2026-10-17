// testa_vetores.cpp - confere o qb_f80 (wasm) contra os vetores do x87 nativo (gera_vetores.cpp).
// Compila com em++ (web/tests/f80/roda.sh) e roda no Node com acesso ao disco (NODERAWFS):
//   node testa_vetores.js <vetores.txt>
// Sai uma linha por operacao: casos, iguais, diferentes e ate 3 exemplos de diferenca.
#include "qb_f80.h"

#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <map>
#include <string>

struct Conta {
    long n = 0, dif = 0;
    std::string ex;
};
static std::map<std::string, Conta> contas;

static qb_f80 lex(const char *&p) {
    while (*p == ' ')
        p++;
    char t[5] = {0};
    memcpy(t, p, 4);
    uint16_t se = (uint16_t)strtoul(t, 0, 16);
    char u[17] = {0};
    memcpy(u, p + 4, 16);
    uint64_t m = strtoull(u, 0, 16);
    p += 20;
    return qb_f80::bits(se, m);
}
static uint64_t lhex(const char *&p) {
    while (*p == ' ')
        p++;
    char *e;
    uint64_t v = strtoull(p, &e, 16);
    p = e;
    return v;
}
static std::string ltxt(const char *&p) {
    while (*p == ' ')
        p++;
    std::string s;
    if (*p == '"') {
        p++;
        while (*p && *p != '"')
            s.push_back(*p++);
        if (*p)
            p++;
    }
    return s;
}
static std::string hx(qb_f80 v) {
    char b[32];
    snprintf(b, sizeof b, "%04x%016llx", v.se, (unsigned long long)v.m);
    return b;
}
// mesmos bits, ou os dois NaN (o x87 nao garante o sinal/carga do NaN entre implementacoes: conta a parte)
static bool igual(qb_f80 a, qb_f80 b) { return a.se == b.se && a.m == b.m; }

static void marca(const std::string &op, bool ok, const std::string &caso) {
    Conta &c = contas[op];
    c.n++;
    if (!ok) {
        c.dif++;
        if (c.dif <= 3)
            c.ex += "\n    " + caso;
    }
}

int main(int argc, char **argv) {
    if (argc < 2) {
        fprintf(stderr, "uso: testa_vetores <vetores.txt>\n");
        return 2;
    }
    FILE *f = fopen(argv[1], "r");
    if (!f) {
        fprintf(stderr, "nao abriu %s\n", argv[1]);
        return 2;
    }
    static char linha[8192];
    while (fgets(linha, sizeof linha, f)) {
        char op[16];
        int k = 0;
        while (linha[k] && linha[k] != ' ' && k < 15) {
            op[k] = linha[k];
            k++;
        }
        op[k] = 0;
        const char *p = linha + k;
        std::string o = op, caso = linha;
        if (!caso.empty() && caso.back() == '\n')
            caso.pop_back();
        if (o == "add" || o == "sub" || o == "mul" || o == "div") {
            qb_f80 a = lex(p), b = lex(p), r = lex(p), v;
            if (o == "add") v = a + b;
            if (o == "sub") v = a - b;
            if (o == "mul") v = a * b;
            if (o == "div") v = a / b;
            marca(o, igual(v, r), caso + " -> " + hx(v));
        } else if (o == "cmp") {
            qb_f80 a = lex(p), b = lex(p);
            while (*p == ' ') p++;
            char t[8];
            snprintf(t, sizeof t, "%d%d%d%d", a < b, a <= b, a == b, a != b);
            marca(o, strncmp(t, p, 4) == 0, caso + " -> " + t);
        } else if (o == "sqrt" || o == "floor" || o == "sin" || o == "fsin" || o == "cos" || o == "tan" || o == "atan" || o == "exp" || o == "log") {
            qb_f80 a = lex(p);
            lex(p);
            qb_f80 r = lex(p), v;
            if (o == "sqrt") v = std::sqrt(a);
            if (o == "floor") v = std::floor(a);
            if (o == "sin" || o == "fsin") v = std::sin(a);
            if (o == "cos") v = std::cos(a);
            if (o == "tan") v = std::tan(a);
            if (o == "atan") v = std::atan(a);
            if (o == "exp") v = std::exp(a);
            if (o == "log") v = std::log(a);
            bool ok = igual(v, r);
            if (!ok && v.e_nan() && r.e_nan()) {
                marca(o + "(nan)", false, caso + " -> " + hx(v));
                continue;
            }
            // distancia em unidades da ultima casa, para as funcoes aproximadas
            std::string d;
            if (!ok && (v.se & 0x7FFF) == (r.se & 0x7FFF)) {
                long long u = (long long)(v.m - r.m);
                d = " (" + std::to_string(u) + " ulp)";
            }
            marca(o, ok, caso + " -> " + hx(v) + d);
        } else if (o == "tof32") {
            qb_f80 a = lex(p);
            uint32_t r = (uint32_t)lhex(p), u;
            float x = a;
            memcpy(&u, &x, 4);
            marca(o, u == r, caso);
        } else if (o == "tof64") {
            qb_f80 a = lex(p);
            uint64_t r = lhex(p), u;
            double x = a;
            memcpy(&u, &x, 8);
            marca(o, u == r, caso);
        } else if (o == "toi32") {
            qb_f80 a = lex(p);
            marca(o, (uint32_t)(int32_t)a == (uint32_t)lhex(p), caso);
        } else if (o == "toi16") {
            qb_f80 a = lex(p);
            uint16_t v = (uint16_t)(int16_t)a;
            char b[16];
            snprintf(b, sizeof b, "%04x", v);
            marca(o, v == (uint16_t)lhex(p), caso + " -> " + b);
        } else if (o == "toi64") {
            qb_f80 a = lex(p);
            marca(o, (uint64_t)(int64_t)a == lhex(p), caso);
        } else if (o == "tou64") {
            qb_f80 a = lex(p);
            marca(o, (uint64_t)a == lhex(p), caso);
        } else if (o == "tou32") {
            qb_f80 a = lex(p);
            marca(o, (uint32_t)a == (uint32_t)lhex(p), caso);
        } else if (o == "qbr") {
            qb_f80 a = lex(p);
            int64_t v = extF80_to_i64(a.sf(), softfloat_round_near_even, false);
            marca(o, (uint64_t)v == lhex(p), caso);
        } else if (o == "dec") {
            std::string t = ltxt(p);
            qb_f80 r = lex(p), v = qb_f80_de_texto(t.c_str());
            marca(o, igual(v, r), caso + " -> " + hx(v));
        } else if (o == "fmtf") {
            int dg = (int)strtol(p, (char **)&p, 10);
            qb_f80 a = lex(p);
            std::string t = ltxt(p);
            static char b[2048];
            qb_f80_formata_f(b, sizeof b, a, dg, true);
            marca(o, t == b, caso.substr(0, 60) + " -> \"" + std::string(b).substr(0, 60) + "\"");
        } else if (o == "fmtg") {
            int dg = (int)strtol(p, (char **)&p, 10);
            qb_f80 a = lex(p);
            std::string t = ltxt(p);
            char b[128];
            qb_f80_formata_g(b, sizeof b, a, dg, true);
            marca(o, t == b, caso + " -> \"" + b + "\"");
        }
    }
    long tot = 0, dif = 0;
    for (auto &kv : contas) {
        printf("%-10s %8ld casos %8ld iguais %6ld diferentes%s\n", kv.first.c_str(), kv.second.n, kv.second.n - kv.second.dif, kv.second.dif, kv.second.ex.c_str());
        tot += kv.second.n;
        dif += kv.second.dif;
    }
    printf("total %ld casos, %ld diferentes\n", tot, dif);
    return 0;
}
