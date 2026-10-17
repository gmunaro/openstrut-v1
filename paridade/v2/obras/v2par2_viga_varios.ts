// v2par2_viga_varios (VIGA 8/1/6/7 → DESENHO 6/5/1/4 → DESDIM): só vigas, digitadas no
// VIGA. A obra é a que o importador de vigas gera do VVR.VIG, VVR.SEC, VVR.FOR e VVR.TAB do
// run e do V2Q.DSP que o DESENHO leu (casos/v2par2_viga_varios.dados): VA engastada com
// Mext e J por tramo, VB 3 tramos (rept 3 no .TAB), VC com cortante acima do limite.
// Respostas do roteiro que nenhum arquivo grava:
// - VIGA 8 (VIGA.INI): acidentais S fornecidas, momentos externos S, reação máxima no .REP;
// - DESDIM, VB: "Altero a Armacao" S, apoio 1 com a tracionada de 16 mm; fissuração dos
//   tramos N; VC: "Continuo com o processamento" N (o padrão);
// - o resumo do DESENHO 4 soma as vigas detalhadas que chegaram ao .TAB (a VB).
import type { CasoRef } from "../../lib/caso";
import type { Modo, Motor, Obra } from "../motor";
import { montarImportada } from "./importada";

const ajusta = (o: Obra): Obra => ({
  ...o,
  parametrosViga: { ...o.parametrosViga, viga: { ...o.parametrosViga?.viga, acidentais: true, momentosExternos: true, reacaoNoPilar: "maxima" } },
  pavimentos: o.pavimentos.map((p) => ({
    ...p,
    vigas: p.vigas.map((v) => (v.nome === "VB" ? { ...v, armaduraDigitada: [{ em: "apoio" as const, numero: 1, tracionada: { bitola: 16 } }] } : v)),
  })),
});

export default (motor: Motor, modo: Modo, caso: CasoRef) => montarImportada(motor, modo, caso, { ajusta, valores: { resumo: ["VB"] } });
