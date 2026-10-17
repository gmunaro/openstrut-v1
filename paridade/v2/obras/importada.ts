// Obra de um caso importada dos arquivos que o próprio original gravou (cópias em
// paridade/casos/arquivos/<caso>/; a origem de cada arquivo no README de lá) pelos
// importadores da V2: o .LAJ primeiro, depois o .VIG/.SEC/.FOR/.TAB/.DSP (do .TAB, só o
// rept de cada viga). O .REP da pasta é saída do original, guardada para o diagnóstico:
// não é importado (o importador de pilares exige o .COL, que nenhum run gravou).
// As opções só dizem o que o arquivo não tem (materiais, peso próprio digitado no
// LAJEMONT, rodada do LAJECALC), conforme o roteiro do caso.
import { readdirSync, readFileSync } from "node:fs";
import { dirname, join } from "node:path";
import { fileURLToPath } from "node:url";
import type { CasoRef } from "../../lib/caso";
import type { ValorV2 } from "../../lib/comparar";
import type { ArquivoOriginal, Modo, Motor, Obra, OpcoesImportacao, OpcoesImportacaoLaj, OpcoesValores } from "../motor";

export const PASTA_ARQUIVOS = join(dirname(fileURLToPath(import.meta.url)), "..", "..", "casos", "arquivos");

/** Os arquivos do original do caso. */
export function arquivosDoCaso(caso: string): ArquivoOriginal[] {
  const pasta = join(PASTA_ARQUIVOS, caso);
  return readdirSync(pasta)
    .filter((n) => !n.startsWith("."))
    .sort()
    .map((nome) => ({ nome, dados: new Uint8Array(readFileSync(join(pasta, nome))) }));
}

export interface OpcoesImportada {
  /** Opções do `importarLaj` (o que o .LAJ não tem). */
  laj?: OpcoesImportacaoLaj;
  /** Leituras de .REP do PILGEEDI, com o .COL. */
  reps?: OpcoesImportacao["reps"];
  /** Entrada que o roteiro digitou depois dos arquivos (ex.: seção de um pilar). */
  ajusta?: (o: Obra) => Obra;
  valores?: OpcoesValores;
  /** Pasta de outro caso, quando o run deste não gravou a obra. */
  arquivosDe?: string;
}

/** Importa, calcula no modo e devolve os ids do caso que a V2 dá. */
export function montarImportada(motor: Motor, modo: Modo, caso: CasoRef, op: OpcoesImportada = {}): Map<string, ValorV2> {
  const imp = motor.importar(arquivosDoCaso(op.arquivosDe ?? caso.caso), { ...(op.laj && { laj: op.laj }), ...(op.reps && { reps: op.reps }) });
  const obra = op.ajusta ? op.ajusta(imp.obra) : imp.obra;
  return motor.calcular(obra, modo, imp.avisos).valores(caso, op.valores);
}

/** Pesos do E2E no LAJEMONT (impressora.prn:105-116 do caso a): 0,12 t/m nas vigas de
 *  4 m (V1 a V3, 12 × 40) e o predominante 0,15 nas outras (12 × 50, o padrão). */
export const VIGAS_E2E: OpcoesImportacaoLaj = { vigas: { V1: { h: 40 }, V2: { h: 40 }, V3: { h: 40 } } };

/** Pilares sem a armadura que o PIGRAEDI gravou no .COL: o .COL é gravado depois do
 *  dimensionamento, e o importador a transforma em `Pilar.armadura` (REDEFINE). Nos
 *  roteiros em que o PILAREDI escolheu a armadura sozinho, ela é saída, não entrada. */
export const semArmaduraDoCol = (o: Obra): Obra => ({
  ...o,
  pavimentos: o.pavimentos.map((p) => ({ ...p, pilares: p.pilares.map(({ armadura: _a, verificacoes: _v, ...q }) => q) })),
});
