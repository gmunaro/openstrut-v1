# v2par_laje_otim

Roteiro: `v2par_laje_otim.sufixo.txt` (caso do oráculo `$ORACULO/casos/v2par_laje_otim.txt`, gerado do sufixo).

Objetivo: Laje 6 × 6 m ao lado de uma faixa de 1,8 × 6 m: a otimização dos negativos reduz o coeficiente do lado da L1 de 2,0 (código 22) até o piso Mneg/Mpos mínimo de fábrica, 0,30 (código 5), e para ali ('coef1 = F7A'). Referência do caso R3 sem travar: com o piso 0,30 a otimização sempre converge (v2par_laje_r3 mostra o laço com o piso 0,35).

Oráculo: `$ORACULO/runs/v2par_laje_otim-20261015-163215`

```
exe: PATH C:\SISTRUT;Z:\|CD \|SISTRUT\SISTRUT
fim: DOSBox-X terminou (programa saiu), codigo 0
roteiro completo: nao
tempo: 243 s
telas: 42
arquivos gravados/alterados em C:\: OTIM.BAK, OTIM.LAJ, OTIM.RLP, OTIM.VIG
```

V1 nova: EXE compilados de `src-original` (main 75cbbab) em `build/v2par-bin`, rodados com `tools/roda_retrad.sh`; comparação com `tools/compara_retrad.py <run> <saída V1> --obra <C: da V1>`.

Resultado: igual (46 de 47; só o FRE); OTIM.LAJ/.VIG/.RLP iguais

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
OK     impressora.prn (34337 bytes iguais)
OK     obra/OTIM.BAK (122 bytes iguais)
OK     obra/OTIM.LAJ (1306 bytes iguais)
OK     obra/OTIM.RLP (449 bytes iguais)
OK     obra/OTIM.VIG (5130 bytes iguais)
marca: trocas no oráculo: 18 em texto de tela, 2 em desenho, 6 em texto da impressora, 1 na cópia gráfica da impressora
46 iguais, 1 diferentes
```

Valores de referência: `oraculo-novos/v2par_laje_otim.json` (136 valores), na pasta de paridade da V2 (fora do repositório).
