# Pedidos ao tradutor (família DESENHO)

Itens que a família DESENHO (DESENHO, DESDIM, DESEDITA, DESGRAF, DESIMP, DESINIT, DESEDCAO) precisa de `tools/retraduz.py`, `tools/common_familia.py`, `tools/compara_retrad.py`, do RT45 ou do oráculo. Cada um traz o endereço, a linha do lift, o que sai hoje e o que deveria sair. Quando há contorno em `src-original/desenho/correcoes.json`, ele está indicado; quando o tradutor resolver, o contorno sai (as entradas geradas por script têm a evidência começando com o nome do script).

## Situação (rodada final, 15/10/2026)

Todos os pedidos fechados. Com o tradutor, o `common_familia.py`, o RT45 e o `compara_retrad.py` do commit 6fe5644 (6491e1f, d134727, 8983b7e) e o oráculo com DATE$/TIME$ congelados, os contornos saíram do `correcoes.json` (só ficaram as marcas PROTECAO) e os 10 casos `retrad_des_*`, rodados de novo no oráculo, saem iguais: 371 de 371 telas, 5 impressões e 23 arquivos gravados byte a byte (CHECKLIST.md). Os scripts de contorno (`gera_redim.py`, `gera_usingtab.py`, `gera_common.sh`) ficaram fora de uso.

| pedido | situação |
|---|---|
| D1 DIM de matriz de DS | resolvido no tradutor: sai `REDIM` (DESENHO 0x101f0..0x10a6e, DESDIM 0x11418) |
| D2 TAB antes do PRINT USING | resolvido no tradutor: `PRINT TAB(n); "";: PRINT USING ...` (DESDIM 22 linhas, DESENHO 2) |
| D3 matrizes de tela fora do COMMON | resolvido no `common_familia.py` (tipo pelo DIM sem sufixo e argumentos de GET/PUT): `A_1d76`, `A_1da4`, `A_1dd2` no bloco |
| D4 realce com empate | resolvido no `compara_retrad.py` |
| D5 relógio do oráculo | resolvido no oráculo (DATE$/TIME$ congelados em 10-14-2026 12:00:00); data e hora iguais nas telas e na impressora |
| D6 aviso falso de SWAP | resolvido antes (o tradutor não avisa mais) |
| D7 TAB do LPRINT | resolvido no RT45 (coluna da LPT1, só caracteres >= 32 andam): impressão do `graf` igual |
| traçado das diagonais | resolvido no RT45GFX: diagrama do DESGRAF igual pixel a pixel (`vis`, `edc`) e na impressão (`graf`) |

Histórico dos pedidos, como foram abertos:

## D1. `DIM` de matriz de DS dá erro 10 no QB64 (tradutor) — o mesmo do P1 da família VIGA

As matrizes de DS são declaradas "não dimensionadas" no começo (`REDIM SHARED A_0faa%(-32768 TO -32768)`, no `COMUM_DESENHO.BI` ou no `.BAS`). O `DIM` do lift sai como `DIM`, e o QB64 dá erro 10 (Array already dimensioned) em tempo de execução. Sem `ON ERROR` ligado, o QB64 abre a caixa "Unhandled Error" e o programa para.

- DESENHO 0x101f0 (`DIM A_0faa(0 TO 14)`, primeiro comando depois do `CLEAR`) e mais 68 `DIM` no nível de módulo (0x1020d..0x10a6e). Sem contorno, o DESENHO para antes da primeira tela.
- DESDIM 0x11418 (`DIM A_1e68(0 TO 14)` dentro da SUB 0x113f7): no QB64 o `DIM` dentro de SUB cria uma matriz local; o `REDIM` age na compartilhada, como o original.
- Saída hoje: `DIM A_0faa%(0 TO 14)   '@101f0`. Deveria sair: `REDIM A_0faa%(0 TO 14)   '@101f0` para toda matriz `A_xxxx` (DS) já declarada.
- Contorno: `tests/retraducao/desenho/gera_redim.py` grava `"lift: REDIM ..."` para os 70 `DIM` (evidência "REDIM").

## D2. `PRINT USING f$; TAB(n); ""; ...`: o `""` cai no primeiro campo (tradutor) — o mesmo do P2 da família PILAR e do A2 da ARMACAO

