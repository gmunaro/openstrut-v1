# x87_zen2: instruções transcendentes do x87 do Zen 2 em software

`x87_zen2.h`/`x87_zen2.cpp` reproduzem, em C++ portátil (inteiros de 64 bits e `unsigned __int128`, sem `long double`), as instruções FSIN, FCOS, FPTAN, FPATAN, F2XM1, FYL2X e FYL2XP1 do x87 do AMD Ryzen 5 3600 (Zen 2) desta máquina. Também reproduzem as funções `long double` da libm do mingw-w64 x86_64 que o V1 nativo chama: `sinl`, `cosl`, `tanl`, `atanl`, `atan2l`, `expl` e `logl`. Cada uma segue a mesma sequência de instruções, com cada operação intermediária arredondada como o x87 faz com PC = 64 bits e RC = ao par, salvo onde a sequência muda o RC. O build web usa esse código no lugar das funções do `qb_f80`.

Nem tudo bate 100%. A seção "Taxas" diz quanto bate e a seção "O que falta" diz onde e por quê.

## Arquivos

| arquivo | o que é |
|---|---|
| `web/runtime/x87_zen2.h`, `.cpp` | modelos; API `zen2_*` (instruções, com RC), `mingw_*` (libm) e a ponte `x87z_f`/`x87z_atan2` usada pelo `qb_f80.cpp` |
| `web/tests/x87/testa_x87.cpp` | teste reexecutável: modelo contra o hardware, 8 distribuições, 4 modos de RC nas instruções |
| `web/tests/x87/roda_f80.sh` | gera os vetores de `web/tests/f80` no nativo, compila o `testa_vetores` com em++ (qb_f80 + x87_zen2) e roda no Node |
| `web/tests/x87/hw.h` | as instruções de verdade em asm em linha, para os testes nativos |
| `web/tests/x87/sonda.cpp`, `x87lab.py` | sonda genérica: roda uma instrução/função sobre uma lista binária de entradas |
| `web/tests/x87/le_L.cpp` | lê o valor interno de 68 bits do FYL2X/FYL2XP1 (varia y e intersecta os intervalos) |
| `web/tests/x87/lp_dados.cpp`, `it_sin.cpp` | geram as restrições lineares para o ajuste dos polinômios (programação linear) |
| `web/tests/x87/busca_log.cpp`, `teste_L1.cpp` | conferem e buscam variantes do log2 interno contra o L lido |
| `web/tests/x87/roda_testes.sh` | compila e roda `teste_nucleo` e `testa_x87` (padrão: 200 mil entradas por operação) |
| `web/tests/x87/busca_trig.cpp` | busca local nos bits dos coeficientes do FSIN/FCOS |
| `web/tests/x87/teste_nucleo.cpp` | confere a aritmética de trabalho (soma, produto, divisão nos 4 modos) contra FADD/FMUL/FDIV |
| `web/tests/x87/ref.h` | valores de referência de ~120 bits para as ferramentas |

## Aritmética de trabalho

Os modelos usam `Nx`, um número com mantissa de 128 bits, expoente `int` e sinal. Soma, produto e divisão são exatos e arredondam uma vez para P bits (P ≤ 128) em qualquer RC. `teste_nucleo` confere 2 milhões de casos contra FADD, FMUL e FDIV, nos 4 modos, sem diferença. `r68(...)` abaixo quer dizer "arredonda ao par para 68 bits de mantissa", que é a precisão interna do microcódigo.

## O que se descobriu de cada instrução

### Método

1. **Sondagem.** Para cada entrada, roda a instrução com RC = ao par, para baixo e para cima. Os resultados dão o intervalo do valor interno V antes do arredondamento final: [RD, RU], e RN diz em qual metade V está. Quando RD = RU, V é exato em 64 bits.
2. **Grade do último passo.** A frequência de resultados exatos mostra a forma da última operação. No FSIN, essa frequência é 2^-(4+d), onde d é a distância em expoente entre x e c = x − sin x. Isso só acontece se V = x − c, com c arredondado para 68 bits relativos ao próprio c e a subtração final arredondada uma vez para 64 bits. O FCOS dá 2^-(3+d), com V = 1 − c. O FPATAN(y, 1) dá V = y − c. FPTAN e F2XM1 nunca dão resultado exato: o último passo é um produto ou um quociente.
3. **Leitura direta, quando há multiplicador.** FYL2X e FYL2XP1 dão arredonda64(y · L). Variando y em 256 mantissas e intersectando os intervalos, L sai isolado num único ponto da grade de 68 bits, em 100% das entradas.
4. **Ajuste por programação linear.** Os coeficientes saem de restrições lineares lo ≤ Σ d_i φ_i(x) ≤ hi sobre a correção dos coeficientes de Taylor, uma por amostra. Em cada rodada, o ruído dos arredondamentos de 68 bits da estrutura suposta entra nas restrições, e o LP minimiza a soma das folgas (L1), só com as amostras perto da borda. O ajuste por margem máxima não convergiu: os pontos ruidosos dominam.

### FSIN, FCOS

