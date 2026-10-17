# Checklist dos livros U31..U45 (família LAJE) na retradução

Gerado por `tests/retraducao/laje/checklist.py` a partir dos livros (`$REA_WORK/ledger/U31..U45.json`), da cobertura da V1 instrumentada (`cobertura.py`) e do resultado de cada caso (`casos.json`). Não editar à mão.

As divergências dos livros comparam o original com a V1 antiga (`src-reconstructed`). Na retradução cada comando vem do original, no mesmo endereço, então todas ficam resolvidas por construção; o que falta é conferir no oráculo. Critério de "conferido": algum endereço que o livro cita para a divergência rodou na V1 num caso cuja saída bateu com o oráculo ("sim"); rodou só em caso com diferença conhecida ("parcial", com o pedido que explica); ou não rodou em nenhum caso ("não"). Quando o livro só dá a entrada da rotina, a coluna diz "rotina" (a rotina rodou, o ponto exato não está localizado).

## Casos

| caso | roteiro | resultado contra o oráculo |
|---|---|---|
| piloto | tests/retraducao/lajeproc_e2e.sufixo.txt (oráculo retrad_lajeproc) | 27 de 29 iguais (impressora 14.557 bytes iguais); os 2 diferentes são o FRE do LAJEGRAV (Kbytes livres). Oráculo retrad_lajeproc-20261015-082452 |
| calc | laje/calc.sufixo.txt | 34 de 34 iguais (impressora 3.916 bytes iguais, inclusive a hora) |
| calc2 | laje/calc2.sufixo.txt | 31 de 32 iguais (impressora 16.518 bytes iguais); o diferente (k06) é o trecho que pisca por TIMER no LAJECALC (0x32094..0x3227b), que segue o relógio real |
| menus | laje/menus.sufixo.txt | 36 de 43 iguais; os 7 diferentes são o FRE do LAJEGRAV |
| param | laje/param.sufixo.txt | 41 de 41 iguais (impressora 16.515 bytes iguais; Fck 0.2, aço A, CSE 1.5, eficiência 90 %, entradas recusadas) |
| teclas | laje/teclas.sufixo.txt | 13 de 14 iguais (Esc e F2 no LAJE, LAJEGRAV, LAJECALC, LAJEPROC e LAJEGEOM); o diferente é o FRE do LAJEGRAV |
| geom | laje/geom.sufixo.txt | 13 de 16 iguais (impressora 85.670 bytes iguais); os 3 diferentes são o FRE do LAJEGRAV. E2E.LAJ e E2E.BAK iguais byte a byte |
| fluxo | laje/fluxo.sufixo.txt | 77 de 80 iguais, do LAJEGEOM ao LAJEPROC passando pelo LAJEMONT (impressora 36.131 bytes iguais); os 3 diferentes são o FRE do LAJEGRAV. E2E.LAJ, E2E.BAK, E2E.VIG e E2E.RLP iguais byte a byte |

## U31 (LAJE): 95 divergências

