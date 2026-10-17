# v2par2_pilar_var

Roteiro: `v2par2_pilar_var.sufixo.txt` (caso do oráculo `$ORACULO/casos/v2par2_pilar_var.txt`, gerado do sufixo).

Objetivo: Variação de armadura numa coluna de 5 níveis: dimensionamento com uma armadura por coluna (N), Redefine recusado (4 # 10 não resiste: volta à janela, nada impresso) e aceito (6 # 16, relatório impresso), depois dimensionamento variando de 2 em 2 níveis. Relatórios repetidos do mesmo nível levam o sufixo .r2, .r3 (PA.FUND = automático, PA.FUND.r2 = Redefine aceito, PA.FUND.r3 e PA.PAV2 = de 2 em 2).

Oráculo: `$ORACULO/runs/v2par2_pilar_var-20261016-050733`

```
exe: PATH C:\SISTRUT;Z:\|CD \|SISTRUT\SISTRUT
fim: DOSBox-X terminou (programa saiu), codigo 0
roteiro completo: nao
tempo: 158 s
telas: 10
arquivos gravados/alterados em C:\: VAR.BAK, VAR.COL
```

V1 nova: EXE compilados de `src-original` do branch `v1-difs` em `build/v2par2-bin`, rodados com `tools/roda_retrad.sh` do v1-difs; comparação com `tools/compara_retrad.py <run> <saída V1> --obra <C: da V1>`.

Resultado: igual (12 de 13: e09 = FRE do PIGRAEDI); impressora e VAR.COL iguais

```
OK     001_s01_esforcos
OK     002_e01_predim
OK     003_e02_arm
OK     004_e03_redef_nao
OK     005_e04_recusado
OK     006_e05_redef_ok
OK     007_e06_aceita
OK     008_e07_opcoes2
OK     009_e08_2em2
DIFERE 010_e09_gravado:
   linha 16 oráculo: '                   6  -  Acesso ao DOS ( 225 Kbytes livres )'
OK     impressora.prn (5368 bytes iguais)
OK     obra/VAR.BAK (123 bytes iguais)
OK     obra/VAR.COL (1145 bytes iguais)
marca: trocas no oráculo: 0 em texto de tela, 0 em desenho, 0 em texto da impressora, 0 na cópia gráfica da impressora
12 iguais, 1 diferentes
```

Valores de referência: `oraculo-novos2/v2par2_pilar_var.json` (264 valores), na pasta de paridade da V2 (fora do repositório).
