# Pedidos ao tradutor, ao RT45 e aos scripts (família VIGA: VIGA e VPLOTA)

Cada pedido traz o endereço, a linha do lift, o que sai hoje, o que deveria sair e o contorno em `src-original/viga/correcoes.json` (chaves com "PROVISORIO (PEDIDOS-TRADUTOR Pn/Rn)" na evidência). Quando o pedido for atendido, apagar as entradas do contorno e regenerar.

P = tradutor (`tools/retraduz.py`), R = runtime (`src-original/comum/RT45.*`), S = scripts.

**Estado em 15/10/2026.** Segundo o agente do tradutor, os commits 9b33d44, 86cb56d, 062dbdc e 351cde1 atendem P1-P5, R1, R2, R4, R7, R8, S1 e S2. Os contornos de P1-P5, R1, R2, R4 e R8 e as ESTATICA saíram de `correcoes.json` (o `gera_estaticas.py` ficou fora de uso). R3 também saiu: com o RT45.BM de trabalho (15/10 04:25) a quebra de linha da LPT1 já sai certa, e com o contorno fixo (VIGA 0x19d54) a V1 escrevia o CR LF duas vezes (casos b e x1). Sem ele, as duas impressoras ficam iguais byte a byte. R5/R6 (gráfico) ficam com outro agente; com o RT45GFX de 15/10 as telas gráficas dos casos saíram iguais. Os pedidos novos do VPLOTA estão na seção "VPLOTA", no fim.

## P1. `DIM` de matriz no nível de módulo dá erro 10 no QB64

- VIGA 0x10155, 0x10172, 0x1018f (`DIM A_16be(0 TO 1)` etc., M_VIGA) e 0x1157f, 0x1159c (`DIM A_1718(0 TO V_0e24%)`).
- Sai: `REDIM SHARED A_16be%(-32768 TO -32768)` no início e `DIM A_16be%(0 TO 1)` no corpo. Compila, mas na execução o QB64 para com "Unhandled Error #10 (Duplicate definition)" na linha do DIM, antes do menu (a janela de erro fica esperando; o caso não anda).
- Deveria: o mesmo que já se faz com matriz local: `DIM` de matriz que já foi declarada `REDIM SHARED` vira `REDIM`.
- Os DIM do nível de módulo do VIAUX (0x200cb..0x201c6) e do VICALC (0x400c6..0x40217) também saem como DIM, mas esse código não roda (o nível de módulo do VIGA nunca cai neles); o DESENHO tem 69 linhas assim.
- Contorno: as 5 linhas viram `REDIM`.

## P2. `LPRINT USING f$; TAB(n); ""; ...` põe o TAB e o "" dentro do USING

- VIGA 0x2a0b6 (lift: `LPRINT USING V_12b2$; TAB(15); ""; V_12ae$; V_180c%; A_0e26!(V_180c%); A_0e54!(V_180c%)`) e mais 23 linhas (0x2297e, 0x22ed0, 0x2313b, 0x2465b, 0x28506, 0x2a303, 0x2a5d0, 0x44908, 0x4499f, 0x44a57, 0x44add, 0x44b9b, 0x44c5c, 0x45061, 0x450c3, 0x45167, 0x4535a, 0x45425, 0x45516, 0x45626, 0x4568c, 0x45951, 0x45a25).
- No .asm a ordem é B$LPRT, B$FTAB(15), B$PSSD(""), e só depois B$USNG (0x2a0bb..0x2a0d6): o TAB e o "" saem sem formato.
- Sai: `PRINT #RT_LPT, USING V_12b2$; TAB(15); ""; V_12ae$; ...`. O QB64 casa o "" com o 1o campo do formato (`\\`) e o `V_12ae$` com `##`: erro 13, que o ON ERROR da opção 7 transforma em " VERIFIQUE O SEU DRIVE" (caso retrad_viga_b, tela v14).
- Deveria: `PRINT #RT_LPT, TAB(15); "";` seguido de `PRINT #RT_LPT, USING V_12b2$; V_12ae$; ...`. O ARMADURA tem o mesmo caso (armacao/gera_alias.py, A2).
- Contorno: as 24 linhas divididas assim.

## P3. Matrizes estáticas: tamanho e ERASE pelo descritor

