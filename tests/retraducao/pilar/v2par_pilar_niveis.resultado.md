# v2par_pilar_niveis

Roteiro: `v2par_pilar_niveis.sufixo.txt` (caso do oráculo `$ORACULO/casos/v2par_pilar_niveis.txt`, gerado do sufixo).

Objetivo: Pilar de edifício com vários níveis: coluna P5 do E2E.REP (17,37 t) de FUND a COB com a carga introduzida nos níveis 2, 3 e 4 (acumula 17,37 / 34,74 / 52,11 t) mais o peso próprio (Δcota·A·2,5); seção 25 × 40; dimensionamento variando a armadura de nível em nível (um relatório por lance: FUND, PAV1, PAV2). Ids com o nível: P5.FUND.1f.MRx2a.

Oráculo: `$ORACULO/runs/v2par_pilar_niveis-20261015-164933`

```
exe: PATH C:\SISTRUT;Z:\|CD \|SISTRUT\SISTRUT
fim: roteiro acabou e o programa nao saiu em 20 s
roteiro completo: sim
tempo: 142 s
telas: 13
arquivos gravados/alterados em C:\: (nenhum)
```

V1 nova: EXE compilados de `src-original` (main 75cbbab) em `build/v2par-bin`, rodados com `tools/roda_retrad.sh`; comparação com `tools/compara_retrad.py <run> <saída V1> --obra <C: da V1>`.

Resultado: igual (14 de 14; impressora 4.026 bytes)

```
OK     001_e01_menu_pilaredi
OK     002_e02_niveis
OK     003_e03_coluna
OK     004_e04_carga2
OK     005_e05_carga3
OK     006_e06_carga4
OK     007_e07_travamentos
OK     008_e08_menu_secoes
OK     009_e09_tipo_secao
OK     010_e10_predim
OK     011_e11_opcoes
OK     012_e12_armadura
OK     013_e13_menu_secoes
OK     impressora.prn (4026 bytes iguais)
marca: trocas no oráculo: 3 em texto de tela, 0 em desenho, 0 em texto da impressora, 0 na cópia gráfica da impressora
14 iguais, 0 diferentes
```

Valores de referência: `oraculo-novos/v2par_pilar_niveis.json` (204 valores), na pasta de paridade da V2 (fora do repositório).
