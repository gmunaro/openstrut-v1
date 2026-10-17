// qb_f80.cpp - funcoes do qb_f80 (qb_f80.h): raiz, arredondamento, libm e conversao decimal.
//
// Compilado so para wasm (o long double do compilador e o quad do IEEE, 113 bits).
// - SIN, COS, TAN, ATN, _ATAN2, EXP e LOG: as funcoes da libm do mingw que o V1 nativo usa
//   (sinl, cosl, tanl, atanl, atan2l, expl, logl), com as instrucoes do x87 do Zen 2 modeladas em
//   x87_zen2.cpp; taxas de igualdade com o hardware em x87_zen2.md e web/README.md.
// - pow (so o _POW/powl direto; o ^ da V1 passa pelo RT45X87.h) e fmod: em quad, arredondados
//   para 64 bits.
// - Decimal <-> estendido: exatos (inteiros grandes), arredondados ao par.
#include "qb_f80.h"

#include <algorithm>
#include <cmath>
#include <string>
#include <stdlib.h>
#include <vector>

extern "C" {
#include "platform.h"
#include "internals.h"
}

static_assert(__LDBL_MANT_DIG__ == 113, "qb_f80.cpp supoe long double quad (wasm)");

typedef long double q128;

static q128 q(qb_f80 x) { return qb_f80::para_ld(x); }
static qb_f80 f(q128 x) { return qb_f80::de_ld(x); }

qb_f80 qb_f80_sqrt(qb_f80 x) { return qb_f80::de_sf(extF80_sqrt(x.sf())); }

qb_f80 qb_f80_rint(qb_f80 x, uint_fast8_t modo) { return qb_f80::de_sf(extF80_roundToInt(x.sf(), modo, false)); }

qb_f80 qb_f80_fmod(qb_f80 x, qb_f80 y) { return f(fmodl(q(x), q(y))); } // exato nos dois formatos

// atan e atan2 da musl em quad sao implementacoes completas (FreeBSD, ld128)
qb_f80 qb_f80_atan(qb_f80 x) {
    void x87z_f(int, const void *, void *); // x87_zen2.cpp: atanl do mingw (FPATAN do Zen 2)
    qb_f80 r{};
    x87z_f(3, &x, &r);
    return r;
}
qb_f80 qb_f80_atan2(qb_f80 y, qb_f80 x) {
    void x87z_atan2(const void *, const void *, void *); // x87_zen2.cpp: atan2l do mingw
    qb_f80 r{};
    x87z_atan2(&y, &x, &r);
    return r;
}

// expl, logl e powl da musl em quad sao so a versao double ("TODO: broken implementation"):
// aqui, em quad.
// ln 2 = LN2_HI + LN2_LO: LN2_HI e o quad mais proximo (exato abaixo), LN2_LO o resto
static const q128 LN2_HI = 0.6931471805599453094172321214581765750836396089098404175333420182650192957474200028400446171872317790985107421875L;
static const q128 LN2_LO = -7.008139474549585163412662008771625673777725287234181290190813091556509261166929314266E-36L;

static q128 exp_q(q128 x) {
    if (std::isnan(x))
        return x;
    if (x > 11357.3L)
        return HUGE_VALL;
    if (x < -11400.0L)
        return 0.0L;
    q128 kq = nearbyintl(x / LN2_HI);
    long k = (long)kq;
    q128 r = (x - kq * LN2_HI) - kq * LN2_LO; // |r| <= ln2/2
    // e^r = 1 + r + r^2/2! + ... ; reduz mais: e^r = (e^(r/256))^256
    r = ldexpl(r, -8);
    q128 t = r, s = r;
    for (int n = 2; n < 40; n++) {
        t = t * r / n;
        s += t;
        if (fabsl(t) < 1e-40L)
            break;
    }
    // s = e^(r/256) - 1; (1+s)^256 - 1 por quadrados sem perder o pequeno: u -> 2u + u^2
    for (int i = 0; i < 8; i++)
        s = 2 * s + s * s;
    return ldexpl(1.0L + s, (int)k);
}

