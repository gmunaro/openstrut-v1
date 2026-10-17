// Compara o RT45X87.h com os vetores de gera_aleatorios.ts (rodar nesta pasta).
#include <stdio.h>
#include <stdlib.h>
#include "../../../src-original/comum/RT45X87.h"
static unsigned char *le(const char *n, long *t) { FILE *f = fopen(n, "rb"); fseek(f, 0, 2); *t = ftell(f); fseek(f, 0, 0); unsigned char *b = (unsigned char *)malloc(*t); fread(b, 1, *t, f); fclose(f); return b; }
static long double ld(const unsigned char *p) { long double v = 0; memcpy(&v, p, 10); return v; }
static int ig(long double v, const unsigned char *p) { return memcmp(&v, p, 10) == 0; }
int main() {
  long t; unsigned char *b; int d = 0, n = 0;
  b = le("fyl2x.bin", &t); for (long o = 0; o < t; o += 30, n++) if (!ig(rt45_fyl2x(ld(b + o), ld(b + o + 10)), b + o + 20)) { if (d++ < 5) printf("fyl2x %ld\n", o / 30); }
  printf("FYL2X: %d de %d diferentes\n", d, n); d = n = 0;
  b = le("f2xm1.bin", &t); for (long o = 0; o < t; o += 20, n++) if (!ig(rt45_f2xm1(ld(b + o)), b + o + 10)) { if (d++ < 5) printf("f2xm1 %ld\n", o / 20); }
  printf("F2XM1: %d de %d diferentes\n", d, n); d = n = 0;
  int de = 0;
  b = le("pot.bin", &t); for (long o = 0; o < t; o += 31, n++) {
    long double r = rt45_pot(ld(b + o), ld(b + o + 10)); int e = rt45_pot_erro();
    if (e != b[o + 30]) { if (de++ < 5) printf("pot erro %ld: %d x %d\n", o / 31, e, b[o + 30]); }
    else if (!e && !ig(r, b + o + 20)) { if (d++ < 5) printf("pot %ld\n", o / 31); }
  }
  printf("POT: %d valores e %d erros diferentes de %d\n", d, de, n);
}
