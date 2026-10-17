# Contrato de dados entre módulos (reconstrução)

Os formatos binários originais de `.LAJ`, `.VIG`, `.RLP`, `.REP`, `.COL`, `.SEC`, `.FOR`, `.CFO`, `.FRM` e `.EDV` não são recuperáveis: não há arquivos de amostra e o QuickBASIC compilado não guarda layout em strings (ver lacunas nas specs de `docs/modules/`). A reconstrução mantém **os mesmos nomes, extensões e o mesmo fluxo entre módulos**, mas com um formato próprio, documentado aqui. Arquivos de obra gravados pelo SISTRUT original **não** são legíveis por esta versão.

## Regras gerais

- **Arquivo sequencial QuickBASIC.** Grava com `WRITE #` e lê com `INPUT #`: campos separados por vírgula e strings entre aspas. O formato funciona igual em QB45 e QB64.
- **Linha 1 (cabeçalho):** `"SISTRUT40","<TIPO>",<versao>,"<obra>"`. `TIPO` é a extensão sem ponto. A versão é 1, exceto `.SEC` e `.EDV`, que são versão 2. Se o cabeçalho não bater, o leitor recusa o arquivo com a mensagem `Arquivo invalido ou de outra versao`.
- **Unidades fixas no arquivo, independentes da parametrização de tela:**
  - comprimentos de planta e vãos em **m**;
  - dimensões de seção e cobrimentos em **cm**;
  - forças em **tf**;
  - cargas distribuídas em **tf/m** (linear) ou **tf/m²** (área);
  - momentos em **tf·m** (por metro, em lajes);
  - áreas de aço em **cm²** (ou **cm²/m**).
  
  A conversão para as unidades da tela (LAJE.INI etc.) acontece só na interface.
- **Nome do arquivo:** `<obra>.<EXT>` no diretório de dados do módulo (vem do .INI do módulo, via `IniDirDados$`). Antes de sobrescrever, copia o anterior para `<obra>.<EXT>.BAK` (um backup por extensao; o original usava `<obra>.BAK`).
- **Strings** não podem conter aspas. Nomes de elementos seguem a numeração do original: `L1`, `V12`, `P3`.
- **Coordenadas de planta:** origem no canto inferior esquerdo, x para a direita, y para cima, em m.

## SISTRUT.OBR — obra corrente

Arquivo de 1 linha (`WRITE #`) `"<obra>"` no diretório de dados. O gerenciador de cada família (LAJE, VIGA, PILAR/PILAREDI, FORMA, DESENHO) grava esse arquivo quando o usuário escolhe a obra, e os submódulos o leem como default do nome da obra. Rotinas: `ObraAtual$(dirDados$)` e `ObraDefine dirDados$, obra$` (SISDADOS.BM).

## .LAJ — lajes de um pavimento (LAJEGEOM/LAJEGRAV gravam; LAJECALC, LAJEPROC, LAJEMONT e FORMA leem)

```
"SISTRUT40","LAJ",1,"<obra>"
<nivel>,<nLajes>
-- para cada laje (1 linha):
"<nome>",<x0>,<y0>,<lx>,<ly>,<h>,"<bordos>",<g>,<q>,"<vigas>"
```

| Campo | Significado |
|---|---|
| `x0`, `y0` | canto inferior esquerdo (m) |
| `lx`, `ly` | dimensão em x e em y (m) |
| `h` | espessura total (cm). Valor 0 significa "a calcular" (LAJECALC define) |
| `bordos` | 4 letras na ordem **esquerdo, inferior, direito, superior**: `A` apoiado, `E` engastado (continuidade), `L` livre |
| `g` | carga permanente adicional: revestimento e enchimento (tf/m²). O peso próprio é calculado (h × densidade do .LAP) |
| `q` | carga acidental (tf/m²) |
| `vigas` | nomes das vigas de apoio nos 4 lados, separados por `/`, na mesma ordem dos bordos. `-` quando não há (bordo livre) |

