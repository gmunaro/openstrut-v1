// v2par2_pilar_col (PILAREDI): a obra só de pilares que o importador gera do COLS.COL do
// run: níveis FUND 0, PAV1 3, PAV2 6, COB 9 m; C1 retangular girada 30° com troca de seção
// e excentricidade, vento e Rx livre no PAV1; C2 circular D 40; C3 poligonal em L,
// começando no PAV1 (sobre transição); esforços externos dos níveis. O roteiro dimensiona
// com uma armadura por trecho de seção (o padrão "N" de `variaArmadura`): a armadura do
// .COL é saída (semArmaduraDoCol).
import type { CasoRef } from "../../lib/caso";
import type { Modo, Motor } from "../motor";
import { montarImportada, semArmaduraDoCol } from "./importada";

export default (motor: Motor, modo: Modo, caso: CasoRef) =>
  montarImportada(motor, modo, caso, { ajusta: semArmaduraDoCol, valores: { niveis: { FUND: 0, PAV1: 1, PAV2: 2 } } });
