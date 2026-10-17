# v2par_viga_fluxo

Roteiro: `v2par_viga_fluxo.sufixo.txt` (caso do oráculo `$ORACULO/casos/v2par_viga_fluxo.txt`, gerado do sufixo).

Objetivo: Viga com BALANÇO e CARGA INDEXADA no fluxo da obra (LAJEMONT → VIGA) e reações no .REP com truncamento (R5). Pilares só em x = 0 e x = 4: as vigas V1 (y = 5) e V2 (y = 0) têm balanço de 4 m e a V5 (x = 8) se apoia nas pontas dos balanços ('V5 apoia em V1' e 'V5 apoia em V2' no LAJEMONT). O VIGA 7 recusa obra com carga indexada ('Leia o arquivo, processe e regrave'): lê, processa (opção 2: V3, V4, V5 e só então V1 e V2 com a reação da V5 como carga F = 1,67 t na ponta), regrava e roda a opção 7. No .REP o P4 recebe −1,67 (V1) + 1,66 (V3: R = 1,67 truncado) = −0,01.

Oráculo: `$ORACULO/runs/v2par_viga_fluxo-20261015-164332`

```
exe: PATH C:\SISTRUT;Z:\|CD \|SISTRUT\SISTRUT
fim: DOSBox-X terminou (programa saiu), codigo 0
roteiro completo: nao
tempo: 400 s
telas: 65
arquivos gravados/alterados em C:\: VBX.BAK, VBX.LAJ, VBX.REP, VBX.RLP, VBX.VIG
```

V1 nova: EXE compilados de `src-original` (main 75cbbab) em `build/v2par-bin`, rodados com `tools/roda_retrad.sh`; comparação com `tools/compara_retrad.py <run> <saída V1> --obra <C: da V1>`.

Resultado: DIFERENTE: 65 de 71. 3 telas de FRE; 2 telas da escolha de apoio do LAJEMONT (v02a, v02c) com 27 pixels: a seta que pisca por TIMER (laço de 0,08 s), dependente do relógio real; e a impressora (byte 39184; impressora.txt linhas 268, 304, 340 e 376): coluna f*EJ do tramo 1 das vigas V1 e V2 (tramo com M+ = 0 em x = 0, ao lado do balanço) sai ' 0.00' no original e '-0.00' na V1 nova, nas duas impressões (opções 2 e 7). Provável defeito da V1 no PRINT USING de valor negativo minúsculo ou −0. VBX.LAJ/.VIG/.RLP/.REP iguais byte a byte

Depois do v1-difs (15/10/2026): 66 de 71, impressora igual. Diferem 3 telas de FRE e as 2 telas da seta que pisca por TIMER (v02a e v02c; numa rodada só a v02c). Causa do f*EJ: −0 no PRINT USING (V2PAR.md, item 2).

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
OK     012_l02
OK     013_c01_menu
OK     014_c02_continuidade (imagem 640x200)
OK     015_c03_direcao (imagem 640x200)
OK     016_c04_direcao (imagem 640x200)
OK     017_c05_esp
OK     018_c06_imp
OK     019_c07_imp
OK     020_c08_mom
OK     021_c09_otim
OK     022_c10_menu
OK     023_c11_mom
OK     024_l03
OK     025_v01_vigas (imagem 640x200)
DIFERE 026_v02a_apoio1: 27 pixels diferentes em 640x200
OK     027_v02b_confirma1 (imagem 640x200)
DIFERE 028_v02c_apoio2: 27 pixels diferentes em 640x200
OK     029_v02d_confirma2 (imagem 640x200)
OK     030_v02e_index (imagem 640x200)
OK     031_v02_pesos (imagem 640x200)
OK     032_v03_vigas (imagem 640x200)
OK     033_v04_apos_imprimo
OK     034_g30_menu
OK     035_l04
DIFERE 036_w01_gravado:
   linha 14 oráculo: '                   5  -  Acesso ao DOS ( 412 Kbytes livres )'
OK     037_l05
OK     038_p01
OK     039_p02
OK     040_p03
OK     041_p04_desenho (imagem 640x200)
OK     042_p05
OK     043_p05n
OK     044_p05n_desenho (imagem 640x200)
OK     045_p05n_menu
OK     046_p06
OK     047_p07
OK     048_l06
OK     049_x01_viga
OK     050_x02_le
OK     051_x03_coloca
DIFERE 052_x04_catalogo:
   linha 16 oráculo: '                   6  -  Acesso ao DOS ( 122 Kbytes livres )'
OK     053_x05_lista
OK     054_x06_proc
OK     055_x07_seguir
OK     056_x08_menu
DIFERE 057_x09_gravado:
   linha 16 oráculo: '                   6  -  Acesso ao DOS ( 120 Kbytes livres )'
OK     058_x10_reg1
OK     059_x10_reg2
OK     060_x10_reg3
OK     061_x10_reg4
OK     062_x10_reg5
OK     063_x11_mult
OK     064_x12_reacoes
OK     065_x13_menu_fim
DIFERE impressora.prn: 48595 x 48595 bytes; primeiro byte diferente em 39184: 20 30 2e 30 30 0d 0a 20 20 20 20 20 20 20 20 20 | 2d 30 2e 30 30 0d 0a 20 20 20 20 20 20 20 20 20
OK     obra/VBX.BAK (121 bytes iguais)
OK     obra/VBX.LAJ (1229 bytes iguais)
OK     obra/VBX.REP (519 bytes iguais)
OK     obra/VBX.RLP (353 bytes iguais)
OK     obra/VBX.VIG (5130 bytes iguais)
marca: trocas no oráculo: 31 em texto de tela, 2 em desenho, 17 em texto da impressora, 1 na cópia gráfica da impressora
65 iguais, 6 diferentes
```

Valores de referência: `oraculo-novos/v2par_viga_fluxo.json` (259 valores), na pasta de paridade da V2 (fora do repositório).
