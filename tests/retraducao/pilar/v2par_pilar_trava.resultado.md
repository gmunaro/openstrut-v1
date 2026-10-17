# v2par_pilar_trava

Roteiro: `v2par_pilar_trava.sufixo.txt` (caso do oráculo `$ORACULO/casos/v2par_pilar_trava.txt`, gerado do sufixo).

Objetivo: Achado da T10: o PILAR opção 6 não termina a verificação de alguns casos de flexão oblíqua (laço na busca do momento resistente). Seção 20 × 30, c' 3, 2 + 2 φ16, Nk 20 t, Mxk 0,8, Myk 0, le 3 m: o caso 1/2 termina 'ok'; o caso 2/2 (Mx 0,80 inicial, My acidental, inclinação 27°) fica em 'Esforcos resistentes do Pilar — Aguarde ...' aos 30 s e aos 60 s; F2 leva a 'Erro de Operacao'. Também travam (V1 nova, código nativo): Nk 30, Mxk 1,0, Myk 0,6 (caso 1, 21°) e Nk 30, Mxk 0,8 (caso 2, 37°). Terminam: inclinações 15°, 18°, 22°, 53°, 61°, 72°.

Oráculo: `$ORACULO/runs/v2par_pilar_trava-20261015-171708`

```
exe: PATH C:\SISTRUT;Z:\|CD \|SISTRUT\SISTRUT
fim: roteiro acabou e o programa nao saiu em 20 s
roteiro completo: sim
tempo: 112 s
telas: 6
arquivos gravados/alterados em C:\: (nenhum)
```

V1 nova: EXE compilados de `src-original` (main 75cbbab) em `build/v2par-bin`, rodados com `tools/roda_retrad.sh`; comparação com `tools/compara_retrad.py <run> <saída V1> --obra <C: da V1>`.

Resultado: sem comparação útil: a V1 nova também não termina o caso 2 (PILAR.exe a 100 % de CPU por mais de 5 min), mas o roteiro da V1 não avança durante o laço (o RT45 só atende teclas e ON KEY quando o programa lê o teclado)

Depois do v1-difs (15/10/2026): 6 de 7, roteiro completo. O F2 interrompe o laço e a tela t03 ("Erro de Operacao") é igual. A t01 difere só no atributo da linha 16: o laço escreve "Aguarde ..." alternando COLOR 4 e COLOR 3, e no oráculo t01 e t02 já diferem entre si (V2PAR.md, item 4).

Valores de referência: `oraculo-novos/v2par_pilar_trava.json` (28 valores), na pasta de paridade da V2 (fora do repositório).
