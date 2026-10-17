// Confere o modelo x87 do RT45 (src-original/comum/RT45X87.h) com os vetores da V2
// (pasta em X87_VETORES, variavel de ambiente obrigatoria; gerados do x87.ts da V2). Compilar com o clang++ do QB64:
//   <pasta do QB64>/internal/c/c_compiler/bin/clang++.exe -O2 -o testa_vetores.exe testa_vetores.cpp
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "../../../src-original/comum/RT45X87.h"
// caminho do arquivo <n> na pasta dos vetores (X87_VETORES)
static const char *vet(const char *n) {
  const char *p = getenv("X87_VETORES");
  if (!p || !*p) { fprintf(stderr, "defina X87_VETORES=<pasta dos vetores x87 da V2>\n"); exit(2); }
  char *s = (char *)malloc(strlen(p) + strlen(n) + 2); sprintf(s, "%s/%s", p, n); return s;
}
static unsigned char *le(const char *n, long *t) { FILE *f = fopen(n, "rb"); fseek(f, 0, 2); *t = ftell(f); fseek(f, 0, 0); unsigned char *b = (unsigned char *)malloc(*t); fread(b, 1, *t, f); fclose(f); return b; }
static long double ld(const unsigned char *p) { long double v = 0; memcpy(&v, p, 10); return v; }
static int ig(long double v, const unsigned char *p) { return memcmp(&v, p, 10) == 0; }
static long double sqr_rt(long double x) { long double z = 0; return x < 0 ? z / z : rt45_fsqrt(x); }   // RT_SQR##
template <class T> static void pot(const char *nome) {
  long t; unsigned char *b = le(vet(nome), &t); int w = sizeof(T), rec = 3 * w + 11, n = 0, de = 0, dv = 0, df = 0;
  for (long o = 0; o < t; o += rec, n++) {
    T A, B, F; memcpy(&A, b + o, w); memcpy(&B, b + o + w, w); memcpy(&F, b + o + 2 * w + 11, w);
    int st = b[o + 2 * w];
    long double r = rt45_pot((long double)A, (long double)B); int e = rt45_pot_erro();
    if (e != st) { if (de++ < 5) printf("  erro %d: %d x %d\n", n, e, st); continue; }
    if (st) continue;
    if (!ig(r, b + o + 2 * w + 1)) { if (dv++ < 5) printf("  estendido %d\n", n); }
    T fr = (T)r; if (memcmp(&fr, &F, w)) df++;
  }
  printf("%s: %d registros; erro diferente %d, estendido diferente %d, valor final diferente %d\n", nome, n, de, dv, df);
}
template <class T> static void xmr(const char *nome) {
  long t; unsigned char *b = le(vet(nome), &t); int w = sizeof(T), rec = 3 * w + 11, n = 0, de = 0, dv = 0, df = 0;
  for (long o = 0; o < t; o += rec, n++) {
    T X, Y, F; memcpy(&X, b + o, w); memcpy(&Y, b + o + w, w); memcpy(&F, b + o + 2 * w + 11, w);
    int st = b[o + 2 * w];
    long double p = rt45_pot((long double)X, 2.0L); int e = rt45_pot_erro();
    if (e != st) { de++; continue; }
    if (st) continue;
    long double r = (long double)X - sqr_rt(p - (long double)Y);
    if (!ig(r, b + o + 2 * w + 1)) { if (dv++ < 5) printf("  estendido %d\n", n); }
    T fr = (T)r; if (memcmp(&fr, &F, w) && !(fr != fr && F != F)) df++;
  }
  printf("%s: %d registros; erro diferente %d, estendido diferente %d, valor final diferente %d\n", nome, n, de, dv, df);
}
int main() {
  long t; unsigned char *b; int d, n;
  b = le(vet("fyl2x.bin"), &t); d = n = 0; for (long o = 0; o < t; o += 30, n++) if (!ig(rt45_fyl2x(ld(b + o + 10), ld(b + o)), b + o + 20)) { if (d++ < 5) printf("  fyl2x %d\n", n); }
  printf("fyl2x.bin: %d registros, %d diferentes\n", n, d);
  b = le(vet("f2xm1.bin"), &t); d = n = 0; for (long o = 0; o < t; o += 20, n++) if (!ig(rt45_f2xm1(ld(b + o)), b + o + 10)) { if (d++ < 5) printf("  f2xm1 %d\n", n); }
  printf("f2xm1.bin: %d registros, %d diferentes\n", n, d);
  b = le(vet("fsqrt.bin"), &t); d = n = 0; for (long o = 0; o < t; o += 20, n++) if (!ig(rt45_fsqrt(ld(b + o)), b + o + 10)) { if (d++ < 5) printf("  fsqrt %d\n", n); }
  printf("fsqrt.bin: %d registros, %d diferentes\n", n, d);
  pot<float>("pot_single.bin"); pot<double>("pot_double.bin");
  xmr<float>("xmr_single.bin"); xmr<double>("xmr_double.bin");
}
