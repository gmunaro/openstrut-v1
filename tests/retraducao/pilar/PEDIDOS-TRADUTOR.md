# Pedidos ao tradutor (família PILAR)

Itens que o dono da família PILAR pediu a `tools/retraduz.py`, `tools/common_familia.py`, `src-original/comum/**` (RT45, RT45GFX) ou aos scripts de teste, com o endereço, o que saía e o que deveria sair.

## Situação (15/10/2026, rodada final)

Todos resolvidos. O `correcoes.json` da família ficou só com as marcas PROTECAO (verificação de licença desativada); os scripts dos contornos (`erase_common.py`, `using_tab.py`, `csng_pu.py`) estão fora de uso e ficam como registro. Conferido com os 11 casos da família, oráculo e V1 com o relógio congelado (ver `CHECKLIST.md`).

| pedido | assunto | dono | resolvido em | conferido em |
|---|---|---|---|---|
| P1 | ERASE de matriz do COMMON sem sufixo | tradutor | commits 6491e1f a 6fe5644 (ERASE de dinâmica vira REDIM não dimensionada, com o tipo do COMMON) | PILAREDI compila sem contorno; 0x1078f sai `REDIM A_12ae$(...)` |
| P2 | TAB antes do USING | tradutor | 9b33d44 (A2 da armação) | ref_pilaredi, dim |
| P3 | `CSNG` dentro do `RT_PU#` | tradutor | 9b33d44 (`RT_SNG!`) | dim, secoes (impressora igual) |
| P4 | ERASE de matriz do COMMON antes do CHAIN (erro 9) | tradutor | junto com P1 | teclas (F2 do PILAREDI volta ao PILAR) |
| P5 | dois blocos COMMON na família | common_familia.py | commits 6491e1f a 6fe5644: `--nome` | `gera.sh` usa `--nome pilaredi` |
| P6 | PILAR 0x44a33 | prep/lift | dump de 15/10 (vai para L_48808) | PILAR traduzido com 0 avisos |
| P7 | quebra de 80 colunas da LPT1 | RT45 | 9b33d44 | geo (impressora igual) |
| P8 | FILES sem arquivo sem erro 53 | RT45 | 9b33d44 | geo, tela r02 |
| P9 | CIRCLE | RT45GFX | d134727 | graf: tela v05 e impressora iguais |
| P10 | hora anda com o tempo real | RT45/oráculo | relógio congelado em 10-14-2026 12:00:00 nos dois lados | dim (rodapé), geo (E2E.COL e E2E.BAK iguais) |
| P11 | INKEY$ do roteiro engole tecla no 07F1 | RT45 | commits 6491e1f a 6fe5644 | verif 5/5, verif2 8/8 |
| P12 | SQR de negativo | tradutor/RT45 | commits 6491e1f a 6fe5644: `RT_SQR##` (NaN sem erro; CINT/CLNG de NaN = -32768) | poliinv 14/14 ("ESTA SECAO NAO SUPORTA" igual ao original) |
| P13 | cor par no SCREEN 2 | RT45GFX | d134727 | sec: 3 diagramas de interação e impressora (44341 bytes) iguais |
| P14 | PRINT emendado no PRINT USING | tradutor | 351cde1 | ref_pilaredi, dim, sec |

Histórico de cada pedido abaixo (como foi escrito, com o estado de então).

## P1. ERASE de matriz do COMMON sai sem sufixo quando o EXE nunca a indexa (tradutor)

PILAREDI 0x1078f, lift `ERASE A_12ae`. O PILAREDI só apaga `A_12ae` (antes do CHAIN para o PILAR); quem a dimensiona e usa é o PILGEEDI (`REDIM A_12ae$(0 TO V_0e34, 0 TO V_0e38, 0 TO 3)`, 0x1181b; recebe MID$ em 0x1282a). O COMMON (`COMUM_PILAREDI.json`) a declara `A_12ae$`.

- Sai hoje: `ERASE A_12ae   '@1078f`; o QB64 recusa (sem sufixo é a matriz SINGLE, que não existe): o PILAREDI não compila.
- Deveria sair: o tipo do COMMON quando a variável está no bloco: `ERASE A_12ae$` (ou, com o P4, `REDIM A_12ae$(-32768 TO -32768, -32768 TO -32768, -32768 TO -32768)`).
- Contorno: `correcoes.json`, PILAREDI 0x1078f.

