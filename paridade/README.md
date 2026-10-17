# Paridade V2 × SISTRUT original (NB-1/78)

Compara a OpenStrut V2 com os números que o SISTRUT 4.0 original imprimiu no oráculo (ou que a V1 nova imprimiu, que é igual byte a byte). Cada caso é um JSON com os valores impressos. A obra sai dos arquivos que o próprio original gravou (`casos/arquivos/<caso>/`), pelos importadores da V2; a V2 calcula com `calcularObra(obra, nb178)` nos dois modos de `obra.modoCalculo` e devolve os mesmos ids, lidos de `resultado.sistrut` (nas unidades do original; formato em `docs/MODO-CALCULO.md` da V2). O resultado vai para `paridade/saida/relatorio-<modo>.md`.

## Como rodar

```sh
export V2_DIR=../openstrut                                # checkout da V2 (ou --v2 <raiz>)
bash paridade/rodar.sh --modo original
bash paridade/rodar.sh --modo corrigido --v2 ../outra-v2   # outra árvore da V2
bash paridade/rodar.sh --modo original --casos paridade/casos --casos <pasta de JSONs>
bun test paridade/testes                                  # testes do comparador (não precisam da V2)
node ../openstrut/node_modules/typescript/bin/tsc -p paridade  # typecheck contra os tipos da V2
```

Variáveis de ambiente (sem padrão; nenhuma é preciso para `bun test`):

- `V2_DIR`: raiz de um checkout da V2 (`gmunaro/openstrut`), quando não se passa `--v2`. Sem nenhum dos dois, o `rodar.sh` sai com erro 2.
- `ORACULO`: pasta do oráculo (DOSBox-X com o original), a que contém `runs/` e `casos/`. O campo `run` dos JSONs é relativo a ela (`runs/<caso>-<data>`). Obrigatória para `original/extrair.ts --padrao` sem `--runs` e para conferir fontes (`original/fontes.ts`); os testes que leem os runs pulam quando ela falta.

O `tsconfig.json` não lê variável: aponta para um checkout da V2 irmão deste repositório, em `../openstrut` (com `bun install` feito lá). Com a V2 em outro lugar, troque os dois caminhos `../../openstrut` do `tsconfig.json` (relativos a `paridade/`).

Opções:

- `--modo original|corrigido`: o modo detalhado no relatório e que decide o código de saída. Os dois modos são sempre calculados, e o resumo mostra os dois. Padrão: `original`.
- `--v2 <raiz>`: repositório da V2. Padrão: `$V2_DIR`; sem os dois, erro. A V2 só é lida.
- `--casos <pasta ou arquivo>`: JSON de caso; pode repetir. Padrão: `paridade/casos`.
- `--saida <pasta>`: padrão `paridade/saida`. Recebe `relatorio-<modo>.md` e `v2-<modo>.json`, o mapa id → número da V2 de cada caso nos dois modos.

Código de saída:

- 0: sem problema;
- 1: modo original com algum valor DIFERE; modo corrigido com alguma diferença inesperada nova (as que já diferem no original reprovam lá, não de novo aqui);
- 2: erro (JSON inválido, montagem da V2 que lançou exceção, opção errada).

"sem par" não reprova.

## Situações e tolerância

Modo original:

- **igual**: a V2 está a até meia unidade da última casa impressa (0,25 aceita 0,245 a 0,255; 52 aceita 51,5 a 52,5).
- **DIFERE**: fora disso. Cada DIFERE tem um diagnóstico em `v2/notas.ts` (`DIAGNOSTICOS`), com a causa provável: obra mal montada, entrada que a obra não representa ou bug da V2 (com o caminho do código).
- **sem par**: a V2 não produz esse id. Cada grupo tem o motivo em `v2/notas.ts` (`SEM_PAR`), com o item de "O que o modelo da obra ainda não representa" do MODO-CALCULO.

Modo corrigido: a V2 não precisa bater. Cada DIFERE é esperada ou inesperada, pela regra da família do id (`FAMILIAS_CORRIGIDO` e `regraCorrigido` em `v2/notas.ts`; `classificar` em `lib/comparar.ts`). Cada item do MODO-CALCULO tem um efeito:

| efeito | itens | o que explica |
|---|---|---|
| precisão | todo id | até 1 na última casa impressa |
| relativo | materiais | até 5 % do valor (densidade, fyk e fck mudam ≈ 2 % cada; o produto de dois dá ≈ 4 %); numa grandeza discreta (H, bitola, espaçamento, arranjo "#φc/s" do LAJEPROC), um passo da tabela |
| absoluto | R5, V-a | 0,01 t por parcela truncada do .REP; 0,002 t por reação indexada (só onde há viga apoiada em viga) |
| caminho | R1, R2, R3, M-a, R6, R8, D-ψ, R11, D-1, D-17, P-a, D-21 | sem faixa, mas só quando o caso mostra o item ativo: R1 se o Hmin da laje muda; R3 se a otimização mudou um código ou parou no laço (nunca no r2, que roda sem ela; no r3 a tela parada do original não existe no corrigido); M-a se a V2 avisou a soma das áreas; R6 se o VIGA.INI da obra sai dos limites do corrigido (o 150 % do viga_r6); D-ψ sempre no cisalhamento; D-1 nos casos "f"; D-17 no PILAREDI e no PILAR opção 6; P-a se a obra levou o MEP ao pilar sem .RLP ou sem a rigidez da viga ("Defino seção" N) e o pilar lê momento do .REP; D-21 no .REP só na parcela ou no momento inteiro que o STR$ cortou (impresso sem ponto, V2 com dois dígitos ou mais) e no pilar que lê momento do .REP (o MEP chega com todas as casas). O D-21 é principal: ativo, a nota o nomeia mesmo dentro da faixa dos outros itens |
| não se aplica | H, R9, M-b, D-3, D-6, D-7, D-8, cobrimentos | a condição não ocorre nestes casos (CA-50, sem φ32, eixo crescente, Nk > 0, seção retangular, sem empate, redução de sobrecarga desligada, cobrimentos iguais aos do original) |

- **esperada**: a diferença cabe na soma das faixas dos itens da família, ou passa dela com um item de caminho ativo. O relatório mostra a faixa e a qual item a diferença foi atribuída.
- **inesperada**: o id já difere no modo original (a linha diz isso; o diagnóstico é o do original); a V2 não deu número ou arranjo (NaN, "NAO", "") onde o original deu; ou a diferença passa da faixa sem item de caminho ativo.

Casas: quando o JSON não diz `casas`, valem as do texto, menos nas grandezas que o original imprime por STR$, que corta os zeros (`CASAS_POR_FORMATO` em `lib/caso.ts`): MEP e flecha do DESDIM com 2 casas, volume e fôrma do resumo com 1, μ com 2.

Valores com `trunca: true`: o original truncou em direção a zero antes de imprimir. A V2 bate se FIX(V2·10ⁿ)/10ⁿ for igual ao impresso, com folga de precisão SINGLE (a V2 guarda 2,08 como 2,0799999). É o caso das parcelas do .REP, que imprime ".72" para 0,729 e "-.64" para −0,648. Texto (ex.: "#6.3c/12.5") é comparado sem diferença de caixa e espaços.

## Estrutura

| Arquivo | O que faz |
|---|---|
| `rodar.sh`, `comparar.ts` | Lê os casos, monta cada um nos dois modos, anota sem par, diagnósticos e a classe do corrigido, grava o relatório. |
| `lib/caso.ts` | Formato do JSON de caso, validação e leitura das pastas. |
| `lib/numero.ts` | Número impresso e tolerância. |
| `lib/comparar.ts` | Casamento por id, situação, classe do corrigido e relatório. |
| `original/extrair.ts` | Lê a `impressora.prn` de um run pelos rótulos e grava o JSON de caso. |
| `original/fontes.ts` | Confere se cada `fonte` `.prn`/`telas/*.txt` de um JSON tem o texto impresso na linha (teste em `testes/`). |
| `casos/*.json` | Casos a, b, c e pilaredi, extraídos dos runs do oráculo da seção 2 do PLANO, e os 17 `v2par_*` da T10 (ver abaixo). |
| `casos/arquivos/<caso>/` | Os arquivos de obra que o original gravou no run (.LAJ, .VIG, .SEC, .FOR, .TAB, .DSP; o .REP só como referência), com a origem de cada um no README de lá. |
| `v2/motor.ts` | Único arquivo que chama a V2: importa a obra (`importarLaj`, `importarVigasSistrut`), chama `calcularObra` e casa cada id do caso com `resultado.sistrut`. |
| `v2/notas.ts` | Motivos de sem par, diagnósticos das DIFERE do modo original, das inesperadas do corrigido e dos casos que a V2 recusa montar; itens e famílias de id do modo corrigido. |
| `tsconfig.json` | Typecheck da paridade com os tipos da V2 de referência (`@v2/*` → `../../openstrut/src`, só em `import type`). |
| `v2/obras/<caso>.ts` | Obra de cada caso: as opções de importação e o que o roteiro digitou depois dos arquivos. |
| `v2/obras/importada.ts` | Lê `casos/arquivos/<caso>/`, importa e calcula. |
| `v2/obras/pilarAvulso.ts` | PILAR opção 6: a obra do roteiro, da `entrada` do JSON. |

