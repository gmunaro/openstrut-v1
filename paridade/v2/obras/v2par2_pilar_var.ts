// v2par2_pilar_var (PILAREDI): a coluna PA da obra só de pilares do VAR.COL (níveis 0 a
// 12 m, 25 × 40, 12 t e 3 tm por nível), dimensionada três vezes no roteiro, cada uma com
// o seu relatório:
// 1. uma armadura para a coluna ("Vario" N): ids PA.FUND.*;
// 2. Redefine 6 # 16 (cantos 16 e uma barra no meio de cada face em Hw) aceito: ids
//    PA.FUND.r2.* (o 4 # 10 recusado volta à janela e não imprime nada);
// 3. variando de 2 em 2 níveis: PA.FUND.r3.* e PA.PAV2.*.
// A armadura que o .COL gravou é a da rodada 3 (saída): semArmaduraDoCol nas três.
// Barras do Redefine na convenção do .COL: cobrimento 2 cm + φ/2 ao eixo da barra.
import type { CasoRef } from "../../lib/caso";
import type { ValorV2 } from "../../lib/comparar";
import type { Modo, Motor, Obra } from "../motor";
import { montarImportada, semArmaduraDoCol } from "./importada";

const NIVEIS = { FUND: 0, PAV1: 1, PAV2: 2, PAV3: 3 };

const c = 2 + 1.6 / 2;
const REDEFINE = [
  [c, c],
  [c, 40 - c],
  [25 - c, 40 - c],
  [25 - c, c],
  [c, 20],
  [25 - c, 20],
].map(([x, y]) => ({ x: x!, y: y!, bitola: 16 }));

/** Rodada do roteiro → ajuste da obra e o que os ids dela têm a mais. */
const RODADAS: { ids: (id: string) => string | undefined; ajusta: (o: Obra) => Obra }[] = [
  { ids: (id) => (/\.r\d\./.test(id) || id.startsWith("PA.PAV") ? undefined : id), ajusta: semArmaduraDoCol },
  {
    ids: (id) => (id.startsWith("PA.FUND.r2.") ? id.replace(".r2.", ".") : undefined),
    ajusta: (o) => {
      const s = semArmaduraDoCol(o);
      // o lance da fundação é o do pavimento mais baixo (o último da lista)
      const base = s.pavimentos.length - 1;
      return { ...s, pavimentos: s.pavimentos.map((p, i) => (i === base ? { ...p, pilares: p.pilares.map((q) => ({ ...q, armadura: { barras: REDEFINE } })) } : p)) };
    },
  },
  {
    ids: (id) => (id.startsWith("PA.FUND.r3.") ? id.replace(".r3.", ".") : id.startsWith("PA.PAV") ? id : undefined),
    ajusta: (o) => ({ ...semArmaduraDoCol(o), parametrosPilar: { ...o.parametrosPilar, variaArmadura: 2 } }),
  },
];

export default function montar(motor: Motor, modo: Modo, caso: CasoRef): Map<string, ValorV2> {
  const out = new Map<string, ValorV2>();
  for (const r of RODADAS) {
    const ids = caso.valores.flatMap((v) => {
      const id = r.ids(v.id);
      return id ? [{ original: v.id, id }] : [];
    });
    const parcial: CasoRef = { ...caso, valores: ids.map((x) => ({ ...caso.valores.find((v) => v.id === x.original)!, id: x.id })) };
    const valores = montarImportada(motor, modo, parcial, { ajusta: r.ajusta, valores: { niveis: NIVEIS } });
    for (const x of ids) {
      const v = valores.get(x.id);
      if (v !== undefined) out.set(x.original, v);
    }
  }
  return out;
}
