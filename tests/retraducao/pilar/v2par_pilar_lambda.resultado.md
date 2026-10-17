# v2par_pilar_lambda

Roteiro: `v2par_pilar_lambda.sufixo.txt` (caso do oráculo `$ORACULO/casos/v2par_pilar_lambda.txt`, gerado do sufixo).

Objetivo: Pilar avulso com esbeltez acima de 80 (λ = CINT(L/i·100) inteiro): seção do caso c com le 5 m (λ 87), le 6/3 m (λx 104: 'SITUACAO DE INSTABILIDADE' na direção x) e le 4,8 m com Mk 0,2 (λ 83). Fluência 0 (padrão). Ids com o prefixo e<k>. do conjunto.

Oráculo: `$ORACULO/runs/v2par_pilar_lambda-20261015-164824`

```
exe: PATH C:\SISTRUT;Z:\|CD \|SISTRUT\SISTRUT
fim: DOSBox-X terminou (programa saiu), codigo 0
roteiro completo: nao
tempo: 57 s
telas: 9
arquivos gravados/alterados em C:\: (nenhum)
```

V1 nova: EXE compilados de `src-original` (main 75cbbab) em `build/v2par-bin`, rodados com `tools/roda_retrad.sh`; comparação com `tools/compara_retrad.py <run> <saída V1> --obra <C: da V1>`.

Resultado: igual (10 de 10; impressora 6.129 bytes)

```
OK     001_p00_menu
OK     002_p01_secao
OK     003_p02_esf1
OK     004_p03_res1
OK     005_p04_esf2
OK     006_p05_res2
OK     007_p06_esf3
OK     008_p07_res3
OK     009_p08_menu
OK     impressora.prn (6129 bytes iguais)
marca: trocas no oráculo: 6 em texto de tela, 0 em desenho, 3 em texto da impressora, 0 na cópia gráfica da impressora
10 iguais, 0 diferentes
```

Valores de referência: `oraculo-novos/v2par_pilar_lambda.json` (109 valores), na pasta de paridade da V2 (fora do repositório).