O `.asm` chama `B$FTAB` e `B$PSSD ""` antes do `B$USNG`. Traduzido na ordem do lift, o QB64 aplica o formato ao `""` e o item seguinte cai no campo errado.

- DESDIM 0x573a9: `PRINT USING V_0e00$; TAB(15); ""; V_0dfc$; L_BP0c%; ...` com `V_0e00$ = "\\ ##  ###.###    ##.##"`: o `"e"` vai para o campo `##`, erro 13, e o tratador do DESDIM mostra "erro no processamento" (caso `retrad_des_p5`, tela f21). Mais 21 linhas no DESDIM (0x54689..0x5790c, tela e LPRINT) e 2 no DESENHO (0x1a2e0, 0x1a406).
- Deveria sair: `PRINT TAB(15); ""; USING V_0e00$; V_0dfc$; ...`.
- Contorno: `tests/retraducao/desenho/gera_usingtab.py` (evidência "USINGTAB"). Com ele, a tela de dados da viga e a impressão dos esforços saem iguais ao oráculo (casos `det` e `vis`).

## D3. Matrizes do COMMON sem uso tipado ficam fora do bloco (common_familia.py; tradutor)

`A_1d76`, `A_1da4` e `A_1dd2` (DS:1D76/1DA4/1DD2, dentro do bloco DS:0DC0..1E06) são matrizes do COMMON: o DESENHO as apaga e redimensiona por placa a cada volta ao menu (0x11b72..0x11cd5: HER 0..7831, CGA/MCG 0..4001, EGA/VGA 0..28001) e elas passam pelos CHAIN. O DESGRAF guarda nelas a imagem do diagrama (0x12b40, `GET` em `A_1da4`) e o DESEDCAO a mostra na opção Esforços (0x1125c, `PUT` de `A_1da4`) e guarda/restaura a tela do editor em `A_1d76`/`A_1dd2` (0x109ad..0x1130f, 0x3058f).

- No lift elas só aparecem sem sufixo: `ERASE`/`REDIM` do DESENHO ("elemento 4 bytes (!/&/$)") e os argumentos crus de `B$GGET`/`B$GPUT`, dentro do comentário. O `tools/common_familia.py` descarta variável sem tipo ("só aparece como argumento sem tipo") e não lê os argumentos crus: o `COMUM_DESENHO.json` saía sem as três, e cada EXE as tinha como matriz própria (ou nenhuma).
- Efeito sem contorno: DESGRAF 0x12b40 sai `GET (0, 0)-(V_0e5c!, V_0e60!), A_1DA4(1)` com a matriz não declarada, erro 9, e o tratador L_10734 mostra "erro no processamento" (caso `retrad_des_p6`, tela g20); no DESEDCAO o mesmo em 0x109ad (caso `edc`, tela k05).
- Deveria: o `common_familia.py` dar a matriz sem sufixo pelo tamanho do elemento do `DIM`/`REDIM` (como o tradutor já faz, `!` para 4 bytes) e contar os nomes dos argumentos crus de `B$GGET`/`B$GPUT`. Seria bom o tradutor escrever `A_1da4!(1)` em vez de `A_1DA4(1)` (no QB64 dá no mesmo, porque o nome sem sufixo é SINGLE).
- Contorno provisório: `tests/retraducao/desenho/gera_common.sh` roda o `common_familia.py` sem mudança sobre uma cópia dos `.lift.txt` com um arquivo a mais (DESENHO, DESGRAF, DESEDCAO) que usa as três matrizes com `!`. O bloco continua DS:0DC0..1E06, agora com 277 variáveis.

## D4. `compara_retrad.py`: realce com empate do atributo "mais comum"

Telas com dois atributos empatados como mais frequentes (det `048_i01`, p5 `019_f19`: `47` e `3F` com 427 células cada) saem DIFERE só no `.realce.txt`. O texto e os 2000 atributos exatos são iguais (`atr_oraculo.py` contra o `.atr.txt` da V1). O oráculo escolhe com `max(set(atr), key=atr.count)` (ordem do `set`), o `RT_GRAVA_TELA` escolhe o menor código.

- Deveria: quando os atributos exatos batem, o `compara_retrad.py` não contar o realce (ou os dois lados desempatarem do mesmo jeito).
- Contorno: nenhum; conferido à mão (ver CHECKLIST.md, "Diferenças restantes").

