// caso_a_laje (LAJECALC + LAJEGEOM 7): E2E.LAJ e E2E.VIG do run, com os pesos de viga do
// roteiro (VIGAS_E2E). Ids: paridade/casos/caso_a_laje.json, casados em v2/motor.ts.
import type { CasoRef } from "../../lib/caso";
import type { Modo, Motor } from "../motor";
import { montarImportada, VIGAS_E2E } from "./importada";

export default (motor: Motor, modo: Modo, caso: CasoRef) =>
  montarImportada(motor, modo, caso, { laj: VIGAS_E2E });
