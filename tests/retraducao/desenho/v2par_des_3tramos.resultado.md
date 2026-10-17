# v2par_des_3tramos

Roteiro: `v2par_des_3tramos.sufixo.txt` (caso do oráculo `$ORACULO/casos/v2par_des_3tramos.txt`, gerado do sufixo).

Objetivo: Dimensionamento e detalhamento (DESDIM/DESINIT) de viga de 3 tramos (3, 5 e 4 m), com o resumo de consumo.

Oráculo: `$ORACULO/runs/v2par_des_3tramos-20261015-165027`

```
exe: PATH C:\SISTRUT;Z:\|CD \|SISTRUT\SISTRUT
fim: DOSBox-X terminou (programa saiu), codigo 0
roteiro completo: nao
tempo: 135 s
telas: 27
arquivos gravados/alterados em C:\: ASS.FOR, ASS.SEC, ASS.TAB
```

V1 nova: EXE compilados de `src-original` (main 75cbbab) em `build/v2par-bin`, rodados com `tools/roda_retrad.sh`; comparação com `tools/compara_retrad.py <run> <saída V1> --obra <C: da V1>`.

Resultado: igual nos números (30 de 31): impressora 58.827 bytes e ASS.FOR/.SEC/.TAB iguais; a tela d09 difere só no cabeçalho com o nome do licenciado, cortado pela janela, que a tabela de marca do compara_retrad.py não troca (artefato da marca)

```
OK     001_d01
OK     002_d05
OK     003_d06
DIFERE 004_d09:
   linha  3 oráculo: '   SISTRUT  ********** ┌───────────────────────────────────────────────────┐'
   linha  4 oráculo: '   Abril 1991   *******│       Obra - ASS    Viga - V1                     │█'
   linha  5 oráculo: '   Versao 4.0   *******│ TRAMO   Bw   Hw   Bf   Hf     APOIO   Bw   Hw     │█'
OK     005_d10_apoio
OK     006_d11_apoio
OK     007_d12_apoio
OK     008_d13_apoio
OK     009_d20
OK     010_d21_vao
OK     011_d22_vao
OK     012_d23_vao
OK     013_d25
OK     014_d28
OK     015_d29
OK     016_d34
OK     017_d35
OK     018_d36
OK     019_d39
OK     020_d41
OK     021_i01
OK     022_i02
OK     023_i03
OK     024_i04_menu
OK     025_r02
OK     026_r04_resumo
OK     027_r05
OK     impressora.prn (58827 bytes iguais)
OK     obra/ASS.FOR (616 bytes iguais)
OK     obra/ASS.SEC (346 bytes iguais)
OK     obra/ASS.TAB (70 bytes iguais)
marca: trocas no oráculo: 78 em texto de tela, 0 em desenho, 1 em texto da impressora, 0 na cópia gráfica da impressora
30 iguais, 1 diferentes
```

Valores de referência: `oraculo-novos/v2par_des_3tramos.json` (128 valores), na pasta de paridade da V2 (fora do repositório).
