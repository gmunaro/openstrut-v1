# Pedidos ao tradutor, ao RT45 e aos scripts (família FORMA)

Família: FORMA, FORMEDCA, FORMIMP, FORMINIT, FORMPLOT (livros U19 a U30). Casos `$ORACULO/casos/retrad_frm_*`, resultado em `comparacao.txt` e `CHECKLIST.md`.

## Situação em 15/10/2026: todos resolvidos

O tradutor e o RT45 atenderam P1, P2, P3, R1, R2 e R3 nos commits 6491e1f, d134727, 8983b7e e 6fe5644. O `correcoes.json` ficou só com as marcas PROTECAO. Na rodada final, os 5 casos ficaram iguais ao oráculo:
- montagem 33/33, edita 35/35, imprime 15/15, plota 22/22, teclas 7/7;
- E2E.FRM, .FOR, .FOK e .DXF iguais byte a byte;
- `impressora.prn` igual (29.120 bytes).

Conferências desta rodada:
- R3: o BRUN45 dá erro 64 ao abrir `C:\.FRM`, o mesmo número que o RT45 usa. Sonda `retrad_frm_err`, `sonda_line/ERR.BAS` e `ERR.oraculo.OUT`.
- R2: a sonda STY sai igual ao oráculo com o RT45GFX. Na família, o retângulo do zoom (edita b25) e os tracejados da impressora (imprime) batem.
- A data 10-15-2026 que aparecia no E2E.FRM do caso edita era do oráculo antigo. Com `DATE$`/`TIME$` congelados, os dois lados gravam "10-14-2026   12:00".

Abaixo, o texto original de cada pedido, para registro.

## P1. `DIM` de matriz dinâmica do COMMON dentro de SUB dá erro 10 no QB64 (tradutor)

- Onde: FORMEDCA, SUB FUN_3000_018c (gera o .FOR), 0x30199, 0x301bd, 0x301d5, 0x301ed, 0x3020c, 0x3022b: `DIM A_125c(0 TO 13, 0 TO 1)` etc.
- Sai: `DIM A_125c!(0 TO 13, 0 TO 1)` no corpo da SUB, com `REDIM SHARED A_125c!(-32768 TO -32768, ...)` em `COMUM_FORMA.BI`.
- No QB4.5 o DIM de matriz dinâmica apagada é válido, e a SUB apaga as seis no fim (ERASE em 0x376a4). No QB64 o DIM sobre a matriz já criada pelo REDIM SHARED dá erro 10. Evidência: no caso `retrad_frm_montagem`, a V1 caía em "erro no processamento" no F/V do editor. Uma cópia de depuração com `RT_LOG ERR/_ERRORLINE` no tratador L_1f4b8 deu "ERRO 10" na linha do DIM @30199.
- Deveria sair `REDIM`, a mesma regra das matrizes locais. É o pedido P1 da VIGA (DIM no nível de módulo), estendido a DIM dentro de SUB de matriz que está no COMMON.
- Contorno: `correcoes.json`, as 6 linhas viram REDIM.

## P2. `ERASE` de matriz do COMMON antes do CHAIN: `RT_COMMON_GRAVA` entra em erro 9 (tradutor ou common_familia.py)

- É o mesmo problema do P4 do PILAR. Aqui o efeito é pior: o tratador do CHAIN do FORMEDCA (L_1f975) faz `RESUME` e tenta de novo, e a V1 fica num laço sem fim no S (Segue) do editor. Evidência: caso `retrad_frm_montagem` antes do contorno; o log de depuração dava "ERRO 9" na linha do `$INCLUDE: 'COMUM_FORMA.BM'` (LBOUND de matriz apagada).
- Contorno: em `correcoes.json`, os 22 ERASE de matriz do COMMON que não têm REDIM logo depois viram `REDIM m(-32768 TO -32768, ...)`. São FORMA 0x20a94, 0x20aa2 e 0x2109b..0x21116 (13), FORMEDCA 0x376a4..0x376d6 (6) e FORMINIT 0x16a2a.
- Deveria: o tradutor emitir sempre o ERASE de matriz dinâmica como esse REDIM (a sugestão do PILAR P4).

## P3. Matriz estática usada só em GET/PUT gráfico sai com 1 elemento (tradutor)

- Onde: FORMEDCA, os rótulos dos pilares e das vigas no editor. São 5 GET e 16 PUT, por exemplo 0x10eb1: `B$GGET(DS, 6948, 10192)` e `B$GGET(DS, 8350, 13348)`.
- O asm (0x10fd0..0x10fdb) passa ES:BX = DS:1B24 (os dados) e AX = 0x27D0 (o descritor). São duas matrizes estáticas que o compilador reserva no DGROUP, sem DIM no código. O tradutor declara `REDIM SHARED A_27d0!(-32768 TO -32768)` e o GET dá erro 5. Evidência: no caso `retrad_frm_edita`, o P do editor caía em "erro no processamento"; no log de depuração, ERRO 5 no GET @10eb1.
- Tamanho tirado do leiaute do DS: as variáveis do FORMEDCA vão até `V_1b1e` e recomeçam em `V_2242`. A primeira matriz ocupa DS:1B24..209D (1.402 bytes) e a segunda DS:209E..2241 (420 bytes).
- Deveria: reconhecer `B$GGET/B$GPUT(DS, dados, descritor)` como matriz estática e tirar o tamanho do descritor. O P3 da VIGA descreve o leitor de descritor (`$REA_WORK/tools/ds.py`).
- Contorno: `correcoes.json` FORMEDCA 0x101d4, `REDIM A_27d0!(0 TO 350)` e `REDIM A_3424!(0 TO 104)` no início do programa.

