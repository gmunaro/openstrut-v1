# Arquivos que o SISTRUT original gravou

Cópia dos arquivos de obra dos runs do oráculo (`$ORACULO/runs/`), um diretório por caso, para o comparador não depender da pasta do oráculo. Os bytes são os do original (o repositório não converte fim de linha). `v2/obras/importada.ts` importa daqui o .LAJ e depois o .VIG/.SEC/.FOR/.TAB/.DSP (do .TAB, o rept de cada viga). Com o .COL, o .REP é lido pelo importador de pilares nos níveis que o roteiro deu (com o .RLP de mesmo nome); sem o .COL, é saída do original e fica só para o diagnóstico. O .COL é gravado depois do dimensionamento: a armadura dele é saída quando o PILAREDI a escolheu (`semArmaduraDoCol`).

| caso | arquivo | origem |
|---|---|---|
| caso_a_laje | E2E.LAJ, E2E.VIG | `runs/caso_a_laje-20261015-041425/obra/` |
| caso_b_viga | E2E.LAJ, E2E.VIG | `casos/caso_b_viga.dados/` (a obra que o run do caso b leu) |
| caso_c_pilaredi | E2E.LAJ, E2E.VIG, E2E.REP | `casos/caso_c_pilaredi.dados/` |
| v2par_pilar_niveis | E2E.LAJ, E2E.VIG | `casos/caso_c_pilaredi.dados/` (a obra que gerou o E2E.REP; o run não grava obra) |
| | E2E.REP | `casos/v2par_pilar_niveis.dados/` (o .REP lido nos níveis 2 a 4) |
| v2par_des_2tramos, v2par_des_3tramos | ASS.LAJ, ASS.VIG | `casos/v2par_des_<n>tramos.dados/` (iguais aos do run do v2par_laje_assim) |
| | ASS.SEC, ASS.FOR, ASS.TAB | `runs/v2par_des_<n>tramos-*/obra/` |
| v2par_des_especial | DSX.VIG, DSX.SEC, DSX.FOR, DSX.TAB | `runs/v2par_des_especial-20261015-171646/obra/` |
| | V2P.DSP | `casos/v2par_des_especial.dados/` |
| v2par_laje_assim, balanco, cargas, livre, otim, r2, umadir | <obra>.LAJ, <obra>.VIG (e o .REP do cargas) | `runs/<caso>-*/obra/` do run do JSON |
| v2par_laje_r3 | OTIM.LAJ | `runs/v2par_laje_otim-20261015-163215/obra/` (o run do r3 trava antes de gravar a obra) |
| v2par_viga_fluxo | VBX.LAJ, VBX.VIG, VBX.REP | `runs/v2par_viga_fluxo-20261015-164332/obra/` (o .VIG regravado pelo VIGA) |
| v2par2_laje_tipos | TIP.LAJ, TIP.VIG | `runs/v2par2_laje_tipos-20261016-050324/obra/` |
| v2par2_pilar_rig | E2E.LAJ, .VIG, .SEC, .FOR, .TAB, .COL, .REP, .RLP | `runs/v2par2_pilar_rig-20261016-045352/obra/` |
| v2par2_pilar_def | E2E.LAJ, .VIG, .SEC, .FOR, .TAB, .COL, .REP, .RLP | `runs/v2par2_pilar_def-20261016-045408/obra/` |
| v2par2_pilar_col | COLS.COL | `runs/v2par2_pilar_col-20261016-050750/obra/` |
| v2par2_pilar_var | VAR.COL | `runs/v2par2_pilar_var-20261016-050733/obra/` (gravado depois da 3ª rodada) |
| v2par2_viga_varios | VVR.VIG, .SEC, .FOR, .TAB, .REP | `runs/v2par2_viga_varios-20261016-053752/obra/` |
| | V2Q.DSP | `casos/v2par2_viga_varios.dados/` (o .DSP que o DESENHO leu) |

Sem arquivo de entrada no run (obra do roteiro em `v2/obras/`): caso_c_pilar, v2par_pilar_lambda, v2par_pilar_mk e v2par_pilar_trava (PILAR opção 6, da `entrada` do JSON) e v2par_viga_r6 (VR6 digitada no VIGA). Na rodada 1 nenhum run tem .COL; na T10b, os quatro casos de pilar têm.
