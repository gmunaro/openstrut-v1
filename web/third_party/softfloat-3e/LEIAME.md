# Berkeley SoftFloat 3e (subconjunto)

Origem: https://github.com/ucb-bar/berkeley-softfloat-3, commit a0c6494cdc11865811dec815d5c0049fba9d82a8 (7/3/2025). Licença BSD de 3 cláusulas (`COPYING.txt`).

Só os arquivos de que o `web/runtime/qb_f80` precisa: operações do formato estendido de 80 bits (`extF80_*`), conversões entre ele e float, double, quad (`f128`) e inteiros, as primitivas e a especialização `8086` (NaN e "inteiro indefinido" como o x87). Ficaram de fora as variantes `M` (por ponteiro), f16/bf16, a aritmética de f32/f64/f128 e as outras especializações. `platform.h` é o de `build/Linux-x86_64-GCC` sem mudança.

Compilação: `web/tools/build.sh` (com `-DSOFTFLOAT_FAST_INT64 -DSOFTFLOAT_ROUND_ODD -DINLINE_LEVEL=5 -DSOFTFLOAT_FAST_DIV32TO16 -DSOFTFLOAT_FAST_DIV64TO32`, como o Makefile original).