| divergência | endereço | impacto | diferença (resumo do livro) | conferido no oráculo |
|---|---|---|---|---|
| U31-001 | 0x10030 | fluxo | A V1 nao implementa o protocolo de retorno VOLTA; apenas espera uma tecla apos o submodulo. | sim (piloto, calc, calc2, menus, param, teclas, geom, fluxo) |
| U31-002 | 0x10030 | arquivo | O original procura o LAJE.INI no drive do COMSPEC e em caminho fixo; a V1 usa o diretorio corrente (_CWD$). | sim (piloto, calc, calc2, menus, param, teclas, geom, fluxo) |
| U31-003 |  | fluxo | verificação de licença do original | não se aplica: verificação de licença do original desativada (marcas PROTECAO no correcoes.json) |
| U31-004 | 0x10030 | arquivo | O original le o INI por posicao; a V1 busca cada valor pela descricao. Um INI com linhas em outra ordem ou faltando linhas produz resultados diferentes. | sim (piloto, calc, calc2, menus, param, teclas, geom, fluxo) |
| U31-005 | 0x10030 | arquivo | O formato do INI difere: o original tem duas linhas (drive e diretorio); a V1 le uma unica linha com drive e diretorio juntos. | rotina (piloto, calc, calc2, menus, param, teclas, geom, fluxo) |
| U31-006 | 0x10030 | arquivo | A V1 acrescenta a barra mas nao executa CHDIR para o diretorio de dados, que o original faz na linha 205. | sim (piloto, calc, calc2, menus, param, teclas, geom, fluxo) |
| U31-007 | 0x10030 | calculo | A V1 nao tem os valores padrao do original. O 0.15 do Fck na LAJECALC.BAS parece corresponder a V_0e78 (linha 23 do lift), mas o mapeamento nao foi confirmado. | sim (piloto, calc, calc2, menus, param, teclas, geom, fluxo) |
| U31-008 | 0x10030 | tela | Os codigos de controle da impressora nao aparecem na V1 aparentemente. | sim (piloto, calc, calc2, menus, param, teclas, geom, fluxo) |
| U31-009 | 0x113ec | tela | A V1 usa cores fixas e nao tem o ramo de placa monocromatica ("HER", destaque 14, fundo 0, rotulos 9) nem o teste PCOPY 0,1 que o dispara. | sim (piloto, calc, calc2, menus, param, teclas, geom, fluxo) |
| U31-010 | 0x113ec | arquivo | O original procura o LAJE.INI em <unidade do COMSPEC>:\SISTRUT\EXEC40\ (ou A:\ se o boot e A/B) e, se a abertura ou a leitura falhar numa unidade C..F, tenta... | sim (piloto, calc, calc2, menus, param, teclas, geom, fluxo) |
| U31-011 | 0x113ec | fluxo | A V1 nao decodifica os codigos de impressora do LAJE.INI (espacamento 1/6", 1/8", pulo de picote e anulacao), entao os valores configurados nao chegam a nenh... | sim (piloto, calc, calc2, menus, param, teclas, geom, fluxo) |
| U31-012 | 0x113ec | calculo | Para o formato do INI distribuido (CHR$(27)+CHR$(50) etc.) o resultado e o mesmo, mas fora dele diverge: o original ignora todo texto fora dos numeros apos '... | rotina (piloto, calc, calc2, menus, param, teclas, geom, fluxo) |
| U31-013 | 0x115f0 | tela | A V1 nao emite BEEP, nao define area de texto/cores nem tem tratador de erro neste ponto. | não |
| U31-014 | 0x115f0 | tela | Texto sem o prefixo 'Arquivo parametrizacao ' e sem o caminho (V_0e1c$ + V_0e18$); coluna 3 no lugar da coluna 1. | não |
| U31-015 | 0x115f0 | tela | A V1 nao mostra a linha 'ultimo dado lido' com o valor de V_0f18$, e usa coluna 3 em vez de 1. | não |
| U31-016 | 0x115f0 | arquivo | O original adota sempre o nome SISTRUT no fallback; a V1 usa o nome da chave do INI (ou SISTRUT se a chave faltar) e mostra o caminho desse arquivo. | não |
| U31-017 | 0x115f0 | tela | A V1 imprime uma linha extra com o caminho do .LAP (linha 12) que o original nao mostra nesta rotina; posicao em coluna 3 no lugar do original. | não |
| U31-018 | 0x115f0 | validacao | O original aceita qualquer tecla (um caractere lido, sem validacao neste bloco) e nao imprime a mensagem 'Acione ESC <Enter>'; a V1 so aceita ESC ou Enter. | não |
| U31-019 | 0x117aa | fluxo | F2 no original troca para o gerenciador SISTRUT.EXE (RUN) apos as mensagens de Aguarde/Retorno; na V1 F2 encerra o programa no DOS (SYSTEM), sem chamar o SIS... | sim (piloto, calc, calc2, menus, param, teclas, geom, fluxo) |
| U31-020 | 0x117aa | fluxo | Na V1 essas teclas sao lidas por INKEY$ e ignoradas silenciosamente pelo menu; o original emite BEEP a cada uma e as consome pela trap. | sim (piloto, calc, calc2, menus, param, teclas, geom, fluxo) |
| U31-021 | 0x117aa | fluxo | As teclas 15-18 (atalhos definidos por KEY) saem para o SISTRUT no original; a V1 nao define nem trata esses atalhos. | sim (piloto, calc, calc2, menus, param, teclas, geom, fluxo) |
| U31-022 | 0x117aa | tela | No original a falha do RUN encerra o programa com a mensagem de Termino; na V1 o RunSubmodulo mostra outra mensagem na linha 24 (com o nome do modulo entre p... | não (a rotina rodou em piloto, calc, calc2, menus, param, teclas, geom, fluxo; o ponto citado, não) |
| U31-023 | 0x117aa | validacao | No original, F1 e F3 a F10 emitem bipe; na V1 são ignoradas em silêncio. | sim (piloto, calc, calc2, menus, param, teclas, geom, fluxo) |
| U31-024 | 0x11bc8 | fluxo | A tecla 2 vai para LAJEGEOM no original; a V1 chama LAJEGRAV (que no original e o destino da tecla 6, via L_13805 em 0130c0_F_130c0). | sim (piloto, calc, calc2, menus, param, teclas, geom, fluxo) |
| U31-025 | 0x11bc8 | fluxo | A V1 so aceita os digitos; no original as letras destacadas tambem sao teclas validas. | sim (piloto, calc, calc2, menus, param, teclas, geom, fluxo) |
| U31-026 | 0x11bc8 | fluxo | A V1 inventa as opcoes 8 e 9 (marcadas RECONSTRUCAO) e nao emite BEEP para tecla invalida. | não (a rotina rodou em piloto, calc, calc2, menus, param, teclas, geom, fluxo; o ponto citado, não) |
| U31-027 | 0x11bc8 | fluxo | O original troca de programa por CHAIN (sem retorno ao menu), com CHDIR, ate 4 tentativas e aviso de disco; a V1 executa como subprocesso, volta ao menu com ... | sim (calc, calc2, menus, param, teclas, geom, fluxo) |
| U31-028 | 0x11bc8 | fluxo | O original so chama LAJEPROC (4) e a lista (5) quando contadores vindos de COMMON sao diferentes de zero; a V1 chama sempre. | sim (piloto, menus, param, teclas, fluxo) |
| U31-029 | 0x11bc8 | fluxo | No original F2 (trap ON KEY) volta ao gerenciador SISTRUT por RUN e so encerra se ele nao existir; a V1 encerra direto com a mensagem de termino. | sim (piloto, calc, calc2, menus, param, teclas, geom, fluxo) |
| U31-030 | 0x11bc8 | fluxo | A ordem difere (V1 pede Fyk logo apos Fck) e a V1 sempre pede unidade e multiplicador; no original eles so sao pedidos quando o Fck foi alterado. | sim (menus, param) |
| U31-031 | 0x11bc8 | validacao | O original rejeita zero e negativos e aceita qualquer texto cujo VAL seja > 0 (ex. '25t' -> 25); a V1 aceita 0 e negativos, rejeita '25t' e, se o campo for a... | sim (param) |
| U31-032 | 0x11bc8 | validacao | A V1 aceita unidade numerica (ex. '5'); o original a rejeita quando VAL(texto) <> 0. | sim (param) |
| U31-033 | 0x11bc8 | validacao | Regra A/B igual; a V1 rejeita o campo apagado (vazio) em vez de manter o valor atual. | sim (menus, param) |
| U31-034 | 0x11bc8 | tela | A V1 mostra mensagem e exige ESC/Enter; o original so emite BEEP. | sim (param) |
| U31-035 | 0x11bc8 | arquivo | O original altera so as variaveis em memoria (repassadas aos modulos seguintes, provavelmente por COMMON no CHAIN) e volta direto ao menu; a V1 grava LAJE.IN... | sim (piloto, calc, calc2, menus, param, teclas, geom, fluxo) |
| U31-036 | 0x11bc8 | tela | Posicoes, destaque (no original a letra e destacada, nao o digito), titulo do item 1 e cabecalho diferem; a V1 acrescenta 'Obra -' e 'Dados em' sem origem e ... | sim (piloto, calc, calc2, menus, param, teclas, geom, fluxo) |
| U31-037 | 0x11bc8 | tela | Linhas, colunas e molduras diferem; o rotulo do multiplicador da V1 nao mostra o nome da unidade corrente (o original imprime V_0de4$, ja atualizado se a uni... | sim (menus, param, teclas) |
| U31-038 | 0x11bc8 | fluxo | A V1 nao usa CHAIN, nao tem ON ERROR nem contagem de 4 tentativas, nao pede disco para A:/B: e nao faz CHDIR. Checa a existencia do .EXE uma vez e chama o pr... | sim (piloto, menus, param, teclas, fluxo) |
| U31-039 | 0x11bc8 | tela | A V1 imprime so a primeira pagina (1 a 16) e nao percorre as lajes seguintes. O original percorre todas as lajes em paginas de 16. | sim (menus) |
| U31-040 | 0x11bc8 | tela | A V1 mostra a mensagem DadErro antes de sair. O trecho original sai sem mensagem. Nao confirmei se V_0e3c% e o retorno de LajLe%. | sim (menus) |
| U31-041 | 0x130c0 | fluxo | A V1 lista todas as lajes na ordem do vetor, sem excluir o codigo 2, e corta em 16; o original numera so as lajes de codigo diferente de 2 e usa o intervalo ... | sim (menus) |
| U31-042 | 0x130c0 | tela | A V1 classifica a laje pela geometria (cruz ou 1 direcao); o original mostra o codigo de tipo gravado (MA, PRE ou MAn). | sim (menus) |
| U31-043 | 0x130c0 | calculo | O original usa a contagem de bordos de uma tabela (A_109e%) e flags de outra (A_10fa%); a V1 conta letras de uma string. Nao ha prova de que as duas represen... | sim (menus) |
| U31-044 | 0x130c0 | calculo | O original le o peso gravado e zera para PRE; a V1 calcula 2,5 x h / 100 para todas as lajes. | sim (menus) |
| U31-045 | 0x130c0 | calculo | A V1 recalcula carga como g + q e area como lx x ly; o original mostra os valores gravados. Se os gravados nao forem essas expressoes, o numero difere. | sim (menus) |
| U31-046 | 0x130c0 | tela | Fonte diferente (A_12fc x Laj(i).h), formato inteiro x uma casa decimal, e a V1 ignora a condicao de V_12fa% e de A_12fc > 0. | sim (menus) |
| U31-047 | 0x130c0 | tela | O original decodifica o codigo de armadura em diametro e espacamento; a V1 so mostra se a armadura foi calculada. | sim (menus) |
| U31-048 | 0x130c0 | tela | A V1 nao imprime o numero da linha e comeca o nome na coluna 3; o original monta o nome com prefixo V_0e58$ e deslocamento V_0e54, nao lido do registro. | sim (menus) |
| U31-049 | 0x130c0 | tela | A V1 desenha o banner da empresa, usa 'Obra H' no titulo (texto marcado como RECONSTRUCAO), imprime o nome da obra na linha 5 em vez da linha 2, nao tem os s... | sim (menus) |
| U31-050 | 0x130c0 | tela | Lados, livre, peso, carga e armadura comecam em colunas diferentes das do PRINT USING original, que alinha os numeros a direita. | sim (menus) |
| U31-051 | 0x130c0 | tela | A V1 imprime duas mensagens que nao aparecem neste bloco do original; podem estar no chamador, o que nao foi verificado. | sim (piloto, calc, calc2, menus, param, teclas, geom, fluxo) |
| U31-052 | 0x130c0 | tela | A V1 nao aplica a cor da linha, a cor da armadura nem o COLOR 7 do texto. | sim (menus) |
| U31-053 | 0x130c0 | tela | O prompt do original sai logo apos a lista (sem linha fixa), tem espacos nas pontas, chama FUN_3000_07f1 antes da espera e usa INPUT$(1); a V1 fixa o prompt ... | sim (menus) |
| U31-054 | 0x130c0 | fluxo | Nao existe na V1 o fluxo de carga do LAJEGRAV por CHAIN com tratamento de erro; a V1 usa RunSubmodulo, que nao e equivalente. | sim (piloto, calc, calc2, menus, param, teclas, geom, fluxo) |
| U31-055 | 0x130c0 | fluxo | O original transfere o controle com CHAIN para LAJEGRAV, com tratamento de erro de disco, CHDIR, aviso de troca de disco para A: e B: e ate 4 tentativas ante... | sim (piloto, calc, calc2, menus, param, teclas, geom, fluxo) |
| U31-056 | 0x13997 | tela | O cabecalho da V1 e o banner do programa; o original mostra so a faixa de titulo entre filetes de 80 caracteres (CHR$ 205). | sim (menus, param) |
| U31-057 | 0x13997 | tela | A V1 tem linhas deslocadas (titulo 6 em vez de 5), nao tem as linhas em branco, usa col 3 em vez de col 1 e alinha valores na col 62 em vez de logo apos o ro... | sim (menus, param) |
| U31-058 | 0x13997 | tela | A V1 nao mostra o diretorio antes do nome do .LAP. | sim (menus, param) |
| U31-059 | 0x13997 | fluxo | No original, D so existe dentro do fluxo P (pergunta de nome); no topo da V1 ele edita o diretorio padrao direto. | sim (param) |
| U31-060 | 0x13997 | fluxo | A V1 e uma edicao de campo: nao lista os .LAP, nao faz CHDIR, nao tem o fluxo D de troca de diretorio, nao guarda/restaura o nome anterior, nao chama o equiv... | sim (param) |
| U31-061 | 0x13997 | tela | A V1 põe o prompt na linha 18 em vez da linha 24, acrescenta '1' no fim (nao existe no dump deste bloco) e pre-preenche o valor atual. Pre-preenchimento no o... | sim (menus, param) |
| U31-062 | 0x13997 | validacao | A V1 valida como numero, pede de novo em valor invalido e grava no LAJE.INI. O original converte com VAL, sem validar, e neste bloco nao grava nada. | sim (param) |
| U31-063 | 0x13997 | validacao | A V1 rejeita valor vazio; o original aceita e grava vazio. | sim (param) |
| U31-064 | 0x13997 | fluxo | O original sai so com item vazio; a V1 sai tambem com ESC. Pelo original, ESC (CHR$(27), LEN = 1) cairia no BEEP, se FUN_3000_0049 devolver esse caractere. | sim (menus, param) |
| U31-065 | 0x13997 | fluxo | A V1 nao da retorno sonoro para tecla invalida. | não (a rotina rodou em menus, param; o ponto citado, não) |
| U31-066 | 0x13997 | arquivo | Falta a chamada equivalente a FUN_1000_4959 depois da troca de .LAP. | sim (param) |
| U31-067 | 0x13997 | tela | Prompt na linha 18 no V1 e na linha 24 no original; V1 imprime um '1' final que o bloco nao tem. | sim (menus, param) |
| U31-068 | 0x13997 | arquivo | V1 nao converte o nome para maiusculas e nao chama FUN_1000_4959 (carga do .LAP, a confirmar) nem restaura o nome anterior em caso de erro. | sim (param) |
| U31-069 | 0x14172 | fluxo | Original: Enter com campo vazio cancela a troca e volta sem erro. V1: campo vazio nao cancela; vira '\' e mostra 'Nenhum Arquivo Encontrado'. | sim (param) |
| U31-070 | 0x14172 | validacao | Original: entrada invalida ou diretorio inexistente so emite BEEP e repete a pergunta. V1: mostra texto de erro na linha 24. | sim (param) |
| U31-071 | 0x14172 | arquivo | Original resolve 'sub' para <diretorio atual>sub\ antes de testar e de CHDIR. V1 testa e grava o texto relativo sem resolver. | sim (param) |
| U31-072 | 0x14172 | arquivo | Original, neste bloco, nao grava o diretorio em arquivo; V1 grava o novo valor no LAJE.INI. | não (a rotina rodou em param; o ponto citado, não) |
| U31-073 | 0x14172 | tela | Original: rotulo e diretorio atual na linha 23, campo vazio. V1: rotulo na linha 20, legenda na 21, campo na 22 ja preenchido com o valor do INI. | sim (param) |
| U31-074 | 0x14172 | fluxo | Original adota SISTRUT (nome da parametrizacao) e chama FUN_1000_4959 antes de voltar. V1 so escreve a mensagem: o nome com erro continua em uso (LapNome$ ca... | não (a rotina rodou em param; o ponto citado, não) |
| U31-075 | 0x14172 | tela | Original: titulo em maiusculas, BEEP e linha com o ultimo dado lido, na area 15-25. V1: uma linha na linha 10, sem o dado lido. | não (a rotina rodou em param; o ponto citado, não) |
| U31-076 | 0x14172 | tela | Original: mensagem na linha 6 com BEEP, depois volta para outra rotina (L_13d62). V1: mensagem na linha 24, sem BEEP, e repete o campo. | sim (param) |
| U31-077 | 0x14172 | tela | Para .LAP inexistente o texto e a posicao diferem: original imprime 'Nenhum Arquivo Encontrado' na posicao atual do cursor; V1 imprime '.LAP nao encontrado' ... | não (a rotina rodou em param; o ponto citado, não) |
| U31-078 | 0x14172 | validacao | Na V1, entrada vazia nao sai sem mudar: cai na validacao (LEN(v) > 1 falso) e mostra erro. Entrada invalida na V1 mostra mensagem e mantem o texto digitado p... | sim (param) |
| U31-079 | 0x147d7 | fluxo | No original, qualquer erro de execucao no LAJE mostra esta tela e, com ESC, volta ao menu principal; na V1, fora do modo roteiro, o erro de execucao cai no d... | sim (piloto, calc, calc2, menus, param, teclas, geom, fluxo) |
| U31-080 | 0x14959 | calculo | Com parametrizacao SISTRUT o original usa sempre a tabela embutida de 0x149a7 e ignora qualquer SISTRUT.LAP em disco; a V1 le SISTRUT.LAP se o arquivo existi... | sim (piloto, calc, calc2, menus, param, teclas, geom, fluxo) |
| U31-081 | 0x14959 | calculo | Com parametrizacao SISTRUT o original sobrescreve os coeficientes de seguranca do INI com 1.4/1.4/1.15; a V1 usa os valores do INI e so recorre a 1.4/1.4/1.1... | sim (piloto, calc, calc2, menus, param, teclas, geom, fluxo) |
| U31-082 | 0x14959 | tela | A V1 verifica o arquivo do .LAP mesmo quando o nome e SISTRUT; sem SISTRUT.LAP na pasta ela mostra '.LAP nao encontrado' e 'Sera adotada a parametrizacao SIS... | sim (piloto, calc, calc2, menus, param, teclas, geom, fluxo) |
| U31-083 | 0x14959 | fluxo | A V1 nao tem rotina equivalente: o LAJE so valida o arquivo e o LAJECALC rele tudo; no original a parametrizacao e carregada no LAJE e chega ao LAJECALC pelo... | sim (piloto, calc, calc2, menus, param, teclas, geom, fluxo) |
| U31-084 | 0x1499d | fluxo | Com a parametrizacao SISTRUT, o original nao abre o SISTRUT.LAP e usa os padroes fixos de L_149a7; a V1 le o SISTRUT.LAP e aplica o que estiver nele. | sim (piloto, calc, calc2, menus, param, teclas, geom, fluxo) |
| U31-085 | 0x1499d | validacao | O original rejeita a relacao fixa Mneg/Mpos de cantos reentrantes fora de 0..1: mostra o erro com a ultima linha lida e volta a todos os padroes SISTRUT. A V... | sim (piloto, calc, calc2, menus, param, teclas, geom, fluxo) |
| U31-086 | 0x1499d | validacao | O original guarda a eficiencia da armadura negativa como fracao (100 vira 1.0) e da ERROR 1 se a fracao for <= 0 ou > 100. A V1 guarda em % (padrao 100) e na... | sim (piloto, calc, calc2, menus, param, teclas, geom, fluxo) |
| U31-087 | 0x1499d | calculo | A V1 nao le a tabela de bitolas do .LAP e usa outra lista: faltam 4.0 e 22.2 e sobra 32. O original tem 10 posicoes, a V1 tem 9. Tambem nao le as areas (area... | sim (piloto, calc, calc2, menus, param, teclas, geom, fluxo) |
| U31-088 | 0x1499d | calculo | O original le o multiplicador de Ec da flecha, ou um Ec fixo (prefixo 'E', guardado com sinal negativo como marca). A V1 fixa o multiplicador em 0.9 e nao te... | sim (piloto, calc, calc2, menus, param, teclas, geom, fluxo) |
| U31-089 | 0x1499d | calculo | A V1 usa espacamento maximo fixo de 20, sem ler o .LAP e sem a opcao de limitar o espacamento a 2*Htotal. | sim (piloto, calc, calc2, menus, param, teclas, geom, fluxo) |
| U31-090 | 0x1499d | calculo | O original escolhe o espacamento numa lista discreta lida do .LAP (7.5/10/12.5/15/17.5/20). A V1 calcula espacamento continuo em multiplos de 0.5 e nao le a ... | sim (piloto, calc, calc2, menus, param, teclas, geom, fluxo) |
| U31-091 | 0x1499d | arquivo | A V1 nao carrega a tabela A_123e de pares, nem a lida do .LAP nem a padrao de 15 pares. O original nao confere o limite de 21 linhas. | sim (piloto, calc, calc2, menus, param, teclas, geom, fluxo) |
| U31-092 | 0x1499d | arquivo | A V1 nao carrega a tabela A_0f34 nem tem os padroes dela. | sim (piloto, calc, calc2, menus, param, teclas, geom, fluxo) |
| U31-093 | 0x1499d | arquivo | O original le por posicao e a V1 por rotulo. Com o arquivo na ordem esperada os valores coincidem. Com linha a mais, a menos ou comentario no meio de uma sec... | sim (param) |
| U31-094 | 0x1499d | validacao | O original exige a marca por igualdade numa posicao fixa (depois do cabecalho, das 6 linhas da tabela e de 2 linhas livres); a V1 aceita o texto como substri... | rotina (piloto, calc, calc2, menus, param, teclas, geom, fluxo) |
| U31-095 | 0x1499d | calculo | A V1 nao le do .LAP a tabela de 6 faixas (limite, indice de bitola) que o original carrega e passa em COMMON ao calculo, entao um .LAP com tabela diferente d... | rotina (piloto, calc, calc2, menus, param, teclas, geom, fluxo) |

## U32 (LAJECALC, LAJECALC): 31 divergências

| divergência | endereço | impacto | diferença (resumo do livro) | conferido no oráculo |
|---|---|---|---|---|
| U32-001 | 0x101f0 | fluxo | O original entra direto no menu com os dados do COMMON e recusa rodar sem o COMMON (video$ vazio); a V1 pede a obra, le o .LAJ e o LAJE.INI/.LAP por conta pr... | sim (calc, calc2, menus, param, teclas, fluxo) |
| U32-002 | 0x10695 | tela | Posicoes (linhas 6-20 de 2 em 2, coluna 20, prompt 22,20), numeracao '1 - ' a '8 - ', moldura de STRING$(80,205), letra A tambem destacada e aceita no item 5... | não (a rotina rodou em calc, calc2, menus, param, teclas, fluxo; o ponto citado, não) |
| U32-003 | 0x10ee9 | fluxo | O original volta ao gerenciador LAJE por CHAIN com a instrucao 'VOLTA LAJECALC' (sem mensagem e sem gravar arquivo); a V1 encerra o programa com a mensagem d... | sim (calc, calc2, menus, param, fluxo) |
| U32-004 | 0x10284 | fluxo | No original Esc em qualquer tela volta ao menu principal, F2 e Ctrl+Alt+Del saem para o LAJE e F1/F3-F10 so apitam; a V1 nao tem esses atalhos. | sim (calc, calc2, menus, param, teclas, fluxo) |
| U32-005 | 0x1d177 | fluxo | Qualquer erro de execucao no original fecha os arquivos, mostra a tela de 3 linhas centrada (linhas 10-12) e prende o usuario ate Esc, voltando ao menu; a V1... | não |
| U32-006 | 0x11041 | fluxo | O original impoe a ordem Continuidade -> Direcoes -> Espessuras Minimas -> Imposicao -> Momentos/Otimizacao na sessao (opcao fora de ordem volta calada ao me... | sim (calc, calc2, param, teclas, fluxo) |
| U32-007 | 0x112a6 | validacao | Original: lista de NUMEROS de laje validada (fora da faixa ou faixa com fim <= inicio -> BEEP e pergunta de novo), Enter vazio = todas, '*TODAS*' digitado e ... | sim (calc, calc2, param, teclas, fluxo) |
| U32-008 | 0x111e6 | tela | A ordem do texto da contagem e outra (original ' Arquivadas 12 Lajes ( L1 a L12 )'; o RECONSTRUCAO da V1 nao se confirma), as respostas sao LINE INPUT e nao ... | sim (calc, calc2, param, teclas, fluxo) |
| U32-009 | 0x11864 | arquivo | O original imprime na impressora (com salto de pagina opcional, cabecalhos e rodape com parametros, data e hora) e mostra na tela com o quadro de parametros ... | sim (calc, calc2, param, fluxo) |
| U32-010 | 0x13899 | calculo | O original procura H so pelo dimensionamento a flexao (x/d <= limite nas secoes positiva e negativa maxima) de Hmin a Hmax, comecando exatamente em Hmin (sem... | sim (calc, calc2, param, fluxo) |
| U32-011 | 0x14317 | calculo | Mesma flexao (bloco retangular, b = 100, aco em fyd, x/d <= limite) mas: (1) o original divide a armadura negativa pela eficiencia (F86) quando ela e < 1 e a... | sim (calc, calc2, param, fluxo) |
| U32-012 | 0x14579 | calculo | Na coluna 'As' o original escolhe bitola e espacamento pelas tabelas (bitola minima por H, espacamento minimo por H, limite 2H opcional) e escreve '#bitola c... | sim (calc, calc2, param, fluxo) |
| U32-013 | 0x12fd6 | tela | Formatos diferentes: H com 1 casa ('##.#'), x/d com 3 casas e branco se x <= 0, L/f inteiro ('#####'), cargas com 2 casas nas mascaras do original; a V1 usa ... | sim (calc, calc2, param, fluxo) |
| U32-014 | 0x1312b | calculo | A coluna L/f do original imprime uma variavel que o programa nunca calcula (sai ' 0'); a V1 calcula vao/flecha. | sim (calc, calc2, param, fluxo) |
| U32-015 | 0x12f5b | calculo | Quando nenhum H ate Hmax atende, o original troca a linha da laje pela mensagem ' H necessario > H maximo configurado' e marca H = -1; a V1 imprime a linha c... | sim (calc, calc2, param, fluxo) |
| U32-016 | 0x1382b | calculo | Mesma expressao algebrica; a unica diferenca e o fator de unidade df0 (DS:0DF0, vem do COMMON) que o original aplica a fyd/Es e a V1 nao tem; com df0 = 1 os ... | sim (calc, calc2, param, fluxo) |
| U32-017 | 0x157e7 | validacao | O original so aceita H inteiro entre Hmin e Hmax (fora disso apita e pergunta de novo) e termina com Enter vazio; a V1 aceita qualquer h > 0 abaixo de Hmax (... | sim (calc, fluxo) |
| U32-018 | 0x154ad | fluxo | No original a imposicao so vale para lajes do tipo 0 ou 3, recalcula o peso proprio, zera os resultados da laje, mostra 'Ultima Espessura Fornecida / H = .. ... | sim (calc, fluxo) |
| U32-019 | 0x148c2 | tela | O original desenha a planta do painel em modo grafico com nome e espessura de cada laje (e pode imprimi-la); a V1 so repete a tabela em texto. | sim (calc2) |
| U32-020 | 0x1691b | fluxo | Ordem e condicoes das perguntas diferentes (original: Imprimo, Visualizo painel, Todas/Isolada so se painel = S, depois o tipo de listagem e 'Dados Corretos'... | sim (calc, calc2, param, fluxo) |
| U32-021 | 0x12069 | calculo | No original M+ secundario = M+ principal multiplicado (relacao <= 1) ou dividido (relacao > 1) pela relacao da direcao (A1210(L,1)), e M- maior/menor = M+ pr... | sim (calc, calc2, param, fluxo) |
| U32-022 | 0x12923 | calculo | O original devolve -1 (impresso '-1.00') nas colunas As+sec e As- quando a linha neutra e 0 (momento nulo) ou a secao nao passa, aplica o minimo na As+princ ... | sim (calc, calc2, param, fluxo) |
| U32-023 | 0x1207f | tela | Mascaras e larguras diferentes (H com 1 casa e nome em 7 colunas no original; valores em campos de 11 caracteres com 2 casas separados por 3, 8, 4 e 5 espaco... | sim (calc, calc2, param, fluxo) |
| U32-024 | 0x1748b | tela | O original desenha o painel com os valores (truncados para 2 casas por INT(v*100)/100) sobre cada bordo e no centro de cada laje; a V1 mostra so tabelas em t... | sim (calc2) |
| U32-025 | 0x1a9e3 | calculo | O original otimiza de fato: reduz iterativamente o coeficiente Mneg/Mpos do lado de maior momento na proporcao M2/M1 (truncado em 2 casas, nunca abaixo do mi... | sim (calc, calc2, param, fluxo) |
| U32-026 | 0x1b972 | calculo | A V1 nao le nem verifica a armadura imposta nos trechos de continuidade; o original compara com tolerancia de 3 % e reduz o coeficiente (no maximo 15 % por p... | sim (calc, calc2, param, fluxo) |
| U32-027 | 0x1a54e | fluxo | O original pergunta uma laje por vez (com a proxima como padrao e '*' para sair) e mostra o andamento na janela 15-25; a V1 pede uma lista de uma vez, nao de... | sim (calc, fluxo) |
| U32-028 | 0x1c278 | tela | Posicoes (linhas 5-21 de 2 em 2, coluna 20), letras de atalho destacadas, formato dos valores (PRINT padrao e '#.##' contra FormataNumero$ com 2 casas) e pro... | sim (menus, param) |
| U32-029 | 0x1c9a7 | validacao | O original valida cada parametro numa faixa e recusa com BEEP (inclusive cantos reentrantes >= 1 e minima >= maxima); a V1 aceita qualquer valor. | não (a rotina rodou em menus, param; o ponto citado, não) |
| U32-030 | 0x1c8d5 | fluxo | No original as letras de atalho tambem escolhem o item e qualquer tecla fora das opcoes sai para o menu; o prompt mostra o valor atual entre asteriscos com a... | parcial (o código que liga as teclas rodou em menus, param; a rotina não rodou no caso teclas, o único que manda Esc/F2) |
| U32-031 | 0x13db9 | calculo | A V1 calcula tudo em DOUBLE; o original arredonda para SINGLE a cada variavel intermediaria, o que pode mudar o ultimo digito impresso e, nos testes de limit... | sim (calc, calc2, param, fluxo) |

## U33 (LAJECALC, LAJECHAR, LAGEOCAL): 3 divergências

| divergência | endereço | impacto | diferença (resumo do livro) | conferido no oráculo |
|---|---|---|---|---|
| U33-001 | 0x30182 | fluxo | O original pergunta ao usuario, par a par, se os lados formam continuidade (S/N); a V1 nunca pergunta e decide pela geometria. | sim (fluxo) |
| U33-002 | 0x33da0 | tela | A original escolhe a cor de desenho pelo tipo de monitor (14 ou 10 em EGA/VGA, nenhuma cor nos demais) e pelo elemento da matriz 0x11e0; a V1 usa 7 e 15 fixo... | não (a rotina rodou em calc, calc2, fluxo; o ponto citado, não) |
| U33-003 | 0x35423 | validacao | Original recusa Relacao fora de [0, 180] e Direcao fora de [0, 180) com BEEP e nova entrada; V1 recusa Relacao <= 0 (original aceita 0) e nao tem teto de 180... | sim (calc2) |

## U34 (LAJECALC, LAMONTLB): 5 divergências

| divergência | endereço | impacto | diferença (resumo do livro) | conferido no oráculo |
|---|---|---|---|---|
| U34-001 | 0x4019b | calculo | O original constroi explicitamente o padrao de charneiras (segmentos) de um poligono qualquer e entrega a lista ao LACALCU; a V1 nao constroi geometria nenhu... | sim (calc, calc2, param, fluxo) |
| U34-002 | 0x402a7 | calculo | O original trata laje poligonal com N vertices e bordos inclinados; a V1 so aceita retangulo alinhado aos eixos com 4 bordos. | sim (calc, calc2, param, fluxo) |
| U34-003 | 0x4d8ae | calculo | No original o coeficiente de engastamento e por bordo, continuo, (codigo-2)/10 ponderado pelo comprimento dos trechos colineares; na V1 e 0 ou o iE global. | sim (calc, calc2, param, fluxo) |
| U34-004 | 0x22590 | calculo | A linha que sai do canto no original depende continuamente de i dos dois bordos (i=1 contra 0 da 35,26 graus, nao 30); a V1 usa pesos fixos SQR(3)/1. | sim (calc, calc2, param, fluxo) |
| U34-005 | 0x4cca5 | calculo | O original monta o padrao para qualquer combinacao de bordos livres (charneira pelo cruzamento dos bordos apoiados vizinhos ou pela divisao SQR(1+i)); a V1 s... | sim (calc, calc2, param, fluxo) |

## U35 (LAJECALC, LACALCU): 9 divergências

| divergência | endereço | impacto | diferença (resumo do livro) | conferido no oráculo |
|---|---|---|---|---|
| U35-001 | 0x5935b | calculo | O original calcula o momento pelo metodo da energia sobre um poligono qualquer (razao trabalho interno/externo com o padrao de charneiras A160c); a V1 usa a ... | sim (calc, calc2, param, fluxo) |
| U35-002 | 0x59117 | calculo | O original corrige o trabalho com os termos (1-sen a)/(sen a+1,14) e (1-sen a)/(5 sen a+1,14); a V1 nao tem esses termos. | sim (calc, calc2, param, fluxo) |
| U35-003 | 0x5936e | calculo | No original a relacao Mneg/Mpos dos cantos reentrantes entra no coeficiente como (1+cantos)*l_2a; na V1 o parametro e lido e editado mas nao chega ao calculo. | sim (menus, param) |
| U35-004 | 0x5cc4d | calculo | O original tem coeficiente de engastamento proprio de cada bordo, i = (A10fa-2)/10 (passo 0,1 por causa do CINT), ponderado pelo comprimento dos trechos agru... | sim (calc, calc2, param, fluxo) |
| U35-005 | 0x50a17 | calculo | Na afinidade o original estica y por 1/SQR(mu) quando mu<1 e estica x por SQR(mu) quando mu>1, truncando as coordenadas a 0,01 (piso); a V1 sempre divide ly ... | sim (calc, calc2, param, fluxo) |
| U35-006 | 0x50643 | calculo | O original gira o poligono pelo angulo exato da armadura, trunca as coordenadas a 0,01 e translada ao minimo; a V1 so escolhe mu ou 1/mu pelo eixo mais proxi... | sim (calc, calc2, menus, param, teclas, fluxo) |
| U35-007 | 0x50dff | calculo | O original soma so o comprimento de cada alvenaria que fica dentro do poligono da laje, zerando o trecho sobre bordo apoiado/engastado; a V1 soma comprimento... | sim (calc, calc2, param, fluxo) |
| U35-008 | 0x5312e | calculo | O original usa a area da intersecao do poligono de carga com a laje e separa duas parcelas de carga (colunas 0 e 1 de A1014); a V1 usa a area lancada inteira... | sim (calc, calc2, param, fluxo) |
| U35-009 | 0x52254 | calculo | O original decide coincidencia de pontos/bordos e paralelismo com tolerancias 0,005 (comprimento) e 0,002 (inclinacao/angulo); a V1 nao tem essa logica. | sim (calc, calc2, menus, param, teclas, fluxo) |

## U36 (LAJEGEOM, LAJEGEOM): 37 divergências

| divergência | endereço | impacto | diferença (resumo do livro) | conferido no oráculo |
|---|---|---|---|---|
| U36-001 |  | fluxo | verificação de licença do original | não se aplica: verificação de licença do original desativada (marcas PROTECAO no correcoes.json) |
| U36-002 | 0x10030 | arquivo | V1 le LAJE.INI, .LAJ e .EIX e grava .LAJ/.EIX; o original nao abre arquivo nenhum. | rotina (teclas, geom, fluxo) |
| U36-003 | 0x10239 | fluxo | No original F2 ou Ctrl+Alt+Del devolvem ao LAJE de qualquer ponto, Esc volta ao menu de qualquer ponto e F1,F3..F10 so bipam; na V1 nada disso existe. | sim (teclas, geom, fluxo) |
| U36-004 | 0x1064b | tela | Cabecalho, linhas/colunas dos itens, cor e letra destacada (no item 1 e o 'x', no 6 sao 'L' e 'C'), linha do prompt e ausencia dos itens 4 e 5 diferem. | sim (teclas, geom, fluxo) |
| U36-005 | 0x10d00 | fluxo | V1 nao aceita letras-atalho, nao tem as opcoes 4 (Estrutura/Lancamento) e 5 (Pilares), nao bloqueia 2 sem eixos nem 8 sem geometria. | sim (teclas, geom, fluxo) |
| U36-006 | 0x10f49 | fluxo | No original a opcao 7 e uma rotina do LAJEPIVI seguida de CHAIN para LAJEMONT com ate 3 tentativas e pedido de disco em A:/B:; a V1 tem um submenu proprio e ... | sim (fluxo) |
| U36-007 | 0x11209 | fluxo | V1 pergunta por gravacao e espera 'EXIT <Enter>'; o original volta direto ao LAJE por CHAIN com f28$='VOLTA LAJEGEOM' e repete se o disco faltar. | sim (geom, fluxo) |
| U36-008 | 0x11361 | tela | Layout, textos de ajuda, linha de entrada e a janela de 5 eixos em torno do corrente nao existem na V1. | sim (teclas, geom, fluxo) |
| U36-009 | 0x118ad | fluxo | A V1 nao tem os codigos *n, A, R, C, I, S nem a entrada de cota direta com eixo corrente; usa teclas unicas e campos proprios. | sim (fluxo) |
| U36-010 | 0x12732 | validacao | V1 aceita cota negativa, repetida ou fora de ordem; o original recusa com BEEP. | sim (fluxo) |
| U36-011 | 0x11f4a | calculo | Geracao repetida de eixos com passo arredondado a 0,001 nao existe na V1. | não (a rotina rodou em teclas, geom, fluxo; o ponto citado, não) |
| U36-012 | 0x117af | tela | Os eixos verticais sao identificados por letras (com apostrofos apos Z) no original e por numeros na V1. | sim (fluxo) |
| U36-013 | 0x1157e | calculo | V1 guarda cotas em DOUBLE com teto fixo 40 e limite do INI; o original usa SINGLE, limite emax% recebido do LAJE e a contagem dentro da propria matriz. | sim (fluxo) |
| U36-014 | 0x1297b | fluxo | A V1 nao tem o relatorio impresso de geometria; os equivalentes existem apenas na tela. | sim (geom, fluxo) |
| U36-015 | 0x1297b | calculo | No original o comprimento da carga linear sai das coordenadas do segmento (SQR); na V1 e um valor digitado. | não (a rotina rodou em geom, fluxo; o ponto citado, não) |
| U36-016 | 0x1297b | calculo | No original a area da carga de area sai dos vertices; na V1 e digitada direto. | sim (geom) |
| U36-017 | 0x1297b | tela | O original usa letras no eixo vertical e numero no horizontal; a V1 usa numero nos dois sentidos. | sim (geom) |
| U36-018 | 0x1297b | tela | O original quebra a linha a cada 6 eixos; a V1 nao tem essa quebra. | sim (geom) |
| U36-019 | 0x1297b | tela | O original imprime todas as cargas; a V1 mostra 5 e corta o resto com '...'. | sim (geom) |
| U36-020 | 0x1297b | arquivo | A V1 nao imprime o relatorio de cargas. Os totais aparecem so na tela, sem cabecalho de obra, eixos, contorno, data/hora e tabela por carga. | sim (geom, fluxo) |
| U36-021 | 0x1297b | fluxo | A V1 nao implementa o relatorio impresso. Falta todo o trecho do original: flags, cabecalhos, secoes de tracos, pilares e lajes, totais e rodape. | sim (geom) |
| U36-022 | 0x15706 | fluxo | A V1 troca o editor de contorno por cursor sobre a grade de eixos por uma tabela de lajes com formulario (LajEditaGeom%) e uma visualizacao passiva; nao ha c... | sim (geom, fluxo) |
| U36-023 | 0x15706 | tela | O original escolhe o modo pelo monitor e desenha num sistema logico de 640x200 em todos os modos; a V1 usa sempre SCREEN 12 em pixels de 640x480. | sim (geom, fluxo) |
| U36-024 | 0x15706 | tela | O original mede a faixa pelo 1o e ultimo eixo de cada direcao (j=1 e X, j=0 e Y); a V1 usa o retangulo envolvente das lajes. A regra 0.4167 e correcao de asp... | rotina (geom, fluxo) |
| U36-025 | 0x15706 | tela | Origem X 45 e base Y 159 em 640x200 no original contra 40 e 420 em 640x480 na V1. | rotina (geom, fluxo) |
| U36-026 | 0x15706 | validacao | A V1 pede o nome na carga do programa e aceita qualquer texto (vazio vira 'sem nome'), sem recusar nome numerico ou com ponto e sem UCASE$; o original pede a... | rotina (geom, fluxo) |
| U36-027 | 0x1a298 | tela | Eixo horizontal: o original vai de x=30 a x=620 com y = 165 - V_14d8 - (v - V_14e8) * V_14ba; a V1 usa origem 40/420 e escala calculada da caixa das lajes. | sim (geom, fluxo) |
| U36-028 | 0x1a298 | tela | O original so desenha eixos dentro da janela visivel (inclusivo nas duas pontas); a V1 desenha todos. | sim (geom, fluxo) |
| U36-029 | 0x1a298 | tela | Eixo vertical: o original vai de y=5 a y=157 fixos; a V1 vai da caixa das lajes ate y=420, com origem x=40. | sim (geom, fluxo) |
| U36-030 | 0x1a298 | tela | No original os eixos sao pontilhados com estilos diferentes (&H1010 horizontal, &H1111 vertical) e cor vinda de uma variavel local do chamador; a V1 desenha ... | sim (geom, fluxo) |
| U36-031 | 0x1a298 | tela | A V1 nao rotula os eixos; o original escreve o numero do eixo horizontal em x=2, 4 px abaixo da linha, e a letra do vertical 3 px a esquerda, em y=165. | sim (geom, fluxo) |
| U36-032 | 0x1a298 | tela | O original muda a cor de frente para 10 so em EGA/VGA e restaura a cor salva depois da grade; a V1 nao tem essa condicao. | sim (geom, fluxo) |
| U36-033 | 0x1a298 | fluxo | A V1 Desenha junta modo de tela, lajes, eixos e espera de tecla numa so SUB; no original a grade e uma sub-rotina chamada por GOSUB dentro de FUN_1000_5706, ... | rotina (geom, fluxo) |
| U36-034 | 0x1a298 | tela | O original tem um cursor de seta que restaura o fundo e salva o novo antes de desenhar; a V1 nao tem cursor grafico. | rotina (geom, fluxo) |
| U36-035 | 0x1a298 | tela | A V1 nao desenha a lista de segmentos A_0fb8. | rotina (geom, fluxo) |
| U36-036 | 0x1a298 | tela | A V1 nao tem o redesenho da grade restrito ao intervalo de um segmento. | rotina (geom, fluxo) |
| U36-037 | 0x1a298 | fluxo | A V1 nao tem o reset de flags de estado do editor grafico. | rotina (geom, fluxo) |

## U37 (LAJEGEOM): 14 divergências

| divergência | endereço | impacto | diferença (resumo do livro) | conferido no oráculo |
|---|---|---|---|---|
| U37-001 | 0x20137 | tela | A V1 usa sempre SCREEN 12 e uma paleta; o original escolhe SCREEN 3, 2 ou 9 e as cores conforme o monitor. | sim (geom, fluxo) |
| U37-002 | 0x20137 | tela | Os dois usam escala isotropica limitada por 560 em X (0.4167 = (200/640)*(4/3) corrige o pixel da janela 640x200), mas o limite vertical do original e 145 de... | sim (geom, fluxo) |
| U37-003 | 0x20137 | tela | O original enquadra a planta pelo primeiro e ultimo elemento de A_0f8a (contagem em (0,k); provavelmente cotas dos eixos, coluna 1 = x e 0 = y), sem min/max ... | sim (geom, fluxo) |
| U37-004 | 0x20137 | tela | O original desenha em coordenadas logicas 640x200 via WINDOW, com as constantes 45 e 10 (provaveis margens usadas nos GOSUBs); a V1 usa pixels de SCREEN 12 c... | sim (geom, fluxo) |
| U37-005 | 0x20137 | tela | O original mostra ' Aguarde ...' na linha 25; a V1 nao mostra. | sim (geom, fluxo) |
| U37-006 | 0x20137 | fluxo | O original volta a SCREEN 0 so quando V_1528$ = "" (com V_1528$ preenchido continua no modo grafico); a V1 sempre espera tecla e volta a SCREEN 0. | sim (geom, fluxo) |
| U37-007 | 0x20137 | validacao | O original exige V_0e3e% <> 0 e V_0e3a% <> 0 e sai sem aviso; a V1 testa so LajQtd = 0 e mostra mensagem. | sim (geom, fluxo) |
| U37-008 | 0x20137 | fluxo | A V1 nao reinicializa as matrizes de trabalho e os contadores quando V_0e3c% = 0. | sim (geom, fluxo) |
| U37-009 | 0x20770 | tela | A V1 nao tem as teclas N, B, T (tipo), A (alinhamento) nem a tecla C como porta de entrada das cargas; a tela so edita a laje selecionada. | sim (fluxo) |
| U37-010 | 0x20770 | calculo | A V1 nao tem peso proprio separado da carga permanente, nao tem imposicao global e o rotulo do segundo campo (q, parcela acidental) nao aparece no bloco orig... | sim (fluxo) |
| U37-011 | 0x20770 | calculo | A V1 grava sempre, sem filtro de tipo (a V1 nao tem campo de tipo); o original nao grava carga permanente em lajes pre-moldadas-puladas (tipo 2) e nao grava ... | sim (fluxo) |
| U37-012 | 0x20770 | validacao | Nao foi conferido se EntradaNumero# aceita '0' e rejeita valor <= 0 da mesma forma. | sim (fluxo) |
| U37-013 | 0x20770 | arquivo | A funcionalidade de tipo (maciça, pre-moldada, comum) com inclinacao e de alinhamento (zerado por S) nao existe na V1. | sim (fluxo) |
| U37-014 | 0x20770 | fluxo | A V1 tem so a tabela de g e q e as teclas E e F; nao tem as teclas C, T e A nem o fluxo de tipo e alinhamento. | rotina (geom, fluxo) |

## U38 (LAJEGEOM, LAJEPIVI): 14 divergências

| divergência | endereço | impacto | diferença (resumo do livro) | conferido no oráculo |
|---|---|---|---|---|
| U38-001 | 0x36ea2 | tela | O menu da V1 nao tem <J>untar, <S>eparar nem <R>edesenhar, e a linha sai na posicao 7,3 em vez de 24,1 (faixa de mensagem). | sim (fluxo) |
| U38-002 | 0x36ea2 | fluxo | A separacao de vigas (S/P/F com cursor e insercao de ponto em A_11b2%) nao existe na V1. | não (a rotina rodou em geom, fluxo; o ponto citado, não) |
| U38-003 | 0x36ea2 | fluxo | A tecla R (redesenhar) nao e tratada na V1. | sim (fluxo) |
| U38-004 | 0x36ea2 | arquivo | A V1 trunca o nivel para inteiro (INT e tipo INTEGER); o original guarda o valor fracionario em SINGLE. | sim (fluxo) |
| U38-005 | 0x36ea2 | validacao | A V1 aceita nivel negativo e, em texto invalido, mostra erro e repete; o original rejeita negativos e mantem o valor sem aviso. | não (a rotina rodou em geom, fluxo; o ponto citado, não) |
| U38-006 | 0x36ea2 | arquivo | A V1 nao pede nem grava a denominacao usada na numeracao das vigas. | não (a rotina rodou em geom, fluxo; o ponto citado, não) |
| U38-007 | 0x36ea2 | tela | Campo do nivel na linha 23 col 3 sem o formato '*valor*' e sem redesenhar os numeros das vigas apos a mudanca. | sim (fluxo) |
| U38-008 | 0x36ea2 | fluxo | A V1 marca alteracao sempre; o original so liga o indicador quando ha entrada valida. | sim (fluxo) |
| U38-009 | 0x36ea2 | validacao | Criterio diferente: o original testa peso proprio = 0 so em lajes de tipo 0 ou 3; a V1 testa altura h <= 0 em todas as lajes (TLaje nao tem campo de peso pro... | sim (fluxo) |
| U38-010 | 0x36ea2 | validacao | Pergunta na linha 22 em vez de 24; a V1 cancela tambem com ESC e le uma tecla em vez de LINE INPUT. | sim (fluxo) |
| U38-011 | 0x36ea2 | tela | A V1 mostra o aviso sempre, nas linhas 14/16, com outra quebra e sem BEEP; o original so quando V_120e%=0, nas linhas 23-24, com BEEP. | sim (fluxo) |
| U38-012 | 0x36ea2 | tela | Pergunta na linha 19 em vez de 25 (ESC tambem cancela na V1) e sem a mensagem ' Aguarde ..'. | sim (geom, fluxo) |
| U38-013 | 0x36ea2 | fluxo | A V1 volta ao menu apos G, nao faz SCREEN 0 no F e sai tambem com ESC; o original sai por L_3c976 em G e F e ignora ESC neste bloco. | sim (fluxo) |
| U38-014 | 0x3987b | tela | No empate de X entre verticais o original numera primeiro o segmento de baixo; a V1 numera primeiro o de cima, entao vigas verticais na mesma linha recebem V... | sim (fluxo) |

## U39 (LAJEGEOM): 12 divergências

| divergência | endereço | impacto | diferença (resumo do livro) | conferido no oráculo |
|---|---|---|---|---|
| U39-001 | 0x40137 | tela | Titulo com a ordem das palavras invertida (CARGAS DE OCUPACAO no original; OCUPACAO E CARGAS na V1) e cabecalho montado com STRING$ em vez de TelaCabecalho. | sim (fluxo) |
| U39-002 | 0x40137 | tela | A barra de comandos do original tem os comandos I, D, R, Z, C, E, F, M, A, L, P e +/-; a V1 mostra so E e F. | sim (fluxo) |
| U39-003 | 0x40137 | fluxo | O original move o cursor no plano em X com as teclas 4/6 e setas esquerda/direita; a V1 usa setas para mover a selecao entre lajes na lista e Enter/E para ab... | sim (fluxo) |
| U39-004 | 0x40137 | tela | A V1 nao tem editor grafico de retangulos: a carga e informada por prompt numerico, nao desenhada sobre a planta. | sim (fluxo) |
| U39-005 | 0x40137 | arquivo | O original guarda a geometria do retangulo (quatro coordenadas); a V1 guarda apenas comprimento ou area e carga, sem posicao na planta. | sim (fluxo) |
| U39-006 | 0x40137 | validacao | A V1 aceita carga linear zero ou negativa; o original rejeita carga <= 0 com BEEP e repete a entrada. | não (a rotina rodou em geom, fluxo; o ponto citado, não) |
| U39-007 | 0x40137 | validacao | A V1 nao valida a carga por area; o original exige Total > 0. | sim (fluxo) |
| U39-008 | 0x40137 | calculo | O original guarda por area uma parcela acidental separada do Total (0 <= p < Total); a V1 nao tem esse campo e soma a carga de area inteira na carga permanen... | sim (fluxo) |
| U39-009 | 0x40137 | validacao | A V1 recusa a entrada 'A*B' que o original aceita (multiplica, mostra o produto e pede confirmacao N/S). | sim (fluxo) |
| U39-010 | 0x40137 | tela | No original o valor padrao da carga linear e a carga do trecho anterior; na V1 o padrao e 0. | não (a rotina rodou em geom, fluxo; o ponto citado, não) |
| U39-011 | 0x40137 | fluxo | A V1 nao tem 'apagar todas' nem 'escolher a carga a deletar'; so retira a ultima. | não (a rotina rodou em geom, fluxo; o ponto citado, não) |
| U39-012 | 0x40137 | tela | A V1 nao tem editor grafico: comprimento e area sao digitados em vez de derivados de trechos e poligonos desenhados na planta. | sim (fluxo) |

## U40 (LAJEGRAV, LAJEGRAV): 67 divergências

| divergência | endereço | impacto | diferença (resumo do livro) | conferido no oráculo |
|---|---|---|---|---|
| U40-001 | 0x105cc | fluxo | O original aceita letras maiusculas e minusculas como atalhos das opcoes; a V1 aceita so os digitos 1-7. | sim (piloto, calc, calc2, menus, param, teclas, geom, fluxo) |
| U40-002 | 0x105cc | tela | O original mostra o texto 'Acesso ao DOS (NNN Kbytes livres )' calculado com FRE; a V1 mostra 'Acesso ao disco de dados' sem valor de Kbytes livres e com out... | sim (piloto, calc, calc2, menus, param, teclas, geom, fluxo) |
| U40-003 | 0x105cc | fluxo | A V1 nao executa shell do DOS, nao mostra a mensagem 'para retornar acione EXIT <Enter>' e nao redesenha o menu; mostra apenas um texto de 'nao calculado'. | não (a rotina rodou em piloto, calc, calc2, menus, param, teclas, geom, fluxo; o ponto citado, não) |
| U40-004 | 0x105cc | tela | O original exibe o drive:diretorio atual ao lado da opcao 6 (COLOR 3); a V1 nao exibe. | sim (piloto, calc, calc2, menus, param, teclas, geom, fluxo) |
| U40-005 | 0x105cc | fluxo | Ha correspondencia de papel (alterar drive/diretorio), mas o original trata a tecla 'D' do nome de arquivo como acesso a alteracao de diretorio e a V1 nao fo... | sim (piloto, calc, calc2, menus, param, geom, fluxo) |
| U40-006 | 0x105cc | fluxo | A V1 encerra com SYSTEM; o original (opcao 7/R, linhas 123-127) segue para o retorno ao LAJE e a rotina de CHDIR/CHAIN com tratamento de erro de disco A:/B:,... | sim (piloto, calc, calc2, menus, param, geom, fluxo) |
| U40-007 | 0x105cc | validacao | Os destinos das opcoes 1, 2 e 3 estao em outros blocos (0x10fbd, 0x1153e, 0x12dc6); a validacao de nome, a checagem de existencia e as posicoes de tela (LOCA... | sim (piloto, calc, calc2, menus, param, teclas, geom, fluxo) |
| U40-008 | 0x105cc | arquivo | O original sobrescreve sem pedir confirmacao; a V1 recusa arquivo existente e pede confirmacao em passo extra. | rotina (piloto, calc, calc2, menus, param, teclas, geom, fluxo) |
| U40-009 | 0x105cc | arquivo | O conteudo gravado difere: o original grava so cabecalho e FIM; a V1 usa LajGrava, com formato de lajes, e nao grava o cabecalho com 'Obra - ' e data/hora (i... | rotina (piloto, calc, calc2, menus, param, teclas, geom, fluxo) |
| U40-010 | 0x105cc | tela | Layout e textos do menu diferem do original. | rotina (piloto, calc, calc2, menus, param, teclas, geom, fluxo) |
| U40-011 | 0x105cc | tela | A V1 mostra mensagem de sucesso que o original nao mostra no trecho lido. | rotina (piloto, calc, calc2, menus, param, teclas, geom, fluxo) |
| U40-012 | 0x105cc | tela | A V1 tem listagem de lajes que nao aparece neste bloco do original; pode estar em outro bloco. | rotina (piloto, calc, calc2, menus, param, teclas, geom, fluxo) |
| U40-013 | 0x105cc | fluxo | Original usa o nome corrente quando Enter vem vazio e so emite BEEP e repete o prompt se tambem nao houver nome corrente; a V1 cancela a gravacao. | rotina (piloto, calc, calc2, menus, param, teclas, geom, fluxo) |
| U40-014 | 0x105cc | validacao | Original rejeita nome com mais de 8 caracteres, nome com VAL diferente de 0, e nome com espaco, ponto, barra ou barra invertida; a V1 aceita ate 30 caractere... | rotina (piloto, calc, calc2, menus, param, teclas, geom, fluxo) |
| U40-015 | 0x105cc | fluxo | Original trata a entrada D no prompt do nome como pedido de troca de drive/diretorio e volta ao prompt; a V1 aceita D como nome de obra e grava D.LAJ. | rotina (piloto, calc, calc2, menus, param, teclas, geom, fluxo) |
| U40-016 | 0x105cc | fluxo | Original le uma linha (precisa de Enter) e cancela so com N; a V1 le uma tecla, cancela tambem com ESC, e nao espera Enter. | rotina (piloto, calc, calc2, menus, param, teclas, geom, fluxo) |
| U40-017 | 0x105cc | tela | Posicoes de tela diferentes: original usa prompt do nome em 6,1 com o nome corrente em destaque, Continuo em 6,40 e Aguarde em 7,1; a V1 usa 11,3 e 13,3 e a ... | rotina (piloto, calc, calc2, menus, param, teclas, geom, fluxo) |
| U40-018 | 0x105cc | arquivo | Original apaga NOME.BAK (sem extensao LAJ) antes de gravar; a V1 usa NOME.LAJ.BAK. O trecho de OPEN/KILL do original nao tem equivalente visivel na V1 nesse ... | rotina (piloto, calc, calc2, menus, param, teclas, geom, fluxo) |
| U40-019 | 0x11a57 | tela | O original escreve na linha 7, coluna 1, com espaco inicial e so o nome da obra, a frase 'Dados anteriores copiados para'. A V1 escreve so '.BAK Aguarde ...'... | sim (geom, fluxo) |
| U40-020 | 0x11a57 | arquivo | O original nao apaga um .BAK ja existente (o NAME falha e o tratador L_11b8f decide o fluxo). A V1 apaga o .BAK anterior e o substitui pela copia do .LAJ atual. | sim (geom, fluxo) |
| U40-021 | 0x11a57 | arquivo | O original move o .LAJ para .BAK; a V1 copia o .LAJ e o mantem ate o OPEN OUTPUT. O conteudo final do .BAK e o mesmo, mas se a gravacao falhar no meio o orig... | sim (geom, fluxo) |
| U40-022 | 0x11a57 | fluxo | Com um .BAK ja existente, o NAME do original tende a falhar (QBasic nao sobrescreve o destino) e cai no tratamento de erro; a V1 apaga o .BAK antigo e segue ... | sim (geom, fluxo) |
| U40-023 | 0x11b8a | fluxo | O original trata erro de execucao nesta rotina (fecha arquivos e retoma em L_11bb3); a V1 nao tem tratamento na gravacao, entao erro de disco ou de arquivo d... | sim (geom, fluxo) |
| U40-024 | 0x11c11 | arquivo | O original grava texto por PRINT (data, hora, matrizes, FIM). A V1 grava registros WRITE com cabecalho SISTRUT40, tipo e versao, e nao grava data e hora. | sim (geom, fluxo) |
| U40-025 | 0x11c11 | arquivo | O original le quatro campos de texto antes do contador, testa o marcador ERRLAJ e o FIM, e converte o campo seguinte com VAL. A V1 le dois campos com INPUT #... | sim (menus, geom) |
| U40-026 | 0x11c11 | tela | Posicao e texto da mensagem diferem. O original imprime ' Gravadas', o contador e 'Lajes ' na linha 6, coluna 50. A V1 imprime '*NUMERO', 'Gravadas' e 'Lajes... | sim (menus, geom) |
| U40-027 | 0x11c11 | fluxo | No original, nome vazio sai para L_105d6 e a letra D chama a sub L_14fd3. Na V1, nome vazio e FIM saem do laco, e nao ha ramo para D. | sim (menus, geom) |
| U40-028 | 0x11c11 | fluxo | Com contador zero, o original emite BEEP e pede o nome de novo. No trecho lido da V1 (287-293) nao ha BEEP nem nova solicitacao do nome. | não (a rotina rodou em menus, geom, fluxo; o ponto citado, não) |
| U40-029 | 0x11c11 | validacao | O original trata falha de abertura por ON ERROR e pelo marcador ERRLAJ. A V1 verifica a existencia do arquivo antes de abrir e mostra a mensagem de arquivo i... | sim (menus, geom) |
| U40-030 | 0x11c11 | tela | O original aceita qualquer tecla (INPUT$(1)). A V1 so encerra a espera com ESC ou Enter. | sim (menus, geom) |
| U40-031 | 0x11c11 | arquivo | A V1 le o cabecalho tipado (4 campos, via DadAbreLeitura%) e depois nivel e n; a contagem fica no 6o item do arquivo. O original le 4 itens e a contagem e o ... | sim (menus, geom) |
| U40-032 | 0x11c11 | arquivo | A V1 cria .BAK em toda gravacao; o original (neste bloco) nao cria; a copia pode estar no chamador (0x11b8a), fora deste bloco. | sim (geom, fluxo) |
| U40-033 | 0x11c11 | tela | Posicoes de tela e ordem dos rotulos diferentes (linha 6 coluna 50 no original; linha 8 e 9 na V1); texto "Lajes ," sem a mesma composicao. | sim (menus, geom) |
| U40-034 | 0x11c11 | validacao | O original usa tratamento de erro e a marca "ERRLAJ"; a V1 usa _FILEEXISTS e DadErro. Mensagens e caminho de erro podem diferir. | sim (menus, geom) |
| U40-035 | 0x1324f | fluxo | No V1, Enter vazio sempre sai ao menu. No original, Enter vazio reaproveita o nome atual e, se ha dados em memoria, segue para o aviso de descarte; sem nome ... | sim (piloto, calc, calc2, menus, param, teclas, geom) |
| U40-036 | 0x1324f | fluxo | No V1, RETORNO digitado cancela e sai ao menu. No original, RETORNO digitado e um nome de obra; so o Enter vazio cancela. | sim (piloto, calc, calc2, menus, param, teclas, geom) |
| U40-037 | 0x1324f | fluxo | No original, a tecla/nome 'D' dispara uma sub-rotina (L_14fd3, nao lida); no V1 'D' e tratado como nome de obra. | sim (piloto, calc, calc2, menus, param, teclas, geom) |
| U40-038 | 0x1324f | validacao | No V1, a tecla S sozinha confirma o descarte. No original, a palavra SIM inteira (linha digitada) e exigida, e qualquer outra resposta, inclusive S, sai. | sim (piloto, calc, calc2, menus, param, teclas, geom) |
| U40-039 | 0x1324f | fluxo | O criterio do aviso de descarte e a flag V_0e34% no original e a quantidade de lajes (LajQtd) no V1. | sim (piloto, calc, calc2, menus, param, teclas, geom) |
| U40-040 | 0x1324f | fluxo | O V1 usa uma confirmacao por tecla que, ao ser cancelada, sai ao menu. O original pergunta 'Continuo N/*S*' e com N volta ao pedido do nome. | sim (piloto, calc, calc2, menus, param, teclas, geom) |
| U40-041 | 0x1324f | fluxo | Em erro de carga o V1 mostra a mensagem e sai ao menu. O original redesenha a tela de leitura e pede outro nome. | sim (piloto, calc, calc2, menus, param, teclas, geom) |
| U40-042 | 0x1324f | tela | O V1 nao mostra o resumo das lajes em memoria na tela de leitura. | sim (piloto, calc, calc2, menus, param, teclas, geom) |
| U40-043 | 0x1324f | tela | Coluna do rotulo (3 em vez de 1), aspa sobrando e ausencia do nome atual entre asteriscos como padrao. | sim (piloto, calc, calc2, menus, param, teclas, geom) |
| U40-044 | 0x1324f | tela | O aviso ocupa duas linhas (9 e 10, coluna 3) no V1 e uma linha (7, coluna 1) no original. Original tem BEEP antes do aviso; V1 nao. | sim (piloto, calc, calc2, menus, param, teclas, geom) |
| U40-045 | 0x1324f | tela | Texto ('...!' no V1, '...' no original) e posicao da mensagem de espera diferem. | sim (piloto, calc, calc2, menus, param, teclas, geom) |
| U40-046 | 0x1324f | fluxo | O nome da obra corrente e atualizado antes da carga no original; no V1 so depois do sucesso. | sim (piloto, calc, calc2, menus, param, teclas, geom) |
| U40-047 | 0x1324f | fluxo | Teste de capacidade e mensagem final existem no V1 e nao aparecem neste bloco do original (podem estar em L_13788). | não (a rotina rodou em piloto, calc, calc2, menus, param, teclas, geom; o ponto citado, não) |
| U40-048 | 0x13783 | validacao | O original aceita qualquer cabecalho de 4 campos; a V1 recusa arquivo sem SISTRUT40, tipo LAJ e versao 1. | rotina (piloto, calc, calc2, menus, param, teclas, geom) |
| U40-049 | 0x13783 | arquivo | Os layouts nao tem nenhuma secao em comum: a V1 le registros de laje por nome e o bloco RES, o original le onze secoes por flag e contagem. A V1 nao le arqui... | rotina (piloto, calc, calc2, menus, param, teclas, geom) |
| U40-050 | 0x13783 | validacao | O original tem um limite por secao e mostra a capacidade insuficiente junto com o nome da secao; a V1 tem um so limite (lajes), com duas mensagens diferentes... | rotina (piloto, calc, calc2, menus, param, teclas, geom) |
| U40-051 | 0x13783 | fluxo | Os dois tem uma cauda opcional e tratam arquivo truncado como erro, mas o ponto opcional e outro (memoria, com a flag obrigatoria, no original; RES na V1) e ... | rotina (piloto, calc, calc2, menus, param, teclas, geom) |
| U40-052 | 0x13783 | arquivo | O original dimensiona a tabela da memoria com MAX(50, 5 * contagem do bloco V_0e3c%); a V1 nao tem essa secao. | rotina (piloto, calc, calc2, menus, param, teclas, geom) |
| U40-053 | 0x13783 | fluxo | Na V1 o nome da obra passa a ser o gravado no cabecalho e e registrado como obra corrente; no original o nome digitado e mantido e o campo do arquivo e ignor... | rotina (piloto, calc, calc2, menus, param, teclas, geom) |
| U40-054 | 0x13783 | fluxo | V1 cancela a alteracao quando o drive fica vazio, em vez de manter o drive atual e pedir o caminho. Alem disso, V1 trunca o drive ao 1o caractere (LEFT$), e ... | sim (menus) |
| U40-055 | 0x13783 | arquivo | Caminho digitado sem barra inicial e relativo no original (anexa ao diretorio atual). Na V1 vira absoluto: troca o caminho inteiro e prefixa a raiz. | não (a rotina rodou em piloto, calc, calc2, menus, param, teclas, geom, fluxo; o ponto citado, não) |
| U40-056 | 0x13783 | fluxo | V1 le uma tecla sem Enter (S confirma sem Enter) e, na recusa, mostra 'Acione D <Enter>' em vez de restaurar o caminho anterior e retentar o CHDIR. O origina... | não (a rotina rodou em piloto, calc, calc2, menus, param, teclas, geom, fluxo; o ponto citado, não) |
| U40-057 | 0x13783 | fluxo | V1 faz uma pre-checagem do diretorio pai e mostra mensagem propria de erro. O original nao pre-checa: o MKDIR falha e segue pelo handler geral. | não (a rotina rodou em piloto, calc, calc2, menus, param, teclas, geom, fluxo; o ponto citado, não) |
| U40-058 | 0x13783 | tela | Tela diferente: V1 limpa a tela inteira e usa posicoes fixas (linhas 6, 8, 9, 10, 11, 12), sem a viewport 22-25, sem os dois BEEP e sem COLOR 14 na mensagem ... | sim (menus) |
| U40-059 | 0x13783 | tela | V1 mostra 'Diretorio de dados: ...' ao final. O trecho do original (L_14fd3) nao tem essa mensagem. Pode existir no chamador (ver duvidas). | sim (piloto, calc, calc2, menus, param, teclas, geom, fluxo) |
| U40-060 | 0x13783 | arquivo | V1 fixa o filtro em *.LAJ; o original usa o conteudo de V_0e20$. | sim (piloto, calc, calc2, menus, param, teclas, geom, fluxo) |
| U40-061 | 0x13783 | tela | Texto da V1 tem barra final espuria ('/'). | sim (fluxo) |
| U40-062 | 0x13783 | tela | Layout diferente: o original usa a janela inferior (22-25) para drive e diretorio; a V1 usa as linhas 6-12. | sim (piloto, calc, calc2, menus, param, teclas, geom, fluxo) |
| U40-063 | 0x13783 | validacao | V1 valida o pai e mostra erro proprio; o original tenta o MKDIR direto e deixa o erro para o handler generico. | não (a rotina rodou em piloto, calc, calc2, menus, param, teclas, geom, fluxo; o ponto citado, não) |
| U40-064 | 0x13783 | validacao | Original aguarda linha terminada em Enter; V1 aceita uma tecla imediatamente. | não (a rotina rodou em piloto, calc, calc2, menus, param, teclas, geom, fluxo; o ponto citado, não) |
| U40-065 | 0x13783 | validacao | Mensagem de disco lotado (ERR 61) nao existe na V1. | não (a rotina rodou em piloto, calc, calc2, menus, param, teclas, geom, fluxo; o ponto citado, não) |
| U40-066 | 0x13783 | validacao | V1 limita o caminho a 60 caracteres e, acima disso, apaga o padrao; o original aceita caminho mais longo. | sim (menus) |
| U40-067 | 0x13783 | validacao | V1 aceita so 1 caractere de drive e trata ESC; o original aceita qualquer texto como drive. | sim (menus) |

## U41 (LAJEMONT, LAJEMONT): 9 divergências

| divergência | endereço | impacto | diferença (resumo do livro) | conferido no oráculo |
|---|---|---|---|---|
| U41-001 | 0x10a3e | calculo | Original compara com o limiar SINGLE 0.0299999993 e calcula com totais SINGLE (0x19e6, 0xef0); V1 usa limiar DOUBLE 0.03 e totais DOUBLE. O pareamento 0x19e6... | sim (fluxo) |
| U41-002 | 0x10a85 | tela | A V1 põe uma barra '/' literal no meio do texto ('Lajes/ difere'); o original não tem '/' e quebra a linha depois de 'Lajes'. | não (a rotina rodou em fluxo; o ponto citado, não) |
| U41-003 | 0x10aa1 | tela | O original mostra os dois totais (Carga por área e Total considerado) entre parênteses depois do aviso de 3%; a V1 mostra só o texto do aviso. | não (a rotina rodou em fluxo; o ponto citado, não) |
| U41-004 | 0x112e4 | fluxo | Original pede a troca do disco de dados (BEEP, mensagem com a unidade e espera de tecla) quando a unidade e A ou B; a V1 nao pede nada e grava direto. | sim (fluxo) |
| U41-005 | 0x11319 | arquivo | Original monta o nome com a unidade escolhida (drive:) e a obra/nivel; a V1 grava em DirDados (pasta do programa ou INI). | não (a rotina rodou em fluxo; o ponto citado, não) |
| U41-006 | 0x11a9b | tela | Original mostra 'Registro i / n' enquanto grava o RLP; a V1 mostra so o titulo. | não (a rotina rodou em fluxo; o ponto citado, não) |
| U41-007 | 0x1170e | arquivo | Original grava o relatorio na unidade escolhida com extensao .RLP (mesma extensao do arquivo de cargas); a V1 grava um .LST em DirDados. | sim (fluxo) |
| U41-008 | 0x11449 | arquivo | Original grava por registro (PUT, com cabecalho de contagem reescrito ao fim); a V1 grava texto com WRITE # e cabecalho 'SISTRUT40'. O formato do arquivo nao... | sim (fluxo) |
| U41-009 | 0x1321a | fluxo | Original mostra a tela de erro e trava em laco EVCK sem ler ESC e sem sair; V1 mostra a mesma tela, le ESC e encerra com SYSTEM. | sim (fluxo) |

## U42 (LAJEMONT): 24 divergências

| divergência | endereço | impacto | diferença (resumo do livro) | conferido no oráculo |
|---|---|---|---|---|
| U42-001 | 0x20146 | validacao | A conferencia por laje 'soma das areas parciais x area total' (tolerancia 3%) nao existe na V1. | sim (fluxo) |
| U42-002 | 0x20146 | tela | O aviso bloqueante por laje, com numero da laje, as duas areas e a opcao <F2>, nao existe na V1. | não (a rotina rodou em fluxo; o ponto citado, não) |
| U42-003 | 0x20146 | calculo | O original obtem a area de cada aresta pela geometria do poligono; a V1 deduz a area de volta a partir da reacao de tabela (reacao * lado / p) e so trata 4 l... | sim (fluxo) |
| U42-004 | 0x20146 | calculo | O original divide alvenaria, carga area e reacoes pelo comprimento da aresta quando o apoio e viga (tf/m), soma alvenaria e carga area no total de vigas/pila... | sim (fluxo) |
| U42-005 | 0x20146 | fluxo | A V1 lista todos os lados; o original omite arestas excluidas e as de area <= V_133a. | sim (fluxo) |
| U42-006 | 0x2a7a8 | calculo | O original calcula o peso próprio com o inteiro A_11b2%(v, nNós+1) da viga e os fatores de COMMON V_0dec!*1000 e V_0de8!, sobre o comprimento geométrico dos ... | rotina (fluxo) |
| U42-007 | 0x2a7a8 | calculo | No original o total de cargas aplicadas nas vigas parte do peso próprio das vigas; na V1 TotVal(9) soma só as reações das lajes, sem o peso próprio, e o tota... | rotina (fluxo) |
| U42-008 | 0x2a7a8 | calculo | A V1 transforma toda ponta e todo cruzamento em pilar e não tem balanço nem apoio de viga sobre viga; o original usa os códigos de apoio do nó, mantém balanç... | rotina (fluxo) |
| U42-009 | 0x2a7a8 | calculo | O original calcula e guarda, para cada pilar, as vigas que nele chegam e o ângulo de cada uma em graus inteiros; a V1 não tem esse dado. | rotina (fluxo) |
| U42-010 | 0x2a7a8 | calculo | O original obtém os pilares da lista de entrada A_1128$; a V1 os infere da geometria das vigas e os renomeia. | rotina (fluxo) |
| U42-011 | 0x2a7a8 | tela | O original mostra, numa janela de 2 linhas sobrescrita a cada viga, o rótulo 'VIGA '+prefixo+número e a contagem de tramos com flags Be/Bd/Ee/Ed; a V1 imprim... | rotina (fluxo) |
| U42-012 | 0x2a7a8 | tela | O original mostra o pilar e as vigas que chegam nele com o ângulo em graus; a V1 mostra nome e carga N (sempre 0), que o original não exibe neste trecho. | rotina (fluxo) |
| U42-013 | 0x2a7a8 | tela | Os títulos coincidem no texto, mas a V1 não usa a janela 23-25 nem CLS 2, perde o espaço inicial e acrescenta uma pausa 'Qualquer tecla' que o original não t... | rotina (fluxo) |
| U42-014 | 0x2a7a8 | calculo | A coluna de peso proprio do original vem de tabela de tramos e de constantes COMMON (V_0dec, V_0de8); a V1 usa vao*bw*h/10000*2.5, formula que o proprio come... | sim (fluxo) |
| U42-015 | 0x2a7a8 | calculo | O original divide a carga do segmento (V_0ef0) pelo comprimento do segmento e imprime esse valor; a V1 imprime a carga total do tramo (q * vao). As unidades ... | sim (fluxo) |
| U42-016 | 0x2a7a8 | tela | O original pula o segmento com carga <= 0 (nao imprime e nao soma em V_19e2/V_19f6); a V1 imprime todos os tramos, inclusive os de carga zero. | sim (fluxo) |
| U42-017 | 0x2a7a8 | arquivo | A V1 nao tem o separador STRING$(50,'-'), nao tem o recuo de 5 espacos no titulo e no cabecalho, e imprime uma linha em branco em vez de duas no arquivo. | sim (fluxo) |
| U42-018 | 0x2a7a8 | arquivo | O original decide o prefixo 'P' na hora de imprimir (so para nome numerico); a V1 grava o prefixo no nome ao criar o pilar. A largura do campo tambem difere:... | sim (fluxo) |
| U42-019 | 0x2a7a8 | calculo | A granularidade e diferente: o original imprime uma linha por grupo de nomes consecutivos, com carga acumulada e indice de grupo, e pula grupos com carga nao... | não (a rotina rodou em fluxo; o ponto citado, não) |
| U42-020 | 0x2a7a8 | tela | A tela do original usa janela de status fixa (VIEW PRINT) e limpa so a area de status a cada pilar; a V1 pagina por contagem de 20 linhas com pausa. O compor... | sim (fluxo) |
| U42-021 | 0x2a7a8 | fluxo | O original gera uma linha por trecho de alvenaria (com quebra quando o tipo A_1a2c muda ou nao e 1, e com a contagem de A_1c92%); a V1 gera uma linha por tra... | sim (fluxo) |
| U42-022 | 0x2a7a8 | fluxo | O original pula os registros com ponto inicial igual ao final; a V1 processa todos os registros de CPilQtd. | sim (fluxo) |
| U42-023 | 0x2a7a8 | arquivo | O original põe o prefixo 'P' em nomes numericos positivos; a V1 nao. | sim (fluxo) |
| U42-024 | 0x2a7a8 | arquivo | Faltam uma linha em branco antes do titulo, o recuo de 5 espacos e a linha separadora de 50 traços. | sim (fluxo) |

## U43 (LAJEMONT): 15 divergências

| divergência | endereço | impacto | diferença (resumo do livro) | conferido no oráculo |
|---|---|---|---|---|
| U43-001 | 0x3014b | validacao | O original le uma linha que exige Enter e trata qualquer texto diferente de S (vazio, "SIM", "X") como N e segue o fluxo; a V1 aceita a primeira tecla S ou N... | sim (fluxo) |
| U43-002 | 0x3014b | tela | No original a pergunta aparece na linha 24 com um espaco a esquerda; na V1 aparece na linha 23, coluna 1, sem espaco. | sim (fluxo) |
| U43-003 | 0x3014b | tela | Antes da pergunta, o original mostra 'Aguarde ..' na linha 24 e roda tres sub-rotinas de desenho. A V1 so imprime o esquema unifilar em texto, sem aviso. | sim (fluxo) |
| U43-004 | 0x3014b | tela | A V1 nao tem escala nem tamanhos por adaptador. O original calcula dois fatores de escala, limita a razao a 0.4167 e escolhe as constantes pelo monitor. | sim (fluxo) |
| U43-005 | 0x3014b | tela | O original compara com "HER" e "MCG"; a V1 grava "HERCULES" e "MCGA". Se o bloco for portado com a V1 como esta, Hercules e MCGA nao casam e nenhuma constant... | sim (fluxo) |
| U43-006 | 0x305c4 | calculo | No original um cruzamento de vigas sem apoio pode virar apoio de viga em viga (ou vigas isoladas) por escolha do usuario; na V1 todo cruzamento vira pilar, o... | sim (fluxo) |
| U43-007 | 0x305c4 | calculo | A V1 nao insere pontos da planta no eixo das vigas, nao trata vigas inclinadas e usa TOL fixo em vez das tolerancias COMMON V_133a!/V_133e!. | sim (fluxo) |
| U43-008 | 0x305c4 | fluxo | A V1 nao classifica cada ponto de viga contra segmentos de apoio, entao nao separa pontos apoiados dos pontos que precisam de escolha de vinculo. | sim (fluxo) |
| U43-009 | 0x305c4 | tela | A V1 nao tem a tela de escolha de vinculo nem o marcador animado. | sim (fluxo) |
| U43-010 | 0x305c4 | fluxo | Resposta N no original reinicia a edicao (GOTO L_312b3); na V1 encerra o programa com SYSTEM sem gravar. | sim (fluxo) |
| U43-011 | 0x305c4 | fluxo | A V1 pergunta incondicionalmente; o original so pergunta quando a flag L_BPec! (DS:2b26) e diferente de zero. | sim (fluxo) |
| U43-012 | 0x305c4 | validacao | O original aceita qualquer texto e trata tudo que nao for N como S; a V1 aceita so S ou N e repete a leitura. | não (a rotina rodou em fluxo; o ponto citado, não) |
| U43-013 | 0x33d84 | arquivo | O original grava o .VIG como arquivo de acesso aleatorio com um registro binario fixo de 855 bytes por viga (registro i+1); a V1 grava texto sequencial com W... | sim (fluxo) |
| U43-014 | 0x33d84 | arquivo | Cada registro de viga do original leva a data da gravacao (MM-DD); a V1 nao grava data no .VIG. | sim (fluxo) |
| U43-015 | 0x33d84 | arquivo | A V1 nao grava tabelas de tamanho fixo (14 grupos e 31 grupos de 5 singles) nem os dois singles zerados; nao ha como afirmar campo a campo se o conteudo e o ... | sim (fluxo) |

## U44 (LAJEMONT): 0 divergências

Sem divergências no livro.

## U45 (LAJEPROC, LAJEPROC): 24 divergências

| divergência | endereço | impacto | diferença (resumo do livro) | conferido no oráculo |
|---|---|---|---|---|
| U45-001 | 0x1527e | calculo | O original recalcula a area de aco de cada posicao a partir do momento, da espessura e dos materiais; a V1 usa a area gravada no .LAJ. | sim (piloto, menus, param, fluxo) |
| U45-002 | 0x15384 | calculo | O original anula a armadura (mostra '*') quando a secao nao resiste (discriminante negativo) ou x/d passa do limite do aco; a V1 sempre escolhe malha. | sim (piloto, menus, param, fluxo) |
| U45-003 | 0x153fb | calculo | O original impoe armadura minima proporcional a espessura (ff72*H na positiva, ff76*H na negativa) e divide a negativa por ff86 quando ff86<1; a V1 nao aplic... | sim (piloto, menus, param, fluxo) |
| U45-004 | 0x11f05 | calculo | O momento da armadura secundaria e derivado do principal pela razao r da laje (M1*r se r<1, M1/r se r>=1); a V1 usa my/asy do .LAJ. | sim (piloto, menus, param, fluxo) |
| U45-005 | 0x13f91 | calculo | No original o momento negativo de cada lado e i*M1 positivo, com i = (codigo do lado - 2)/10 e um fator de direcao pela ortotropia; a V1 le x1..x4/as1..as4 d... | sim (piloto, menus, param, fluxo) |
| U45-006 | 0x146ae | calculo | O original guarda uma armadura negativa por continuidade, dimensionada pela maior As dos dois lados; a V1 guarda uma por bordo de cada laje e, na modificacao... | sim (piloto, menus, param, fluxo) |
| U45-007 | 0x154c4 | calculo | Regra de escolha diferente: o original usa as tabelas do COMMON (bitolas, areas, espacamentos discretos, bitola inicial e espacamento minimo por espessura) e... | sim (piloto, menus, param, fluxo) |
| U45-008 | 0x11b12 | calculo | No item E (e ao abrir uma laje no M) o original preserva a positiva imposta se ainda for suficiente e sobrescreve as negativas impostas no M; a V1 recalcula ... | sim (piloto, menus, param, fluxo) |
| U45-009 | 0x163fb | calculo | O original nao tem quantitativo de aco; na V1 o quantitativo e invencao e ainda conta cada negativa de bordo continuo duas vezes (uma em cada laje vizinha), ... | sim (piloto, param, fluxo) |
| U45-010 | 0x15f19 | fluxo | No original so o item I pergunta o tipo (Enter/espaco = 3, invalido = BEEP e repete) e o tipo 4 gera dois desenhos separados (positivo e depois negativo); a ... | sim (piloto, menus, param, fluxo) |
| U45-011 | 0x17d7a | tela | O desenho original e esquematico (contorno poligonal, setas das direcoes e rotulos '#phi c/s'); a V1 desenha barra por barra em retangulos, com comprimentos ... | sim (piloto, menus, param, fluxo) |
| U45-012 | 0x15a84 | validacao | O original aceita lista e faixas de lajes e sempre pergunta a lista antes de T/I, repetindo com BEEP; a V1 so aceita uma laje no modo I e sai com mensagem. | sim (piloto, menus, param, fluxo) |
| U45-013 | 0x171db | fluxo | No original 'Isolada' gera um desenho por laje (cada uma ampliada); na V1 gera um desenho de uma laje so. | sim (piloto, menus, param, fluxo) |
| U45-014 | 0x10770 | tela | Layout e teclas do menu diferem: o original numera 1-6, usa linhas 8-18 coluna 20, destaca so a inicial dentro da palavra e aceita digitos; a V1 usa cabecalh... | sim (piloto, menus, param, teclas, fluxo) |
| U45-015 | 0x10e03 | fluxo | No original qualquer resposta diferente de N prossegue, lajes de tipo 1 e 3 sao puladas, cada laje e mostrada durante o calculo e nao ha espera nem gravacao;... | sim (piloto, menus, param, fluxo) |
| U45-016 | 0x11630 | validacao | Validacao diferente: o original so faz BEEP e repete, usa o numero exibido (com deslocamento fe54) e recusa lajes com H=0 ou tipo 1/3; a V1 mostra mensagens ... | sim (piloto, teclas) |
| U45-017 | 0x12a36 | validacao | O original so aceita bitolas e espacamentos das tabelas do COMMON, confere area e espacamento minimo em cada entrada e, ao trocar a bitola, recalcula o espac... | sim (piloto, menus, param, fluxo) |
| U45-018 | 0x12980 | tela | A sequencia e a posicao dos campos diferem e a V1 nao pede uma negativa por continuidade. | sim (piloto, menus, param, fluxo) |
| U45-019 | 0x11e1b | tela | Linhas, mascara, conversao do momento (divide por fdec*fde8*100), texto da armadura e o titulo SECUNDARIO diferem; a negativa e mostrada por continuidade e n... | sim (piloto, menus, param, fluxo) |
| U45-020 | 0x1487d | validacao | No original o aviso vale para a negativa imposta pela OTIMIZACAO (codigo > 0), aparece tambem no item E, tem a 2a linha 'Acione o Item OTIMIZACAO...' e nao b... | sim (piloto, menus, param, fluxo) |
| U45-021 | 0x101a7 | arquivo | O original troca dados com o LAJE so por COMMON/CHAIN (as escolhas voltam ao LAJE no COMMON) e volta por CHAIN; a V1 le e grava arquivos proprios (.ARL) e te... | sim (piloto, menus, param, fluxo) |
| U45-022 | 0x10282 | fluxo | No original F2 e Ctrl+Alt+Del voltam ao LAJE, Esc volta ao menu de qualquer ponto e F1-F10 bipam; a V1 nao trata essas teclas. | sim (piloto, menus, param, teclas, fluxo) |
| U45-023 | 0x1aaf8 | tela | Na V1 as duas frases sao mensagens de validacao; no original sao a tela do tratador de erros de execucao. | não |
| U45-024 | 0x105b9 | tela | Posicao e texto da tela de retorno diferem (o original nao usa LOCATE, tem ' Aguarde ...' e espaco inicial). | sim (teclas) |

## Totais

sim 275, rotina 39, parcial 1, não 42, não se aplica 2.
