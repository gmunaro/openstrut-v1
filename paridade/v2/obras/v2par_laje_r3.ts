// v2par_laje_r3 (R3: a otimização não converge): o run trava antes de gravar a obra; ela é
// a do v2par_laje_otim (OTIM.LAJ daquele run, copiado em casos/arquivos/v2par_laje_r3),
// com o piso Mneg/Mpos 0,35 digitado no LAJECALC 7 (`parametrosLaje.relacaoNegPosMin`).
import type { CasoRef } from "../../lib/caso";
import type { Modo, Motor } from "../motor";
import { montarImportada } from "./importada";

export default (motor: Motor, modo: Modo, caso: CasoRef) =>
  montarImportada(motor, modo, caso, { laj: { parametrosLaje: { relacaoNegPosMin: 0.35 } } });