Quando a API da V2 mudar (`src/calculo/fluxo.ts`, `src/calculo/sistrut/`), só `v2/motor.ts` muda.

## Como a obra é montada

Pelos importadores da V2 (docs/MODO-CALCULO.md da V2, "Importador de obra do SISTRUT (.LAJ)" e "Importar a parte de viga"), na ordem do original:

1. o .LAJ (`importarLaj`): lajes com o polígono na ordem gravada, μ, vínculos escolhidos, cargas de ocupação e alvenarias, eixos das vigas e pilares com os nomes do original;
2. o .VIG/.SEC/.FOR/.TAB/.DSP (`importarVigasSistrut`), que completa a obra do .LAJ (seções e fôrma do DESENHO; `lajesNoCorte: "nao"` quando o .FOR tem as lajes zeradas; o rept do .TAB; o número de pilar do J; as cargas do .VIG quando diferem da montagem) ou, sem .LAJ, gera a obra só de vigas (v2par_des_especial, v2par2_viga_varios);
3. o .COL/.PIP/.PIL com os .REP (`importarPilaresSistrut`), lidos nos níveis que o roteiro deu (`reps`), com o .RLP de mesmo nome; completa a obra das vigas ou, sem ela, gera a obra só de pilares (v2par2_pilar_col, v2par2_pilar_var). A armadura que o .COL grava é saída do dimensionamento; onde o PILAREDI a escolheu, a obra a tira (`semArmaduraDoCol`).

As opções só dizem o que o arquivo não tem, e o que o roteiro respondeu entra por cima (os campos de "Como montar uma obra" e de "Entrada de viga do VIGA e do DESENHO" do MODO-CALCULO). Respostas que nenhum arquivo grava, conferidas nos roteiros (`$ORACULO/casos/<caso>.txt`):

| caso | resposta no roteiro | campo |
|---|---|---|
| caso_a/b/c', pilar_niveis | peso das vigas no LAJEMONT: V1 a V3 0,12 t/m | `importarLaj` `vigas` (12 × 40) |
| v2par_laje_r2 | sem a opção 6 do LAJECALC | `otimizaNegativos: false` |
| v2par_laje_r3 | LAJECALC 7, item 6: 0,35 | `parametrosLaje.relacaoNegPosMin` |
| v2par_viga_fluxo | "V1 apoia em V5" e "V2 apoia em V5" invertidos (x) | `apoiosEmViga: { V5: ["V1", "V2"] }` |
| v2par_des_especial | "Continuo com o processamento" S nas duas passadas; "Altero a Armação" N; fissuração N | `viga.continuaSeExcederLimite` na D1; sem `armaduraDigitada` |
| caso_c_pilaredi | "Defino seção" N; "Vario a Armadura" Enter (N) | `parametrosPilar.rigidezVigas: false` |
| v2par_pilar_niveis | "Vario a Armadura" S, de 1 em 1; "Defino seção" N; .REP sem .RLP; pavimento repetido 3 vezes, P5 25 × 40, predimensionamento | `variaArmadura: 1`, `rigidezVigas: false`, `rlp: false`, `repeticoes: 3`, `predimensionamento: "tensoes"` |
| v2par2_laje_tipos | sem a opção 6; cruzamento (8, 4): 1ª opção "V2 apoia em V6" | `otimizaNegativos: false`, `apoiosEmViga: { V2: ["V6"] }` |
| v2par2_pilar_rig / def | E2E.REP no nível 2; "Prossigo com a Leitura" S / N e "Defino seção" N | `reps`; rig: o padrão de `rigidezVigas`; def: `rigidezVigas: false` |
| v2par2_pilar_var | três rodadas: "Vario" N; Redefine 6 # 16 aceito; de 2 em 2 | três obras: `variaArmadura` 0, `Pilar.armadura` no lance da fundação, `variaArmadura: 2` (ids `.r2`, `.r3`) |
| v2par2_viga_varios | VIGA 8: acidentais S, Mext S, reação máxima; VB "Altero a Armação" com φ16 no apoio 1; VC "Continuo" N | `parametrosViga.viga`, `viga.armaduraDigitada`; o padrão de `continuaSeExcederLimite` |