O tradutor (versão de trabalho de 14/10, ainda não commitada) já declara as `ST_` e junta os escalares do lift. Faltam duas coisas:
- Tamanho: ele estende a matriz até a próxima variável de outro tipo e engole escalares vizinhos do mesmo tipo. VIGA: `ST_1a8c!` sai 0..28 (o descritor DS:4B50 diz 14 x 2 = 28 elementos; o 29o é `V_1afc!`, um contador) e `ST_1b78!` sai 0..38 (engole `V_1bf0!`..`V_1c10!`); o `FOR V_1c00! = ...` de 0x422a6 vira `FOR ST_1b78!(34) = ...`, que o QB64 não compila. VPLOTA: `ST_15fe%` sai 0..73 (descritor DS:3182: 22 x 3 = 66).
- ERASE: `ERASE A_4b00` (VIGA 0x402c3), `A_4b50` (0x41c29), `A_4b90` (0x422cd), `A_4ba2` (0x422d6) e `A_3182` (VPLOTA 0x15c22) são ERASE de matriz estática: o operando é o descritor na área de constantes. Sai `ERASE A_4b00` de uma matriz dinâmica vazia (sem efeito). Deveria zerar os elementos.
- Como achar: o descritor (`$REA_WORK/tools/ds.py VIGA 0x4b00 x 2`) tem deslocamento dos dados, nº de dimensões, `40h`, tamanho do elemento e, por dimensão, nº de elementos e limite inferior. Ex.: DS:4B00 = `98 19 .. 01 40 98 19 04 00 03 00 00 00` = SINGLE (0 TO 2) em DS:1998 (`V_1998!`, `V_199c!` e DS:19A0).
- Contorno: `DIM SHARED ST_1a8c!(0 TO 27), ST_1b78!(0 TO 19)` (VIGA 0x10155) e `ST_15fe%(0 TO 65)` (VPLOTA 0x1019b), que o tradutor lê (`st_mao`); os ERASE viram laços que zeram só os elementos do descritor (`tests/retraducao/viga/gera_estaticas.py`).
- Efeito no cálculo: sem o alias `V_19a8!` = 2o elemento de `ST_19a4!` (foco esquerdo do tramo 1, 0x40f1b) o caso da viga contínua dava M+ e reações dos apoios extremos errados; com ele a V1 bate com o oráculo (caso retrad_viga_b).

## P4. PRINT USING cujo item tem um CALL no meio vira dois comandos

- VIGA 0x2a4bc / 0x2a5a8 (quadro de dados, linha "ac" das acidentais) e 0x2a5d0 / 0x2a6d3 (o mesmo na impressora).
- No .asm é um comando só: B$USNG (0x2a4c5), B$PSR4 do Pac (0x2a506), o CALL MAX do MIXT (0x2a563) e B$PER4 do MAX(0, Fac) (0x2a5b0), sem B$EVCK no meio.
- Sai: `PRINT USING V_12ae$; Pac;` e depois `PRINT V_181c!` (sem formato). Na impressora sai `PRINT V_1828!`: o valor vai para a TELA, não para a impressora.
- Deveria: o 2o item com o 2o campo do formato, no mesmo canal (oráculo retrad_viga_c1: `ac  0.500            0.00`).
- Contorno: `PRINT [#RT_LPT,] USING MID$(V_12ae$, 19); RT_PU#(V_181c!, MID$(V_12ae$, 19), 1)`. O PRINT USING do QB64 terminado em `;` já escreve os espaços literais que seguem o 1o campo; por isso o resto do formato começa no 2o campo.

## P5. Dois comandos com o mesmo endereço no lift

- VIGA 0x2a5d0 (`V_1820! = 0.0` e o LPRINT USING), 0x45626 (`L_BP2c% = V_0e08% + 1` e o PRINT USING), 0x4568c (idem, LPRINT).
- A correção por endereço troca os dois comandos. A primeira tentativa do contorno P2 tirou a atribuição do índice (`A_18e6!(L_BP2c%, 0)` com índice 0) e imprimiu duas vezes.
- Pedido: aceitar chave `"0x45626#2"` (n-ésimo comando do endereço) em `correcoes.json`, ou dar ao comando "içado" o endereço da instrução dele.
- Contorno: as linhas saem duas vezes; a atribuição repete e o PRINT só sai na 2a vez (`RT_DUP%` alterna).

## R1. Impressora: `RT_LPTABRE` usa FREEFILE

