// caso_b_viga (VIGA opção 7 e .REP): a obra E2E que o caso leu (E2E.LAJ e E2E.VIG de
// casos/caso_b_viga.dados), com os pesos de viga do roteiro do caso a.
import type { CasoRef } from "../../lib/caso";
import type { Modo, Motor } from "../motor";
import { montarImportada, VIGAS_E2E } from "./importada";

export default (motor: Motor, modo: Modo, caso: CasoRef) =>
  montarImportada(motor, modo, caso, { laj: VIGAS_E2E });
