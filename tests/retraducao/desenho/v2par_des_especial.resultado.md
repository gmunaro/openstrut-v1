# v2par_des_especial

Roteiro: `v2par_des_especial.sufixo.txt` (caso do oráculo `$ORACULO/casos/v2par_des_especial.txt`, gerado do sufixo).

Objetivo: Dimensionamento de viga com: seção T (Bf 80, Hf 10) nos tramos; armadura dupla no apoio 1 (x/d no limite do aço A, 0,628; Ast 10,18 e Asc 2,61); aço classe A; balanço à esquerda e à direita; carga concentrada de 3 t a 0,4 m do apoio (alívio do cortante: Vke 8,98 no DESDIM contra Ve 10,98 da análise); flecha com inércia fissurada e deformação lenta (impressa, 1,97 cm no tramo 1); verificação de fissuração (só na tela: janelas 'Fissura(1)' por apoio e por tramo; o original não imprime fissuração); envoltória de acidentais (acidentais S: linhas 'max' na impressão).

Oráculo: `$ORACULO/runs/v2par_des_especial-20261015-171646`

```
exe: PATH C:\SISTRUT;Z:\|CD \|SISTRUT\SISTRUT
fim: DOSBox-X terminou (programa saiu), codigo 0
roteiro completo: nao
tempo: 258 s
telas: 30
arquivos gravados/alterados em C:\: DSX.FOR, DSX.SEC, DSX.TAB, DSX.VIG
```

V1 nova: EXE compilados de `src-original` (main 75cbbab) em `build/v2par-bin`, rodados com `tools/roda_retrad.sh`; comparação com `tools/compara_retrad.py <run> <saída V1> --obra <C: da V1>`.

Resultado: DIFERENTE só no arquivo DSX.SEC (32 de 35 iguais): bytes 21, 25, 93 e 97 = Bf e Hf dos dois balanços (seções retangulares), gravados como −0,0 (00 00 00 80) no original e +0,0 na V1 nova. Impressora 60.657 bytes e DSX.VIG/.FOR/.TAB iguais; as outras diferenças são o FRE do VIGA e a tela d09_secoes (cabeçalho cortado pela janela, artefato da troca de marca)

Depois do v1-difs (15/10/2026): 33 de 35 (FRE e d09 = marca); DSX.SEC igual byte a byte. Causa: produto de comparações em ponto flutuante no DESENHO 0x38ebb (V2PAR.md, item 3).

```
OK     001_a00
OK     002_a01
OK     003_a02
OK     004_b01_dados
OK     005_b01b_dados
OK     006_b02
OK     007_b03_menu
DIFERE 008_b04_gravado:
   linha 16 oráculo: '                   6  -  Acesso ao DOS ( 121 Kbytes livres )'
OK     009_c00_desenho
OK     010_c01_dir_dsp
OK     011_c02_menu
OK     012_c03_param
OK     013_c04_param_v2p
OK     014_d05
OK     015_d06
DIFERE 016_d09_secoes:
   linha  3 oráculo: '   SISTRUT  ********** ┌───────────────────────────────────────────────────┐'
   linha  4 oráculo: '   Abril 1991   *******│       Obra - DSX    Viga - D1                     │█'
   linha  5 oráculo: '   Versao 4.0   *******│ TRAMO   Bw   Hw   Bf   Hf     APOIO   Bw   Hw     │█'
OK     017_d20_apoios
OK     018_d25
OK     019_d28
OK     020_d29
OK     021_d34
OK     022_d35
OK     023_h00_aviso
OK     024_h01
OK     025_h02_fissura_apoios
OK     026_h03_fissura_tramos
OK     027_h04_aviso2
OK     028_i04_menu
OK     029_r04_resumo
OK     030_r05
OK     impressora.prn (60657 bytes iguais)
OK     obra/DSX.FOR (616 bytes iguais)
DIFERE obra/DSX.SEC: 346 x 346 bytes; primeiro byte diferente em 21: 80 00 00 00 80 00 00 a0 41 00 00 20 42 00 00 a0 | 00 00 00 00 00 00 00 a0 41 00 00 20 42 00 00 a0
OK     obra/DSX.TAB (70 bytes iguais)
OK     obra/DSX.VIG (1710 bytes iguais)
marca: trocas no oráculo: 51 em texto de tela, 0 em desenho, 1 em texto da impressora, 0 na cópia gráfica da impressora
32 iguais, 3 diferentes
```

Valores de referência: `oraculo-novos/v2par_des_especial.json` (159 valores), na pasta de paridade da V2 (fora do repositório).