- O primeiro LPRINT abre a impressora com `FREEFILE`, que devolve 1 quando nada está aberto. Depois o programa faz `OPEN ... AS #1` (VIGA 0x1ab1d, leitura do .VIG na opção 7): erro 55 e " VERIFIQUE O SEU DRIVE" (caso retrad_viga_b).
- Deveria: número fora da faixa do programa (o BRUN45 não usa número de arquivo para a LPT1), por exemplo 255 fixo. Continua valendo com o `RT_CLOSE` novo do RT45 (14/10, não commitado): ele fecha a impressora e o próximo LPRINT a reabre com FREEFILE, que pode ser 1 de novo.
- Contorno: o VIGA (0x10172) e o VPLOTA (0x101a9) abrem a impressora no #250 no início, com o mesmo nome de arquivo e as mesmas variáveis do `RT_LPTABRE` (`RT_LPT_NOME`, `RT_LPT_POS`, que o `RT_LPTQUEBRA` novo usa: sem elas o `RT_FIM` caía em erro 76 e, pelo ON ERROR do VIGA, em recursão até "Out of stack space"). Efeito colateral: `impressora.prn` vazio quando nada é impresso (o compara trata vazio = ausente).

## R2. `CLOSE` sem número fecha a impressora

- VIGA 0x1194c (toda volta ao menu principal), 0x1ad44, 0x301c6, 0x24eb1; VPLOTA 15 linhas. No QB4.5 o CLOSE fecha os arquivos do programa e a LPT1 continua; no QB64 fecha o `#RT_LPT`, e o próximo `PRINT #RT_LPT` dá erro 52 (segunda impressão na mesma sessão).
- Deveria: `CLOSE` do original vira um `RT_CLOSE` que fecha tudo menos o RT_LPT. O tradutor de trabalho já emite `RT_CLOSE`, mas ele fecha a impressora e zera o `RT_LPT` (ver R1).
- Contorno: laço `CLOSE #n` de 1 a 255 menos o RT_LPT (CLOSE de número fechado não dá erro no QB64, conferido); substitui o `RT_CLOSE` nessas linhas.

## R3. Largura 80 da LPT1

- VIGA 0x19d54: depois de `LPRINT CHR$(12);` e de `ESC 0`, `ESC N 6` sem fim de linha (coluna 6), `LPRINT STRING$(79, 45)` não cabe e o BRUN45 manda CR LF antes (oráculo: `0C 1B 30 1B 4E 06 0D 0A 2D..`). Mesmo pedido do LAJE (laje/PEDIDOS-TRADUTOR.md), com esta regra a mais: item que não cabe na linha começa na linha seguinte.
- Contorno: um `PRINT #RT_LPT, ""` fixo antes (o caminho é sempre o mesmo).
- O `RT_LPTQUEBRA` novo (quebra quando a coluna chega a 80) não daria este resultado: contando só os caracteres >= 32, a linha tem coluna 2 antes dos traços e a quebra sairia depois do 78o traço; o oráculo quebra ANTES do item, com 6 bytes já na linha. Regra a conferir no BRUN45: item que não cabe (coluna + tamanho > largura) começa na linha seguinte, e os bytes de controle contam.

## R4. FILES sem arquivo não dá erro 53

- VIGA 0x1aa64 (opção 7), 0x3391c (Gravação e Leitura); VPLOTA 0x14433, 0x17b14, 0x1ccaa. O QB4.5 escreve a pasta e dá erro 53, que o ON ERROR trata (" Nenhum Arquivo Encontrado"); o `RT_FILES` escreve " 2013265920 Bytes free" (oráculo retrad_viga_k1, tela k03).
- Contorno: sem arquivo, a mesma pasta do RT_FILES e `ERROR 53`.

## R5. WINDOW: arredondamento do ponto lógico para o pixel

- Prova no oráculo: caso `retrad_viga_win` (programa `WIN.BAS` compilado com o BC do QB4.5; saída em `runs/retrad_viga_win-*/obra/WIN.OUT`, com cópia fora do repositório), com o VIEW/WINDOW SCREEN do esquema da viga (VIGA 0x25292/0x252bc: `VIEW (0,0)-(639,191)`, `WINDOW SCREEN (0,0)-(640,192)`).
- O BRUN45 arredonda o meio para baixo: pixel = teto(v - 0,5), v = (x - x1)·(vx2 - vx1)/(x2 - x1) + vx1. x = 320 vai para a coluna 319 (QB64: 320); y = 96 vai para a linha 95 (QB64: 96). As 4 linhas de 160 pontos (x = 4j, 4j+0,25, +0,5, +0,75) e as 4 colunas de 48 pontos batem todas com essa regra; com arredondamento ao par ou para cima, não.
- Efeito: o apoio do meio do esquema sai uma coluna à direita (casos p2: 56 pixels por tela).
- Mesmo programa no QB64 (`WINQ.BAS`, fora do repositório): 617 pixels diferentes, dos quais a maior parte vem do R6.