static q128 log_q(q128 x) {
    if (std::isnan(x) || x < 0)
        return nanl("");
    if (x == 0)
        return -HUGE_VALL;
    if (std::isinf(x))
        return x;
    int k;
    q128 m = frexpl(x, &k); // x = m * 2^k, m em [0.5, 1)
    if (m < 0.70710678118654752440084436210484903928L) {
        m *= 2;
        k--;
    }
    // log m = 2 atanh(s), s = (m - 1) / (m + 1), |s| <= 0.1716
    q128 s = (m - 1) / (m + 1), z = s * s, t = s, soma = s;
    for (int n = 3; n < 120; n += 2) {
        t *= z;
        q128 termo = t / n;
        soma += termo;
        if (fabsl(termo) < 1e-40L)
            break;
    }
    return (q128)k * LN2_HI + ((q128)k * LN2_LO + 2 * soma);
}

qb_f80 qb_f80_exp(qb_f80 x) {
    void x87z_f(int, const void *, void *); // x87_zen2.cpp: expl do mingw (F2XM1, FSCALE...)
    qb_f80 r{};
    x87z_f(4, &x, &r);
    return r;
}
qb_f80 qb_f80_log(qb_f80 x) {
    void x87z_f(int, const void *, void *); // x87_zen2.cpp: logl do mingw (FYL2X/FYL2XP1 do Zen 2)
    qb_f80 r{};
    x87z_f(5, &x, &r);
    return r;
}

qb_f80 qb_f80_pow(qb_f80 x, qb_f80 y) {
    q128 a = q(x), b = q(y);
    if (b == 0)
        return qb_f80(1);
    if (a == 0)
        return b > 0 ? qb_f80(0) : qb_f80((double)HUGE_VAL);
    if (a < 0) {
        if (nearbyintl(b) != b)
            return f(nanl(""));
        q128 r = exp_q(b * log_q(-a));
        return f(fmodl(b, 2) != 0 ? -r : r);
    }
    return f(exp_q(b * log_q(a)));
}

// ------------------------------------------------------------------- inteiros grandes (decimal)
namespace {
struct Grande {
    std::vector<uint32_t> w; // palavras de 32 bits, menos significativa primeiro

    bool zero() const { return w.empty(); }
    void normaliza() {
        while (!w.empty() && w.back() == 0)
            w.pop_back();
    }
    void mul_peq(uint32_t k) {
        uint64_t c = 0;
        for (auto &x : w) {
            uint64_t p = (uint64_t)x * k + c;
            x = (uint32_t)p;
            c = p >> 32;
        }
        if (c)
            w.push_back((uint32_t)c);
    }
    void soma_peq(uint32_t k) {
        uint64_t c = k;
        for (size_t i = 0; i < w.size() && c; i++) {
            uint64_t s = (uint64_t)w[i] + c;
            w[i] = (uint32_t)s;
            c = s >> 32;
        }
        if (c)
            w.push_back((uint32_t)c);
    }
    uint32_t div_peq(uint32_t k) { // devolve o resto
        uint64_t r = 0;
        for (size_t i = w.size(); i-- > 0;) {
            uint64_t v = (r << 32) | w[i];
            w[i] = (uint32_t)(v / k);
            r = v % k;
        }
        normaliza();
        return (uint32_t)r;
    }
    void pot(uint32_t base, int n) { // multiplica por base^n
        while (n > 0) {
            uint32_t p = base;
            int k = 1;
            while (k < n && (uint64_t)p * base < 0xFFFFFFFFULL) {
                p *= base;
                k++;
            }
            mul_peq(p);
            n -= k;
        }
    }
    int bits() const {
        if (w.empty())
            return 0;
        return (int)(w.size() - 1) * 32 + (32 - __builtin_clz(w.back()));
    }
    int bit(int i) const {
        if (i < 0 || i / 32 >= (int)w.size())
            return 0;
        return (w[i / 32] >> (i % 32)) & 1;
    }
    bool algum_abaixo(int k) const { // algum bit em 0..k-1
        for (int i = 0; i < (int)w.size() && k > 0; i++, k -= 32) {
            uint32_t m = k >= 32 ? 0xFFFFFFFFu : ((1u << k) - 1);
            if (w[i] & m)
                return true;
        }
        return false;
    }
    void shl(int n) {
        if (w.empty() || n <= 0)
            return;
        int q = n / 32, b = n % 32;
        std::vector<uint32_t> r(w.size() + q + 1, 0);
        for (size_t i = 0; i < w.size(); i++) {
            r[i + q] |= w[i] << b;
            if (b)
                r[i + q + 1] |= w[i] >> (32 - b);
        }
        w.swap(r);
        normaliza();
    }
    // bits [i, i+64) como inteiro (i pode ser negativo: zeros abaixo)
    uint64_t pega64(int i) const {
        uint64_t r = 0;
        for (int k = 0; k < 64; k++)
            r |= (uint64_t)bit(i + k) << k;
        return r;
    }
    static int compara(const Grande &a, const Grande &b) {
        if (a.w.size() != b.w.size())
            return a.w.size() < b.w.size() ? -1 : 1;
        for (size_t i = a.w.size(); i-- > 0;)
            if (a.w[i] != b.w[i])
                return a.w[i] < b.w[i] ? -1 : 1;
        return 0;
    }
    void sub(const Grande &b) { // *this >= b
        int64_t emp = 0;
        for (size_t i = 0; i < w.size(); i++) {
            int64_t v = (int64_t)w[i] - (i < b.w.size() ? b.w[i] : 0) - emp;
            emp = v < 0;
            w[i] = (uint32_t)(v + (emp ? 0x100000000LL : 0));
        }
        normaliza();
    }
};
} // namespace

