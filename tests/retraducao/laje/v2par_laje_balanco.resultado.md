# v2par_laje_balanco

Roteiro: `v2par_laje_balanco.sufixo.txt` (caso do oráculo `$ORACULO/casos/v2par_laje_balanco.txt`, gerado do sufixo).

Objetivo: Laje interna 4 × 5 m com laje em BALANÇO 4 × 1,5 m (três bordos livres, engastada na interna pela continuidade em y = 5). O original dá ao balanço M+ 0,00 e M− negativo (−0,56), e As+ mínima 1,50.

Oráculo: `$ORACULO/runs/v2par_laje_balanco-20261015-162752`

```
exe: PATH C:\SISTRUT;Z:\|CD \|SISTRUT\SISTRUT
fim: DOSBox-X terminou (programa saiu), codigo 0
roteiro completo: nao
tempo: 237 s
telas: 42
arquivos gravados/alterados em C:\: BAL.BAK, BAL.LAJ, BAL.RLP, BAL.VIG
```

V1 nova: EXE compilados de `src-original` (main 75cbbab) em `build/v2par-bin`, rodados com `tools/roda_retrad.sh`; comparação com `tools/compara_retrad.py <run> <saída V1> --obra <C: da V1>`.

Resultado: DIFERENTE: 45 de 47 (FRE e a impressora). Na impressora (impressora.prn byte 1786; impressora.txt linhas 63 e 97, tabela ARMADURAS NAS LAJES antes e depois da otimização), a L1 (balanço, M+ = −0,28 impresso 0,00) sai no original com As+ principal 1.50 e As+ secundário 1.50 e na V1 nova com -1.00 e -1.00. Provável defeito da V1 na flexão com M+ ≤ 0 (LAJECALC.BAS:660-700 e GOSUB L_14312, 929-953). Telas e BAL.LAJ/.VIG/.RLP iguais

Depois do v1-difs (15/10/2026): IGUAL, 46 de 47 (só FRE). Causa: o `^` do BRUN45 calcula por logaritmo e `X - SQR(X^2)` não dá 0; `RT_POT##`/`RT_SQR##` agora repetem o x87 (V2PAR.md, item 1).

```
OK     001_l01
OK     002_g01_menu
OK     003_g02_eixos
OK     004_g03_arq (imagem 640x200)
OK     005_g04_ocup (imagem 640x200)
OK     006_g05_estr (imagem 640x200)
OK     007_g06_pil (imagem 640x200)
OK     008_g07_lajes (imagem 640x200)
OK     009_g08_lajes (imagem 640x200)
OK     010_g09_menu
OK     011_l02
OK     012_c01_menu
OK     013_c02_continuidade (imagem 640x200)
OK     014_c03_direcao (imagem 640x200)
OK     015_c04_direcao (imagem 640x200)
OK     016_c05_esp
OK     017_c06_imp
OK     018_c07_imp
OK     019_c08_mom
OK     020_c09_otim
OK     021_c10_menu
OK     022_c11_mom
OK     023_l03
OK     024_v01_vigas (imagem 640x200)
OK     025_v02_pesos (imagem 640x200)
OK     026_v03_vigas (imagem 640x200)
OK     027_v04_apos_imprimo
OK     028_g30_menu
OK     029_l04
DIFERE 030_w01_gravado:
   linha 14 oráculo: '                   5  -  Acesso ao DOS ( 412 Kbytes livres )'
OK     031_l05
OK     032_p01
OK     033_p02
OK     034_p03
OK     035_p04_desenho (imagem 640x200)
OK     036_p05
OK     037_p05n
OK     038_p05n_desenho (imagem 640x200)
OK     039_p05n_menu
OK     040_p06
OK     041_p07
OK     042_l06
DIFERE impressora.prn: 33944 x 33944 bytes; primeiro byte diferente em 1786: 20 31 2e 35 30 20 20 20 20 20 20 20 20 20 20 20 | 2d 31 2e 30 30 20 20 20 20 20 20 20 20 20 20 20
OK     obra/BAL.BAK (121 bytes iguais)
OK     obra/BAL.LAJ (1203 bytes iguais)
OK     obra/BAL.RLP (371 bytes iguais)
OK     obra/BAL.VIG (4275 bytes iguais)
marca: trocas no oráculo: 18 em texto de tela, 2 em desenho, 6 em texto da impressora, 1 na cópia gráfica da impressora
45 iguais, 2 diferentes
```

Valores de referência: `oraculo-novos/v2par_laje_balanco.json` (115 valores), na pasta de paridade da V2 (fora do repositório).
