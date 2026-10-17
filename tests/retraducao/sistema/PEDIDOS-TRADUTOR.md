# Pedidos ao tradutor (família sistema: SISTRUT, SISEDIT)

Dono destes pedidos: agente da família sistema. Arquivos citados em `tools/` e `src-original/comum/` são do agente do tradutor; nada foi editado lá. O que deu para contornar foi contornado em `src-original/sistema/correcoes.json` ou no script de teste da família.

O tradutor (`tools/retraduz.py`) gera SISTRUT e SISEDIT sem nenhum `'RETRAD?` de código (o único do SISEDIT, `@13d49`, são 33 bytes de dado depois do `B$CENP`).

Situação em 15/10/2026 (rodada final): todos os pedidos estão resolvidos e conferidos. Nenhum pedido aberto.

## Resolvidos

### 6. Data do DOS no oráculo e segundos da linha `PARAMETRIZADO EM` — resolvido (agente do oráculo e RT45)

- Era: o `date 10-14-2026` do autoexec não pegava (formato com hífen), e o SISTRUT original gravava a data do computador (`PARAMETRIZADO EM:10-15-2026  12:00:20`, execução `retrad_sis_config-20261015-030212`); os segundos também diferiam porque os dois relógios andavam com o tempo (oráculo 12:00:20, V1 12:00:00).
- Agora: oráculo (KEYFEED) e V1 (RT45) congelam `DATE$`/`TIME$` em `10-14-2026 12:00:00`.
- Conferido: caso `retrad_sis_config` (execução `retrad_sis_config-20261015-082500`): `SISTRUT.INI` regravado igual byte a byte (338 bytes), inclusive `PARAMETRIZADO EM:10-14-2026  12:00:00`.

### 1. `RT_RUN` não levava a posição do roteiro nem o contador de telas — resolvido

- Era: `RT_RUN` abria o EXE sem `/CHAIN:`; o programa novo recomeçava o roteiro na posição 0 e regravava `telas/001_*`.
- Agora: `RT_RUN` grava o arquivo de troca (log `SISEDIT: RUN <pasta dos EXE>\SISTRUT.exe` e `SISTRUT: inicio /CHAIN:...SISTRUT_SISEDIT_*.CHN`).
- Conferido: caso `retrad_sis_onkey_editor`, que agora confirma o Fim do SISEDIT (S) e volta ao menu do gerenciador (tela f13 igual ao original).

### 2. `RT_ACHA_EXE` achava na pasta do executável um módulo da pasta EXEC32 — resolvido

- Era: com `<Ins>`, Enter no Laje fazia `RUN C:\SISTRUT\EXEC32\LAJE`; o original dá erro 53 ("Erro de Operacao") e a V1 rodava o `LAJE.exe` ao lado.
- Agora: a pasta do executável só vale para `C:\SISTRUT\EXEC40\` (`SISTRUT_EXEC`), `C:\SISTRUT\` e pastas que existem depois do `RT_ARQ$`.
- Conferido: o caso `retrad_sis_exec32` ganhou Laje com EXEC32 (telas x07..x10); o resultado está no CHECKLIST.

### 3. `{HW tecla}` e `{BIOS tecla}` sumiam no roteiro da V1 — resolvido

- Agora `RT_ROT_CARREGA` trata `{HW x}`, `{BIOS x}`, `{ESC}` e `{Fn}` com a semântica do oráculo (só tecla pelo controlador dispara ON KEY; o ON KEY roda entre comandos).
- Conferido: casos `retrad_sis_onkey`, `retrad_sis_onkey_editor` e `retrad_sis_onkey_editor2` rodados no oráculo padrão (não mais na imagem `teste`) e na V1.

### 4. `tools/roda_retrad.sh` terminava no meio de um CHAIN lento — resolvido

- Agora o script espera `<EXE>: fim` na última linha do log por 3 s. O `roda_sistema.sh` não precisa mais do laço próprio, e a sonda `SONDA_CHAIN.BAS` grava a linha no mesmo formato (`<MODULO>: fim`).

### 5. Atributos exatos nas telas da V1 — resolvido

- Agora o RT45 grava `NNN_nome.atr.txt` e o `compara_retrad.py` compara cada célula com o `telas.raw` do oráculo (e aceita a célula do cursor piscando). A sonda grava o mesmo `.atr.txt`.

## Observações sem pedido

- `ENVIRON "PATH=" + V_0dd4$` (SISTRUT `0x112dc`) troca o PATH do processo da V1 por `C:\SISTRUT` (10 primeiros caracteres da pasta dos EXE), como no DOS. Os módulos herdam esse PATH. `RT_CHAIN`/`RT_RUN` usam caminho completo e funcionaram; um `SHELL` dentro de módulo (Acesso ao DOS) vai abrir o `cmd.exe` sem `System32` no PATH. É o comportamento do original; fica registrado.
- O "Termino da Utilizacao do Sistema SISTRUT" (F2 no menu) só existe na V1 do caso `retrad_sis_onkey`: no oráculo o DOSBox-X encerra quando o programa sai e a tela não é despejada.
- O arquivo de troca está na versão 3 (`SISTRUT CHAIN 3`; desde a 2 o VIEW PRINT corrente vem depois da tela, e a 3 muda só a parte gráfica). A sonda lê a 1 e da 2 em diante.
