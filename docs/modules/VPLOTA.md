# VPLOTA - Plotagem de vigas contínuas editadas

Fontes: strings do executável original `VPLOTA.EXE` (fora do repositório) e `sistrut-game/VPLOTA.INI`.

Convenção de referência:
- `[ev: INI ln N]`: linha N de `sistrut-game/VPLOTA.INI`.
- `[inferido]`: dedução a partir de string ou nome, sem prova direta no código.
- Limitação das strings extraídas: quando um byte de controle precede a primeira letra, a letra some (ex.: "eguir", "im aceito", "xcluo"). A letra é deduzida e marcada `[inferido]`.

## 1. Papel

- Módulo do pacote SISTRUT 4.0 que monta as vigas editadas em folhas de corte, grava o arranjo e envia a folha para plotagem ou para arquivo `.PLT` [inferido: a partir dos títulos e menus]. Título: "PLOTAGEM DE VIGAS CONTINUAS EDITADAS".
- Versão exibida: "Abril 1991", "Versao 4.0".
- Data no `VPLOTA.INI` é 11-24-1989 13:00:00 [ev: INI ln 2]. Diverge do "Abril 1991" do texto. Não resolvido.

## 2. Chamada e retorno

- Módulo executado a partir do gerenciador, que mostra "Aguarde ..." na troca.
- Caminho de busca: usa a variável de ambiente `COMSPEC` e a pasta `\SISTRUT\EXEC40\`. Caminho exato de busca não confirmado [inferido].
- Se o módulo não for achado, exibe "Modulo nao encontrado em '".
- Saída pela tecla `<F2> = Fim` no menu inicial. Ao sair, exibe "Termino da Utilizacao do Sistema SISTRUT   Obrigado ..".
- O retorno ao gerenciador ocorre em "Retorno ao Modulo Gerenciador". Não há prova de como o gerenciador recebe o código de retorno [inferido].
- Nomes "SISTRUT" e "SISTRUTINICIAL" aparecem como identificadores do sistema [inferido: nome de parâmetro ou chave de instalação].
- Ambiente de vídeo: tokens "CGA", "HER", "EGA", "VGA". Uso não identificado [inferido: detecção de adaptador].
- Portas citadas como destino de plotagem: "LPT1:" e "COM1:".

## 3. Telas e menus

### 3.1 Menu inicial

Texto exato, na ordem da tela:
- "1  -  Montagem de Folha a partir de Arquivo ."; continuação "Arquivos Publicos padrao CAD gerados pelo Modulo Desenho-". Extensão `.DXF` não aparece na mesma string; lida como `.DXF` pelo contexto [inferido].
- "2  -  Montagem de Folha a partir de Arquivo ."; continuação "Arquivos Editados gerados pelo Modulo Desenho". Extensão `.EDV` [inferido: ln 24 do INI e texto].
- "3  -  Recuperacao de Folhas previamente salvas em ."; continuação "Arquivos contendo o Arranjo das Vigas nas Folhas". Extensão `.AVF`.
- Rodapé: "<F2> = Fim" e "escolha opcao".

### 3.2 Tela "Montagem de Folhas para Plotagem"

- Título: "Montagem de Folhas para Plotagem".
- Opção: "Criacao de um Arquivo .DXF (folha) a partir de varios .DXF (vigas) isolados)".
- Pergunta: "Deseja alterar as parametrizacoes S/*N*". Padrão `N` [inferido: maiúsculo em `*N*`].

### 3.3 Tela de parametrização

Opções:
- "<C>orrigir".
- "<S>eguir". Letra `S` [inferido].
- "<G>ravar em disco <VPLOTA.INI>". Letra `G` [inferido].

Cabeçalho: "parametrizacao-VPLOTA".

Campos, com os mesmos rótulos do `VPLOTA.INI` (ver seção 5):
- "=LARGURA DE CORTE DA FOLHA (mm)".
- "=ALTURA DE CORTE DA FOLHA (mm)".
- "=MARGEM A ESQUERDA DA FOLHA DE CORTE (mm)".
- "=MARGEM NAS OUTRAS FACES DA FOLHA (mm)".
- "=LARGURA DO CARIMBO A PARTIR DA MARGEM DIREITA (mm)".
- "=ALTURA DO CARIMBO A PARTIR DA MARGEM INFERIOR (mm)".
- "=ESCALA DO DESENHO".
- "=DRIVE DE LEITURA DOS ARQUIVOS DXF ISOLADOS".
- "=DRIVE DE GRAVACAO DO ARQUIVO DXF DA FOLHA MONTADA".
- "=DISTANCIA ENTRE DESENHOS ACIMA/ABAIXO/LADOS (mm)".
- "=POSICAO DA TABELA <I>solada <E>squerda <D>ireita".
- "=NUMERACAO DAS POSICOES NA FOLHA <I>solada <S>equencial".
- Alturas de letra em mm: "viga", "ferro", "amarracao", "apoios", "corte", "estribo", "tabela".
- "=PARAMETRIZACAO UTILIZADA NA MONTAGEM DO DESENHO (.DSP)".
- "=DRIVE DE LEITURA DOS ARQUIVOS DE DADOS (.VIG .SEC .FOR)".
- "=DRIVE DE LEITURA DAS VIGAS EDITADAS (.EDV)".
- "=DRIVE DE PLOTAGEM PARA ARQUIVOS (.PLT)".
- "=ARQUIVO GERADO EM DISCO (S/N)".
- "=X inicial DE PLOTAGEM (mm) PARA PLOTAGEM DIRETA/ARQUIVO".
- "=Y inicial DE PLOTAGEM (mm) PARA PLOTAGEM DIRETA/ARQUIVO".
- Rodapé de instrução: "Acione <Enter> para manter   ou   <ESC> <Enter> para Retornar".

Blocos de rótulo da tela com nomes diferentes dos do INI (agrupamento visual):
- "Area de Plotagem e Bordas": "largura da folha", "altura da folha", "margem esquerda", "outras margens", "largura do carimbo", "altura do carimbo", "escala do desenho 1/".
- "Drives e Extensoes de arquivos": "extensao do arquivo destino"; "drive leitura viga CAD (.DXF)"; "drive gravacao folha (.DXF)"; "drive leitura dados (.VIG)"; "drive leitura editadas (.EDV)"; "drive de plotagem (.PLT)".
- "Posicionamento e Caracteristicas do Desenho": "distancia de separacao entre desenhos"; "tabela de ferros"; "numeracao dos ferros".
- "Grandezas de Escrita   altura de letra (mm) para :".

Observação: a tela mostra "<I>solada / <E>squerda / <D>ireita" e "<I>solada / <S>equencial" como opções de letra. O `VPLOTA.INI` usa `D` e `S` [ev: INI ln 13, 14].

### 3.4 Menu de montagem de folhas

- Título: "Montagem de folhas para Plotagem".
- Opções:
  - "Criacao de um unico Arquivo .DXF a partir de varios .DXF isolados": gera uma folha em DXF.
  - "Plotagem direta de Folhas, Montadas a partir dos arquivos editados": gera e envia a folha para plotagem.
- Ações da tela de montagem:
  - "<V>isualizar a disposicao das Vigas nas folhas e altera-las".
  - "<A>lterar as Parametrizacoes ou a Escolha das Vigas entre as folhas".
  - "<S>eguir ... preparo dos arquivos .DXF".
  - "<S>eguir ... plotagem". A letra `S` não aparece nas strings; [inferido].
  - "<C>ancelar as montagens executadas".
- Rodapé: "escolha opcao".
- Confirmações: "Confirme seguir S/*N*"; "Confirme o cancelamento S/*N* !".

### 3.5 Leitura e montagem das vigas

- Entrada da obra: "Nome da Obra *RETORNO*". A mesma tela de entrada aparece na plotagem. O texto `*RETORNO*` indica opção de volta [inferido].
- Ordem de montagem: "As vigas serao montadas nas folhas, na ordem de preferencia dada a seguir."
- Seleção de registros: "Numero dos Registros das Vigas a serem Montadas I/J/../N a M/../K". Formato dos intervalos [inferido, pelo padrão `I/J/../N`].
- Leitura, com rótulos "Obra" e "Registros", mensagem "Aguarde .. Leitura de informacoes dos registros acima ..." e "tempo maximo estimado de leitura" em minutos.
- Contadores por tipo de entidade: "LINE", "TEXT", "UNI" e "TOTAL". Interpretação como contagem de entidades [inferido].
- Montagem: "Aguarde ...  Montagem das Vigas nas Folhas .."; "Atencao ...      Confirme a escolha ...".
- Registro colocado ou excluído: "O REGISTRO" seguido de "SERA COLOCADO NA FOLHA".
- Respostas da escolha: "...im aceito"; "...ao aceito"; "...xcluo da montagem". A primeira letra não aparece nas strings. Provável "Sim aceito", "Nao aceito" e "Exclui da montagem" [inferido].
- Excedente: "Nao couberam nos limites da folha / excluidos   os registros". Registros que não cabem na folha ficam excluídos.

### 3.6 Mensagens de disco

Leitura (arquivos de entrada):
- "Nenhum Arquivo Encontrado!".
- "NAO EXISTE ESTE ARQUIVO NO DISCO".
- "O SEU DISCO ESTA COMPLETO".
- "VERIFIQUE O SEU DRIVE".
- "DADOS INCORRETOS".

Gravação (folha e arquivos gerados):
- "Coloque um disco formatado em" seguido de "e acione <Enter> para seguir".
- "O disco de Gravacao esta completo."
- "Disco de dados nao encontrado."
- "Disco provavelmente nao formatado."
- "coloque outro disco formatado em".
- "Digite <Enter> para continuar ou".
- "D <Enter> para acessar o DOS". A tecla `D` é a opção de sair ao DOS [inferido].
- "para retornar acione EXIT <Enter>".

Plotagem:
- "O seu disco de plotagem esta completo ."
- "Recomece a plotagem a partir da Folha" seguido de "em outro disco ."
- "Verifique o seu Drive".
- "Acione <Enter> para continuar".

### 3.7 Gravação do conjunto de folhas (.AVF)

- Título da tela: "Plotagem direta de Folhas, Montadas a partir dos arquivos Editados (.EDV)".
- Opções: "<*C*>ontinuar ou <R>etornar".
- Texto de orientação: "O conjunto de folhas montado, pode ser gravado para uma posterior plotagem sem a necessidade de remontarmos as folhas ."
- Regra de nome: "Caso optada a gravacao, o arquivo destino tera o mesmo nome da OBRA e sera gravado com extensao .AVF (Aranjo de Vigas nas Folhas) ." O texto original grafa "Aranjo".
- Recuperação: "Estes dados poderao ser recuperados pelo item 3 do menu inicial."
- Destino: "Gravo o conjunto de folhas em <". O restante da frase não aparece nas strings [inferido: o drive é digitado depois].
- Cabeçalho do arquivo gravado: linha de assinatura do formato, gravada pelo programa; "gravacao de dados referentes a montagem de folhas para plotagem".
- Marcadores de registro: "REGISTRO" e "FIM". Uso no arquivo [inferido].

### 3.8 Progresso da montagem

- "Montagem dos arquivos .DXF em"; "montando folha"; "em".
- "tempo acumulado em processamento ...." em minutos; "dados referentes ao registro".
- "Montagem terminada ....".
- "Montagem dos arquivos de plotagem (.PLT) em". Gerado pelo mesmo fluxo de montagem [inferido].

### 3.9 Comunicado de comunicação serial e DOS

Texto exibido antes da plotagem por arquivo:
- "Atencao !"
- "Este comunicado e destinado a quem possua ou va utilizar o PLOTER"
- "Para posterior plotagem do arquivo gerado, necessitamos preparar a comunicacao"
- "serial entre o equipamento e o ploter pelo Sistema Operacional (DOS)."
- "Entre no prompt do sistema operacional com os comandos:"
- Comando de porta serial: "...>MODE COM" seguido de ",P <Enter>". O número da porta não aparece nas strings [inferido].
- Comando de redirecionamento: "...>MODE LPT1:=COM" seguido de " <Enter>".
- "Logo em seguida acione a plotagem com o comando PRINT"
- Comando de impressão: "...>PRINT Drive:\Diretorio\Subdiretorio\..\Arquivo.PLT <Enter>".
- "Continua ..."
- Dependência: o `MODE` e o `PRINT` são comandos do DOS. A porta de saída é COM1 ou LPT1 (seção 2). Ver PLOTER.md, seção sobre a comunicação do equipamento.

### 3.10 Tela de plotagem sequencial

- "Plotagem seguencial de" seguido de "folhas da Obra". Grafia original "seguencial".
- Drive e diretório da entrada: "Drive e Diretorio onde se encontram gravados os arquivos contendo os" seguido de "Arranjos das Vigas editadas previamente posicionadas nas Folhas (.AVF)".
- "Nome da OBRA  *RETORNO*".
- "Confirme plotagem da folha".
- "Plotando folha".
- "Acione <Enter> para inicio de plotagem !"
- "tempo acumulado de Plotagem ....".
- "Plotagem terminada ....".

### 3.11 Erros e interrupções de plotagem

- "Acione [ESC] para interromper ."
- "Plotagem desconectada ."
- "Apos coneccao do equipamento acione <Enter> para continuar".
- "Erro na plotagem".
- "Verifique Equipamentos/Discos e acione <Enter> para continuar".
- "Coloque a pena de numero" seguido de "no Ploter, no local da pena". O número da pena é preenchido pelo programa [inferido].
- "Acione <Enter> para seguir com a plotagem".
- "Ajuste a impressora antes de seguir   Continua N/*S*".

### 3.12 Resumo da folha

- "RESUMO GERAL DA FOLHA"; "ACO  #    TOTAL   PESO".
- Sequência de inicialização do plotter: "CS65535,DS65535,OP65535". Os comandos CS, DS e OP são os mesmos de PLOTER.md (HP-GL) [inferido].
- Rótulos de limites: "Xmax"; "Ymax".
- Dimensões: "[LARG]".

### 3.13 Ajuste de posicionamento

- "Deseja alterar o posicionamento das Vigas S/*N*".
- "FOLHA" e "alteracao registro -".
- Teclas: "Move   <+ ->Passo   <A>bandona   <Enter>Fixa   <I>mprime   <F>im". Os símbolos de setas não aparecem nas strings [inferido: "Move" com setas].
- Retorno: "Deseja <R>etornar ao arranjo inicial ou <*S*>eguir".

### 3.14 Configuração do plotter (tela de plotagem por arquivo)

- "PLOTER UTILIZADO E CONFIGURACAO DO DESENHO"; "PLOTER utilizado".
- "Plotagem gerada em Arquivo no Disco (.PLT)"; "Origem da Folha (mm) *".
- "PLOTER.INI": arquivo de equipamentos lido pelo módulo. Ver PLOTER.md.
- Opções em S/N: "# DESENHO DE VIGAS CONTINUAS"; "Desenho cotas e medidas da forma S/*N*"; "Todas as folhas serao plotadas N/*S*".
- "CHR$(". Usado na montagem da string de comando [inferido].

## 4. Entradas do usuário

Teclas de menu e de tela:
- Menu inicial: "1", "2", "3" e "<F2> = Fim".
- Parametrização: "<C>orrigir", "<S>eguir", "<G>ravar em disco".
- Edição de campos: "Acione <Enter> para manter   ou   <ESC> <Enter> para Retornar". Os valores editáveis são os que ficam à esquerda do '=' [ev: INI ln 31-32].
- Montagem: "<V>", "<A>", "<S>", "<C>".
- Ajuste manual de posição: "<+ ->", "<A>", "<Enter>", "<I>", "<F>".
- Continuação: "<*C*>ontinuar" e "<R>etornar"; "<R>etornar ao arranjo inicial ou <*S*>eguir".
- Disco: "D <Enter>", "EXIT <Enter>", "[ESC]".

Respostas S/N:
- "Deseja alterar as parametrizacoes S/*N*".
- "ARQUIVO GERADO EM DISCO (S/N)".
- "Confirme seguir S/*N*"; "Confirme o cancelamento S/*N* !".
- "Deseja alterar o posicionamento das Vigas S/*N*".
- "Desenho cotas e medidas da forma S/*N*"; "Todas as folhas serao plotadas N/*S*".
- "Ajuste a impressora antes de seguir   Continua N/*S*".

Campos de texto e números:
- Nome da obra: "Nome da Obra *RETORNO*".
- Registros: "Numero dos Registros das Vigas a serem Montadas I/J/../N a M/../K".
- Drives e diretórios: os campos "DRIVE DE..." e "PARAMETRIZACAO ... (.DSP)".
- Destino do .AVF: "Gravo o conjunto de folhas em <".
- Medidas: "LARGURA", "ALTURA", "MARGEM", "ESCALA", "DISTANCIA", "X inicial", "Y inicial" e alturas de letra.
- Posição e numeração: "POSICAO DA TABELA" e "NUMERACAO DAS POSICOES".
- Pena: "Coloque a pena de numero".

## 5. Arquivos lidos e gravados

Família e extensões. Origem dos arquivos de entrada: as strings de menu dizem "gerados pelo Modulo Desenho". A origem exata de .VIG, .SEC e .FOR não aparece no VPLOTA [inferido].

Lidos:
- `.DXF` de vigas isoladas. Pasta em "DRIVE DE LEITURA DOS ARQUIVOS DXF ISOLADOS" [ev: INI ln 10]. Família: DXF de Desenho.
- `.EDV` de vigas editadas. Pasta em "DRIVE DE LEITURA DAS VIGAS EDITADAS (.EDV)" [ev: INI ln 24]. Família: Desenho.
- `.VIG`, `.SEC` e `.FOR` de dados. Pasta em "DRIVE DE LEITURA DOS ARQUIVOS DE DADOS" [ev: INI ln 23]. Família: dados de viga [inferido: os três sufixos sugerem vigas, seções e formas].
- `.DSP` de parametrização. Valor padrão "SISTRUT" [ev: INI ln 22]. Rótulo "ARQUIVO PARAMETRIZACAO A SER UTILIZADO (.DSP)". Família: parametrização SISTRUT.
- `VPLOTA.INI` de parametrização, lido e regravado [ev: INI ln 1-40]. Família: arquivos INI do pacote.
- `PLOTER.INI` de equipamentos. Ver PLOTER.md.
- `.AVF` de arranjo de vigas nas folhas, na opção 3 do menu. Família: gerado pelo próprio VPLOTA (ver seção 7).

Gravados:
- `.DXF` da folha montada. Pasta em "DRIVE DE GRAVACAO DO ARQUIVO DXF DA FOLHA MONTADA" [ev: INI ln 11]. Família: DXF.
- `.PLT` de plotagem em arquivo. Pasta em "DRIVE DE PLOTAGEM PARA ARQUIVOS (.PLT)" [ev: INI ln 25]. Família: HP-GL, ver PLOTER.md.
- `.AVF` de arranjo, com o mesmo nome da obra.
- `VPLOTA.INI`, gravado pelo item "<G>ravar em disco".

## 6. Processamento

Fluxo geral, reconstruído a partir das telas das seções 3.1 a 3.14 [inferido]:
1. Menu inicial: o operador escolhe uma das três opções (§3.1).
2. Parametrização: os valores de VPLOTA.INI e do arquivo `.DSP` são mostrados e podem ser corrigidos, seguidos ou gravados (§3.3). O `.DSP` é identificado pelo rótulo "ARQUIVO PARAMETRIZACAO A SER UTILIZADO (.DSP)".
3. Escolha de registros: o operador informa os registros das vigas a montar, em faixa ou em lista. As vigas são lidas da pasta de dados e da pasta de vigas editadas (§5) [inferido].
4. Verificação dos dados: se a leitura ou a montagem falha, o VPLOTA mostra as mensagens da seção 8.
5. Montagem da folha: as vigas são dispostas na folha de corte. O operador confirma com "Confirme seguir S/N" ou cancela com "Confirme o cancelamento S/N". A tela de montagem oferece as teclas V, A, S e C (§3.4).
6. Ajuste manual: a pergunta "Deseja alterar o posicionamento das Vigas S/N" abre a tela de posicionamento, com as teclas de movimento, passo, abandona, fixa, imprime e fim (§3.13).
7. Arranjo em disco (opcional): o conjunto de folhas pode ser gravado em `.AVF` (§3.7).
8. Saída: a folha segue para o DXF (seção 7), para a plotagem HP-GL no equipamento de PLOTER.INI, ou para arquivo `.PLT` (§3.10 e §3.14).

Parâmetros de geometria, lidos de VPLOTA.INI [ev: INI ln 3-12, 27-28]:
- Folha de corte de 841 x 594 mm (largura x altura) [ev: INI ln 3-4]. Corresponde ao formato A1 [inferido].
- Margem esquerda de 25 mm e demais margens de 10 mm [ev: INI ln 5-6].
- Carimbo de 175 mm de largura, medido a partir da margem direita, e 287 mm de altura, medida a partir da margem inferior [ev: INI ln 7-8].
- Escala do desenho 50 [ev: INI ln 9] [inferido: a escala reduz as medidas reais das vigas ao tamanho da folha].
- Distância de 35 mm entre desenhos vizinhos, acima, abaixo e nos lados [ev: INI ln 12].
- Posição da tabela: "D" (direita), "E" (esquerda) ou "I" (isolada) [ev: INI ln 13].
- Numeração: "S" (sequencial) ou "I" (isolada) [ev: INI ln 14].
- Alturas de letra de 6, 3, 2,4, 3, 2,4, 2,4 e 2,4 mm para nome da viga, ferro, amarração, apoios, cortes, estribos e tabela [ev: INI ln 15-21].
- Origem X e Y da plotagem direta ou em arquivo, ambas em 0 mm [ev: INI ln 27-28].

Montagem de comandos HP-GL [inferido]: o VPLOTA contém cadeias com CS, DS e OP seguidas de 65535, além de Xmax e Ymax. A cadeia "CHR$(" aparece na montagem da string de comando. Os comandos e o terminador estão em PLOTER.md. Os números 65535 provavelmente são valores de limite, não medidas da folha [inferido].

## 7. Saídas

### 7.1 DXF da folha montada

Arquivo gravado na pasta de DXF da folha (§5). A estrutura segue a ordem SECTION, ENTITIES, ENDSEC e EOF.

Entidades: TEXT e LINE.

Camadas usadas: COTA, FERRO, POSITIVO, PELE, FORMA, NEGATIVO, ESTRIBO, CORTE, NOME e REPETIR.

A cadeia "POSITIVONEGATIVOFORMAPELE" agrupa camadas de armadura e de forma, provavelmente para filtrar a exportação [inferido]. A tabela de aço usa o rótulo "TABELA" e o resumo da folha usa "RESUMO GERAL DA FOLHA".

### 7.2 Tabela de aço e resumo na folha

Textos da tabela: "TIPO DE ACO", "ORDEM", "COMPARACAO DO MAXIMO" e os cabeçalhos "ACO # TOTAL PESO" e "# Q UNI TOTAL". O resumo usa "RESUMO GERAL DA FOLHA". As cadeias "[LARG]" são marcas de tabela, não texto para o operador [inferido].

### 7.3 Arquivo .PLT

Plotagem HP-GL gravada em disco, na pasta de .PLT (§5), quando a opção "Plotagem gerada em Arquivo no Disco (.PLT)" está ativa. O formato de comandos é o do equipamento escolhido em PLOTER.INI (ver PLOTER.md). A impressão posterior é feita pelo DOS (§3.9).

### 7.4 Arquivo .AVF

Arranjo das vigas nas folhas, que pode ser reaberto para plotagem posterior: "Arranjos das Vigas editadas previamente posicionadas nas Folhas (.AVF)". Grava o conjunto de folhas com o nome da obra. Ver §3.7.

### 7.5 VPLOTA.INI

Regravado quando o operador escolhe "<G>ravar em disco" na parametrização. Os valores gravados são os mostrados na seção 6 [inferido].

## 8. Mensagens de erro

Erros de arquivo e de processamento:
- "NAO EXISTE ESTE ARQUIVO". Arquivo de dados ou de parametrização não encontrado.
- "ERRO NO ARQUIVO PARAMETRIZACAO". O `.DSP` ou o VPLOTA.INI não pôde ser lido.
- "erro no processamento". Falha na montagem.
- "verifique a consistencia dos seus dados". Complemento da mensagem anterior.
- "Acione ESC <Enter> para Continuar". Confirmação que devolve ao operador.

Erros de disco e plotagem: ver §3.6 e §3.11.

Cruzamento: a mensagem "erro no processamento" aparece depois da leitura de registros (§6, passo 4). A mensagem de ESC e Enter é a saída comum das telas de erro [inferido].

## 9. Lacunas

- Data: o VPLOTA.INI diz "11-24-1989" [ev: INI ln 2], e a tela diz "Abril 1991". Não há como saber qual vale.
- Tokens de vídeo "HER", "EGA", "VGA" e "CGA": função não identificada [inferido: seleção de placa de vídeo].
- Funções de SISTRUT e SISTRUTINICIAL: o VPLOTA é chamado pelo gerenciador, mas os parâmetros de chamada não aparecem nas strings.
- Ligação do item 2 do menu inicial com a plotagem direta de .EDV: confirmada só pelos textos, não pelo fluxo.
- Formato interno de .VIG, .SEC e .FOR: não aparece no VPLOTA.
- Semântica dos grupos de camada do DXF (§7.1): não confirmada.
- Porta do "MODE COM" e modo de comunicação: depende de PLOTER.INI e não foi verificado (§3.9).
- Número da pena e tipo de caneta: a tela pede "Coloque a pena de numero", mas o número escolhido não aparece nas strings.
