// caso_c_pilaredi (PILAREDI, P5): a obra E2E de casos/caso_c_pilaredi.dados (E2E.LAJ e
// E2E.VIG). O original leu o E2E.REP dela, que a V2 calcula da obra; o .COL não foi
// gravado (o importador de pilares exige o .COL), e a coluna é a que a V2 monta: P5 20 × 20
// de 0 a 3 m, vínculo de continuidade.
// Respostas do roteiro (casos/caso_c_pilaredi.txt): "Defino seção" N (`rigidezVigas:
// false`); "Vario a Armadura" Enter, o padrão N; o E2E.RLP está ao lado do .REP e o
// PILGEEDI o lê (o padrão de `rlp`).
import type { CasoRef } from "../../lib/caso";
import type { Modo, Motor, Obra } from "../motor";
import { montarImportada, VIGAS_E2E } from "./importada";

const ajusta = (o: Obra): Obra => ({ ...o, parametrosPilar: { ...o.parametrosPilar, rigidezVigas: false } });

export default (motor: Motor, modo: Modo, caso: CasoRef) =>
  montarImportada(motor, modo, caso, { laj: VIGAS_E2E, ajusta });
