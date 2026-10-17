# Pedidos ao tradutor e ao RT45 (família ARMACAO)

O que o ARMADURA precisa de `tools/retraduz.py` e de `src-original/comum/RT45.*`. Cada item traz o endereço, a linha do lift, o que sai hoje e o que deveria sair. Onde há contorno, ele está em `src-original/armacao/correcoes.json`; as entradas com evidência começando por `ALIAS` são geradas por `tests/retraducao/armacao/gera_alias.py` (rodar de novo regenera só essas). Quando o tradutor resolver, essas entradas saem do `correcoes.json`.

**Estado em 15/10/2026: A1, A2, A3, A5 e A6 resolvidos no tradutor/RT45 (commit 9b33d44 e seguintes); A4 resolvido no RT45 (907bf8a).** Os contornos saíram do `correcoes.json`, que ficou só com as 13 entradas PROTECAO (verificação de licença desativada). `gera_alias.py` não é mais usado (fica no repositório como registro do contorno). Com o tradutor novo e sem contornos, os 8 casos dão o resultado do CHECKLIST. O texto abaixo é o pedido como foi feito em 14/10.

## A1. Matriz estática: escalar do lift e `ST_` são a mesma memória (tradutor) — RESOLVIDO (9b33d44: `DIM SHARED ST_...` e escalares como elementos)

O BC do QB4.5 acessa elemento de matriz estática com índice constante como variável simples, e o lift mostra `V_0ee2!`; com índice variável mostra `ST_0ece!(i)`. No original os dois nomes são a mesma memória. O tradutor os trata como variáveis diferentes e não declara as `ST_`; o QB64 cria cada `ST_` com 0..10.

- Lift 0x105bd: `READ V_0ece!, V_0ed2!, ..., V_0efe!` (13 bitolas do DATA). Lift 0x13b66: `PRINT ST_0ece!(CINT(V_0e98!));` com `V_0e98!` de 0 a 12.
- Sai hoje: `READ V_0ece!, ...` e `PRINT ST_0ece!(CINT(V_0e98!));` sem DIM. Resultado: o `READ` enche escalares que ninguém lê como matriz e o índice 11 dá erro 9; a V1 cai na tela "erro no processamento" ao pedir as bitolas (caso `retrad_arm_secoes`, tela s04, antes do contorno).
- Deveria sair: `READ ST_0ece!(0), ST_0ece!(1), ...` e um `DIM SHARED ST_0ece!(0 TO 13)` no começo do programa. Matrizes do ARMADURA e tamanho (cada uma vai até o início da seguinte no DS): `ST_0ece!(0..13)` bitolas, `ST_0f06!(0..13)` áreas, `ST_0f3e!(0..3)`, `ST_0f4e!(0..3)`, `ST_0f5e!(0..6)` bitolas da posição, `ST_0f7a!(0..153)` e `ST_11e2!(0..153)` (as duas são (21, 6) do original, acesso `i + 22*j`), `ST_144a$(0..3)` marcas `#`/`@`. Escalares que são elementos: `V_0ece..V_0efe`, `V_0f06..V_0f36`, `V_0f46`, `V_0f4e/52/56`, `V_0f5e..V_0f72`, `V_144a$/144e$/1452$` (65 linhas).
- Sugestão: o tradutor juntar a lista de bases `ST_` do EXE e trocar todo `V_xxxx` que cair dentro de uma delas (mesmo sufixo, deslocamento múltiplo do tamanho do elemento) por `ST_base(k)`. O tamanho pode vir do próximo endereço DS usado ou do maior índice constante visto. O VIGA também usa `ST_`.
- Contorno: `gera_alias.py` (DIM no 0x100fd e 65 linhas `lift:` com o elemento no lugar do escalar).

## A2. `LPRINT USING f$; TAB(n); ""; ...`: o `""` consome um campo no QB64 (tradutor) — RESOLVIDO (9b33d44: TAB/SPC num PRINT # antes do USING)

O lift mostra o TAB do QB4.5 como `TAB(n); ""` (o B$FTAB devolve uma string vazia que o PRINT imprime). Fora do USING o `""` não faz nada. Dentro do USING, no QB4.5 o `""` do TAB não consome campo do formato; no QB64 consome, e o item seguinte cai no campo errado.

- Lift 0x247a2 (ARMADAUX 413f): `LPRINT USING L_BP0e$; TAB(20); ""; "Mk(ret)  ="; V_0e24! / 100.0; V_0dd0$ + V_0dd4$`, com `L_BP0e$ = " \        \########.## \ \"`.
- Oráculo (`runs/retrad_arm_secoes-20261014-195726/impressora.prn`): `                    Mk(ret)  =       9.20 tm ` (19 espaços do TAB, depois o formato).
- Sai hoje: `PRINT #RT_LPT, USING L_BP0e$; TAB(20); ""; "Mk(ret)  ="; RT_PU#(...)`. No QB64 dá erro 13 (teste avulso `T1.BAS`, fora do repositório: `PRINT #1, USING f$; TAB(20); ""; "Mk(ret)  ="; 9.2; "tm"` imprime 30 espaços e para em ERR 13). Na V1 a impressão cai na tela de erro.
- Deveria sair: `RT_LPTABRE: PRINT #RT_LPT, TAB(20);` e depois `PRINT #RT_LPT, USING L_BP0e$; "Mk(ret)  ="; ...` (o mesmo para `SPC(n)`).
- Ocorrências: 16 no ARMADURA (0x15eef, 0x16574, 0x1671a, 0x16df9, 0x16fe4, 0x175d2, 0x24052, 0x24096, 0x247a2, 0x24817, 0x24871, 0x24b30, 0x24ebe, 0x25353, 0x257ba, 0x259d4).
- Contorno: `gera_alias.py` (cada linha vira as duas acima). Com ele a impressora do ARMADURA fica igual byte a byte nos 4 casos que imprimem.