## R1. `TAB(n)` com o cursor depois da coluna n rola a tela no QB64 (RT45 ou tradutor)

- Onde: FORMPLOT 0x11392, na prévia da folha de plotagem: `LOCATE 24, 1: PRINT " " + 4 setas + " movimenta ... <P>asso"; TAB(79); ""; "";`. O texto tem 79 caracteres, e o cursor fica na coluna 80.
- No QB4.5, o TAB(79) leva o cursor à coluna 79 da linha 25 sem rolar a tela. Evidência: oráculo, caso `retrad_frm_plota`, tela d09, molduras em y = 5, 8, 167 e 170.
- No QB64, o mesmo comando rola a tela uma linha, e a prévia saía 8 pixels acima (7.776 pixels diferentes). Teste isolado em `sonda_line/TAB79.BAS` (QB64 PE 4.7.0, SCREEN 2, VIEW PRINT 1 TO 25, LOCATE 24): STRING$(79) seguido de TAB(79) apaga a linha desenhada em y = 5; STRING$(78) seguido de TAB(79) não apaga; STRING$(79) sem TAB também não.
- Deveria: TAB passar por uma rotina do RT45 (por exemplo `RT_TAB$(n)`) que, quando POS(0) > n, faça LOCATE na linha seguinte (e só role se o cursor já estiver na última linha da janela).
- Contorno: `correcoes.json` FORMPLOT 0x11392: `PRINT ...;: LOCATE CSRLIN + 1, 79` (o comando sempre começa em LOCATE 24, 1).

## R2. LINE com estilo: linha horizontal da direita para a esquerda e lados verticais do B (RT45)

Sonda do BRUN45 no oráculo: caso `retrad_frm_sty`. O programa é `sonda_line/STY.BAS`, compilado com o BC do QB4.5 no DOSBox-X. A saída do oráculo está em `sonda_line/STY.oraculo.OUT` e a do mesmo programa no QB64 em `sonda_line/STY.qb64.OUT`.

| linha | BRUN45 (pixels acesos) | QB64 |
|---|---|---|
| `LINE (220,30)-(120,30),1,,&H2` (horizontal, da direita para a esquerda) | 134, 150 … 214 (o padrão começa no x menor) | 126, 142 … 206 (começa no x1) |
| `LINE (400,20)-(483,101),1,B,&H1111`, lado esquerdo | 21, 25 … 97, 101 | 22, 26 … 98, 101 |
| o mesmo, lado direito | 20, 23 … 99, 101 | 20, 23 … 99 (sem o 101) |
| verticais nos dois sentidos, PSET + `LINE -`, padrão reiniciado a cada LINE | iguais | iguais |

- O BRUN45 troca as pontas para desenhar com x crescente, e o QB64 não troca. No B, os lados verticais têm outra fase.
- Efeito na família: no caso `retrad_frm_edita`, tela b25 (retângulo elástico do zoom, `LINE -(...),,B,&H1111` em 0x273e4), há 81 pixels diferentes, só nos lados verticais. No caso `retrad_frm_imprime`, há 93 bytes diferentes no gráfico da impressora, só nos 3 eixos tracejados (`&H0002`, FORMIMP 0x21126/0x21382): os pontos estão nas mesmas linhas, deslocados de 5 pixels.
- Deveria: o RT45 desenhar LINE com estilo pelo traçado do BRUN45: pontas trocadas para x crescente, e a ordem e a fase dos 4 lados do B como na tabela. É do mesmo grupo do R6 da VIGA (traçado de LINE diagonal).
- Contorno: nenhum. As pontas dependem dos dados, e trocá-las no `correcoes.json` não cobre todos os casos.

## R3. Nome de arquivo que o DOS recusa é aceito no Windows (RT45)

- Onde: FORMEDCA, opção G (gravação) com o nome vazio: `OPEN "O", #1, "C:\" + "" + ".FRM"` (0x1c4e5).
- No original, o DOS recusa `C:\.FRM`. O tratador (0x1f36d) mostra " VERIFIQUE O SEU DRIVE", que é o ramo de erro diferente de 61 e de 71, e volta ao menu. Evidência: caso `retrad_frm_montagem`, telas a20 e a21.
- Na V1, o Windows aceita o nome e grava um arquivo `.FRM` na pasta C:. A tela a21 sai diferente (2.826 pixels), e sobra o arquivo `.FRM` ("SO V1" em `comparacao.txt`).
- Deveria: `RT_ARQ$` (ou o OPEN do RT45) recusar nomes que o DOS recusa (nome vazio antes do ponto, mais de 8+3 caracteres, caracteres inválidos) com o erro que o DOS daria. O número exato não foi medido; no original ele não é 61 nem 71.
- Contorno: nenhum.

## Já pedidos por outras famílias (só referência)

- Relógio (PILAR P10, VIGA R7, LAJE P7): resolvido com `DATE$`/`TIME$` congelados nos dois lados. Antes, o E2E.FRM saía "12:01"/"12:03" no oráculo e "12:00" na V1.
- Cursor do LINE INPUT em modo gráfico (LAJE P10) e `LINE INPUT ;` sem avanço de linha (LAJE P12): já resolvidos no RT45 atual. Antes da correção, os casos desta família tinham 64 pixels de diferença em cada tela gráfica gravada durante um LINE INPUT e a rolagem errada no F/P do editor (FORMEDCA 0x1dd3d, B$LNIN com 3). Agora essas telas batem.