- **Redução.** k é o inteiro mais próximo de |x| / (π66/2), com π66 = 0x3243F6A8885A308D3 · 2^-64. r = |x| − k·π66/2 é exato (cabe em 66 bits). O quadrante k mod 4 escolhe ±sin r ou ±cos r. Para |x| ≥ 2^63 a instrução não reduz: liga C2 e deixa st0 intacto.
- **Seno.** z = r68(r²), p = Horner de 9 coeficientes de 68 bits em z (`SIN_Q`), c = r68(r68(|r|·z)·p), resultado = arredonda64(±(|r| − c)).
- **Cosseno.** c = r68(z·p) com `COS_Q`, resultado = arredonda64(±(1 − c)).
- **Coeficientes.** Ponto de partida: os de Taylor, (−1)^i/(2i+3)! no seno e (−1)^i/(2i+2)! no cosseno. Depois, ajuste L1 com ruído modelado, de 3 a 6 rodadas sobre 40 a 100 mil amostras.
- **Estrutura.** Entre as variantes testadas (`it_sin.cpp`: ordem dos produtos, produto final sem arredondar, truncamento, grade absoluta), a estrutura acima foi a de maior acerto. Precisão de 66, 67, 70 ou 72 bits piora. Truncar em vez de arredondar também piora.

### FYL2X, FYL2XP1

- **FYL2X.** É o modelo do `src-original/comum/RT45X87.h`: s = r68((m−1)/(m+1)), série ímpar de grau 21 em s, com 10 coeficientes e C = r68(2/ln 2). O cabeçalho de `sistrut-v2/src/calculo/sistrut/base/x87.ts` o descreve.
- **FYL2XP1.** É novo. Usa s = r68(x / r68(2 + x)) e a mesma série e os mesmos coeficientes, com k = 0. O resultado é arredonda64(y · L) no RC. Com 2 + x arredondado a 66, 67, 69 ou 70 bits, ou sem arredondar, o acerto cai.
- **L lido contra L do modelo.** Bate em 99,77% das entradas (FYL2XP1) e 99,9% (FYL2X). As diferenças são de 1 ulp de 68 bits. Todas ficam a menos de 1/64 ulp do ponto médio da soma final, ou seja, são empates ou quase empates resolvidos para o outro lado. A causa é uma diferença de ±1 ulp no termo R da série. Não achei o mecanismo. Busca local nos coeficientes, frações de ulp nos coeficientes, modos de arredondamento e precisões diferentes em cada passo não resolveram. Na saída, essa diferença quase sempre some.

### FPATAN

- **Constante π.** Para |y| > |x|, resultado = π66/2 ∓ atan(|x|/|y|). Para x < 0 e |y| ≤ |x|, resultado = π66 − atan(|y|/|x|). Os casos especiais (±0, ±∞) dão ±π, ±π/2 e ±3π/4 arredondados. Com o π66/2, FPATAN(y, 1) bate 100% para |y| ≥ 2^12. Com π de 64 ou 65 bits, 75%. Com 69 bits ou mais, 97 a 98,5%.
- **atan(t), t ≤ 1.** V = t − c, com c na grade de 68 bits. O ruído de c é de 1,5 a 4 ulps de 68 bits e não sai com polinômio liso. Está medido em janelas de 0,01 de largura com o LP: margem de −0,04 ulp perto de t = 1. A estrutura interna não foi achada. O modelo usa atan(t) exato arredondado.

### FPTAN, F2XM1

O último passo nunca é exato, então é um quociente ou um produto. Nos dois, o ruído intrínseco medido em janelas estreitas fica entre 0,05 e 0,13 ulp do resultado, perto de um arredondamento de 68 bits do próprio resultado. Um ajuste liso não ajuda.

- **FPTAN.** Testei tan = N/D com N e D vindos dos polinômios de seno e cosseno acima, com e sem arredondar N e D para 68 bits. Todas as variantes ficaram entre 96,2% e 96,7%, abaixo do valor exato arredondado (97,1%). O FPTAN tem aproximação própria, provavelmente racional, que não foi achada.
- **F2XM1.** O degrau na mantissa 0x8ae3cc7c6d352aa0 de x, já observado antes, dá a = 2 / 1,0850768668700906 = 1,8431873916628686 (mantissa da primeira constante). Não reconheci essa constante.
- **Modelo atual.** Nos dois casos, o valor exato arredondado uma vez no RC.

### libm do mingw (`llvm-objdump -d` de um exe do clang do QB64)

