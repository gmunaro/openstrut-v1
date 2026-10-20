# Brief comum: teste de uso real dos módulos do SISTRUT (V1)

## Contexto

O SISTRUT 4.0 é uma suíte MS-DOS de cálculo de estruturas de concreto armado (lajes, vigas, pilares, formas, desenho), de 1991. O fonte foi reconstruído em BASIC compatível com QB64 Phoenix Edition, em `dist/src-reconstructed/`.

- **Estado:** os 28 módulos de `src-original/` (um por EXE) compilam e o cálculo tem testes de console. O número 29 da versão anterior contava `INSTALAR.BAS`, que está em `src-reconstructed/`. Ninguém usou as telas de verdade até agora.
- **Sua tarefa:** usar as telas dos seus módulos de ponta a ponta, achar o que não funciona ou não faz sentido e corrigir nos arquivos que são seus.

Raiz do projeto, que é o seu diretório de trabalho: a raiz deste repositório (a pasta que contém `roteiros/`). Use Git Bash e caminhos entre aspas se o caminho tiver espaços.

## Ferramenta: roteiro de teclas

Leia primeiro `roteiros/README.md`, que é curto. Resumo:

- `bash tools/roteiro.sh roteiros/NOME.txt EXE 60` roda o EXE com as teclas do arquivo. A janela fica escondida.
- `{TELA nome}` grava a tela em `nome.txt` na pasta de saída. Leia esses `.txt` para ver o que o programa mostrou.
- Códigos de saída:
  - 0: terminou normalmente;
  - 3: o roteiro acabou e o programa ainda esperava tecla (veja `esgotado_<EXE>.txt`);
  - 4: erro de execução (veja `erro_<EXE>.txt` e o log);
  - 124: travou.
- A obra pronta FLUXO está em `roteiros/semente/`. Para partir dela: `cp -r roteiros/semente roteiros/<seu_roteiro>.dados`.
- Para recompilar **um** módulo, rode `bash tools/build.sh laje/LAJECALC`, que filtra por substring do caminho. Nunca rode `tools/build.sh` sem filtro e nunca rode `tools/runtests.sh`, porque outros agentes compilam ao mesmo tempo.

## O que fazer

1. **Entender os módulos.** Para cada um dos seus módulos, leia o fonte e descubra:
   - o menu, as teclas e os campos de entrada;
   - os arquivos que o módulo lê e grava (o contrato está em `docs/formats/DADOS.md`).

   Leia em blocos de até 200 linhas (Read com offset e limit). Use Grep para achar `SELECT CASE`, `TeclaLer$`, `EntradaTexto$`, `EntradaNumero#`, `TelaTecla$` e `RunSubmodulo`.
2. **Escrever os roteiros.** Escreva `roteiros/<prefixo>_NN_<assunto>.txt`, com o prefixo indicado no seu brief específico.
   - Juntos, os roteiros passam por **todas** as opções do menu de cada módulo, com dados que um engenheiro digitaria.
   - Grave telas antes e depois das ações importantes.
   - Cada roteiro termina saindo do programa (F2, Esc ou a tecla de fim do módulo), com código 0.
3. **Rodar e ler.** Rode cada roteiro e leia as telas e os arquivos gravados na pasta de saída. Procure:
   - travamento, erro de execução ou tecla que não faz nada;
   - texto cortado ou sobreposto, ou tela que não limpa;
   - campo que não aceita o valor;
   - opção de menu que não faz o que diz;
   - arquivo que deveria ser gravado e não foi;
   - valores sem sentido: zero onde deveria haver valor, negativo, NaN, unidade trocada, número absurdo (por exemplo, momento de 1E+30 ou armadura de 500 cm²).

   Para números, confira à mão pelo menos um caso simples. Por exemplo, uma laje armada em cruz apoiada tem momento da ordem de p·l²/20 a p·l²/10.
4. **Corrigir.** Corrija nos **seus** arquivos (lista abaixo). Depois recompile só o módulo, rode o roteiro de novo e confirme a correção na tela gravada.

   Se a causa estiver num arquivo que não é seu, **não edite**. Anote no relatório o arquivo, a linha, o sintoma e a correção sugerida. Isso vale para `common/*`, `*CALC.BM`, `*.BM` de cálculo e módulos de outras famílias.
5. **Parar.** O trabalho termina quando:
   - cada módulo seu tem roteiros com saída 0 cobrindo todas as opções do menu;
   - os bugs encontrados nos seus arquivos foram corrigidos e verificados por roteiro.

## Regras

- **Edição:** só nos seus arquivos e em `roteiros/<prefixo>_*`. Não apague arquivos fora de `roteiros/saida/`, não use `rm -rf` e não edite nada fora do projeto.
- **Fidelidade:** o fonte reconstrói um programa de 1991. Mantenha os textos, menus e teclas do original. Não "modernize" a interface; o objetivo é que funcione.
- **Comentário de suposição:** marque com `' RECONSTRUCAO:` qualquer ponto em que você supôs algo.
- **Nomes reservados no QB64:** não use `as`, `pos`, `base`, `sin` nem `asc` como nomes de variável.
- **Contexto:** comandos com saída curta (`head`, `tail`, `grep`). Não liste as pastas de saída inteiras: elas têm 29 `.exe`; use `ls <pasta> | grep -v exe`.
- **Agentes paralelos:** não mexa em processos que você não iniciou. Se um roteiro travar, o próprio `roteiro.sh` encerra os processos da pasta dele.

## Relatório final (texto curto, nesta ordem)

1. **Roteiros:** cada roteiro criado, com módulos e opções cobertas, e o código de saída final.
2. **Bugs corrigidos:** arquivo, sintoma, causa, correção e como verificou (roteiro e trecho da tela).
3. **Bugs fora dos seus arquivos:** arquivo:linha, sintoma e correção sugerida.
4. **Valores conferidos à mão:** o caso, o valor do programa, o valor esperado e se bate.
5. **O que não conseguiu testar** e por quê.