// a * 2^e2 / b (a, b > 0) arredondado para o estendido com sinal s
static qb_f80 empacota(bool s, Grande a, const Grande &b, int e2) {
    // q = floor(a * 2^sh / b) com 2^66 <= q < 2^68
    int sh = 67 - (a.bits() - b.bits());
    if (sh > 0)
        a.shl(sh);
    Grande bb = b;
    if (sh < 0)
        bb.shl(-sh);
    // divisao longa bit a bit: quociente de ate 69 bits
    Grande r;
    unsigned __int128 qq = 0;
    for (int i = a.bits() - 1; i >= 0; i--) {
        r.shl(1);
        if (r.zero() && a.bit(i))
            r.w.push_back(1);
        else if (a.bit(i))
            r.w[0] |= 1;
        qq <<= 1;
        if (Grande::compara(r, bb) >= 0) {
            r.sub(bb);
            qq |= 1;
        }
    }
    bool sobra = !r.zero();
    int nb = 0;
    for (unsigned __int128 t = qq; t; t >>= 1)
        nb++;
    // valor = qq * 2^(e2 - sh) + sobra; mantissa = 64 bits mais altos de qq
    int corte = nb - 64;
    uint64_t sig = (uint64_t)(qq >> corte);
    uint64_t extra = corte > 0 ? (uint64_t)(qq << (128 - corte) >> 64) : 0;
    if (corte > 64 || sobra)
        extra |= 1;
    // expoente: o bit mais alto de qq vale 2^(nb - 1 + e2 - sh)
    long ex = (long)nb - 1 + e2 - sh + 16383;
    if (ex > 0x7FFF + 64)
        ex = 0x7FFF + 64;
    if (ex < -200)
        ex = -200;
    return qb_f80::de_sf(softfloat_roundPackToExtF80(s, (int_fast32_t)ex, sig, extra, 80));
}

qb_f80 qb_f80_de_texto(const char *s, const char **fim) {
    const char *p = s;
    while (*p == ' ' || *p == '\t')
        p++;
    bool neg = false;
    if (*p == '+' || *p == '-')
        neg = *p++ == '-';
    Grande n;
    int e10 = 0, digs = 0;
    bool algum = false, ponto = false;
    for (;; p++) {
        if (*p >= '0' && *p <= '9') {
            algum = true;
            if (n.zero() && *p == '0') {
                if (ponto)
                    e10--;
                continue;
            }
            if (digs < 800) { // mais que isso nao muda o arredondamento a 64 bits
                n.mul_peq(10);
                n.soma_peq((uint32_t)(*p - '0'));
                digs++;
                if (ponto)
                    e10--;
            } else if (!ponto)
                e10++;
        } else if (*p == '.' && !ponto)
            ponto = true;
        else
            break;
    }
    if (algum && (*p == 'e' || *p == 'E' || *p == 'd' || *p == 'D')) {
        const char *q0 = p++;
        bool en = false;
        if (*p == '+' || *p == '-')
            en = *p++ == '-';
        if (*p >= '0' && *p <= '9') {
            long ev = 0;
            while (*p >= '0' && *p <= '9') {
                if (ev < 100000)
                    ev = ev * 10 + (*p - '0');
                p++;
            }
            e10 += en ? -(int)ev : (int)ev;
        } else
            p = q0;
    }
    if (fim)
        *fim = algum ? p : s;
    qb_f80 r;
    if (n.zero()) {
        r = qb_f80(0);
        return neg ? -r : r;
    }
    int mag = e10 + digs; // valor < 10^mag
    if (mag > 4933 + 1) {
        r = qb_f80::bits(0x7FFF, 0x8000000000000000ULL);
        return neg ? -r : r;
    }
    if (mag < -4951 - 1) {
        r = qb_f80(0);
        return neg ? -r : r;
    }
    Grande um;
    um.w.push_back(1);
    if (e10 >= 0) {
        n.pot(10, e10);
        return empacota(neg, n, um, 0);
    }
    // n / 10^-e10 = n / (5^-e10 * 2^-e10)
    Grande d = um;
    d.pot(5, -e10);
    return empacota(neg, n, d, e10);
}

