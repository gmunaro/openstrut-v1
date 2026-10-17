# v2par2_laje_tipos

Roteiro: `v2par2_laje_tipos.sufixo.txt` (caso do oráculo `$ORACULO/casos/v2par2_laje_tipos.txt`, gerado do sufixo).

Objetivo: Lajes: pré-moldada com fluxo a 90 graus (L4); tipo 3 'laje comum não calculada' com relação 0,7 informada (L3); laje em L (L1, polígono de 6 vértices); coeficiente de engastamento digitado no LAJECALC 1 (lado da L1 na continuidade L1–L2 = 1,2), sem otimização; dois grupos (L5 rebaixada −10 cm: sem continuidade com L2/L3/L4); μ = 1 informado (L2); pilar-parede P5 com alvenaria por cima (L3 descarrega parte nele); cruzamento de vigas sem pilar em (8,4) com a escolha padrão 'Vx apoia em Vy'.

Oráculo: `$ORACULO/runs/v2par2_laje_tipos-20261016-050324`

```
exe: PATH C:\SISTRUT;Z:\|CD \|SISTRUT\SISTRUT
fim: DOSBox-X terminou (programa saiu), codigo 0
roteiro completo: nao
tempo: 361 s
telas: 53
arquivos gravados/alterados em C:\: TIP.BAK, TIP.LAJ, TIP.RLP, TIP.VIG
```

V1 nova: EXE compilados de `src-original` do branch `v1-difs` em `build/v2par2-bin`, rodados com `tools/roda_retrad.sh` do v1-difs; comparação com `tools/compara_retrad.py <run> <saída V1> --obra <C: da V1>`.

Resultado: igual (56 de 58: v02a = 27 pixels da seta que pisca por TIMER no LAJEMONT; w01 = FRE); impressora e TIP.LAJ/.BAK/.VIG/.RLP iguais

```
OK     001_l01
OK     002_g01_menu
OK     003_g02_eixos
OK     004_g03_arq (imagem 640x200)
OK     005_g04a_alv (imagem 640x200)
OK     006_g04_ocup (imagem 640x200)
OK     007_g05_estr (imagem 640x200)
OK     008_g06a_parede (imagem 640x200)
OK     009_g06_pil (imagem 640x200)
OK     010_g07_lajes (imagem 640x200)
OK     011_t01_pre (imagem 640x200)
OK     012_t02_tipo3 (imagem 640x200)
OK     013_t03_cargas (imagem 640x200)
OK     014_t04_alinh (imagem 640x200)
OK     015_g08_lajes (imagem 640x200)
OK     016_g09_menu
OK     017_l02
OK     018_c01_menu
OK     019_c02_continuidade (imagem 640x200)
OK     020_c03_coef_L1 (imagem 640x200)
OK     021_c04_coef_L2 (imagem 640x200)
OK     022_c05_coef (imagem 640x200)
OK     023_c06_direcao (imagem 640x200)
OK     024_c07_rel3 (imagem 640x200)
OK     025_c08 (imagem 640x200)
OK     026_c09 (imagem 640x200)
OK     027_c10_direcao (imagem 640x200)
OK     028_c11_esp
OK     029_c12_imp
OK     030_c13_imp
OK     031_c14_mom
OK     032_l03
OK     033_v01_vigas (imagem 640x200)
DIFERE 034_v02a_apoio: 27 pixels diferentes em 640x200
OK     035_v02b_confirma (imagem 640x200)
OK     036_v02c_index (imagem 640x200)
OK     037_v03_vigas (imagem 640x200)
OK     038_v04_apos_imprimo
OK     039_g30_menu
OK     040_l04
DIFERE 041_w01_gravado:
   linha 14 oráculo: '                   5  -  Acesso ao DOS ( 412 Kbytes livres )'
OK     042_l05
OK     043_p01
OK     044_p02
OK     045_p03
OK     046_p04_desenho (imagem 640x200)
OK     047_p05
OK     048_p05n
OK     049_p05n_desenho (imagem 640x200)
OK     050_p05n_menu
OK     051_p06
OK     052_p07
OK     053_l06
OK     impressora.prn (33752 bytes iguais)
OK     obra/TIP.BAK (121 bytes iguais)
OK     obra/TIP.LAJ (2211 bytes iguais)
OK     obra/TIP.RLP (648 bytes iguais)
OK     obra/TIP.VIG (7695 bytes iguais)
marca: trocas no oráculo: 18 em texto de tela, 2 em desenho, 4 em texto da impressora, 1 na cópia gráfica da impressora
56 iguais, 2 diferentes
```

Valores de referência: `oraculo-novos2/v2par2_laje_tipos.json` (263 valores), na pasta de paridade da V2 (fora do repositório).
