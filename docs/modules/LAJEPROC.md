# LAJEPROC — Escolha, modificação e desenho das armaduras das lajes

Fontes: strings do executável original `LAJEPROC.EXE` (fora do repositório; inclui busca de nomes de arquivo) e `sistrut-game/LAJE.INI`.
Convenção: `[ev: LAJE.INI:Ln]` = linha do INI. `[inferido]` = dedução sem evidência direta.
A primeira letra de cada item de menu aparece em destaque na tela e não está nas strings. A hotkey indicada entre colchetes é `[inferido]`.

## Papel

Escolher e modificar as armaduras (positiva principal, positiva secundária e negativa) de cada laje, a partir do cálculo já feito, e desenhar/imprimir as armaduras sobre a planta das lajes. Título da tela: "Escolha de Armaduras do Painel / Lajes de um Edificio".

## Chamada e retorno

- Chamado pelo módulo LAJE. A opção do menu LAJE que corresponde é "Processar / Detalhar Lajes". O mapeamento opção → executável é `[inferido]`.
- Retorno ao LAJE: "Retorno ao Modulo Basico de LAJE", "VOLTA LAJEPROC", nome do módulo de retorno "LAJE". Protocolo geral em `_FAMILIA_LAJE.md`.
- "Aguarde ...!" durante carregamento ou processamento.
- Falha ao localizar o módulo de retorno: "Modulo nao encontrado em 6". O significado do "6" no fim não está claro `[inferido: unidade ou caminho]`.

## Telas e menus

### Menu principal (prompt "escolha opcao ")

| Hotkey | Texto no executável | Observação |
|---|---|---|
| E `[inferido]` | "scolhe todas as Armadura" (início e fim faltam) | Escolhe automaticamente as armaduras de todas as lajes |
| P `[inferido]` | "ositivo, desenho da Ferragem" | Desenho das armaduras positivas |
| N `[inferido]` | "egativo, desenho da Ferragem" | Desenho das armaduras negativas |
| M `[inferido]` | "odifica Armadura" | Tela de modificação por laje |
| I `[inferido]` | "mpressao das Armaduras" | Impressão |
| R `[inferido]` | "etorno ao Menu Principal" | Sai do módulo |

Saída do sistema: "Termino da Utilizacao do Sistema SISTRUT / Obrigado". Não se sabe se aparece ao sair deste módulo ou só do sistema `[inferido]`.

### Escolha automática (E)

- "Escolha automatica das Armaduras para as Lajes", com trecho "Lajes ( " e "ArquivadasO". O texto completo provavelmente é "...para as Lajes Arquivadas" com indicação de quantidade `[inferido]`.
- Confirmação: "Escolhe automaticamente Armadura para Todas as Lajes N/*S*". Default S.

### Modificação de armadura (M)

Título "Modificacao das Armaduras para as Lajes". Campos na ordem em que aparecem:

1. "Numero da Laje que sera Alterada/Imposta Armadura *FIM*". Entrada do número da laje; `FIM` encerra.
2. Cabeçalho da laje: "Laje", "H =", "cm". Espessura H em cm.
3. "Momento Positivo PINCIPAL" (grafia do original) e "Momento Positivo SECUNDARIO(".
4. Linha de resultado: "M =######.##        As =####.## cm2". Momento com 6 inteiros e 2 decimais; área de aço em cm² com 4 inteiros e 2 decimais. Logo abaixo, régua de tela "\   \".
5. "Momento Negativo" e ".. Continuidade com a Laje ". Informa a laje vizinha com a qual há continuidade.
6. "Armadura Positiva PRINCIPAL", "Bitola  *", "Espacamento  *".
7. "Armadura Positiva SECUNDARIA".
8. "Armadura Negativa".
9. Confirmação "Alteracao Correta  N/*S*". Default S.

Avisos da tela de modificação:
- "Armadura Negativa IMPOSTA menor que a NECESSARIA".
- "Acione o Item OTIMIZACAO em Continuidade/Espessura/Dimensionamento". Remete a um item de otimização que não está neste executável `[inferido: está em LAJE ou LAJECALC]`.

### Desenho das armaduras (P, N, Visualização)

- "Armaduras Positivas nas Lajes" e "Armaduras Negativas nas Lajes". As duas strings têm um dígito solto no fim ("2", "7"), que é lixo de tela `[inferido]`.
- "Numero das Lajes que serao mostradas as Armaduras". Entrada: "I/J/N a M/.../K  *TODAS*".
- "Visualizo <*T*>odas as Lajes  ou  cada Laje <I>solada". Default T.
- "<1> So Positiva   <2> So Negativa   <*3*> Ambas Juntas   <4> Ambas Isoladas". Default 3.
- "Dados Corretos N/*S*". Default S.

### Impressão (I)