Nos outros campos de roteiro do MODO-CALCULO (`coeficientesLados`, `muInformado`, `armaduraDigitada`, `pilaresNoRep`, `viga.repeticoes`), os roteiros dão o padrão ou o arquivo já traz (grupo, A_11e0 e μ informado no .LAJ; rept no .TAB; pilar no J).

Sem arquivo de entrada no run, a obra é a do roteiro, com os campos do modelo: PILAR opção 6 (`Pilar.verificacoes`, de `entrada.secao` e `entrada.conjuntos` do JSON) e v2par_viga_r6 (`parametrosViga` com a acidental gerada de 150 %, `viga.cargas`, `somenteCargasProprias`). Nenhum run gravou .COL, e o importador de pilares exige o .COL: os pilares saem do .REP que a V2 calcula.

O casamento dos ids segue `calculo/sistrut/__oraculo__/confere.ts` da V2 e está no cabeçalho de `v2/motor.ts`. Id que o casamento reconhece mas a V2 não calculou sai NaN ("sem número", DIFERE), não sem par.

## Casos v2par (T10)

Os 17 JSONs da rodada `oraculo-novos` do oráculo (fora do repositório; índice em `tests/retraducao/V2PAR.md` do worktree `v1-v2par`), copiados para `casos/` com estas correções, cada uma registrada no `obs` do valor:

- μ por polígono: o extrator lia o μ do .LAJ na ordem das lajes, mas o .LAJ grava μ por polígono (`A_1210(A_10cc(i,0))`, LAJECALC.BAS:35ce6). `v2par_laje_balanco`: L1 0,8 → 1,6 e L2 1,6 → 0,8; `v2par_laje_assim`: L2 0,8 → 0,9 e L3 0,9 → 0,8. A `entrada` foi corrigida junto.
- Fonte do cobrimento nos três `v2par_des_*`: apontava a linha em branco abaixo de "Cobrimento  2  cm" (41 → 40, 46 → 45, 58 → 57).
- `v2par_laje_cargas`, `entrada.obra.obra_gravada_pelo_original.cargas_area`: o extrator desalinhava a partir da 2ª área (saíam 3 áreas, uma com "acidental 5"). Ficaram as duas do CAR.LAJ e do roteiro: 0,15 (0,10) no contorno e 0,30 (0,20) sobre a L1 (`cargas_area_obs`).

A varredura das 2284 fontes `.prn`/`telas/*.txt` (`original/fontes.ts`) não achou outro erro. μ dos 12 .LAJ dos runs relido por polígono (só balanco e assim mudam); os 46 valores lidos de desenho (`.png`) foram conferidos à vista por amostra (positivas do otim e do cargas, negativas do assim).

## Casos v2par2 (T10b)

Os 6 JSONs da rodada `oraculo-novos2` do oráculo (fora do repositório; 2417 valores; índice em `tests/retraducao/V2PAR.md` do worktree `v1-v2par`), copiados sem mudança. A T10b regerou três JSONs da rodada 1 (`v2par_laje_balanco`, `v2par_laje_assim`, `v2par_laje_cargas`): os dois primeiros são iguais aos de `casos/`; no `cargas` ficam os de `casos/`, que já tinham a `entrada.cargas_area` corrigida (a regerada ainda traz as 3 áreas do extrator) e `casas`/`trunca` no `REP.P2.carga.V2` ("6", parcela truncada); dela entra só o `obs` desse valor, que explica o corte do STR$ (VIGA.BAS:2501, 2506).

## JSON de caso

