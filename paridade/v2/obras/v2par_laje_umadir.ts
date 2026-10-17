// v2par_laje_umadir: o .LAJ e o .VIG que o original gravou no run, importados.
import type { CasoRef } from "../../lib/caso";
import type { Modo, Motor } from "../motor";
import { montarImportada } from "./importada";

export default (motor: Motor, modo: Modo, caso: CasoRef) =>
  montarImportada(motor, modo, caso);
