# v2par_viga_r6

Roteiro: `v2par_viga_r6.sufixo.txt` (caso do oráculo `$ORACULO/casos/v2par_viga_r6.txt`, gerado do sufixo).

Objetivo: R6 do PLANO (VIGA.BAS ≈5434, U62-025): o percentual de carga acidental gerada é validado com 'VAL > 96 AND VAL < 4' (AND no lugar de OR), então a tela aceita qualquer valor. Com 150 % a acidental gerada (3,0 t/m) passa a carga total (2,0 t/m): a envoltória usa permanente −1 t/m e dá reações mínimas negativas. A outra metade do R6 (redução dos negativos lida do VIGA.INI sem piso) só se provoca editando o VIGA.INI da instalação; não tem caso.

Oráculo: `$ORACULO/runs/v2par_viga_r6-20261015-184612`

```
exe: PATH C:\SISTRUT;Z:\|CD \|SISTRUT\SISTRUT
fim: DOSBox-X terminou (programa saiu), codigo 0
roteiro completo: nao
tempo: 53 s
telas: 6
arquivos gravados/alterados em C:\: (nenhum)
```

V1 nova: EXE compilados de `src-original` (main 75cbbab) em `build/v2par-bin`, rodados com `tools/roda_retrad.sh`; comparação com `tools/compara_retrad.py <run> <saída V1> --obra <C: da V1>`.

Resultado: igual (7 de 7; impressora 2.062 bytes)

```
OK     001_p00
OK     002_p01
OK     003_p02_150
OK     004_e01_dados
OK     005_e02
OK     006_e03_menu
OK     impressora.prn (2062 bytes iguais)
marca: trocas no oráculo: 3 em texto de tela, 0 em desenho, 1 em texto da impressora, 0 na cópia gráfica da impressora
7 iguais, 0 diferentes
```

Valores de referência: `oraculo-novos/v2par_viga_r6.json` (56 valores), na pasta de paridade da V2 (fora do repositório).
