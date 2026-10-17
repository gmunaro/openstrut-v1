// v2par_des_3tramos (DESENHO 1 e 4): a obra ASS (ASS.LAJ e ASS.VIG de
// casos/v2par_des_3tramos.dados) completada com o ASS.SEC e o ASS.FOR do run (V1 detalhada).
// O .FOR com pe/Hle/pd/Hld zerados vira `lajesNoCorte: "nao"` no importador. A análise
// impressa é a do DESDIM, e o resumo do DESENHO 4 somou só a V1.
import type { CasoRef } from "../../lib/caso";
import type { Modo, Motor } from "../motor";
import { montarImportada } from "./importada";

export default (motor: Motor, modo: Modo, caso: CasoRef) =>
  montarImportada(motor, modo, caso, { valores: { analise: "DESDIM", resumo: ["V1"] } });
