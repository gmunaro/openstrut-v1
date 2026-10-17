# v2par_laje_r2

Roteiro: `v2par_laje_r2.sufixo.txt` (caso do oráculo `$ORACULO/casos/v2par_laje_r2.txt`, gerado do sufixo).

Objetivo: R2 do PLANO (LAJEPROC.BAS:855): continuidade em que o lado da vizinha tem o MESMO número do lado da laje atual (L1 lado 3 com L2 lado 3). O LAJEPROC não recalcula a vizinha e grava um código por continuidade com a As da última laje processada: a negativa sai # 6.3 c/10 (3,15 cm2/m), que atende a L2 (As− 2,86) mas não a L1 (As− 4,70, que pede # 8.0 c/10). Sem otimização, para os M− das duas lajes ficarem diferentes (2 × M+ de cada uma).

Oráculo: `$ORACULO/runs/v2par_laje_r2-20261015-163144`

```
exe: PATH C:\SISTRUT;Z:\|CD \|SISTRUT\SISTRUT
fim: DOSBox-X terminou (programa saiu), codigo 0
roteiro completo: nao
tempo: 231 s
telas: 39
arquivos gravados/alterados em C:\: RDOIS.BAK, RDOIS.LAJ, RDOIS.RLP, RDOIS.VIG
```

V1 nova: EXE compilados de `src-original` (main 75cbbab) em `build/v2par-bin`, rodados com `tools/roda_retrad.sh`; comparação com `tools/compara_retrad.py <run> <saída V1> --obra <C: da V1>`.

Resultado: igual (43 de 44; só o FRE); RDOIS.LAJ/.VIG/.RLP iguais. A V1 nova reproduz o R2 (mesma negativa # 6.3 c/10)

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
OK     020_l03
OK     021_v01_vigas (imagem 640x200)
OK     022_v02_pesos (imagem 640x200)
OK     023_v03_vigas (imagem 640x200)
OK     024_v04_apos_imprimo
OK     025_g30_menu
OK     026_l04
DIFERE 027_w01_gravado:
   linha 14 oráculo: '                   5  -  Acesso ao DOS ( 412 Kbytes livres )'
OK     028_l05
OK     029_p01
OK     030_p02
OK     031_p03
OK     032_p04_desenho (imagem 640x200)
OK     033_p05
OK     034_p05n
OK     035_p05n_desenho (imagem 640x200)
OK     036_p05n_menu
OK     037_p06
OK     038_p07
OK     039_l06
OK     impressora.prn (29383 bytes iguais)
OK     obra/RDOIS.BAK (123 bytes iguais)
OK     obra/RDOIS.LAJ (1293 bytes iguais)
OK     obra/RDOIS.RLP (450 bytes iguais)
OK     obra/RDOIS.VIG (5130 bytes iguais)
marca: trocas no oráculo: 18 em texto de tela, 2 em desenho, 4 em texto da impressora, 1 na cópia gráfica da impressora
43 iguais, 1 diferentes
```

Valores de referência: `oraculo-novos/v2par_laje_r2.json` (120 valores), na pasta de paridade da V2 (fora do repositório).