## R6. LINE diagonal: outro traçado

- Mesma sonda: `LINE (10,30)-(630,170)` sai com os segmentos de cada linha deslocados de um pixel (linha 30: QB4.5 `10 11`, QB64 `10 11 12`; linha 31: `12..15` × `13..16`). O traçado do BRUN45 (Bresenham com outra regra de passo) precisa ser reproduzido no RT45 para os diagramas de esforços (casos p2, a1, c1: 580 a 1.120 pixels por tela) e para a cópia da tela na impressora (caso p3: 320 bytes de gráfico diferentes; o texto bate).

## R7. Relógio

- Com o relógio fixo, a V1 roda os casos em 2 a 5 s e o oráculo em 1 a 3 min de tempo emulado: as horas impressas e gravadas mudam de 12:00 para 12:01/12:02 (casos a1, c1, x1, v1; `.REP`, `VPLOTA.INI`, rodapés). O `tools/compara_retrad.py` novo aceita isso nas telas ("igual (relógio)"); o `tests/retraducao/viga/compara_obra.py` usa a mesma regra nos arquivos de obra.
- Sugestão: um modo em que o relógio só anda por tecla consumida, nos dois lados.

## R8. `SPC(n)` que passa do fim da linha

- VIGA 0x28b8b (`PRINT SPC(60); "";` na tela de parâmetros, a partir da coluna 55 ou 65): o QB4.5 escreve os 60 espaços na cor corrente e continua na linha seguinte (oráculo retrad_viga_c1, tela p04: atributo 1E nas colunas 65-80 da linha 11 e 1-44 da linha 12). O QB64 não.
- Contorno: `SPACE$` dividido no fim da linha.

## S2. `compara_retrad.py`: relógio na linha de realce

- Caso a1, tela 026_q04_v10: a única diferença é a hora (12:01 × 12:00), mas a linha do `.realce.txt` não passa pela regra do relógio e a tela sai DIFERE (`(realce 22) 10-14-2026 12:01` × `12:00`); a tela 029 (12:02 × 12:00, sem realce na hora) sai "igual (relógio)".

## S1. Scripts

- `tools/roda_retrad.sh` mudou durante uma execução (14/10 19:57) e o bash leu a versão nova pela metade ("syntax error near unexpected token do"). Sugestão: o script se copiar para um arquivo temporário e rodar a cópia.
- Erro de execução do QB64 abre uma janela modal ("Unhandled Error #n ... Continue?") e o programa fica parado até o limite do `roda_retrad.sh`, sem nada no log. Sugestão: `$CONSOLE`/`_ERRORLINE` no tratador do RT45, ou o roda_retrad procurar essa janela e gravar o texto dela no log. Para achar os erros desta família usei `tests/retraducao/viga/dbg_build.sh` (cópia do .BAS com `RT_LOG ERR/_ERRORLINE` em cada rótulo de ON ERROR).

## VPLOTA (arquivos de plotagem, 15/10/2026)

**Estado (rodada final de 15/10/2026).** Segundo o agente do tradutor, P6, R9, R10, R11 (commit 8983b7e) e R12 (d134727) foram atendidos. Os contornos saíram de `correcoes.json`, onde só restam as marcas PROTECAO (verificação de licença desativada); o `gera_str8.py` ficou fora de uso. Com o tradutor e o RT45 do repositório, todos os casos retrad_viga_* e retrad_vpl_* saem iguais (`comparacao.txt`).

Casos `$ORACULO/casos/retrad_vpl_*` (sufixos `vpl_*.sufixo.txt`). A obra de partida foi gravada pelo DESENHO original no caso `retrad_vpl_obra` (roteiro em `vpl_obra.oraculo.txt`, saída guardada fora do repositório): R1__E2E.DXF, R1__E2E.EDV, E2E.SEC, .FOR e .TAB.

### P6. Salto que leva o valor do FOR na pilha da FPU ("leva ST0")

