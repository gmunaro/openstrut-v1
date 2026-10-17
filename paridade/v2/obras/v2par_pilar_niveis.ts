// v2par_pilar_niveis (PILAREDI): coluna P5 de FUND (0 m) a 9 m com o E2E.REP lido nos
// níveis 2, 3 e 4, seção 25 × 40, armadura por lance, e o predimensionamento por tensões
// (B e H digitados). Sem .COL no run: a obra é a E2E (E2E.LAJ e E2E.VIG da obra que gerou o
// E2E.REP) com o pavimento repetido 3 vezes, e a V2 leva o .REP de cada repetição ao seu
// nível, como `calculo/sistrut/pilaresDaObra.test.ts` da V2.
// Respostas do roteiro (casos/v2par_pilar_niveis.txt): "Vario a Armadura" S, "de quantos em
// quantos" 1 (`variaArmadura: 1`); "Defino seção" N nas três leituras do .REP
// (`rigidezVigas: false`); o .dados só tem o E2E.REP, sem o .RLP (`rlp: false`).
// Lance do original (nível de baixo) → nível da V2: FUND = 0, PAV1 = 1, PAV2 = 2.
import type { CasoRef } from "../../lib/caso";
import type { Modo, Motor, Obra } from "../motor";
import { montarImportada, VIGAS_E2E } from "./importada";

const ajusta = (o: Obra): Obra => ({
  ...o,
  parametrosPilar: { predimensionamento: "tensoes", variaArmadura: 1, rigidezVigas: false, rlp: false },
  pavimentos: o.pavimentos.map((p) => ({ ...p, repeticoes: 3, pilares: p.pilares.map((q) => (q.nome === "P5" ? { ...q, b: 25, h: 40 } : q)) })),
});

export default (motor: Motor, modo: Modo, caso: CasoRef) =>
  montarImportada(motor, modo, caso, { laj: VIGAS_E2E, ajusta, valores: { niveis: { FUND: 0, PAV1: 1, PAV2: 2 } } });
