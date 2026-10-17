// v2par2_pilar_rig (LAJE → VIGA 7 → DESENHO 1 → PILAREDI): a obra E2E do run, na ordem do
// original: E2E.LAJ, E2E.VIG/.SEC/.FOR/.TAB (DESENHO das V1, V3, V4 e V5) e E2E.COL com o
// E2E.REP lido no nível 2 (o .RLP de mesmo nome vai junto). Colunas P7, P1 e P8, 25 × 40.
// Respostas do roteiro: pesos de viga do E2E (VIGAS_E2E); o PILAREDI escolheu a armadura
// sozinho (a do .COL é saída: semArmaduraDoCol); "Prossigo com a Leitura" S: rigidez das vigas do .SEC (o padrão de `rigidezVigas`).
import type { CasoRef } from "../../lib/caso";
import type { Modo, Motor, Obra } from "../motor";
import { montarImportada, semArmaduraDoCol, VIGAS_E2E } from "./importada";

const ajusta = (o: Obra): Obra => semArmaduraDoCol(o);

export default (motor: Motor, modo: Modo, caso: CasoRef) =>
  montarImportada(motor, modo, caso, {
    laj: VIGAS_E2E,
    reps: [{ arquivo: "E2E.REP", nivelInicial: 2, nivelFinal: 2 }],
    ajusta,
    valores: { niveis: { FUND: 0 } },
  });