- "Impressao do Desenho das Armaduras dispostas nas Lajes".
- Cabeçalhos do desenho: "ARMADURAS POSITIVAS", "ARMADURAS NEGATIVAS ", "ARMADURAS POSITIVAS E NEGATIVAS".
- Carimbo: " OBRA ", "       LAJES ", "2       LAJE ". Os prefixos e o "2" são lixo de tela `[inferido]`.

### Mensagens de progresso e de erro

- "~ erro no processamento".
- "ÿ verifique a consistencia dos seus dados".
- "─ Acione ESC <Enter> para Continuar ".

Os caracteres iniciais (`~`, `ÿ`, `─`) são símbolos de quadro ou marcadores `[inferido]`.

## Entradas do usuário

| Campo | Unidade | Limites / default |
|---|---|---|
| Número da laje a alterar | nº | `FIM` encerra; limite desconhecido |
| Número das lajes a mostrar | lista `I/J/N a M/.../K` | default `TODAS` |
| Modo de visualização | T / I | default T |
| Tipo de desenho | 1, 2, 3 ou 4 | default 3 |
| Bitola da armadura | não identificada (`[inferido]`: mm) | obrigatório (`*`) |
| Espaçamento | não identificada (`[inferido]`: cm) | obrigatório (`*`) |
| Altura H da laje | cm | não identificado |
| Armaduras positiva e negativa (área, bitola, espaçamento) | cm² (As) | não identificado |
| Laje de continuidade | nº | não identificado |
| Confirmações | S / N | default S |

Unidades do projeto, de LAJE.INI: comprimento `m`, força `t` [ev: LAJE.INI:L17-18]. Momento em tf·m é `[inferido]`. Fck = 0,15 t/cm², Fyk = 5,0, aço tipo B [ev: LAJE.INI:L23-25]. Os coeficientes de segurança são 1,4 (esforços), 1,4 (concreto) e 1,15 (aço) [ev: LAJE.INI:L26-28].

## Arquivos lidos e gravados

- Nenhum nome de arquivo nem extensão aparece em `LAJEPROC.EXE`, além do runtime BRUN45. Busca por `.LAJ`, `.LAP`, `.VIG`, `.RLP`, `.BAK`, `.INI` e `.DAT` deu zero ocorrências `[ev: busca no executável]`.
- Lê: os resultados de cálculo e a geometria das lajes gerados pelos módulos anteriores (LAJEGEOM, LAJECALC, LAJEGRAV). Nome e formato não identificados `[inferido]`.
- Não lê `LAJE.INI` nem `SISTRUT.LAP` diretamente `[inferido: ausência de string]`.
- Grava: não identificado. A tela "Alteracao Correta" sugere que a modificação atualiza os dados em memória ou em arquivo `[inferido]`.

## Processamento / cálculos

- Escolha automática: seleciona armadura para todas as lajes ou para as lajes arquivadas. O algoritmo não está nas strings. Lacuna.
- Para cada laje são mostrados: momento positivo principal e secundário, momento negativo com continuidade, e a área de aço As em cm².
- Validação: armadura negativa imposta menor que a necessária gera aviso.
- Armadura imposta pelo usuário substitui a calculada na laje escolhida `[inferido]`.
- Impressão e desenho usam a planta das lajes e as armaduras de cada laje.

## Relatórios e impressão

- Desenho com três modos: só positiva, só negativa, ambas (juntas ou isoladas).
- Títulos: ARMADURAS POSITIVAS / NEGATIVAS / POSITIVAS E NEGATIVAS, com carimbo OBRA / LAJES / LAJE.
- Controle de impressora vem de `LAJE.INI` [ev: LAJE.INI:L29-32]: espaçamento default 1/6" (ESC 2), espaçamento de impressão 1/8" (ESC 0), pulo de 6 linhas no picote (ESC N 6), anulação do picote para gráfico (ESC O). `[inferido: usados por LAJEPROC]`.

## Mensagens de erro

| Texto | Situação |
|---|---|
| "erro no processamento" | Falha de processamento |
| "verifique a consistencia dos seus dados" | Dados inconsistentes |
| "Armadura Negativa IMPOSTA menor que a NECESSARIA" | Armadura imposta abaixo da necessária |
| "Modulo nao encontrado em 6" | Módulo de retorno ausente |

O aviso de disquete "Coloque o Disco LAJE no Drive" é obsoleto. Não reimplementar.

## Lacunas

1. Hotkeys: a primeira letra de cada item não aparece nas strings. As letras acima são `[inferido]`.
2. Formato e nome dos arquivos de entrada e de saída. Nenhum nome aparece no executável.
3. Unidades e limites de Bitola, Espaçamento, H, M e As.
4. Lista de bitolas e espaçamentos válidos, e regra de escolha automática.
5. Significado de "ArquivadasO", "Lajes ( ", "Continuidade com a Laje" e do "6" em "em 6".
6. Mapeamento exato da opção "Processar / Detalhar Lajes" do LAJE para este executável.
7. Local e significado do item "OTIMIZACAO" citado no aviso da tela de modificação.
8. Limite de lajes para visualizar ou modificar.