Depois do cálculo, LAJECALC acrescenta um bloco de resultados por laje, na mesma ordem:
```
"RES",<nLajes>
"<nome>",<h>,<p>,<mx>,<my>,<xesq>,<xinf>,<xdir>,<xsup>,<asx>,<asy>,<asesq>,<asinf>,<asdir>,<assup>,<flecha>,<resq>,<rinf>,<rdir>,<rsup>
```

| Campo | Significado |
|---|---|
| `p` | carga total (tf/m²) |
| `mx`, `my` | momentos positivos (tf·m/m) |
| `x*` | momentos negativos nos bordos (tf·m/m, 0 se não engastado) |
| `as*` | armaduras (cm²/m) |
| `flecha` | flecha (cm) |
| `r*` | reações nos bordos (tf/m) |

O bloco RES contém só as lajes com resultado (`"RES",<n>` com n ≤ nLajes) e é associado pelo nome: uma laje ausente do RES é lida sem resultado. O leitor que só precisa da geometria para depois da lista de lajes.

## .VIG — vigas com carregamento (LAJEMONT/LAJEGEOM gravam; VIGA lê, completa e regrava; FORMA e DESENHO leem)

```
"SISTRUT40","VIG",1,"<obra>"
<nivel>,<nVigas>
-- para cada viga:
"<nome>",<nTramos>,<bw>,<h>
-- nTramos+1 apoios, um por linha:
"<apoio>",<x>,<y>          apoio = nome do pilar/viga ou "-" (balanço); x,y em planta (m)
-- nTramos tramos, um por linha:
<vao>,<qPerm>,<qAcid>,<nConc>
-- nConc cargas concentradas do tramo, uma por linha:
<a>,<P>                    a = distancia ao apoio esquerdo (m), P (tf)
```

Os valores de `bw` e `h` são em cm. Os de `qPerm` e `qAcid` são em tf/m e já incluem as reações das lajes. O peso próprio da viga **não** está incluído: VIGA soma esse peso. Um tramo em balanço é indicado com apoio `"-"` na extremidade correspondente.

## .RLP — cargas de lajes em pilares e inclinações (LAJEMONT grava; PILGEEDI lê)

```
"SISTRUT40","RLP",1,"<obra>"
<nivel>,<nPilares>
"<pilar>",<x>,<y>,<N>,<Mx>,<My>
```
`N` em tf; `Mx`, `My` em tf·m (momentos por excentricidade/inclinação; 0 se não houver).

## .REP — reações de vigas nos pilares (VIGA grava; PILGEEDI lê)

Mesmo layout do `.RLP`, com `TIPO` = `REP`. `N` é a somatória das reações de todas as vigas que chegam ao pilar naquele nível.

## .COL — colunas/pilares de um edifício (PIGRAEDI grava e lê; PILAREDI, FORMA e DESENHO leem)

```
"SISTRUT40","COL",1,"<obra>"
<nNiveis>,<nColunas>
-- niveis (nNiveis linhas): "<nome do nivel>",<cota (m)>,<pe-direito (m)>
-- para cada coluna:
"<nome>","<secao>",<bx>,<by>,<x>,<y>
-- uma linha por nivel (do mais alto ao mais baixo):
<N>,<Mx>,<My>,<lex>,<ley>,<asTot>,<phi>,<nBarras>,<phiEstribo>,<sEstribo>
```

| Campo | Significado |
|---|---|
| `secao` | `R` retangular (`bx`, `by` em cm) ou `C` circular (`bx` = diâmetro, `by` = 0) |
| `N` | esforço normal acumulado (tf) |
| `Mx`, `My` | momentos (tf·m) |
| `lex`, `ley` | comprimentos de flambagem (m) |
| `asTot`, `phi`, `nBarras`, `phiEstribo`, `sEstribo` | resultado do dimensionamento (cm², mm, un, mm, cm); 0 antes do cálculo |

