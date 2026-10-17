# Roteiros: teste de uso dos módulos

Um roteiro é um arquivo de teclas que dirige um módulo como se alguém estivesse no teclado. O programa roda com a janela escondida, grava as telas pedidas e termina sozinho.

```sh
bash tools/build.sh laje/                          # recompila o que mudou
bash tools/roteiro.sh roteiros/laje_01.txt LAJE 60  # roteiro, EXE inicial, limite em s
```

O executor cria `roteiros/saida/<nome>-<data>/` com os executáveis, os INIs e, se existir, o conteúdo de `roteiros/<nome>.dados/` (obra de partida). O programa grava a obra nessa pasta. Ao fim, ele mostra a pasta, o código de saída e o log.

| Saída | Significado |
|---|---|
| 0 | o programa terminou normalmente (o roteiro levou até o F2/Esc final) |
| 3 | o roteiro acabou e o programa ainda esperava tecla; a tela fica em `esgotado_<EXE>.txt` |
| 4 | erro de execução do QB64; a tela fica em `erro_<EXE>.txt` e o log traz o número e a linha |
| 5 | roteiro mal formado (marca desconhecida ou sem `}`) |
| 124 | estourou o limite de tempo: laço infinito ou espera fora do teclado |

## Formato

- Linhas que começam com `#` são comentário. As quebras de linha são ignoradas.
- Cada caractere é uma tecla. As teclas especiais vão entre chaves: `{ENTER}` `{ESC}` `{BS}` `{TAB}` `{SPACE}` `{F1}`…`{F10}` `{UP}` `{DOWN}` `{LEFT}` `{RIGHT}` `{PGUP}` `{PGDN}` `{HOME}` `{END}` `{INS}` `{DEL}` `{CHAVE}` (o caractere `{`).
- `{TELA nome}` grava a tela atual em `nome.txt` (modo texto) ou `nome.png` (modo gráfico, SCREEN 12) e segue.
- Um submódulo chamado pelo gerenciador continua lendo o mesmo roteiro de onde o anterior parou. Quando ele termina, o gerenciador segue com as teclas seguintes.

Exemplo (menu principal):

```
# tela inicial, informações, fim
{TELA menu}{F1}{TELA info}x{F2}
```

## Obra de partida

`roteiros/semente/` tem a obra **FLUXO** gerada pelo teste `T_FLUXO`. São duas lajes, já com o fluxo completo: `.LAJ` com resultados, `.VIG`, `.RLP`, `.SEC`, `.REP`, `.COL`, `.EDV`, desenho, e `SISTRUT.OBR` = FLUXO. Para um roteiro começar dessa obra, copie a pasta: `cp -r roteiros/semente roteiros/<nome>.dados`.

`roteiros/saida/` é descartável.
