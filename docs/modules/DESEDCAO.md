# DESEDCAO.EXE — spec de reconstrução

Fonte de evidência: strings do executável original `DESEDCAO.EXE` (fora do repositório). Letras entre `<>` nas strings são hotkeys visíveis; a letra com `*...*` é o valor padrão.

## Papel

Editor de ferragem de uma viga já processada: cria, altera, junta, separa e deleta barras longitudinais (positivas e negativas, pele, grampos) e transversais (estribos, porta-estribo), define cortes e notas de observação, e mostra diagramas de esforços e armação na tela, com zoom e ampliação de trecho. Ao final grava a viga editada.

Relação com DESEDITA: "Edito novamente o desenho da armacao para alteracoes" (em DESEDITA) é o gancho provável para este módulo. [inferido]

## Chamada e retorno

- Nome do executável e cadeia: `DESEDCAO`, `DESINIT`.
- Blocos de runtime: `DESEDCAO`, `DESEDLON`, `DESPARTE`, `DESAUXCA`, `DESEDTRA`, `MIXT`. O papel de cada um é [inferido] pelo nome: edição longitudinal, edição transversal, partes da viga, auxiliar de cálculo.
- Saída: "Retorno ao Modulo Gerenciador". "RET" é rótulo de retorno de barra de comandos; sua ligação ao submenu é [inferido].
- Encerramento: "Termino da Utilizacao do Sistema SISTRUT   Obrigado ..".
- "Coloque o Disco DESINIT no Drive" e "Aguarde ...": pedido de troca de disco.
- Protocolo "VOLTA <MOD>": aparece em "Segunda posicao *VOLTA*", que é o nome de um campo, não de um módulo.
- Erros de carga RTM (BRUN45, R6005–R6007) são do runtime. Ignorados nesta spec.

## Telas e menus

Menu principal de ferragem (hotkeys visíveis):

| Tela | Hotkeys / opções |
|---|---|
| "Edicao de Ferragem Longitudinal" | `<C>riar  <A>lterar  <J>untar  <S>eparar  <D>eletar  <I>niciar  <E>sforcos` |
| Barra de comandos longitudinal | `<Z>oom  <P>orta estribo  <F>erragem transversal` |
| "Edicao de Ferragem Transversal" | `<C>riar  <A>lterar  <I>niciar  <E>sforcos  <R>etorno  <F>im` |
| Barra transversal | `<Z>oom  <N>otas  <V>er corte` |
| Criação de ferragem | `<P>ositivo  <N>egativo  pe<L>e  <G>rampo  <R>etorno` |
| "Criacao de Grampos"; barra de tipo | `<P>ositivo  <N>egativo  <R>etorno` |
| "Juncao de Ferragem" | `Junto pela maior Bitola <S> ou <*R*>etorno` |
| "Deletar Ferragem" | `para deletar todos: <PO> ou <NE> ou <GP> ou <GN> ou <TODOS>` |
| "Corte da Viga" | `Local de Corte <S>im <*N*>ao <R>etorno` |
| "Alteracao de Ferragem Transversal" | `Corrigir <S>im <*N*>ao <D>eletar <R>etorno`; "Deletar intervalo indicado SIM/*N*" |
| "Notas de Observacao na Forma" e "...na Armadura" | `<E>squerda <C>entro <D>ireita` |

Telas de dados (campos com padrão entre `*...*`):

- "Criacao de Ferragem Positiva": Quantidade `*0*`; Bitola da Ferragem (mm); Inicio no Tramo; Distancia (cm +) a partir da face esquerda do Balanco / do Apoio; Termino no Tramo; Comprimento do Gancho Esquerdo (cm) `*0*`; Comprimento do Gancho Direito (cm) `*0*`.
- "Criacao de Ferragem Negativa": Bitola, Inicio no tramo.
- "Criacao da Armadura de Pele:": "ATENCAO! A Armadura existente deve ser mantida NAO/*S*"; "Crio uma Nova Armadura N/*S*"; Bitola (mm) `*RETORNO*`; Numero de Barras por face; "Tramo que possua Armadura Diferente *NENHUM*"; Numero de barras do Tramo por face; Bitola (mm).
- "Criacao de Grampos Positivos": Numero do Tramo; "no lado <E>squerdo ou <D>ireito"; Bitola (mm); Numero de Grampos; Comprimento do Grampo a partir da face do Apoio (cm).
- "Criacao de Grampos Negativos": Numero de Grampos.
- "Alteracao de Ferragem,": Numero da posicao a ser alterada `*RETORNO*`; Posicao; Quantidade `*`; Bitola (mm) `*`; Inicio-Distancia (cm +) a partir da esquerda do Balanco; Termino-Distancia (cm +); Comprimento do Gancho Esquerdo/Direito (cm).
- "Separacao de Ferragem,": Numero da Posicao a ser Separada `*RETORNO*`; Comprimento de Emenda `*`; Distancia do inicio da Emenda, a partir da ponta da barra.
- "Deletar Posicao": SIM/`*N*`. "TODOS". "Numero da posicao que sera Deletada `*RETORNO*`".
- "Geracao Automatica de Porta-Estribo": Geracao Automatica S/N `*`.
- "Criacao de Estribos": Espacamento `*RETORNO*`; Bitola da Ferragem (mm); Localizado no Tramo; Inicio (cm +) a partir da face esquerda do Balanco ou do Apoio; Termino (cm +).
- "Alteracao de ferragem": Espacamento `*`; Bitola da Ferragem (mm) `*`; Inicio.
- "Notas de Observacao": "Altero a Nota S/*N*"; "Numero do Tramo em que sera colocada a Nota *NENHUM*"; Posicao no Tramo; "Numero da Posicao em que sera colocada a Nota *RETORNO*"; "NOTA:".

