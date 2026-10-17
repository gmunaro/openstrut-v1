# v2par_laje_cargas

Roteiro: `v2par_laje_cargas.sufixo.txt` (caso do oráculo `$ORACULO/casos/v2par_laje_cargas.txt`, gerado do sufixo).

Objetivo: Cargas por área (dois polígonos de ocupação sobrepostos, com parcela acidental) e alvenarias sobre viga e sobre laje, do LAJEGEOM ao LAJEMONT (.VIG) e ao VIGA (opção 7, .REP).

Oráculo: `$ORACULO/runs/v2par_laje_cargas-20261015-164316`

```
exe: PATH C:\SISTRUT;Z:\|CD \|SISTRUT\SISTRUT
fim: DOSBox-X terminou (programa saiu), codigo 0
roteiro completo: nao
tempo: 301 s
telas: 60
arquivos gravados/alterados em C:\: CAR.BAK, CAR.LAJ, CAR.REP, CAR.RLP, CAR.VIG
```

V1 nova: EXE compilados de `src-original` (main 75cbbab) em `build/v2par-bin`, rodados com `tools/roda_retrad.sh`; comparação com `tools/compara_retrad.py <run> <saída V1> --obra <C: da V1>`.

Resultado: igual (65 de 66; só o FRE); impressora 42.538 bytes e CAR.LAJ/.BAK/.VIG/.RLP/.REP iguais

```
OK     001_l01
OK     002_g01_menu
OK     003_g02_eixos
OK     004_g03_arq (imagem 640x200)
OK     005_g04a_cargas (imagem 640x200)
OK     006_g04b_alv (imagem 640x200)
OK     007_g04c_alv (imagem 640x200)
OK     008_g04d_alv (imagem 640x200)
OK     009_g04e_area (imagem 640x200)
OK     010_g04f_area (imagem 640x200)
OK     011_g05_estr (imagem 640x200)
OK     012_g06_pil (imagem 640x200)
OK     013_g07_lajes (imagem 640x200)
OK     014_g08_lajes (imagem 640x200)
OK     015_g09_menu
OK     016_l02
OK     017_c01_menu
OK     018_c02_continuidade (imagem 640x200)
OK     019_c03_direcao (imagem 640x200)
OK     020_c04_direcao (imagem 640x200)
OK     021_c05_esp
OK     022_c06_imp
OK     023_c07_imp
OK     024_c08_mom
OK     025_c09_otim
OK     026_c10_menu
OK     027_c11_mom
OK     028_l03
OK     029_v01_vigas (imagem 640x200)
OK     030_v02_pesos (imagem 640x200)
OK     031_v03_vigas (imagem 640x200)
OK     032_v04_apos_imprimo
OK     033_g30_menu
OK     034_l04
DIFERE 035_w01_gravado:
   linha 14 oráculo: '                   5  -  Acesso ao DOS ( 412 Kbytes livres )'
OK     036_l05
OK     037_p01
OK     038_p02
OK     039_p03
OK     040_p04_desenho (imagem 640x200)
OK     041_p05
OK     042_p05n
OK     043_p05n_desenho (imagem 640x200)
OK     044_p05n_menu
OK     045_p06
OK     046_p07
OK     047_l06
OK     048_x01_viga
OK     049_x02_listo
OK     050_x03_lista
OK     051_x04_relisto
OK     052_x05_todas
OK     053_x06_reg1
OK     054_x06_reg2
OK     055_x06_reg3
OK     056_x06_reg4
OK     057_x06_reg5
OK     058_x07_mult
OK     059_x08_reacoes
OK     060_x09_menu_fim
OK     impressora.prn (42538 bytes iguais)
OK     obra/CAR.BAK (121 bytes iguais)
OK     obra/CAR.LAJ (1399 bytes iguais)
OK     obra/CAR.REP (693 bytes iguais)
OK     obra/CAR.RLP (448 bytes iguais)
OK     obra/CAR.VIG (5130 bytes iguais)
marca: trocas no oráculo: 25 em texto de tela, 2 em desenho, 12 em texto da impressora, 1 na cópia gráfica da impressora
65 iguais, 1 diferentes
```

Valores de referência: `oraculo-novos/v2par_laje_cargas.json` (283 valores), na pasta de paridade da V2 (fora do repositório).
