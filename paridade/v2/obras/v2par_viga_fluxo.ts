// v2par_viga_fluxo (LAJECALC + LAJEMONT + LAJEPROC + VIGA 2/7 e .REP): VBX.LAJ e o VBX.VIG
// regravado pelo VIGA, do run. No LAJEGEOM 7 o roteiro inverte "V1 apoia em V5" e "V2 apoia
// em V5" (resposta x): a V5 se apoia em V1 e em V2 (`apoiosEmViga`, que o .LAJ não guarda).
import type { CasoRef } from "../../lib/caso";
import type { Modo, Motor } from "../motor";
import { montarImportada } from "./importada";

export default (motor: Motor, modo: Modo, caso: CasoRef) =>
  montarImportada(motor, modo, caso, { laj: { apoiosEmViga: { V5: ["V1", "V2"] } } });
