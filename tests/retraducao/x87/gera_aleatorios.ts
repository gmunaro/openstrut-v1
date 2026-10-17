// Vetores aleatorios do modelo x87 da V2 (FYL2X, F2XM1, potencia) para tests/retraducao/x87/testa_aleatorios.cpp.
// Uso: bun gera_aleatorios.ts [n]  (le o x87.ts do worktree da V2; grava fyl2x.bin, f2xm1.bin, pot.bin aqui)
//   V2_RAIZ = raiz do worktree da V2 (variavel de ambiente obrigatoria; le $V2_RAIZ/src/calculo/sistrut/base).
// Registro: entradas e saida em estendido de 10 bytes; potencia com 1 byte de erro (0, 5, 6).
import { writeFileSync } from "node:fs";
// tipos copiados do x87.ts da V2 (o import do modulo e dinamico, pelo caminho em V2_RAIZ)
type Num = { readonly s: 0 | 1; readonly m: bigint; readonly e: number };
type Estendido =
  | ({ readonly tipo: "finito" } & Num)
  | { readonly tipo: "infinito"; readonly s: 0 | 1 }
  | { readonly tipo: "nan" };
const v2 = process.env.V2_RAIZ;
if (!v2) throw new Error("defina V2_RAIZ=<raiz do worktree da V2>");
const base = `${v2}/src/calculo/sistrut/base`;
const { f2xm1, fyl2x, potenciaX }: {
  f2xm1(x: Num): Num;
  fyl2x(y: Num, x: Num): Num;
  potenciaX(a: Estendido, b: Estendido): Estendido;
} = await import(`${base}/x87.ts`);
const { ErroQB }: { ErroQB: new (...a: never[]) => Error & { codigo: number } } = await import(`${base}/f32.ts`);

let semente = 20261016n;
const rnd = () => { semente = (semente * 6364136223846793005n + 1442695040888963407n) & ((1n << 64n) - 1n); return semente; };
const ri = (a: number, b: number) => a + Number(rnd() % BigInt(b - a + 1));
const num = (s: 0 | 1, e: number): Num => ({ s, m: rnd() | (1n << 63n), e: e - 63 });
function b80(n: Num | Estendido): Buffer {
  const b = Buffer.alloc(10);
  if ("tipo" in n && n.tipo !== "finito") { if (n.tipo === "infinito") { b.writeBigUInt64LE(1n << 63n, 0); b.writeUInt16LE((n.s << 15) | 0x7fff, 8); } else { b.writeBigUInt64LE(3n << 62n, 0); b.writeUInt16LE(0xffff, 8); } return b; }
  const x = n as Num;
  if (x.m === 0n) { b.writeUInt16LE(x.s << 15, 8); return b; }
  let m = x.m, e = x.e;
  while (m < (1n << 63n)) { m <<= 1n; e--; }
  while (m >= (1n << 64n)) { m >>= 1n; e++; }  // ja vem arredondado a 64 bits
  b.writeBigUInt64LE(m, 0); b.writeUInt16LE((x.s << 15) | (e + 63 + 16383), 8);
  return b;
}
const N = Number(process.argv[2] ?? 20000);
const fy: Buffer[] = [], f2: Buffer[] = [], po: Buffer[] = [];
for (let i = 0; i < N; i++) {
  const x = i % 4 === 0 ? num(0, ri(-1, 0)) : num(0, ri(-40, 40));
  const y = num(ri(0, 1) as 0 | 1, ri(-20, 20));
  fy.push(b80(y), b80(x), b80(fyl2x(y, x)));
  const ex = i % 10 === 0 ? ri(-300, -70) : ri(-70, -2);
  const f = num(ri(0, 1) as 0 | 1, ex);
  f2.push(b80(f), b80(f2xm1(f)));
  // potencia: base com sinal, expoentes inteiros e fracionarios
  const a = num(i % 7 === 0 ? 1 : 0, ri(-12, 12));
  let b: Num;
  const k = i % 5;
  if (k === 0) { const v = BigInt(ri(-6, 6) || 2); b = { s: v < 0n ? 1 : 0, m: v < 0n ? -v : v, e: 0 }; }
  else b = num(ri(0, 1) as 0 | 1, k === 1 ? ri(-8, 0) : ri(-3, 6));
  const A: Estendido = { tipo: "finito", ...a }, B: Estendido = { tipo: "finito", ...b };
  let r: Estendido = { tipo: "finito", s: 0, m: 0n, e: 0 }, err = 0;
  try { r = potenciaX(A, B); } catch (e) { if (e instanceof ErroQB) err = e.codigo; else throw e; }
  po.push(b80(a), b80(b), b80(r), Buffer.from([err]));
}
writeFileSync("fyl2x.bin", Buffer.concat(fy)); writeFileSync("f2xm1.bin", Buffer.concat(f2)); writeFileSync("pot.bin", Buffer.concat(po));
console.log("ok", N);
