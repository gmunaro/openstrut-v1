# v2par_laje_assim

Roteiro: `v2par_laje_assim.sufixo.txt` (caso do oráculo `$ORACULO/casos/v2par_laje_assim.txt`, gerado do sufixo).

Objetivo: Planta em T com 4 lajes de vãos diferentes: vínculos assimétricos (L2 com 3 bordos contínuos e 1 apoiado; L1, L3 e L4 com 1 contínuo) e otimização dos negativos que MUDA o coeficiente: L3 lado 3 de 22 para 16 (i 2,0 → 1,4) e L4 lado 1 de 22 para 15 (i 1,3), com M+ recalculado (L3 0,32 → 0,36; L4 0,31 → 0,35).

Oráculo: `$ORACULO/runs/v2par_laje_assim-20261015-163200`

```
exe: PATH C:\SISTRUT;Z:\|CD \|SISTRUT\SISTRUT
fim: DOSBox-X terminou (programa saiu), codigo 0
roteiro completo: nao
tempo: 260 s
telas: 42
arquivos gravados/alterados em C:\: ASS.BAK, ASS.LAJ, ASS.RLP, ASS.VIG
```

V1 nova: EXE compilados de `src-original` (main 75cbbab) em `build/v2par-bin`, rodados com `tools/roda_retrad.sh`; comparação com `tools/compara_retrad.py <run> <saída V1> --obra <C: da V1>`.

Resultado: igual (46 de 47; só o FRE); ASS.LAJ/.VIG/.RLP iguais

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
OK     impressora.prn (36181 bytes iguais)
OK     obra/ASS.BAK (121 bytes iguais)
OK     obra/ASS.LAJ (2026 bytes iguais)
OK     obra/ASS.RLP (601 bytes iguais)
OK     obra/ASS.VIG (6840 bytes iguais)
marca: trocas no oráculo: 18 em texto de tela, 2 em desenho, 6 em texto da impressora, 1 na cópia gráfica da impressora
46 iguais, 1 diferentes
```

Valores de referência: `oraculo-novos/v2par_laje_assim.json` (264 valores), na pasta de paridade da V2 (fora do repositório).