- VPLOTA 0x56477 (lift `056272_FUN_5000_6272.lift.txt` linha 43: `GOTO L_583d3 ' leva ST0 = 1.0`). No .asm: `FLD [4660]` (1.0) e `JMP 583d3`, onde está `FSTP [1470]` (0x583d4). É o início de `FOR V_1470! = 1 TO L_BP22!` (folhas da visualização gráfica).
- Sai: `GOTO L_583d3`, e em L_583d3 `V_1470! = V_1470! + 1.0`, que parte do valor antigo de `V_1470!`. Esse valor é maior que o número de folhas, então a visualização acaba sem desenhar e sem a pergunta "Deseja alterar o posicionamento das Vigas" (casos retrad_vpl_dxf2 e retrad_vpl_avf1: o roteiro desanda e o FV1_E2E.DXF sai diferente).
- O mesmo em VPLOTA 0x14a66 (`0148da_F_148da.lift.txt` linha 24, `leva ST0 = V_15e2!`; `FLD [15e2]`, `JMP 14bb0`, `FSTP [16ac]` em 0x14bb1): `FOR V_16ac! = V_15e2!`, o 1º registro da faixa "I A J". Nos casos rodados a tela não mudou.
- Deveria: atribuir o valor levado e pular a soma, como o tradutor já faz com `leva AX` (VPLOTA 0x1c5b9 → `L_1cc05_v`) e com `leva ST0` no VIGA (0x48853 → `L_488fa_v`).
- Contorno: `V_1470! = 0.0` antes do GOTO (0x56477) e `V_16ac! = V_15e2! - 1.0` (0x14a66). A soma de 1 dá o valor exato.

### R9. `OPEN "LPT1:"` como arquivo

- VPCAD 0x30e89 (`0302fe_FUN_3000_02fe.lift.txt` linha 113): `OPEN V_0e3c$ FOR modo(2) AS #3`, com `V_0e3c$ = "LPT1:"` quando o PLOTER do PLOTER.INI usa a porta paralela (20º, "LOGICAL LTG 400/B - LPT") e a plotagem não vai para arquivo.
- No original a plotagem sai na impressora (oráculo retrad_vpl_edv6: 8344 bytes em `impressora.prn`). O tradutor emite `OPEN RT_ARQ$(V_0e3c$) FOR OUTPUT AS #3`. No Windows isso abre o dispositivo LPT1: o programa fica 5 minutos parado e mostra " Erro na plotagem".
- Deveria: `OPEN "LPTn:"` (e `"PRN"`) ir para o arquivo da impressora do RT45, junto com o LPRINT.
- Contorno: `RT_LPTABRE`, `RT_LPTQUEBRA 0`, `CLOSE #RT_LPT: RT_LPT = 0` e `OPEN RT_LPT_NOME FOR APPEND AS #3`. O próximo LPRINT reabre a impressora pelo RT_LPTABRE. Com ele a impressora sai igual byte a byte.

### R10. STR$ de DOUBLE com 16 algarismos (B$STR8)

- VPINI 0x55b82 (`0549e6_F_549e6.lift.txt` linha 170): `V_184a$ = STR$(VAL(V_184a$) - A_1436&(...) + A_1408%(...) * V_1484% * 1.0)`. O .asm faz a conta na FPU e chama `B$STR8` com um DOUBLE (0x55bf8, 0x55bfc).
- Oráculo retrad_vpl_dxf2 (escala 100 e viga deslocada): ` 78062.39999999999` no FV1_E2E.DXF. A V1 escreve ` 78062.4`. A conta dá o mesmo DOUBLE nos dois lados (entradas ` 4937.4 `, 1575, 747 e 100, registradas numa cópia de depuração). Esse DOUBLE é o mais próximo de 78062,4, e com 16 algarismos ele se escreve 78062.39999999999. O BRUN45 sempre escreve 16 algarismos significativos. O STR$ do QB64 escreve o texto mais curto que volta ao mesmo valor. Valores que não são o DOUBLE mais próximo (` 77167.60000000001`) já saíam iguais.
- Deveria: o STR$ (e o PRINT) de DOUBLE do RT45 escrever 16 algarismos significativos e tirar os zeros à direita, com o formato do QB4.5: espaço ou '-' na frente, sem o 0 antes do ponto e expoente `D`.
- Contorno: as 13 linhas `STR$(RT_DBL#(...))` do VPLOTA usam `_TOSTR$(ABS(x), 16)` (gerado por `gera_str8.py`). O contorno não trata expoente.

