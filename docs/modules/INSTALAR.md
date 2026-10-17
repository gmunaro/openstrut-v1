# INSTALAR.EXE - Resumo

Fonte: strings do executavel original `INSTALAR.EXE` (fora do repositorio). O INSTALAR nao entra na V1; este resumo fica so como referencia do que o instalador do SISTRUT 4.0 fazia.

## O que fazia

O INSTALAR implantava o SISTRUT num disco rigido (Winchester) ou num diretorio de rede a partir dos disquetes de distribuicao. Era rodado direto do DOS, nao pelo gerenciador. Perguntava o drive de destino (`C` ou `D`, ou uma rota de rede com a linha `SET SISTRUTREDE=` no `AUTOEXEC.BAT` das estacoes) e o drive dos disquetes (`A` ou `B`), e depois pedia os disquetes um a um ("Coloque um dos Discos de Programas no drive", "Existem outros discos").

A copia montava esta arvore:

- `\SISTRUT\`: o gerenciador `SISTRUT.EXE`, o `SISTRUT.INI`, `SISEDIT.EXE`, `HERCULES.COM`, o runtime `BRUN45.EXE` e o proprio `INSTALAR.EXE` (para reinstalar a partir do disco rigido).
- `\SISTRUT\EXEC40\`: os executaveis da versao 4.0 e os `.INI` de cada modulo.
- `\SISTRUT\EXEC32\`: opcionalmente, a versao 3.2 (PORTICO, GRELHA, TRELICA, LAJE, VIGA, ARMADURA, PILAR, DETALHA, DESENHO). O gerenciador escolhia a versao a executar.

No fim gravava o `SISTRUT.INI` com o drive de implantacao, o monitor, a saida paralela, a porta serial, o `.BAT` usado e a data da parametrizacao (formato em `docs/formats/SISTRUT_INI.md`). Os `.INI` de cada modulo eram copiados como vinham nos disquetes; a tela de informacoes explicava que sao texto ASCII editavel, com o valor a esquerda do `=` (formato em `docs/formats/INI.md`). A configuracao de monitor e impressora era refeita depois no menu `Configuracao` do gerenciador.

## Telas principais

- **Abertura:** `S I S T R U T`, `Versao 4.0  Abril 1991`.
- **Informacoes gerais para implantacao:** texto corrido com rolagem (`ESC` interrompe) sobre uso com e sem Winchester, a arvore `SISTRUT`/`EXEC40`/`EXEC32`, a edicao dos `.INI` (com o exemplo do `VIGA.INI` e os codigos ESC/P de impressora) e a reinstalacao sem apagar o que ja estava implantado.
- **Menu de instalacao:** Instalacao em Winchester, Lista dos Modulos implantados, Sistrut - Entrada no sistema, Acesso ao DOS, Fim - retorno ao DOS, Manuais - roteiro de Impressao.
- **Drive de implantacao e disco de origem:** as perguntas de drive, rede e origem descritas acima, com confirmacoes S/N.
- **Copia:** mensagens de progresso ("Copiando os aplicativos auxiliares", "Copiando os aplicativos executaveis") e a pergunta "Instalo o gerenciador SISTRUT novamente".
- **Manuais:** explica que os manuais ficavam em tres disquetes opcionais (`MANUAL I`, `II` e `III`), em `.WRI`, nao copiados para o disco rigido.

Depois da implantacao, o sistema era acionado pelo gerenciador (`C> SISTRUT\SISTRUT`, ou so `SISTRUT` com `C:\SISTRUT` no `PATH`), nao pelo INSTALAR. O texto pede MS-DOS 4.0 ou maior.