// ------------------------------------------------------------------- %.*Lg
int qb_f80_formata_g(char *dst, int tam, qb_f80 v, int digitos, bool maiusculo) {
    std::string o;
    bool neg = v.se >> 15;
    int ex = v.se & 0x7FFF;
    if (digitos < 0)
        digitos = 6;
    if (digitos == 0)
        digitos = 1;
    if (ex == 0x7FFF) {
        if ((v.m << 1) == 0)
            o = neg ? "-inf" : "inf";
        else
            o = "nan"; // o __mingw_snprintf nao poe o sinal do NaN
        if (maiusculo)
            for (auto &c : o)
                c = (char)toupper(c);
    } else {
        // valor = m * 2^(ex - 16383 - 63) (denormal: expoente 1 - 16383 - 63)
        int e2 = (ex ? ex : 1) - 16383 - 63;
        Grande n;
        n.w.push_back((uint32_t)v.m);
        n.w.push_back((uint32_t)(v.m >> 32));
        n.normaliza();
        std::string d; // digitos de n, valor = d * 10^e10
        int e10 = 0;
        if (n.zero())
            d = "0";
        else {
            if (e2 >= 0)
                n.shl(e2);
            else {
                n.pot(5, -e2);
                e10 = e2;
            }
            while (!n.zero())
                d.push_back((char)('0' + n.div_peq(10)));
            std::reverse(d.begin(), d.end());
        }
        // expoente decimal do primeiro digito
        int X = (int)d.size() - 1 + e10;
        // arredonda para P digitos significativos, ao par
        int P = digitos;
        auto arredonda = [&](std::string dd, int P, int &X) {
            if ((int)dd.size() > P) {
                bool sobe;
                char c = dd[P];
                bool resto = false;
                for (size_t i = P + 1; i < dd.size(); i++)
                    if (dd[i] != '0') {
                        resto = true;
                        break;
                    }
                if (c > '5' || (c == '5' && resto))
                    sobe = true;
                else if (c == '5')
                    sobe = ((dd[P - 1] - '0') & 1);
                else
                    sobe = false;
                dd.resize(P);
                if (sobe) {
                    int i = P - 1;
                    while (i >= 0 && dd[i] == '9')
                        dd[i--] = '0';
                    if (i < 0) {
                        dd.insert(dd.begin(), '1');
                        dd.resize(P);
                        X++;
                    } else
                        dd[i]++;
                }
            }
            while ((int)dd.size() < P)
                dd.push_back('0');
            return dd;
        };
        std::string r;
        if (d == "0") {
            r = std::string(P, '0');
            X = 0;
        } else
            r = arredonda(d, P, X);
        // %g: notacao com expoente se X < -4 ou X >= P; tira zeros a direita
        std::string corpo;
        if (X < -4 || X >= P) {
            corpo = r.substr(0, 1);
            std::string frac = r.substr(1);
            while (!frac.empty() && frac.back() == '0')
                frac.pop_back();
            if (!frac.empty())
                corpo += "." + frac;
            char buf[16];
            snprintf(buf, sizeof buf, "%c%c%02d", maiusculo ? 'E' : 'e', X < 0 ? '-' : '+', X < 0 ? -X : X);
            corpo += buf;
        } else {
            std::string inteiro, frac;
            if (X >= 0) {
                inteiro = r.substr(0, X + 1);
                frac = r.substr(X + 1);
            } else {
                inteiro = "0";
                frac = std::string(-X - 1, '0') + r;
            }
            while (!frac.empty() && frac.back() == '0')
                frac.pop_back();
            corpo = inteiro + (frac.empty() ? "" : "." + frac);
        }
        o = (neg ? "-" : "") + corpo;
    }
    int len = (int)o.size();
    if (tam > 0) {
        int k = len < tam - 1 ? len : tam - 1;
        memcpy(dst, o.data(), k);
        dst[k] = 0;
    }
    return len;
}

