# v2par2_pilar_rig

Roteiro: `v2par2_pilar_rig.sufixo.txt` (caso do oráculo `$ORACULO/casos/v2par2_pilar_rig.txt`, gerado do sufixo).

Objetivo: Pilar com momento de viga pelo fluxo padrão: o PILGEEDI lê E2E.REP + .RLP e, com E2E.VIG e E2E.SEC presentes, 'Prossigo com a Leitura' S (rigidez das vigas lida do .SEC: os momentos das vigas são repartidos entre viga e coluna). Dimensiona P7 e P1 (canto) e P8 (extremidade). Ids da impressão do LAJECALC/LAJEMONT/VIGA como nos casos a/b; PILAREDI com o nível (P7.FUND.1f.MRx2a).

Oráculo: `$ORACULO/runs/v2par2_pilar_rig-20261016-045352`

```
exe: PATH C:\SISTRUT;Z:\|CD \|SISTRUT\SISTRUT
fim: DOSBox-X terminou (programa saiu), codigo 0
roteiro completo: nao
tempo: 575 s
telas: 97
arquivos gravados/alterados em C:\: E2E.BAK, E2E.COL, E2E.FOR, E2E.LAJ, E2E.REP, E2E.RLP, E2E.SEC, E2E.TAB, E2E.VIG
```

V1 nova: EXE compilados de `src-original` do branch `v1-difs` em `build/v2par2-bin`, rodados com `tools/roda_retrad.sh` do v1-difs; comparação com `tools/compara_retrad.py <run> <saída V1> --obra <C: da V1>`.

Resultado: igual (103 de 107: as 4 são o FRE do LAJEGRAV/VIGA/PIGRAEDI); impressora (35.953 bytes) e E2E.LAJ/.VIG/.RLP/.REP/.SEC/.FOR/.TAB/.COL iguais

```
OK     001_l01
OK     002_g01_menu
OK     003_g02_eixos
OK     004_g03_eixos
OK     005_g04_menu
OK     006_g05_obra (imagem 640x200)
OK     007_g06_arq (imagem 640x200)
OK     008_g07_arq (imagem 640x200)
OK     009_g08_menu
OK     010_g09_ocup (imagem 640x200)
OK     011_g10_ocup (imagem 640x200)
OK     012_g11_ocup (imagem 640x200)
OK     013_g12_ocup (imagem 640x200)
OK     014_g13_menu
OK     015_g14_estr (imagem 640x200)
OK     016_g15_estr (imagem 640x200)
OK     017_g16_menu
OK     018_g17_pil (imagem 640x200)
OK     019_g18_pil (imagem 640x200)
OK     020_p9 (imagem 640x200)
OK     021_pf (imagem 640x200)
OK     022_g19_menu
OK     023_g20_lajes (imagem 640x200)
OK     024_g21_lajes (imagem 640x200)
OK     025_g22_lajes (imagem 640x200)
OK     026_g23_lajes (imagem 640x200)
OK     027_g24_lajes (imagem 640x200)
OK     028_g25_lajes (imagem 640x200)
OK     029_g26_lajes (imagem 640x200)
OK     030_g27_lajes (imagem 640x200)
OK     031_g01_geo_menu
OK     032_l02
OK     033_c03_menu_calc
OK     034_c04_continuidade (imagem 640x200)
OK     035_c05_menu
OK     036_c06_direcao (imagem 640x200)
OK     037_c07_direcao (imagem 640x200)
OK     038_c08_menu
OK     039_c09_esp
OK     040_c10_menu
OK     041_c11_imp
OK     042_c12_imp
OK     043_c13_menu
OK     044_c14_mom
OK     045_c15_menu
OK     046_c16_otim
OK     047_c17_menu
OK     048_c18_menu
OK     049_l03
OK     050_g30_menu
OK     051_v01_vigas (imagem 640x200)
OK     052_v02_vigas (imagem 640x200)
OK     053_v03_vigas (imagem 640x200)
OK     054_v04_vigas (imagem 640x200)
OK     055_v05_pesos (imagem 640x200)
OK     056_v06_vigas (imagem 640x200)
OK     057_v07_apos_imprimo
OK     058_g31_menu
OK     059_l04
DIFERE 060_w00:
   linha 14 oráculo: '                   5  -  Acesso ao DOS ( 412 Kbytes livres )'
OK     061_w01
DIFERE 062_w02:
   linha 14 oráculo: '                   5  -  Acesso ao DOS ( 412 Kbytes livres )'
OK     063_w03
OK     064_w04
DIFERE 065_w05_gravado:
   linha 14 oráculo: '                   5  -  Acesso ao DOS ( 412 Kbytes livres )'
OK     066_l05
OK     067_x01_viga
OK     068_x02_listo
OK     069_x03_lista
OK     070_x04_relisto
OK     071_x05_todas
OK     072_x06_reg1
OK     073_x06_reg2
OK     074_x06_reg3
OK     075_x06_reg4
OK     076_x06_reg5
OK     077_x06_reg6
OK     078_x07_mult
OK     079_x08_reacoes
OK     080_x09_menu_fim
OK     081_d00_desenho
OK     082_d_V1
OK     083_d_V3
OK     084_d_V4
OK     085_d_V5
OK     086_d99_menu
OK     087_e01_menu_pilaredi
OK     088_e02_colunas
OK     089_e03_rigidez
OK     090_e04_predim1
OK     091_e04_predim2
OK     092_e04_predim3
OK     093_e05_arm1
OK     094_e05_arm2
OK     095_e05_arm3
OK     096_e06_menu
DIFERE 097_e07_gravado:
   linha 16 oráculo: '                   6  -  Acesso ao DOS ( 225 Kbytes livres )'
OK     impressora.prn (35953 bytes iguais)
OK     obra/E2E.BAK (123 bytes iguais)
OK     obra/E2E.COL (1669 bytes iguais)
OK     obra/E2E.FOR (3080 bytes iguais)
OK     obra/E2E.LAJ (1852 bytes iguais)
OK     obra/E2E.REP (878 bytes iguais)
OK     obra/E2E.RLP (554 bytes iguais)
OK     obra/E2E.SEC (1730 bytes iguais)
OK     obra/E2E.TAB (350 bytes iguais)
OK     obra/E2E.VIG (5985 bytes iguais)
marca: trocas no oráculo: 43 em texto de tela, 0 em desenho, 13 em texto da impressora, 0 na cópia gráfica da impressora
103 iguais, 4 diferentes
```

Valores de referência: `oraculo-novos2/v2par2_pilar_rig.json` (664 valores), na pasta de paridade da V2 (fora do repositório).
