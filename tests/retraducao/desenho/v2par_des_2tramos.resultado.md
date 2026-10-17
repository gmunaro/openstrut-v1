# v2par_des_2tramos

Roteiro: `v2par_des_2tramos.sufixo.txt` (caso do oráculo `$ORACULO/casos/v2par_des_2tramos.txt`, gerado do sufixo).

Objetivo: Dimensionamento e detalhamento (DESDIM/DESINIT) de viga de 2 tramos desiguais (4 e 5 m; o tramo 2 recebe a laje 5 × 5 e a 5 × 4) com o resumo de consumo.

Oráculo: `$ORACULO/runs/v2par_des_2tramos-20261015-165207`

```
exe: PATH C:\SISTRUT;Z:\|CD \|SISTRUT\SISTRUT
fim: DOSBox-X terminou (programa saiu), codigo 0
roteiro completo: nao
tempo: 127 s
telas: 25
arquivos gravados/alterados em C:\: ASS.FOR, ASS.SEC, ASS.TAB
```

V1 nova: EXE compilados de `src-original` (main 75cbbab) em `build/v2par-bin`, rodados com `tools/roda_retrad.sh`; comparação com `tools/compara_retrad.py <run> <saída V1> --obra <C: da V1>`.

Resultado: igual nos números (28 de 29): impressora 49.578 bytes e ASS.FOR/.SEC/.TAB iguais; a tela d09 difere só no cabeçalho cortado pela janela (artefato da troca de marca)

```
OK     001_d01
OK     002_d05
OK     003_d06
DIFERE 004_d09:
   linha  3 oráculo: '   SISTRUT  ********** ┌───────────────────────────────────────────────────┐'
   linha  4 oráculo: '   Abril 1991   *******│       Obra - ASS    Viga - V5                     │█'
   linha  5 oráculo: '   Versao 4.0   *******│ TRAMO   Bw   Hw   Bf   Hf     APOIO   Bw   Hw     │█'
OK     005_d10_apoio
OK     006_d11_apoio
OK     007_d12_apoio
OK     008_d20
OK     009_d21_vao
OK     010_d22_vao
OK     011_d25
OK     012_d28
OK     013_d29
OK     014_d34
OK     015_d35
OK     016_d36
OK     017_d39
OK     018_d41
OK     019_i01
OK     020_i02
OK     021_i03
OK     022_i04_menu
OK     023_r02
OK     024_r04_resumo
OK     025_r05
OK     impressora.prn (49578 bytes iguais)
OK     obra/ASS.FOR (3080 bytes iguais)
OK     obra/ASS.SEC (1730 bytes iguais)
OK     obra/ASS.TAB (350 bytes iguais)
marca: trocas no oráculo: 72 em texto de tela, 0 em desenho, 1 em texto da impressora, 0 na cópia gráfica da impressora
28 iguais, 1 diferentes
```

Valores de referência: `oraculo-novos/v2par_des_2tramos.json` (96 valores), na pasta de paridade da V2 (fora do repositório).