```json
{ "caso": "caso_a_laje", "run": "runs/caso_a_laje-20261015-041425", "programa": "LAJECALC + LAJEGEOM 7",
  "descricao": "...", "entrada": { "fck_tcm2": 0.15 },
  "valores": [ { "id": "L1.M+princ", "grandeza": "L1 M+ principal", "unidade": "tm/m", "impresso": "0.25", "fonte": "impressora.prn:78" } ] }
```

- `caso` dá o nome da montagem: `v2/obras/<caso>.ts`. Sem montagem, o caso entra no relatório com tudo sem par.
- `id` é único no caso e é a chave do casamento. `impresso` é o texto como saiu, e as casas decimais dele dão a tolerância.
- Opcionais: `casas`, quando o texto não mostra todas (STR$ corta zeros: "1.1" de um valor com 2 casas); `trunca`; `obs`.
- `entrada.obra.obra_gravada_pelo_original` (casos do LAJE): o .LAJ gravado. `lados` dá a geometria de `L1.lado3.codigo`.

Convenção de ids (T10b acrescenta: `des.VB.*` = impresso pelo DESDIM; `.tela` = a tela da viga que parou; `VA.a0.Mext`; `L3>V7.s2.*` = sub-área do lado 2; `L3>P5.*` = bordo sobre o pilar-parede; `V6.t1.2a.*` = 2ª linha do tramo no quadro de alvenarias; pilares pelo nome com o nível, `C1.FUND.rot`, `PA.FUND.r2.As` = 2ª rodada):

- lajes: `L1.M+princ`, `L1.As-maior`, `L1.Hmin.x/d`, `L1.M+princ.antesOtim`, `L1.mu`, `L1.lado3.codigo`, `L1.proc.posPrinc`, `L1-L2.proc.neg`, `L1>V4.area`, `total.painel`;
- vigas: `V1.t1.M+` (tramo; t0 e t(n+1) são os balanços), `V1.a0.R` (apoio 0), `V1.MEP0`, `V1.t2.EEP.M+`, `V1.t1.ppViga`;
- .REP: `REP.P5`, `REP.P5.carga.V2`, `REP.P5.momento.V2`;
- DESDIM e DESENHO 4: `V1.a1.Ast`, `V1.t1.estriboE`, `resumo.V1.Afor`, `resumo.total.comp.10`;
- pilar avulso (PILAR opção 6): `P.lambdaX`, `c1.Mx`;
- PILAREDI: `P5.1f.MRx2a` (caso 1f), `P5.As`, `P5.FUND.As` (nível nomeado).

## Como adicionar um caso

1. Gere o JSON. Há dois caminhos:
   - se o programa já tem extrator em `original/extrair.ts`: `bun paridade/original/extrair.ts <caso> <pasta do run> --saida <pasta>`;
   - se não tem, escreva o JSON à mão ou acrescente um extrator em `CASOS`.
2. Copie os arquivos de obra do run para `casos/arquivos/<caso>/` (anote a origem no README de lá) e escreva `v2/obras/<caso>.ts` com `export default (motor, modo, caso) => montarImportada(motor, modo, caso, opções)`. Sem arquivo, escreva a `Obra` do roteiro com os tipos do domínio da V2. Se o id não casar, acrescente o casamento em `v2/motor.ts`.
3. Rode `bash paridade/rodar.sh --modo original --casos <pasta>`. Id que a V2 não produz aparece em "Sem par" do relatório; dê o motivo em `v2/notas.ts`. Cada DIFERE precisa de diagnóstico lá, e cada id precisa de família no corrigido (o teste `notas` cobra).

Para regenerar `casos/` a partir dos runs do PLANO: `ORACULO=<pasta do oráculo> bun paridade/original/extrair.ts --padrao`. O teste `paridade/casos/*.json = extração dos runs do oráculo` confere isso quando `ORACULO` está definida e `$ORACULO/runs` existe.

**Run da V1 nova.** `tools/roda_retrad.sh` grava `impressora.prn` no mesmo formato do oráculo. O mesmo comando extrai dela:

```sh
bun paridade/original/extrair.ts caso_b_viga <saída do roda_retrad> --saida paridade/saida/v1nova
bash paridade/rodar.sh --modo original --casos paridade/saida/v1nova
```