## D5. Relógio do oráculo: a data muda conforme a hora do host (oráculo, não V1)

`ORACULO_DATA` padrão grava `date 10-14-2026` e `time 12:00:00` no autoexec (dosbox-x.conf da execução confere). Mesmo assim, execuções feitas com o host depois de ~21h (hora local) imprimem `10-15-2026    12:01` (casos `det`, `vis`, `p9`, `p11`, rodados de 21:36 em diante); a `p8`, rodada às 20:55, imprime `10-14-2026    12:02`. A V1 (`SISTRUT_DATA` padrão do `roda_retrad.sh`) imprime `10-14-2026    12:00`. Parece o DOSBox-X ajustando a data pelo dia UTC do contêiner.

- Efeito: o rodapé do relatório do DESDIM (data e hora, tela `j02` e `impressora.prn`) difere só na data e às vezes no minuto.
- Contorno: `tests/retraducao/desenho/compara.sh` troca `MM-DD-AAAA` e `HH:MM` por marcas fixas na `impressora.prn`; nas telas a diferença fica listada.

## D6. Aviso falso de SWAP inline (tradutor) — resolvido

Até o commit 907bf8a o tradutor avisava `?? 36 bytes com XCHG (SWAP inline?) nao reconhecido` em DESGRAF 0x1ab7e, que é dado depois do fim do módulo (`B$CENP` em 0x1aac0). Com o tradutor de 351cde1 o aviso não sai mais. Nenhum SWAP inline na família (grep `XCHG` nos `.asm`: só em dados e nas rotinas de cópia da tela).

## D7. `TAB` no LPRINT conta os caracteres de controle na coluna (RT45 ou tradutor)

DESGRAF, diagrama impresso (escala numérica, caso `graf`): 0x114d7 `LPRINT CHR$(12);`, 0x114f5 `LPRINT V_0f96$;` (ESC "O"), e 0x119ea `LPRINT TAB(20); ""; "OBRA - "; V_0dd8$; TAB(38); ""; "VIGA - "; V_0dd4$`.

- Oráculo (`impressora.prn`): `0C 1B 4F` + 18 espaços + "OBRA - E2E" (byte 21) + 8 espaços + "VIGA - V1" (byte 39). Para o BRUN45, FF e ESC não andam a coluna e o "O" anda uma: o TAB(20) parte da coluna 2.
- V1: `0C 1B 4F` + 16 espaços + "OBRA" (byte 19): o `TAB` do `PRINT #RT_LPT` usa a coluna do arquivo do QB64, que conta os três bytes. O resto da linha fica 2 bytes mais curto e a impressão do caso `graf` difere a partir do byte 19 (13.240 × 13.238 bytes; alinhando esses 2 bytes, o resto difere só dentro do bit-image do diagrama, ver "traçado" abaixo).
- Deveria: `TAB`/`SPC`/`,` do LPRINT usarem a coluna da LPT1 que o RT45 já conta em `RT_LPTQUEBRA` (CR zera, BS volta, os demais controles não contam), por exemplo com o tradutor emitindo `RT_LPTTAB$(n)` no lugar de `TAB(n)` nos `PRINT #RT_LPT`.
- Contorno: nenhum.

## Observado sem pedido (já com dono)

- Traçado de LINE em diagonal: o diagrama de esforços do DESGRAF (caso `vis`, tela `j04`, CGA 640x200) tem 604 pixels diferentes (305 só no oráculo, 299 só na V1), todos em degraus das retas inclinadas e das parábolas (imagem de diferença `diff_j04.png`, fora do repositório). Texto, eixos e retas horizontais/verticais iguais. A mesma imagem volta no Esforços do DESEDCAO (caso `edc`) e na cópia impressa do diagrama (caso `graf`: 339 bytes diferentes, todos dentro dos blocos ESC K/L). É o arredondamento do WINDOW/LINE que o agente do `RT45GFX.BM` está tratando; não contornado.
- CHAIN entre EXE compilados com versões diferentes do RT45 (arquivo de troca com a página gráfica): um DESDIM antigo lendo o arquivo de um DESGRAF novo parou em "Unhandled Error #9, Line 210 (in RT45.BM)" (`_PALETTECOLOR`). Recompilar a família inteira junto resolve; vale anotar no RETRADUCAO.md que todos os EXE de uma cadeia precisam do mesmo RT45.