### R11. MID$ com comprimento negativo não dá erro

- VPCAD 0x30413, 0x3045c, 0x304f2, 0x30546, 0x316f5, 0x3173e, 0x317e7, 0x31830: `PRINT #3, MID$(V_0e48$, 1, INSTR(V_0e48$, "[") - 1); ...` (troca de pena).
- O 11º PLOTER do PLOTER.INI ("Calcomp 104x GT - 906/7/PCI") tem os comandos "nao configuravel", sem "[". No QB4.5 o comprimento -1 dá erro 5. O tratador do VPCAD (0x3025a) mostra " Erro na plotagem" e faz RESUME a cada Enter (oráculo retrad_vpl_edv5: o FV1_E2E.PLT fica com as 6 linhas de início). O MID$ do QB64 aceita -1, e a V1 plotava a folha inteira (16910 bytes).
- Deveria: MID$ (função e comando) com comprimento menor que 0, ou início menor que 1, dar erro 5, como no QB4.5.
- Contorno: `IF INSTR(...) - 1 < 0 THEN ERROR 5` antes de cada uma das 8 linhas.

### R12. RT_INKEY$ de trabalho joga fora teclas do roteiro (regressão, RT45.BM não commitado de 15/10 04:25)

- O `RT_INKEY$` novo tem `STATIC total`: depois de 20 consultas vazias a tecla sai "de qualquer jeito". O `total` só volta a 0 quando o próprio `RT_INKEY$` entrega uma tecla. Teclas lidas por LINE INPUT ou INPUT$ (`RT_ROT_TECLA$`) zeram `RT_ROT_VAZIOS`, mas não o `total`.
- O VPLOTA e o VIGA chamam o `MIXT_07f1_LimpaTeclado` (laço de INKEY$ até vir vazio) antes de cada pergunta. Cada chamada soma 1 ao `total`. Na 21ª, o 07F1 recebe a próxima tecla do roteiro e a descarta.
- Efeito (todos os casos rodados de novo em 15/10, com os contornos atendidos já retirados): v1 8/21 (largura "1189 m" e 3 Enter perdidos na edição dos 19 campos); vpl_edv6 e vpl_edv7 escolhem outro PLOTER (o 19º em vez do 22º); vpl_edv3 e vpl_edv5 param no meio; c1, x1, p3 e m1 recebem números trocados. Com a correção abaixo, numa cópia do RT45 fora do repositório (`$V1_TRAB/viga/dbgsrc`, ver `dbg_build.sh`), v1 e vpl_edv7 voltam a 21/21 e 19/19.
- Pedido: zerar o contador também no `RT_ROT_TECLA$`, junto com `RT_ROT_VAZIOS` (usei um `DIM SHARED RT_INKEY_TOTAL` no lugar do STATIC). Ou contar só as consultas seguidas do mesmo laço.

### S3. Oráculo: data 10-15-2026 com o relógio fixo

- O `E2E.AVF` grava `DATE$, TIME$` (VPLOTA 0x1bf35). Nos casos retrad_vpl_edv*, rodados entre 02:40 e 04:05 (horário de Brasília), saiu `10-15-2026`, embora o `dosbox-x.conf` tenha `date 10-14-2026`. O retrad_des_p9 (21:36) também mostra 10-15; o retrad_viga_a1 (20:30) mostra 10-14. Causa provável: depois das 21:00 de Brasília o dia UTC do contêiner já virou. O executor é do oráculo, não do tradutor; fica registrado aqui.
- Contorno: o `compara_obra.py` aceita 10-14-2026 × 10-15-2026 como "igual (relógio)".
- Resolvido no oráculo em 15/10: DATE$ e TIME$ ficam congelados em 10-14-2026 12:00:00 (o TIMER anda). Todos os casos da família (retrad_viga_* e retrad_vpl_*, menos retrad_vpl_obra e retrad_vpl_dxf*, que não gravam data) foram rodados de novo depois disso.

### Gráfico (com outro agente, RT45GFX)

- retrad_vpl_avf1, telas a06 e a07 (visualização das folhas em CGA): com o RT45GFX de 03:04 deram 263 pixels diferentes em cada. Com o de 15/10 posterior (rodada final) as duas saíram iguais, como as do retrad_vpl_dxf2. Os arquivos sempre bateram.