## P2. `PRINT USING` com TAB antes do formato (RESOLVIDO: tradutor, item A2 da família ARMACAO)

O tradutor agora escreve `PRINT TAB(55); "";: PRINT USING L_BP5e$; ...`. Conferido: o caso `ref_pilaredi` passa no predimensionamento (0x40be0) sem o contorno. Histórico abaixo.

O lift escreve `PRINT USING f$; TAB(n); ""; x`, mas o `.asm` chama `B$FTAB`, `B$PSSD ""` e só depois `B$USNG` e o item (PILGEEDI 0x1968c..0x196ab; PILAR 0x35fd2..0x3601c com `B$LPRT` antes). O original é `PRINT TAB(n); ""; USING f$; x`. Traduzido na ordem do lift, o QB64 aplica o formato numérico ao `""` e dá erro 13 (Type mismatch). No PILAREDI isso derruba o predimensionamento (0x40be0) no tratador "erro no processamento": o caso de referência `caso_c_pilaredi` dava 3 de 9 telas iguais.

- O QB64 aceita `USING` no meio do PRINT (teste avulso `T1.BAS`, fora do repositório: `PRINT #1, TAB(55); ""; USING f$; x` sai na coluna 55 com o formato).
- Deveria sair: `PRINT TAB(55); ""; USING L_BP5e$; RT_PU#(V_0f88!, L_BP5e$, 1);` (e `PRINT #RT_LPT, TAB(22); ""; USING ...` no LPRINT).
- Ocorrências na família: PILAREDI 0x40be0, 0x51095, 0x52556; PILGEEDI 0x19683, 0x230af, 0x23408, 0x24cc8, 0x25022; PILAR 0x35fcd, 0x364e5, 0x36c9e (LPRINT). Em todos os lifts: 75 linhas casam com `USING [^;]*; TAB(` (`grep -rh "USING [^;]*; TAB(" dump/*/*.lift.txt`).
- Contorno: `correcoes.json`, as linhas acima, geradas por `tests/retraducao/pilar/using_tab.py` (pega a linha do tradutor e só move `TAB(n); "";` para antes do `USING`).

## P3. `RT_PU#(CSNG(expr _FLOAT))` não arredonda para SINGLE (RESOLVIDO: tradutor emite `RT_SNG!`)

Histórico:

Ver `tests/retraducao/laje/PEDIDOS-TRADUTOR.md`, P8. Na família PILAR: PILAREDI 26 linhas, PILGEEDI 3.

- Contorno: `correcoes.json`, `CVS(MKS$(expr))` no lugar de `CSNG(expr)`, gerado por `tests/retraducao/pilar/csng_pu.py`.

## P4. ERASE de matriz do COMMON antes do CHAIN: o RT_COMMON_GRAVA para em erro 9 (common_familia.py ou tradutor)

PILAREDI, F2 no menu (rotina 0x106d6): `ERASE` das 19 matrizes do COMMON (0x1075d..0x1080e) e `CHAIN V_0e00$ + "PILAR"` (0x10826). No QB64, `LBOUND` de matriz dinâmica apagada dá erro 9; o `RT_COMMON_GRAVA` gerado testa `IF LBOUND(m, 1) <> -32768` e o erro cai no tratador do programa (0x10843): " Modulo nao encontrado em C:\SISTRUT\EXEC40\" e fim, em vez de voltar ao PILAR. Evidência: cópia de depuração com `RT_LOG ERR/_ERRORLINE` nos tratadores (`dbg.sh`, fora do repositório): "ERRO 9 linha 7904" (o `$INCLUDE` do `COMUM_PILAREDI.BM`).

- No QB4.5 a matriz apagada não existe e o CHAIN passa; o PILAR redimensiona o que usa.
- Deveria: ou o tradutor emitir `ERASE` de matriz dinâmica como `REDIM m(-32768 TO -32768, ...)` (o estado "não dimensionada" do RT45; o acesso depois dá erro 9 nos dois), ou o `RT_COMMON_GRAVA`/`RT_PROG_LIMPA` tolerarem matriz apagada (não há função no QB64 para perguntar; teria de ser por ON ERROR local no RT45). A primeira é mais simples.
- Contorno: `correcoes.json`, todo `ERASE` de matriz do COMMON nos quatro EXE do bloco PILAREDI (PILAREDI 53, PILGEEDI 11, PIPROEDI 3, PIGRAEDI 12), gerado por `tests/retraducao/pilar/erase_common.py`.