## A3. `CLOSE` sem número fecha o arquivo da impressora do RT45 (tradutor ou RT45) — RESOLVIDO (9b33d44: `RT_CLOSE`)

- Lift 0x11861 (menu principal, a cada volta): `CLOSE`. Sai `CLOSE`, que no QB64 fecha também o `#RT_LPT`; o `RT_LPT` continua diferente de zero e o `RT_LPTABRE` não reabre. O próximo LPRINT dá erro 52.
- Evidência: caso `retrad_arm_uma`: a primeira impressão (circular) sai, volta ao menu, a segunda (Te) para no `PRINT #RT_LPT, CHR$(12)` de 0x14ca1 com ERR 52 (cópia de depuração com `_ERRORLINE`). O oráculo imprime as quatro seções. No original o `CLOSE` não fecha a LPT1 do LPRINT.
- Deveria sair: `CLOSE: RT_LPT = 0` (o `RT_CLEAR` já faz isso), ou um `RT_CLOSE` no RT45. Vale para todas as famílias: há `CLOSE` sem número no LAJE (3), LAJEGRAV (4), SISEDIT (6) e outros.
- Contorno: `correcoes.json` em 0x11861 e 0x1971e (SUB de erro 0x196cc).

## A4. ON KEY durante INPUT$/LINE INPUT (RT45) — RESOLVIDO (907bf8a)

No original (oráculo, `runs/teclas_qb-20261014-195816`), com a leitura esperando, a tecla presa é engolida, a leitura continua e recebe a tecla seguinte, e o GOSUB roda depois do comando. O RT45 anterior encerrava a leitura na hora: no caso `retrad_arm_teclas` (`{F2}{ENTER}` no menu) a V1 rodava o gerenciador e o ENTER chegava a ele, que escolhia o Portico e dava "Erro de Operacao" (tela k09). O RT45 do commit 907bf8a engole a tecla e segue; com ele a k09 fica igual. (Com o RT45 antigo, o roteiro sem o ENTER dava a mesma tela do original.)

## A6. ON KEY atendido dentro de SUB do programa (tradutor) — RESOLVIDO (9b33d44: `IF RT_EVENTO THEN IF RT_ONKEY_FICA%(...) ... ELSE EXIT SUB` depois das leituras em SUB)

O tradutor só põe `IF RT_EVENTO THEN ... ON RT_EV GOSUB` depois de leituras do nível de módulo. Leitura dentro de SUB deixa o evento pendente até a SUB voltar. O módulo ARMADAUX do original atende o ON KEY dentro da SUB 0x200c9 (Dimensionamento).

- Lift 0x213bf: `LINE INPUT ")  *FIM* "; L_BP0e$` (Mk). Oráculo, `retrad_arm_teclas` tela k07: `{ESC}{ENTER}` no Mk leva direto ao menu principal (o tratador 0x117d3 faz `RETURN` para 0x117f9 `GOTO L_11801`). V1 sem contorno: o ENTER volta ao menu do Dimensionamento (`IF LEN = 0 THEN GOTO L_200d6`) e o desvio só roda quando o usuário sai do Dimensionamento.
- Deveria: depois de leitura em SUB, se `RT_EVENTO` aponta para tratador que sai por `RETURN rótulo` ou RUN, sair da SUB (`EXIT SUB` em cascata) para o desvio rodar depois do CALL; se o tratador volta com `RETURN` simples, rodar o tratador ali (aqui, F1/F3-F10 = BEEP). Não sei se o MIXT também atende dentro das SUBs dele (a tela k05, Esc nas dimensões, sai igual dos dois jeitos).
- Contorno: `correcoes.json`, as 12 leituras da SUB 0x200c9 (0x203bd .. 0x238b5) com `IF RT_EVENTO = 1 THEN RT_EVENTO = 0: BEEP` e `IF RT_EVENTO THEN EXIT SUB` depois.

## A5. `LPRINT USING` sai sem `RT_LPTABRE` (tradutor; baixo) — RESOLVIDO (9b33d44)

As 26 linhas `PRINT #RT_LPT, USING ...` do ARMADURA saem sem `RT_LPTABRE:`; as de LPRINT comum saem com ele. Se o primeiro LPRINT depois de abrir (ou de um CLOSE) for um USING, dá erro 52. No ARMADURA não acontece (o cabeçalho com `LPRINT CHR$(12)` vem antes), mas pode acontecer em outra família.

## Observado sem diferença

- P8 da família LAJE (`RT_PU#(CSNG(expr))` sem arredondar para SINGLE): nenhum número saiu diferente nos 8 casos com o tradutor antigo; o tradutor novo já gera `RT_SNG!(...)` nessas linhas.
- P9 (quebra de 80 colunas do LPRINT): as linhas do ARMADURA têm menos de 80 colunas; não apareceu.