- `sinl`/`cosl`: se o expoente é 0x7FFF, NaN volta como está e ±∞ dá +qNaN (0x7FFF:C000…). Senão, FSIN/FCOS. Se C2 ligar (|x| ≥ 2^63): `fldpi; fadd st,st; fxch; fprem1` em laço, depois FSIN/FCOS do resto. O resto é exato, módulo 2·π64 com π64 = 0xC90FDAA22168C235·2^-62.
- `tanl`: FPTAN, com o mesmo FPREM1 se C2 ligar.
- `atanl(x)`: `fld1; fpatan`. `atan2l(y, x)`: `fpatan`.
- `expl`: se x > 0x400C:B17217F7D1CF79AC, +∞. Se x < 0xC00C:B16C8C671210EB30, 0. ±0 dá 1. +∞ dá +∞, −∞ dá 0 e NaN volta como está. O caso geral faz t = r(log2e·x); com RC = para zero, n = FRNDINT(t) e xi = FRNDINT(x); de volta ao par:
  - f = r(r(r(xi·c0) − n) + r(c0·(x − xi))) + r(c1·x), com c0 = 0x3FFF:B8AA000000000000 e c1 = 0x3FED:ECA5705FC2EEFA20;
  - resultado = FSCALE(r(F2XM1(f) + 1), n).

  A instrução DE E2 é FSUBRP, então o passo é xi·c0 − n.
- `logl`: −0 e +0 dão −∞. x < 0 e −∞ dão +qNaN; +∞ dá +∞; NaN volta como está. O caso geral faz t = r(x − 1) e compara |t| com 0,29 (double 0x3FD28F5C28F5C28F). Se |t| ≤ 0,29, ou se é NaN, calcula FYL2XP1(ln2, t). Senão, FYL2X(ln2, x). ln2 é o do FLDLN2 ao par, 0x3FFE:B17217F7D1CF79AC.

## Taxas

Medidas por `testa_x87.exe` e `roda_f80.sh` nesta máquina (Ryzen 5 3600). Os números da rodada final estão na seção abaixo, com o comando que os gerou.

Rodada de 16/10/2026 (`roda_f80.sh 30000 1`: o qb_f80 do build web contra o x87 nativo, 30 mil casos por funcao, as funcoes da libm do mingw):

| funcao | iguais | diferentes (1 ulp) |
|---|---|---|
| sinl | 29.989 | 11 |
| cosl | 29.985 | 15 |
| atanl | 29.972 | 28 |
| logl | 29.999 | 1 |
| expl | 29.818 | 182 |
| tanl | 29.248 | 752 |

O "fsin" da mesma rodada (398 diferentes e 708 NaN) compara o FSIN cru do asm com o sinl e difere por definicao para |x| >= 2^63 (ver "Pendencias").

## Como reproduzir

```sh
bash web/tests/x87/roda_testes.sh 25000 1          # nativo: núcleo + 200 mil entradas por operação
bash web/tests/x87/roda_testes.sh 5000 3 fsin sinl  # só algumas operações, outra semente
bash web/tests/x87/roda_f80.sh 30000 1             # build web (em++ + Node) contra os vetores de web/tests/f80
```

Os dois usam o clang do QB64 (`QB64_CXX`, padrão `/c/qb64pe/qb64pe/internal/c/c_compiler/bin/c++.exe`) e gravam em `$X87_TMP` (padrão: `x87zen2` no temporário do sistema). O `roda_f80.sh` também usa o emsdk de `web/tools/emenv.sh`. `testa_x87.exe <n> <semente> [op...]` sem o filtro mostra até 3 exemplos de diferença por linha.

## O que falta e onde difere

- **FPTAN e F2XM1.** São o valor exato arredondado e diferem do Zen 2 em cerca de 2,5% das entradas, sempre 1 ulp. A causa é o ruído de 68 bits da aproximação interna, que não foi reproduzida (ver acima). Isso limita o `tanl` a cerca de 97,5% e o `expl` a cerca de 99,4%. No `expl` o F2XM1 recebe |f| < 1 e o erro só aparece quando cai perto de meio ulp depois de somar 1.
- **FPATAN, 2^-8 < |y/x| < 2^12.** É o atan exato arredondado, mais as constantes π66. Difere em 0,1% a 2,7% das entradas, sempre 1 ulp, com o pior caso em |y/x| perto de 1.
- **FSIN e FCOS.** Diferem em cerca de 0,05% (1 ulp). As diferenças se concentram em |r| perto de π/4, onde o ajuste dos polinômios ainda tem viés, e em casos de quase empate do arredondamento de 68 bits de c.
- **FYL2X e FYL2XP1.** L difere em cerca de 0,1% a 0,2% (1 ulp de 68 bits); na saída, cerca de 0,01% a 0,03%. Fora do domínio do FYL2XP1 (|x| ≥ 1 − √2/2), o hardware usa outro caminho. Para x grande ele dá o log certo; para x ≤ −1 devolve x. O modelo não cobre esse caso. O `logl` nunca chama FYL2XP1 fora do domínio.
- **Denormais na saída** (FPATAN com y ou x denormais): às vezes 1 ulp de diferença. É provável que o hardware arredonde duas vezes.
- **`qb_f80_pow`** continua com a conta antiga em quad. O `powl` do mingw é C (log2l, exp2l, __powil), e o `^` da V1 passa pelo RT45 (`RT45X87.h`), não por ele.
- O "fsin" de `web/tests/f80` compara o FSIN cru do asm (sem FPREM1) com `std::sin` do qb_f80, que é o `sinl` do mingw. Para |x| ≥ 2^63, ±∞ e NaN eles diferem por definição; não é erro do modelo.
