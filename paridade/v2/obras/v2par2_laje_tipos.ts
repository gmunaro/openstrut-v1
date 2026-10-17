// v2par2_laje_tipos (LAJEGEOM + LAJECALC + LAJEMONT + LAJEPROC): TIP.LAJ e TIP.VIG do run.
// O .LAJ traz o polígono em L, os tipos (pré-moldada a 90°, comum não calculada), o grupo
// da L5, o i 1,2 digitado no LAJECALC 1, o μ informado (1 na L2, 0,7 na L3) e o
// pilar-parede P5. Respostas do roteiro que o .LAJ não grava: sem a otimização (LAJECALC 6)
// e, no LAJEGEOM 7, a 1ª opção do cruzamento (8, 4) sem pilar, "V2 apoia em V6" (tela
// 034_v02a_apoio do run).
import type { CasoRef } from "../../lib/caso";
import type { Modo, Motor } from "../motor";
import { montarImportada } from "./importada";

export default (motor: Motor, modo: Modo, caso: CasoRef) =>
  montarImportada(motor, modo, caso, { laj: { otimizaNegativos: false, apoiosEmViga: { V2: ["V6"] } } });
