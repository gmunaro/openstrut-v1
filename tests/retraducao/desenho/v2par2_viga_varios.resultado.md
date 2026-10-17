# v2par2_viga_varios

Roteiro: `v2par2_viga_varios.sufixo.txt` (caso do oráculo `$ORACULO/casos/v2par2_viga_varios.txt`, gerado do sufixo).

Objetivo: Vigas: engaste nas extremidades com momentos externos e J diferente por tramo (VA); acidentais S fornecidas com reação máxima no .REP (VIGA 8: indexação/somatória Máximas); .DSP editado (6 grupos de bitolas, fissuração classe 2); armadura alterada no DESDIM ('Altero a Armacao') e repetições por viga (VB × 3); 'Continuo com o processamento' N numa viga com cortante acima do limite (VC, 20 × 40 com 15 t/m: Vk 27,00* e momento acima de 40 % do limite). Com N, o DESDIM imprime só o bloco de esforços da VC (sem tabela de armação); a armação aparece só na tela (ids *.tela); a VC fica fora do VVR.TAB e do resumo de consumo, mas a seção dela continua no VVR.SEC. Ids do DESDIM com o prefixo des.

Oráculo: `$ORACULO/runs/v2par2_viga_varios-20261016-053752`

```
exe: PATH C:\SISTRUT;Z:\|CD \|SISTRUT\SISTRUT
fim: DOSBox-X terminou (programa saiu), codigo 0
roteiro completo: nao
tempo: 360 s
telas: 26
arquivos gravados/alterados em C:\: VVR.FOR, VVR.REP, VVR.SEC, VVR.TAB, VVR.VIG
```

V1 nova: EXE compilados de `src-original` do branch `v1-difs` em `build/v2par2-bin`, rodados com `tools/roda_retrad.sh` do v1-difs; comparação com `tools/compara_retrad.py <run> <saída V1> --obra <C: da V1>`.

Resultado: igual (31 de 32: c01 = FRE do VIGA); impressora (12.413 bytes) e VVR.VIG/.REP/.SEC/.FOR/.TAB iguais

```
OK     001_a01
OK     002_a02
OK     003_a03
OK     004_a04
OK     005_b01_va
OK     006_b02_vb
OK     007_b03_vc
DIFERE 008_c01_gravado:
   linha 16 oráculo: '                   6  -  Acesso ao DOS ( 121 Kbytes livres )'
OK     009_r1_apoios
OK     010_r2_apoios
OK     011_r3_apoios
OK     012_r9_reacoes
OK     013_r10_menu
OK     014_d00_desenho
OK     015_d01_param
OK     016_d_VB
OK     017_d_VC
OK     018_g01_rep
OK     019_h01_vb
OK     020_h02_apoio1
OK     021_h03_fiss
OK     022_h05_vc_cortante
OK     023_i01_menu
OK     024_r02
OK     025_r04_resumo
OK     026_r05
OK     impressora.prn (12413 bytes iguais)
OK     obra/VVR.FOR (1848 bytes iguais)
OK     obra/VVR.REP (679 bytes iguais)
OK     obra/VVR.SEC (1038 bytes iguais)
OK     obra/VVR.TAB (140 bytes iguais)
OK     obra/VVR.VIG (3420 bytes iguais)
marca: trocas no oráculo: 31 em texto de tela, 0 em desenho, 6 em texto da impressora, 0 na cópia gráfica da impressora
31 iguais, 1 diferentes
```

Valores de referência: `oraculo-novos2/v2par2_viga_varios.json` (350 valores), na pasta de paridade da V2 (fora do repositório).