## .SEC — armação de vigas (VIGA grava; DESENHO lê; ARMADURA usa `<obra>_ARM.SEC` próprio)

```
"SISTRUT40","SEC",2,"<obra>"
<nVigas>
-- para cada viga:
"<nome>",<nTramos>,<bw>,<h>,<d>
-- nTramos+1 apoios, como no .VIG ("-" = balanco):
"<apoio>",<x>,<y>
-- para cada tramo:
<vao>,<mPos>,<mNegEsq>,<mNegDir>,<vEsq>,<vDir>,<asPos>,<asNegEsq>,<asNegDir>,<phiPos>,<nPos>,<phiNegEsq>,<nNegEsq>,<phiNegDir>,<nNegDir>,<aswEsq>,<aswDir>,<phiEst>,<sEst>
```
Versão 2: a versão 1 não gravava os apoios e é recusada (o balanço `-` precisa chegar ao detalhamento). Momentos em tf·m (característicos, com sinal positivo para tração embaixo); cortantes em tf; `as*` em cm²; `asw*` em cm²/m; `phi*` em mm; `sEst` em cm.

## .FRM, .FOR e .CFO — forma (FORMEDCA grava; FORMPLOT e DESENHO leem)

- **`.FRM`**: forma montada do pavimento. Cabeçalho mais três blocos:
  - `"LAJES",n` com `"<nome>",x0,y0,lx,ly,h` (h em cm);
  - `"VIGAS",n` com `"<nome>",x1,y1,x2,y2,bw,h` (eixo da viga em m; bw e h em cm);
  - `"PILARES",n` com `"<nome>",x,y,bx,by,"<secao>"`.
- **`.FOR`**: dados de forma por viga, para o desenho. Cabeçalho, depois `nVigas` e, por viga, `"<nome>",bw,h,nivel,comprimento_total`.
- **`.CFO`**: mesmo layout por pilar: `"<nome>",bx,by,"<secao>",nivel,altura`.

## .EDV — viga em edição no DESENHO (DESEDITA/DESEDCAO gravam e leem)

Igual ao `.SEC` (versão 2, com apoios), com `TIPO` = `EDV`. Por tramo, acrescenta uma linha `<nPos>` e `nPos` posições de ferro:
```
<numPos>,<phi>,<n>,<comprimentoTotal (cm)>,"<forma>"
```
`forma` é um código de dobra: `R` reta, `U` com ganchos, `L` dobrada numa ponta, `E` estribo.

## .VET — desenho vetorial neutro (todos os geradores de desenho gravam; VPLOTA e FORMPLOT convertem)

Formato e rotinas em `src-reconstructed/common/SISPLOT.BM`: `VetAbre%`, `VetLinha`, `VetRetangulo`, `VetTexto`, `VetCirculo`, `VetFecha`, `VetParaHpgl%` (gera .PLT), `VetParaDxf%` (gera .DXF R12) e `VetMostra%` (prévia na tela, SCREEN 12). Coordenadas em **mm no papel**: quem gera aplica a escala (ex.: 1:50 significa 1 m = 20 mm).

Penas por convenção:

| Pena | Uso |
|---|---|
| 1 | contorno de concreto |
| 2 | armadura |
| 3 | cotas e textos |
| 4 | eixos |
| 5 | carimbo/legenda |

## Arquivos auxiliares de um só módulo

Todos usam o mesmo cabeçalho `"SISTRUT40","<TIPO>",1,"<obra>"`, exceto o `.PSC`. Só o módulo que grava cada arquivo o lê, salvo a exceção indicada na tabela. O layout exato está no comentário da rotina que grava cada um.

