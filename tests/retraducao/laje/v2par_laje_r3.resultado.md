# v2par_laje_r3

Roteiro: `v2par_laje_r3.sufixo.txt` (caso do oráculo `$ORACULO/casos/v2par_laje_r3.txt`, gerado do sufixo).

Objetivo: R3 do PLANO (LAJECALC.BAS:2111-2145): a otimização dos negativos NÃO CONVERGE quando o piso Mneg/Mpos mínimo não é múltiplo de 0,1. Mesma obra do v2par_laje_otim com o parâmetro 'Minima Relacao Mneg/Mpos' (LAJECALC 7, item 6) em 0,35: o coeficiente reduzido vira max(INT(100·c·M2/M1)/100; 0,35) = 0,35 em SINGLE (0,3499999940), gravado como CINT(0,35·10 + 2) = CINT(5,4999999) = 5 (0,30); como 0,30 ≠ 0,35 e (M1 − M2)/M1 > 10 %, o mesmo bordo é refeito para sempre. Telas aos 30 s e 60 s iguais ('Relacao Mneg/Mpos da Laje L1 alterada para .35 .. Aguarde'); F2 interrompe e volta ao LAJE. Com o piso de fábrica 0,30 não há laço (o mesmo CINT faz o código andar: 0,4 → 0,3 = piso).

Oráculo: `$ORACULO/runs/v2par_laje_r3-20261015-164300`

```
exe: PATH C:\SISTRUT;Z:\|CD \|SISTRUT\SISTRUT
fim: DOSBox-X terminou (programa saiu), codigo 0
roteiro completo: nao
tempo: 220 s
telas: 27
arquivos gravados/alterados em C:\: (nenhum)
```

V1 nova: EXE compilados de `src-original` (main 75cbbab) em `build/v2par-bin`, rodados com `tools/roda_retrad.sh`; comparação com `tools/compara_retrad.py <run> <saída V1> --obra <C: da V1>`.

Resultado: sem comparação útil: a V1 nova também entra no laço (LAJECALC.exe a ~5 % de CPU, nenhuma tela depois de c09_otim), mas o roteiro da V1 não avança porque o RT45 só lê teclas (e o ON KEY) quando o programa pede tecla; o F2 que tira o original do laço não chega. Diferença de comportamento do ON KEY durante laço sem leitura de teclado

Depois do v1-difs (15/10/2026): IGUAL, 28 de 28, roteiro completo. O F2 tira o LAJECALC do laço e volta ao LAJE, como no original (B$EVCK: `RT_EVCK` antes dos saltos para trás; V2PAR.md, item 4).

Valores de referência: `oraculo-novos/v2par_laje_r3.json` (56 valores), na pasta de paridade da V2 (fora do repositório).