## P5. Dois blocos COMMON na mesma família (common_familia.py)

O PILAR troca com o PILAREDI só DS:0DC0..0F87 (DS:0F8A do PILAR cai dentro de DS:0F88 do PILAREDI); o PILAREDI troca com PILGEEDI/PIPROEDI/PIGRAEDI DS:0DC0..1483 (níveis, colunas, `V_107e$` "VOLTA ...", `V_11a6%` n. de colunas, matrizes A_11c8..A_141e). Com um bloco só (0DC0..0F87) a volta do PILGEEDI ao PILAREDI perde as colunas e as marcas que liberam a opção 3.

- `common_familia.py` grava em `<saida>/<familia>/COMUM_<FAMILIA>.*`: para gerar `COMUM_PILAREDI` dentro de `src-original/pilar/` é preciso gerar numa pasta temporária e copiar (`tests/retraducao/pilar/gera.sh`).
- Deveria: uma opção `--nome` (nome do bloco) separada da pasta da família.
- Contorno: `gera.sh` (gera em pasta temporária e copia; o PILAREDI e os filhos usam `--common src-original/pilar/COMUM_PILAREDI.json --comum-nome pilaredi`).

## P6. PILAR 0x44a33 (RESOLVIDO no prep/lift de 15/10: o salto vai para L_48808)

`JMP 4000:e5cb` cai em zeros no EXE derivado (módulo 4000 com tamanho errado no realinhamento). Em conserto por outro agente; o PILAR só é traduzido depois do dump novo.

## P7. LPRINT: quebra automática na coluna 80 da LPT1 (RESOLVIDO: RT45 conta a coluna, `RT_LPT_COL`)

Conferido: `impressora.prn` do caso `retrad_pil_geo` igual ao do oráculo (478 bytes) sem contorno. Histórico:

PILGEEDI, "Impressao dos dados" (item 7, por colunas, com dados geométricos): o cabeçalho `"Carga  Acumulada  Ma Incl ... Mb Incl"` (0x15b29, 0x16ff4) tem 80 caracteres e as linhas de dados montadas por `PRINT USING` em pedaços (0x15b..) dão 80 com os valores do caso. O BRUN45 manda CR LF ao chegar na coluna 80 e depois o CR LF do LPRINT: uma linha em branco a mais depois de cada uma. Evidência: `impressora.prn` do oráculo no caso `retrad_pil_geo` (linhas de 80 seguidas de linha vazia; a V1 não tem a linha vazia). O PILAREDI usa `WIDTH LPRINT 132` só no relatório do dimensionamento e volta a 80 (0x52a5f, 0x52ffb); ali as linhas de 130 saem iguais.

- Deveria: o RT45 contar a coluna da LPT1 em todo `PRINT #RT_LPT` (inclusive `USING` e `;`) e mandar CR LF ao chegar na largura corrente (`RT_LPTLARGURA`, 80 por padrão).
- Contorno: só para o cabeçalho fixo (`correcoes.json`, PILGEEDI 0x15b29 e 0x16ff4, com um `PRINT #RT_LPT, ""` a mais). As linhas de dados dependem dos valores e ficam como diferença até o RT45 contar a coluna.

## P8. FILES sem arquivo que case: falta o erro 53 (RESOLVIDO no commit 9b33d44; era o R4 da família VIGA)

Conferido: tela `r02` do caso `retrad_pil_geo` igual ao oráculo. Histórico:

PIGRAEDI, item 1 (Criação de arquivo): `FILES "C:\*.COL"` (0x165f3) numa pasta sem .COL. No original o FILES escreve a pasta (`C:\`) e dá erro 53; o tratador escreve " Nenhum Arquivo Encontrado" (0x1665e). O `RT_FILES` escreve a pasta e " 2013265920 Bytes free", sem erro. Evidência: caso `retrad_pil_geo`, tela `r02` (linha 18). Os mesmos pontos existem em PILAREDI 0x1296a, 0x12fda, 0x379e4 e PILGEEDI 0x11229 (cada um com o seu " Nenhum Arquivo Encontrado").

- Deveria: `RT_FILES` dar `ERROR 53` depois de escrever a pasta quando nenhum arquivo casa (é o que o DOS/BRUN45 faz; a linha "Bytes free" não sai).
- Contorno: nenhum (seria reescrever o RT_FILES dentro do correcoes.json).

## P9. CIRCLE rasteriza diferente do BRUN45 (RT45GFX: só anotado, sem contorno)

PILAREDI, desenho das seções com a armadura (tela de aceite da armadura, tecla D; rotina 0x5ab4c `CIRCLE (V_1006!, V_100a!), raio, cor`, uma por barra). Caso `retrad_pil_graf`, tela `v05` (CGA 640x200): 118 pixels diferentes, todos nos 4 círculos das barras (linhas 45-51 e 149-155 da tela; o resto do desenho, retângulos, cotas e textos, é igual). Exemplo, linha 45: oráculo `.#...###########...`, V1 `.#..#############..`. A cópia da tela na impressora (`impressora.prn`, a partir do byte 3519) difere pelo mesmo motivo.

- O CIRCLE do QB64 (raio pequeno, razão de aspecto padrão do SCREEN 2) não acende os mesmos pixels que o `B$CIRC` do BRUN45.
- Deveria: o RT45 ter um `RT_CIRCLE` com o algoritmo do BRUN45 (pontos por octante com a razão de aspecto 4/3 x 200/640 do modo 2), e o tradutor emitir `RT_CIRCLE` no lugar do CIRCLE. Precisa ler o `B$CIRC` do BRUN45 (não é da família).
- Contorno: nenhum.

## P10. Hora impressa e gravada anda com o tempo real (RT45 / comparação) — o mesmo do P7 da LAJE e do R7 da VIGA

Com o relógio fixo os dois lados começam em 2026-10-14 12:00:00, mas o relógio anda com o tempo de execução: o oráculo (DOSBox-X) leva 80 s até o relatório do dimensionamento e a V1 2 s. Diferenças que sobram só por isso: `impressora.prn` do caso `retrad_pil_dim` (byte 1440, rodapé `10-14-2026    12:01:22` no oráculo e `12:00:02` na V1) e os arquivos `E2E.COL`/`E2E.BAK` do caso `retrad_pil_geo` (linha 3, "inicializado em 10-14-2026 12:02:28" × "12:00:06").

- Deveria: um modo do relógio que não dependa da velocidade (por exemplo, avançar um tempo fixo por tecla do roteiro nos dois lados), ou a comparação ignorar `HH:MM:SS` quando só ele difere.
- Contorno: nenhum; essas diferenças estão explicadas no CHECKLIST.

## P11. INKEY$ do roteiro: o contador de consultas vazias não zera entre leituras diferentes (RT45)

`RT_INKEY$` devolve vazio nas 2 primeiras consultas e a tecla na 3.ª; `RT_ROT_VAZIOS` só zera quando uma tecla é entregue. Se o programa chama a rotina que esvazia o teclado (MIXT 07F1, uma consulta) várias vezes sem ler tecla entre elas, a 3.ª chamada recebe a tecla do roteiro e a joga fora. Caso `retrad_pil_verif` (PILAR opção 6, verificação NB1; com o PILAR provisório do dump antigo, módulo 3000 igual): depois da verificação, o programa volta a "Forca Normal Nk(t) *FIM*" (0x30392, `PRINT`; 0x303a9, `CALL MIXT_07f1`; 0x303b3, `LINE INPUT`). A tela `p03` sai com o prompt pela metade ("Forca Normal Nk(t", gravada dentro do 07F1) e o `{ENTER}` seguinte é engolido pelo 07F1; a tela `p04` fica na verificação em vez do menu. Os números (impressora, 2098 bytes) batem.

- No oráculo o KEYFEED só põe a tecla quando a anterior foi consumida e a tela ficou parada; uma consulta isolada nunca recebe tecla.
- Deveria: zerar `RT_ROT_VAZIOS` sempre que o programa escreve na tela (PRINT/LOCATE/CLS) ou contar só consultas seguidas sem saída entre elas.
- Confirmado (15/10, commit 9b33d44) com uma cópia do MIXT que registra cada consulta do 07F1: depois do `{ENTER}` de "Dados Corretos" (posição 45 do roteiro) o PILAR chama o 07F1 três vezes sem ler tecla; a 3.ª recebe o `{ENTER}` da posição 47 (e grava a tela `p03` nesse momento).
- Contorno: nenhum (tirar o 07F1 mudaria o comportamento com teclas digitadas antes da hora).

## P12. SQR de número negativo: erro 5 no QB64, NaN sem erro no oráculo (tradutor/RT45)

PILAREDI 0x4aa1e e 0x4aa4c (índice de esbeltez da seção poligonal): `CINT(L / SQR(J / A) * 100)`. Com a poligonal digitada no sentido anti-horário (a tela pede horário) a área `V_104a!` sai negativa (-400) e o SQR recebe negativo. No oráculo o `FSQRT` dá NaN sem exceção (DOSBox-X, mesma situação de `1/0` no RETRADUCAO.md, "Divisão por zero e overflow") e o original segue até "ESTA SECAO NAO SUPORTA OS ESFORCOS ATUANTES..." (caso `retrad_pil_poliinv`); a V1 dá erro 5 e mostra "erro no processamento". Evidência: cópia de depuração com `RT_LOG` (`fdc= 93333.33 a=-400`, "ERRO 5 linha ... em L_103c6").

- Deveria: `SQR` sair como uma função do RT45 que devolve NaN para negativo (como o x87 com a exceção mascarada) e `CINT`/`CLNG` de NaN devolverem o "integer indefinite" do x87 (-32768 / -2147483648), sem erro. Vale para LOG de não positivo também.
- Contorno: nenhum; o caso `secoes` usa a poligonal no sentido horário (caminho normal, igual ao oráculo) e o `poliinv` fica como prova da diferença.

## P13. Cor par no SCREEN 2 (CGA 640x200) não acende o pixel no QB64 (RT45GFX: só anotado, sem contorno)

PILAR, opção 3 (Processar), diagramas de interação: as três curvas saem com `LINE ..., CINT(V_1016!)`, com `V_1016!` = 11, 12 e 14 (0x1752d, 0x17559, 0x17585; também 0x17d38.. e 0x18926.. para os trechos tracejados). No oráculo as três curvas aparecem (o BRUN45 acende o pixel para qualquer cor diferente de 0 no modo 6); na V1 só a curva da cor 11 aparece: o QB64 usa a cor módulo 2 no SCREEN 2, e 12 e 14 viram 0. Evidência: caso `retrad_pil_sec`, telas `d02`, `d03` e `d04` (1.229 a 1.249 pixels diferentes, todos nas curvas (2) e (3); eixos, textos e a curva (1) iguais) e a cópia dessas telas na impressora (`impressora.prn` a partir do byte 5666).

- Deveria: no modo 2 (e no 3, Hercules) toda cor diferente de 0 vira 1 em LINE, PSET, CIRCLE, PAINT e no texto gráfico, como o BRUN45. Falta conferir o que o BRUN45 faz com cor par no SCREEN 9 (EGA), que tem 16 cores.
- Contorno: nenhum (diferença gráfica: fica com o agente do RT45GFX).

## P14. PRINT emendado no PRINT USING anterior mesmo com B$PEOS entre eles (tradutor) — URGENTE, regressão do 9b33d44

A regra nova (`RT_USING_RESTO$`, VIGA P4: item com CALL no meio do PRINT USING) pega também PRINTs que são comandos separados. Nos 8 casos da família o PRINT USING anterior termina com `B$PEOS` (fim de comando com `;`) e o PRINT seguinte começa com `B$EVCK`: PILAR 0x36878; PILAREDI 0x40c12, 0x4376d, 0x438c7, 0x45b2b, 0x510c7; PILGEEDI 0x2364b, 0x25265 (chamadas do runtime entre os dois endereços conferidas no `.asm`, ex.: PILAREDI 0x40be0..0x40c12 = B$EVCK, B$FTAB, B$PSSD, B$USNG, B$PSR4, B$PEOS).

- Sai hoje: `PRINT USING RT_USING_RESTO$(L_BP5e$, 1); V_0ddc$   '@40c12 (continua o PRINT USING de @40be0)`. O formato `"######.## "` só tem um campo; o resto recomeça no campo numérico e o QB64 dá erro 13 com a string: o predimensionamento cai em "erro no processamento" (caso `ref_pilaredi`, 3 de 9 telas iguais; todos os casos de edifícios param aí).
- Deveria sair: `PRINT V_0ddc$`. Critério sugerido: só emendar quando não houver `B$PEOS`/fim de comando do PRINT USING antes do endereço novo.
- Contorno: `correcoes.json`, as 8 linhas acima com o PRINT simples do lift.
