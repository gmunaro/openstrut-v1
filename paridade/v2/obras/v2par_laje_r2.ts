// v2par_laje_r2 (R2 do LAJEPROC): RDOIS.LAJ e RDOIS.VIG do run. O roteiro não roda a
// otimização (LAJECALC 6): `otimizaNegativos: false`. O polígono vem do .LAJ, na ordem
// gravada: o lado comum é o 3 nas duas lajes, o que dispara o R2.
import type { CasoRef } from "../../lib/caso";
import type { Modo, Motor } from "../motor";
import { montarImportada } from "./importada";

export default (motor: Motor, modo: Modo, caso: CasoRef) =>
  montarImportada(motor, modo, caso, { laj: { otimizaNegativos: false } });