// ------------------------------------------------------------------- FSIN, FCOS, FPTAN
// sinl/cosl/tanl do mingw no V1 nativo: as instrucoes do x87 (FSIN, FCOS, FPTAN) do Zen 2,
// modeladas em x87_zen2.cpp (x87_zen2.md: algoritmo e taxas).
qb_f80 qb_f80_sin(qb_f80 x) {
    void x87z_f(int, const void *, void *); // x87_zen2.cpp: sinl do mingw (FSIN do Zen 2)
    qb_f80 r{};
    x87z_f(0, &x, &r);
    return r;
}
qb_f80 qb_f80_cos(qb_f80 x) {
    void x87z_f(int, const void *, void *); // x87_zen2.cpp: cosl do mingw (FCOS do Zen 2)
    qb_f80 r{};
    x87z_f(1, &x, &r);
    return r;
}
qb_f80 qb_f80_tan(qb_f80 x) {
    void x87z_f(int, const void *, void *); // x87_zen2.cpp: tanl do mingw (FPTAN do Zen 2)
    qb_f80 r{};
    x87z_f(2, &x, &r);
    return r;
}

// ------------------------------------------------------------------- "% .*Lf"
// Expansao decimal exata, arredondada ao par na casa "decimais" (o printf do mingw e da musl).
// espaco: flag ' ' (positivo comeca com espaco). Devolve o comprimento.
int qb_f80_formata_f(char *dst, int tam, qb_f80 v, int decimais, bool espaco) {
    std::string o;
    bool neg = v.se >> 15;
    int ex = v.se & 0x7FFF;
    if (ex == 0x7FFF) {
        o = (v.m << 1) == 0 ? (neg ? "-inf" : (espaco ? " inf" : "inf")) : (espaco ? " nan" : "nan");
    } else {
        int e2 = (ex ? ex : 1) - 16383 - 63;
        Grande n;
        n.w.push_back((uint32_t)v.m);
        n.w.push_back((uint32_t)(v.m >> 32));
        n.normaliza();
        int e10 = 0;
        if (!n.zero()) {
            if (e2 >= 0)
                n.shl(e2);
            else {
                n.pot(5, -e2);
                e10 = e2;
            }
        }
        // R = valor * 10^decimais, ao par
        int k = -(e10 + decimais); // digitos a cortar do fim de n
        std::string d;
        Grande q = n;
        if (k <= 0) {
            q.pot(10, -k);
        } else {
            // corta k digitos: q = n / 10^k, resto comparado com a metade
            Grande dez = Grande();
            dez.w.push_back(1);
            dez.pot(10, k);
            // divisao longa de n por 10^k
            Grande r, qq;
            for (int i = n.bits() - 1; i >= 0; i--) {
                r.shl(1);
                if (n.bit(i)) {
                    if (r.zero())
                        r.w.push_back(1);
                    else
                        r.w[0] |= 1;
                }
                qq.shl(1);
                if (Grande::compara(r, dez) >= 0) {
                    r.sub(dez);
                    if (qq.zero())
                        qq.w.push_back(1);
                    else
                        qq.w[0] |= 1;
                }
            }
            // metade: compara 2r com 10^k
            Grande r2 = r;
            r2.shl(1);
            int c = Grande::compara(r2, dez);
            q = qq;
            if (c > 0 || (c == 0 && !q.zero() && (q.w[0] & 1))) {
                q.soma_peq(1);
            }
        }
        while (!q.zero())
            d.push_back((char)('0' + q.div_peq(10)));
        while ((int)d.size() < decimais + 1)
            d.push_back('0');
        std::reverse(d.begin(), d.end());
        std::string inteiro = d.substr(0, d.size() - decimais), frac = d.substr(d.size() - decimais);
        o = (neg ? "-" : (espaco ? " " : "")) + inteiro + (decimais > 0 ? "." + frac : "");
    }
    int len = (int)o.size();
    if (tam > 0) {
        int kk = len < tam - 1 ? len : tam - 1;
        memcpy(dst, o.data(), kk);
        dst[kk] = 0;
    }
    return len;
}