| Arquivo | Módulo | Conteúdo |
|---|---|---|
| `<obra>.EIX` | LAJEGEOM | eixos de auxílio horizontais e verticais (coordenadas em m). O FORMEDCA também lê, sem gravar, para a amarração por eixo |
| `<obra>.FIN` | FORMINIT | parâmetros iniciais da forma, uma linha `"<nome>",valor` por item |
| `<obra>.FEL` | FORMEDCA | cota básica (m) e alinhamento das vigas pela face S/I |
| `<obra>.AVF` | VPLOTA | arranjo de folhas: `folha,"<arq.VET>",dx,dy` por desenho |
| `<obra>.PSC` | PILAR | seções de pilar avulsas arquivadas, uma linha por posição |
| `<obra>.EDX` | DESEDCAO | complemento do `.EDV`: tipo (P/N/PE/G/E) e início de cada barra (cm da ponta esquerda da viga), e as notas da forma e da armadura. Sem ele, tipo e início são deduzidos como no desenho |
| `<obra>.PRD` | PILAREDI | seções pré-dimensionadas, uma linha por coluna: campos `nome`, `q` e, para cada nível, `niv,tipo,B,H,Ex,Ey,bx,by`, separados por barra vertical. A primeira linha é `SISTRUT40 PRD 1 <obra>`, gravada com PRINT (texto separado por espaços, não o cabeçalho WRITE dos outros arquivos). O `.COL` guarda uma seção só; com variação de seção, grava a de baixo e avisa |
| `<obra>_<coluna>_D.VET` | PILAREDI | diagrama de momentos e carga normal da coluna (formato `.VET`) |
| `<obra>.ARL` | LAJEPROC | escolha de armaduras das lajes (teclas E e M): `<n>` e uma linha por laje `"<nome>",as1,phi1,s1,…,as6,phi6,s6`. Se as áreas não baterem mais com o `.LAJ` (laje recalculada), a escolha daquela laje é descartada e vale a automática |
| `<obra>_ARM{P,N,PN,PNI}[_L<n>].VET` | LAJEPROC | desenhos de armadura das lajes, um arquivo por tipo de desenho (e por laje, quando é de uma só) |
| `<obra>_ARM.SEC` | ARMADURA | seções avulsas de viga, no formato `.SEC` (cada seção é uma viga de 1 tramo) |
| `<obra>_<MOD>.LST` | vários | relatórios em texto (substituem a impressora) |
| `<obra>_*.VET`, `.PLT`, `.DXF` | desenho | desenhos (ver `.VET`) |

## Fluxo da obra

```
LAJEGEOM ─► .LAJ ─► LAJECALC ─► .LAJ(+RES) ─► LAJEPROC ─► .VET
                                    │
                                    └─► LAJEMONT ─► .VIG + .RLP
.VIG ─► VIGA ─► .SEC + .REP     (ARMADURA: secoes avulsas ─► .SEC)
.REP + .RLP ─► PILGEEDI ─► .COL ─► PILAREDI (dimensiona) ─► .COL
.LAJ + .VIG + .COL ─► FORMA/FORMEDCA ─► .FRM, .FOR, .CFO ─► FORMPLOT ─► .VET/.PLT/.DXF
.SEC + .FOR (+.COL) ─► DESENHO/DESEDITA ─► .EDV ─► DESIMP/DESGRAF ─► .VET ─► VPLOTA ─► .PLT/.DXF
```

## Núcleo de cálculo compartilhado

`src-reconstructed/common/CALCCA.BM` faz o cálculo de concreto armado da NB-1/78 em tf, cm e tf/cm²:

- `CcaAsFlexao#`, `CcaLinhaNeutra#`, `CcaMdLim#` e `CcaXdLim#`: flexão simples;
- `CcaAsMin#`: armadura mínima;
- `CcaAswEstriboRho#` (ψ1 = 0,07 + 5ρ1 ≤ 0,14), `CcaAswEstribo#` (ψ1 = 0,07) e `CcaAswMin#`: estribos;
- `CcaAreaBarra#` e `CcaBitola#`: área e bitola de barra;
- `CcaEscolheMalha`, `CcaEscolheBarras` e `CcaEscolheBarrasBw` (barras que cabem na alma): escolha de bitola e espaçamento.

Testes em `tests/T_CALCCA.BAS`.
