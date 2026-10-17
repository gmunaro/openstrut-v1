# v2par2_pilar_col

Roteiro: `v2par2_pilar_col.sufixo.txt` (caso do oráculo `$ORACULO/casos/v2par2_pilar_col.txt`, gerado do sufixo).

Objetivo: .COL com seções retangular girada (com troca de seção e excentricidade entre seções), circular e poligonal; vínculo por nível (C1 livre em x no PAV1: λx 58); vento com dois momentos; coluna que começa acima da fundação (C3).

Oráculo: `$ORACULO/runs/v2par2_pilar_col-20261016-050750`

```
exe: PATH C:\SISTRUT;Z:\|CD \|SISTRUT\SISTRUT
fim: DOSBox-X terminou (programa saiu), codigo 0
roteiro completo: nao
tempo: 235 s
telas: 14
arquivos gravados/alterados em C:\: COLS.BAK, COLS.COL
```

V1 nova: EXE compilados de `src-original` do branch `v1-difs` em `build/v2par2-bin`, rodados com `tools/roda_retrad.sh` do v1-difs; comparação com `tools/compara_retrad.py <run> <saída V1> --obra <C: da V1>`.

Resultado: igual (16 de 17: e07 = FRE do PIGRAEDI); impressora e COLS.COL iguais

```
OK     001_e01_colunas
OK     002_e02_vento
OK     003_e03_trav
OK     004_p01
OK     005_q01
OK     006_q02_excentr
OK     007_q03_circ
OK     008_q04_polig
OK     009_q05
OK     010_e05_arm1
OK     011_e05_arm2
OK     012_e05_arm3
OK     013_e06_menu
DIFERE 014_e07_gravado:
   linha 16 oráculo: '                   6  -  Acesso ao DOS ( 225 Kbytes livres )'
OK     impressora.prn (4867 bytes iguais)
OK     obra/COLS.BAK (124 bytes iguais)
OK     obra/COLS.COL (2100 bytes iguais)
marca: trocas no oráculo: 0 em texto de tela, 0 em desenho, 0 em texto da impressora, 0 na cópia gráfica da impressora
16 iguais, 1 diferentes
```

Valores de referência: `oraculo-novos2/v2par2_pilar_col.json` (212 valores), na pasta de paridade da V2 (fora do repositório).