Telas de desenho e confirmação:

- "Desenho Diagramas e Armacoes"; "Ampliacao de Trecho do Desenho"; "(Desenho total da Viga, do Tramo ... ao Tramo"; "Desenhar do Tramo i a j  i,j *".
- "Gravo a Viga Editada em <". Nome do arquivo não aparece nas strings. [lacuna]
- "Confirme o termino da Edicao  SIM/*N*".
- "Abandono TODAS as modificacoes e retorno a Armacao acima SIM/*N*".
- "Inicializacao de Ferragem Longitudinal" e "Inicializacao de Ferragem Transversal".
- "Diagramas de Esforcos/Armacao nao foram solicitados ou impressos em escala". Mensagem de aviso; a escala não aparece.
- "FOTO": opção sem texto explicativo. [inferido: opção de foto/cópia do desenho]
- "Qualquer Tecla para Continuar".
- "TABELA"; "<< Verifique as Notas das Armaduras >>".
- "Notas" e "Ver corte".

Rótulos de barra de comandos: INICIA, ZOOM, ESFORCOS, ZOOMEST, RET.

Título do menu de criação: "Criacao de Ferragem".

Strings de drivers de vídeo: CGA, MCG, EGA, VGA, HER e um segundo conjunto HER/EGA/VGA.

Fragmentos "OR" e "XOR" aparecem no fim do arquivo, sem contexto de tela. Não entram nesta spec. [inferido: lixo ou palavras-chave do runtime]

## Entradas do usuário

| Campo | Tipo | Padrão / valores |
|---|---|---|
| Hotkey do menu | letra | ver tabela de menus |
| Confirmação de término | S/N | N |
| Abandono de modificações | S/N | N |
| Quantidade de barras | inteiro | 0 |
| Bitola (mm) | número | sem padrão nas strings |
| Início e término (cm) | número, a partir da face | — |
| Comprimento de gancho (cm) | número | 0 |
| Tramo / posição | número / E,C,D | NENHUM |
| Espaçamento de estribo | número | RETORNO |
| Armadura de pele | S/N | N (existente mantida = NAO) |
| Local de corte | S/N | N |
| Geração automática de porta-estribo | S/N | — |
| Nota de observação | S/N e texto | N |

## Arquivos lidos e gravados

Nenhuma extensão de arquivo aparece nas strings de DESEDCAO. [lacuna]

| Arquivo | Operação | Evidência |
|---|---|---|
| Viga editada (nome não aparece) | gravado | "Gravo a Viga Editada em <" |
| Viga editada, provavelmente `.EDV` | gravado [inferido] | DESEDITA cita `.EDV` como "Vigas Editadas" |
| Parametrização | não há referência a `.DSP` nas strings | — |

## Processamento

- Carrega a viga já calculada (ferragem existente) e mostra o desenho. Sem evidência de como carrega. [lacuna]
- Edita a ferragem por posição: criar, alterar, juntar, separar, deletar. Cada operação pede bitola, quantidade e posição no tramo.
- Regras: ferros positivos não se juntam com negativos ("NAO PODEMOS JUNTAR FERROS POSITIVOS COM NEGATICOS"). Juntar usa a maior bitola.
- Deletar por posição ou por tipo (PO, NE, GP, GN, TODOS).
- Gera porta-estribo e estribos automaticamente (S/N), com espaçamento e intervalo de tramo.
- Cortes da viga: "Local de Corte".
- Notas de observação por tramo ou por posição da armadura, com alinhamento E/C/D.
- Ao término, pede confirmação e grava a viga editada.
- Desenho: zoom, ampliação de trecho, desenho de tramo i a j.

## Relatórios e impressão

- Não há string de impressora neste executável. [ev: ausência]
- Diagramas e armação só saem se "solicitados ou impressos em escala". Esse aviso sugere impressão em escala, mas o mecanismo não aparece. [inferido]
- A tabela "TABELA" é tela de quantidades. Formato não aparece. [inferido]

## Mensagens de erro

Avisos de edição: "NAO PODEMOS JUNTAR FERROS POSITIVOS COM NEGATICOS" (sic), "ATENCAO! A Armadura existente deve ser mantida NAO/S", "ATENCAO! para Substituicao, a Armadura existente devera ser DELETADA", "Diagramas de Esforcos/Armacao nao foram solicitados ou impressos em escala". Erros gerais: "erro no processamento", "verifique a consistencia dos seus dados", "Acione ESC <Enter> para Continuar", "Modulo nao encontrado em".

## Lacunas

1. Nome e formato do arquivo gravado ("Gravo a Viga Editada em <"): não aparece nas strings. Não se sabe se é `.EDV` ou outro.
2. Como a viga é carregada e de onde vem a ferragem inicial (DESEDITA, DESDIM ou arquivo intermediário): sem evidência.
3. Funções dos blocos `DESEDLON`, `DESPARTE`, `DESAUXCA`, `DESEDTRA`, `MIXT`: apenas nomes.
4. Significado de "FOTO", "INILONG", "INITRAN": nomes sem contexto.
5. Ordem de navegação entre os menus longitudinal e transversal: a tabela segue a posição das strings no executável, não o fluxo.
6. Formato da tabela de quantidades ("TABELA") e do desenho em escala: não lidos.
7. Trechos ilegíveis por bytes corrompidos nas strings, não reconstruídos: "(ê$", "(,$", "(Inicio-¢", "(vide".
