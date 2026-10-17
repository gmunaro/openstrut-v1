# Pedidos ao tradutor (família LAJE)

Itens que o dono da família LAJE precisa de `tools/retraduz.py`, `src-original/comum/**` (RT45) ou de `tools/compara_retrad.py`. Cada um traz o endereço, a linha do lift, o que sai, o que deveria sair e a evidência. Quando há contorno provisório em `src-original/laje/correcoes.json`, ele está indicado; quando o tradutor resolver, o contorno sai do `correcoes.json` (as entradas provisórias têm "PROVISORIO (PEDIDOS-TRADUTOR Pn)" na evidência).

## Situação

Atualizada em 15/10/2026, depois dos commits 9b33d44, 86cb56d, 062dbdc, 351cde1, d134727 e 8983b7e (RT45GFX e data/hora congeladas), com o oráculo rodado de novo às 08:24–08:39 (data/hora congeladas também lá). O `correcoes.json` da família ficou só com as marcas PROTECAO (verificação de licença desativada); os contornos provisórios (P1, P8, P9, P11) saíram e os 6 EXE foram regenerados e recompilados sem eles.

| pedido | assunto | dono | situação | conferido |
|---|---|---|---|---|
| P1 | SWAP inline some como "?? N bytes" | tradutor | resolvido (9b33d44) | sim: as 20 linhas saem `SWAP` do tradutor; calc, calc2, fluxo iguais |
| P2 | ERASE/GET/PUT com matriz INTEGER sem sufixo | tradutor | resolvido (09f39ab) | sim (compila; fluxo igual) |
| P3 | FOR com STEP variável | tradutor | resolvido (09f39ab) | sim (fluxo, LAJEGEOM) |
| P4 | PUT # de registro (.VIG) | tradutor + RT45 | resolvido | sim: E2E.VIG do fluxo igual ao do oráculo, byte a byte |
| P5 | `=` dentro do índice do destino | tradutor | resolvido (09f39ab) | compila; fluxo igual |
| P6 | cor do LINE com comparação de string | tradutor | resolvido (09f39ab) | compila; ver P15 |
| P7 | data/hora | RT45 / oráculo | resolvido: DATE$/TIME$ congelados nos dois lados | sim: impressora e obras iguais byte a byte, inclusive a hora; nenhum "igual (relógio)" |
| P8 | `CSNG` não arredonda dentro do `RT_PU#` | tradutor | resolvido (9b33d44) | sim: peso próprio 0.17 (calc) |
| P9 | quebra de 80 colunas da LPT1 | RT45 | resolvido (9b33d44) | sim: calc 34/34 sem o contorno |
| P10 | cursor do LINE INPUT em modo gráfico | RT45 | resolvido (9b33d44) | sim: calc2 e fluxo sem as diferenças de 64 pixels |
| P11 | comparação SINGLE × DOUBLE feita em SINGLE | tradutor | resolvido (9b33d44) | sim: LAJEGEOM 0x43ef1 sai com `FX##` nos dois lados; fluxo passa da carga de ocupação |
| P12 | `LINE INPUT ;` sem avançar a linha | tradutor + RT45 | resolvido (9b33d44) | sim: telas g11_ocup e c07_direcao do fluxo iguais |
| P13 | CHAIN e o LAJEMONT | RT45 | resolvido (9b33d44; a causa era a impressora aberta no #1 e o `OPEN #1` do programa dar erro 55) | sim: fluxo vai até o fim |
| P14 | cabeçalho do FILES com barra final | RT45 | resolvido (9b33d44) | sim: param 41/41 |
| P15 | estilo do LINE nas diagonais impressas pelo LAJEMONT | RT45GFX | resolvido (d134727, gráfico do BRUN45) | sim: impressora do fluxo 36.131 bytes iguais |

Diferenças que ficam e não são pedido: FRE ("Kbytes livres" do LAJEGRAV, não reproduzível) e o trecho que pisca por TIMER no LAJECALC (calc2, tela k06; o TIMER segue vivo, então a fase capturada depende do tempo). Nenhum pedido aberto.

## P1. SWAP inline de variáveis simples sai como "?? N bytes" (tradutor)

O BC do QB4.5 compila `SWAP a, b` de duas variáveis simples sem chamar o runtime: `MOV SI,a / MOV BX,b / MOV AX,[SI] / XCHG [BX],AX / MOV [SI],AX`, palavra a palavra (DOUBLE, 31 bytes), ou `MOV AX,[BP-a] / MOV DX,[BP-a+2] / XCHG [BP-b],AX / XCHG [BP-b+2],DX / MOV [BP-a],AX / MOV [BP-a+2],DX` (SINGLE local, 12 ou 14 bytes). O lift mostra `'?? 31 bytes que não parecem código do QuickBASIC ... XCHG word ptr [BX], AX` e o tradutor o trata como dado: o `.BAS` perde o SWAP sem aviso (sai como comentário `'RETRAD?`, que não é contado em "avisos").

- Saída hoje: `'RETRAD? @1a159 ?? 31 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; ...)`
- Deveria sair: `SWAP V_16a8#, V_16b0#   '@1a159`
- Ocorrências (20): LAJECALC 0x1a159, 0x4a4d1, 0x4a4fd, 0x4e2b5, 0x4e2e1; LAJEGEOM 0x22baf, 0x22bc8, 0x2395b, 0x23972, 0x23e9b, 0x23eb2, 0x23fe5, 0x23ffe; LAJEMONT 0x2e588, 0x2e59f, 0x4ae46, 0x4ae72, 0x4f45b, 0x4f487; LAJEPROC 0x191a7 (já em `CORRECOES`). Os operandos de cada um, lidos do `.asm`, estão em `correcoes.json` com a evidência.
- Contorno: `correcoes.json` (todas as 19 da família, fora o LAJEPROC). Sugestão: reconhecer o padrão no tradutor (ou no lift) e, enquanto isso, contar `'RETRAD?` com `XCHG` como aviso, porque não é dado.

## P2. ERASE e GET/PUT gráfico com matriz INTEGER saem sem o sufixo (tradutor)

LAJEGEOM, matriz `A_14fa` (DS:14FA, `REDIM A_14fa(0 TO 480)` com "elemento 2 bytes (%)" no lift 0x15721), usada como buffer de `GET`/`PUT` gráfico.

- Lift 0x15713: `ERASE A_14fa`. Sai `ERASE A_14fa   '@15713`; o QB64 recusa ("Undefined array passed to ERASE", linha 1101), porque sem sufixo é a matriz SINGLE `A_14fa!`. Deveria sair `ERASE A_14fa%`.
- Lift 0x15f65 e outros 19 (`B$GGET(ELEM, A_14fa(1), ...)`, `B$GPUT`): saem `..., A_14fa(1)` e `..., A_14fa(241), PSET`. Deveriam sair `A_14fa%(1)` / `A_14fa%(241)`.
- LAJEMONT 0x32573: sai `GET (...)-STEP(8, -8), L_BP60(1)%` (sufixo depois do índice; o QB64 para em "Unexpected character", linha 4297). Deveria sair `L_BP60%(1)`. O mesmo vale para o `PUT` logo depois (0x32xxx, linha 4314).
- Contorno: nenhum (são ~25 linhas longas; espero o tradutor).

## P3. FOR com STEP variável (tradutor; já na lista dele)

- LAJEGEOM 0x2fc36 (`L_BP2f6! = ??{ST0 = 1.0 | L_BP2f6! + L_BP2f2!}`, entrada em 0x2fb54 "leva ST0 = 1.0") e 0x4915a (`L_BP33e!`, entrada em 0x49079). É `FOR v = 1 TO lim STEP passo` com limite e passo copiados para locais (0x2fb36/0x2fb48, 0x4905b/0x4906d).
- Contorno: nenhum.

## P4. PUT # de registro (OPEN "R" de 855 bytes) e o bloco DS:168A (tradutor + RT45)

LAJEMONT 0x11410 `OPEN "R", #1, ... + ".VIG", 855`; 0x11452 `PUT #1, 1&, V_168a`; 0x11590 `PUT #1, CLNG(V_0f0c! + 1.0), V_168a`; 0x11652 `PUT #1, 1&, V_168a`. `V_168a` é o início de um bloco de 855 bytes em DS:168A..DS:19E0 (registro do .VIG) montado campo a campo na SUB 0x33d84 (`V_168a` = 20 bytes de string fixa, `V_169e` = 5 bytes, `V_16a3%`, `V_16a5%`, ..., `V_16b1!`, ... em endereços ímpares). Hoje sai `'RETRAD? PUT #1, 1&, V_168a   ' (comando nao reconhecido)`. Precisa de um jeito de escrever o bloco com o leiaute do original (bytes iguais no .VIG, que o VIGA lê depois).

- Contorno: nenhum.

## P5. Comparação dentro do índice do destino de uma atribuição (tradutor; já na lista dele)

LAJEMONT 0x2b089 `A_1b7e!(CINT(V_0f0c!), CINT(V_0f14! - (L_BP22! = 0.0))) = A_1a2c%(...) - V_0f04!` e 0x2b103 `A_1bac!(...(L_BP22! = 0.0)...) = -100.0`. O analisador pega o `=` de dentro do índice como o da atribuição ("esperava ')', veio None").

## P6. LINE com expressão "??{...}" no estilo (tradutor)

LAJEMONT 0x4db5e: `LINE -(...)  ' B$LINE((V_0dcc${COMMON?} = "EGA" OR L_BP22a%) * -13 + L_BP228%, 21845, 0)`. Sai `'RETRAD? ... (esperava ')', veio '{')`. A cor é uma expressão com comparação de string.

## P7. Data e hora na impressora (RT45 / roda_retrad.sh)

Os rodapés dos relatórios do LAJECALC e do LAJEGEOM imprimem `DATE$` e `TIME$` (`10-14-2026     12:01`). Com o relógio fixo do commit 907bf8a a data bate; o minuto não, porque o relógio anda com o tempo real e o oráculo leva mais de um minuto até o relatório, a V1 alguns segundos. Evidência: casos `calc`, `calc2` e `param` (15/10): a única diferença da impressora é `12:01` × `12:00` no rodapé; E2E.LAJ do caso `geom`: `12:00:34` × `12:00:02`. Não é da V1.

- Sugestão: um modo de relógio parado (ou que avance por tecla do roteiro) nos dois lados, ou `--ignora` também para as linhas do `impressora.prn`.
- Contorno: nenhum; a diferença está registrada em `casos.json`.

## P8. CSNG(expressão _FLOAT) não arredonda para SINGLE quando o valor vai para RT_PU# (tradutor ou RT45) — URGENTE

Regra 3 do RETRADUCAO.md: o item de `PRINT USING` sai `RT_PU#(CSNG(expr), fmt, k)`. No QB64, `CSNG` de um `_FLOAT` só muda o tipo para o compilador; o valor passa para o parâmetro `v AS DOUBLE` do `RT_PU#` sem arredondar para SINGLE. Teste dentro do LAJECALC (cópia de depuração): `MKS$(CSNG(e))` = `3E333333` (0,174999997), mas `STR$(CDBL(CSNG(e)))` = `.175` e `RT_PU#(CSNG(e), fmt, 3)` = `.18`.

- Onde aparece: LAJECALC 0x13589 (e a tela, 0x13248), peso próprio da espessura mínima 7 cm: `V_0de8!^2/(100*V_0dec!)*V_13e0!*V_0f6e!` = 0,07×2,5. Oráculo imprime `0.17` (caso `retrad_laje_calc`, impressora.prn, e `tabela_3casos.md`: "peso proprio 0.17"); a V1 imprimia `0.18`.
- Deveria sair: algo que arredonde para SINGLE antes do DOUBLE, por exemplo `RT_PU#(RT_SNG!(expr), ...)` com `FUNCTION RT_SNG! (x AS _FLOAT): RT_SNG = x`, ou um `RT_PUS#` com parâmetro SINGLE. Testado com `RT_SNGQ!` numa cópia: o caso `calc` fica igual ao oráculo nesse ponto.
- Contorno: `correcoes.json`, as 20 linhas com `RT_PU#(CSNG(` (LAJECALC 10, LAJEGEOM 2, LAJEMONT 5, LAJEPROC 3) com `CVS(MKS$(expr))` no lugar de `CSNG(expr)`. O mesmo pode valer para outras famílias.

## P9. LPRINT: quebra automática na coluna 80 da LPT1 (RT45)

`LPRINT STRING$(80, 95)` no original sai como 80 sublinhados + CR LF (o BRUN45 quebra ao chegar na coluna 80 da largura padrão) + CR LF (fim do LPRINT): uma linha em branco a mais. Evidência: `impressora.prn` do oráculo no caso `retrad_laje_calc` (LAJECALC 0x11aed, 0x16e6e, 0x170ba; byte 245 em diante). O RETRADUCAO.md já lista isso como NÃO TESTADO; agora está testado.

- Deveria: o RT45 contar a coluna da LPT1 (todo `PRINT #RT_LPT`) e mandar CR LF quando ela chega a 80 (e no `WIDTH LPRINT`, se aparecer).
- Contorno: `correcoes.json`, as 3 linhas do LAJECALC com um `PRINT #RT_LPT, ""` a mais.

## P10. Cursor do LINE INPUT em modo gráfico (RT45)

No modo CGA 640x200, enquanto o `LINE INPUT` espera, o BRUN45 desenha o cursor (bloco 8x8 cheio) na posição de digitação. A V1 não desenha. Evidência: caso `retrad_laje_calc2`, tela `k04` (LAJECALC, "Numero da Laje para Imposicao de Engastamento *FIM*"): 64 pixels diferentes, exatamente a célula da linha 24, coluna 54, acesa no oráculo e apagada na V1. As telas de INPUT$/INKEY$ em modo gráfico batem.

- Deveria: `RT_LINEINPUT` em `SCREEN 2/9/3` mostrar o bloco na posição do cursor enquanto espera (e apagar ao sair), como o BRUN45.
- Contorno: nenhum. Toda tela gráfica gravada durante um LINE INPUT fica com essa diferença.

## P11. Comparação entre SINGLE e DOUBLE/_FLOAT é feita em SINGLE no QB64 (tradutor) — URGENTE

O QB64 PE 4.7.0 compara `DOUBLE >= SINGLE` (e `=`, `<`) arredondando para SINGLE, mesmo com `FX##()` no lado DOUBLE. Teste (`T3.BAS`, avulso, fora do repositório): `d# = 0.15#: x! = 0.15` dá `d >= x` = -1, `d = x` = -1, `FX##(d) >= x` = -1; só `d >= CDBL(x)` dá 0. O x87 do QB4.5 compara exato: 0,15# < 0,15!.

- Onde quebrou: LAJEGEOM 0x43ef1 `IF NOT ((VAL(V_0f18$) >= A_1014!(...) OR L_BP162%) <> 0) THEN GOTO L_43f25` (parcela acidental não pode ser maior ou igual à carga total). Com 0,15 e 0,15 (caso_a_laje), o original aceita; a V1 dá BEEP e pergunta de novo, e o resto do roteiro desanda (caso `retrad_laje_fluxo`, tela `g12_ocup`).
- É geral: toda comparação com um lado SINGLE e outro DOUBLE, `VAL(...)` ou `_FLOAT` (ex.: LAJECALC 0x4a150 `A_15de!(...) = V_17f0#`). A regra 6 do RETRADUCAO.md (float × LONG) precisa valer também para SINGLE × DOUBLE: promover o lado SINGLE. Teste `T4.BAS` (avulso, fora do repositório): `VAL(s) >= FX##(x!)`, `d# >= FX##(x!)`, `FX##(d#) >= FX##(x!)` e `d# = CDBL(x!)` dão o resultado do QB4.5 (0); `FX##` só no lado DOUBLE não basta.
- Tamanho: na família há umas 700 linhas `IF` com um SINGLE e um DOUBLE/`VAL`/`FX##` na mesma expressão (LAJECALC 256, LAJEMONT 231, LAJEGEOM 184, LAJEPROC 40, LAJE 1; contagem por expressão regular, nem todas comparam os dois diretamente). Só diferem do QB4.5 quando os dois lados ficam iguais em SINGLE e diferentes em DOUBLE, mas aí a decisão muda.
- Contorno: `correcoes.json`, só LAJEGEOM 0x43ef1 (`CDBL` no lado SINGLE). Os outros pontos ficam para o tradutor.

## P12. LINE INPUT com ";" logo depois do comando (B$LNIN com opção 3) não pode avançar a linha (tradutor + RT45) — URGENTE

O `B$LNIN` recebe um último argumento 1 ou 3. Com 3 (35 chamadas na família; ex.: LAJEGEOM 0x43af5, `PUSH 3` em 0x43b06 do `.asm`), é o `LINE INPUT ; "prompt"; v$` do QB: depois do ENTER o cursor fica na mesma linha, sem CR LF. O tradutor gera `RT_LINEINPUT "", V_0f18$` e o `RT_LINEINPUT` sempre termina com `PRINT`: na linha 25 de um `VIEW PRINT 23 TO 25`, a tela rola.

- Evidência 1: caso `retrad_laje_fluxo`, tela `g11_ocup` (LAJEGEOM, carga de ocupação): no oráculo as linhas 23 a 25 são "Carga de Ocupacao distribuida...", "Entre com o valor...", "Total = 0.15 Parcela Acidental..."; na V1 o texto subiu uma linha (2.159 pixels diferentes).
- Evidência 2: mesma execução, tela `c07_direcao` (LAJECALC, "Predominante"): na V1 o desenho inteiro subiu 8 pixels (3.681 pixels diferentes).
- Deveria: `RT_LINEINPUT` com um parâmetro de opção (o do `B$LNIN`); com 3, não escrever o CR LF final.
- Contorno: nenhum (o `correcoes.json` não tem como chamar outra rotina do RT45).

## P13. CHAIN não leva o modo de vídeo, a tela gráfica nem o WINDOW (RT45) — URGENTE

O LAJEMONT não tem nenhum `SCREEN`, `WINDOW` ou `VIEW (...)`: ele herda do LAJEGEOM (que chama `CHAIN ... "LAJEMONT"` em 0x1100c, já em SCREEN 2 com `WINDOW SCREEN (0,0)-(639,199)` e o painel desenhado) o modo gráfico e o desenho, e escreve por cima (linha 22 "V I G A S", pesos das vigas nas linhas 23 a 25). O BRUN45 não troca o modo no CHAIN. O `RT_CHAIN` leva só a tela de texto 80x25.

- Evidência: caso `retrad_laje_fluxo`, telas `v03_vigas` a `v06_vigas`: no oráculo são telas CGA 640x200 (PNG, com o separador "V I G A S" na linha 22); na V1 são de texto (sem PNG) e o separador não aparece. Depois de `v06_vigas` (S para imprimir o carregamento das vigas) o LAJEMONT da V1 entra em laço sem pedir tecla (processo "Not Responding", morto pelo PID); a impressora para no byte 5.062 de 36.131.
- Deveria: o arquivo de troca levar o modo (`SCREEN`), a página gráfica (os 16 KB da CGA; plano(s) na EGA) e o estado do `WINDOW`/`VIEW`, e o `RT_INICIO` restaurar antes do nível de módulo.
- Contorno: nenhum. Bloqueia o LAJEMONT inteiro (geração de E2E.VIG/E2E.RLP e o relatório de cargas nas vigas) e, por isso, o resto do caso `fluxo` (LAJEGEOM 8, LAJEGRAV, LAJEPROC) na V1.

## P14. FILES: o cabeçalho do diretório não leva a barra final (RT45)

O `FILES` do QB4.5 escreve na primeira linha o diretório corrente do DOS sem a barra final, menos na raiz: `C:\SISTRUT\EXEC40` e `C:\`. O `RT_FILES` sempre acrescenta `\`.

- Evidência: caso `retrad_laje_param`, telas `r02` a `r08` (LAJE 0x13e61, `FILES V_0e1c$ + "*.LAP"` na troca de parametrização): oráculo `C:\SISTRUT\EXEC40`, V1 `C:\SISTRUT\EXEC40\`. Na raiz (LAJEGRAV, `C:\`) as duas batem.
- Deveria: em `RT_FILES`, só acrescentar `\` quando o diretório for a raiz (`C:`).
- Contorno: nenhum.

## P15. Padrão de estilo do LINE nas diagonais da cópia de tela do LAJEMONT (RT45GFX) — RESOLVIDO em d134727

No caso `retrad_laje_fluxo` a impressora tem 36.131 bytes nos dois lados e só difere, fora a hora, na cópia da tela gráfica que o LAJEMONT manda depois do relatório de cargas nas vigas (`RT_ROTINA_0AEA` em LAJEMONT 0x10cfa; linhas 160 a 182 do `impressora.prn`, 311 bytes diferentes). Decodificando o ESC L das duas: 403 pixels diferentes, todos nas diagonais tracejadas das áreas de influência das lajes (x 54 a 322, y 11 a 154 da imagem). As linhas cheias, os eixos e os rótulos batem. As diagonais saem do `LINE -(...), cor, , &H5555` de LAJEMONT 0x4db5e (e vizinhos): a diferença é de traçado do LINE com estilo (fase do padrão ou ponto inicial do segmento). As telas gravadas antes (`v01` a `v06`) batem.

- Dono: agente do RT45GFX. Não contornado.
- Imagens (fora do repositório): `o.png` (oráculo), `v.png` (V1), `d.png` (diferença).
