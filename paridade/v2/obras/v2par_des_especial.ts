// v2par_des_especial (VIGA 8/1/6 → DESENHO): a viga D1 digitada no VIGA, sem planta. A
// obra é a que o importador de vigas gera do DSX.VIG, DSX.SEC e DSX.FOR do run e do
// V2P.DSP que o caso leu (casos/v2par_des_especial.dados): seção T, concentradas,
// acidentais próprias e a parametrização do .DSP.
// Roteiro (casos/v2par_des_especial.txt): o aviso "Momento acima de 40% do limite da
// armadura simples" pergunta "Continuo com o processamento desta Viga" nas duas passadas,
// e a resposta é S (`continuaSeExcederLimite`, que nenhum arquivo grava); "Altero a
// Armação" N e as janelas de fissuração N: sem `armaduraDigitada`.
import type { CasoRef } from "../../lib/caso";
import type { Modo, Motor, Obra } from "../motor";
import { montarImportada } from "./importada";

const ajusta = (o: Obra): Obra => ({
  ...o,
  pavimentos: o.pavimentos.map((p) => ({ ...p, vigas: p.vigas.map((v) => (v.nome === "D1" ? { ...v, continuaSeExcederLimite: true } : v)) })),
});

export default (motor: Motor, modo: Modo, caso: CasoRef) =>
  montarImportada(motor, modo, caso, { ajusta, valores: { analise: "DESDIM", resumo: ["D1"] } });
