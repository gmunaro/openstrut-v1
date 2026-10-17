#!/usr/bin/env python3
"""Mede a fidelidade textual de um .BAS reconstruido contra o EXE original.

Uso:
    python -I tools/strcover.py <ORIG.EXE> <RECONSTR.BAS> [--show-missing] [--exclui ARQ]
    python -I tools/strcover.py --all [--exclui ARQ]

Cobertura = strings visiveis do EXE (sem runtime, sem lixo, sem as excluidas)
que aparecem como literal de string no .BAS. Excluidas: as strings que nao serao
reimplementadas (trechos de verificacao de licenca do original), uma por linha no
arquivo de --exclui ou da variavel STRCOVER_EXCLUI, fora do repositorio; saem do
denominador. Regras de comparacao:
  - ignora espacos nas pontas e diferenca de maiusculas;
  - ignora caracteres CP437 de borda nas pontas (lixo de bytes adjacentes);
  - uma string do EXE igual ao literal sem a 1a letra conta (hotkey desenhada a parte).
Strings do EXE repetidas contam uma vez.
"""
import argparse
import glob
import os
import re
import sys
from dataclasses import dataclass

TOOLS_DIR = os.path.dirname(os.path.abspath(__file__))
DIST_DIR = os.path.dirname(TOOLS_DIR)
sys.path.insert(0, TOOLS_DIR)
import qbstrings  # noqa: E402  (modulo irmao; -I nao poe o diretorio do script no path)

# Mensagens do runtime BRUN45/QB: nao pertencem ao SISTRUT.
RUNTIME_MARKERS = [
    "BRUN45",
    "run-time",
    "Error in loading RTM",
    "COMSPEC",
    "Memory allocation error",
    "Cannot find file in PATH",
    "Disk I/O error",
    "Invalid format",
    "Out of memory",
    "DOS memory-arena error",
    "not enough memory on exec",
    "bad format on exec",
    "bad environment on exec",
    "C_FILE_INFO",
    "PATH=",
]

MIN_LETTERS = 4


def norm(s: str) -> str:
    """Forma canonica para comparacao: sem brancos e sem bytes >= 0x80 nas pontas, minusculas."""
    i, j = 0, len(s)
    while i < j and (s[i].isspace() or ord(s[i]) >= 0x80):
        i += 1
    while j > i and (s[j - 1].isspace() or ord(s[j - 1]) >= 0x80):
        j -= 1
    return s[i:j].strip().lower()


def _nospace(s: str) -> str:
    return "".join(norm(s).split())


_EXCLUIDAS: list[str] = []


def define_exclusoes(textos: list[str]) -> None:
    """Strings que saem do denominador (ver o cabecalho). A comparacao ignora espacos."""
    _EXCLUIDAS[:] = [_nospace(t) for t in textos if t.strip()]


def le_exclusoes(caminho: str | None) -> None:
    """Carrega as exclusoes de um arquivo (uma string por linha); sem arquivo, nenhuma."""
    if caminho:
        define_exclusoes(open(caminho, encoding="utf-8").read().splitlines())


def is_excluded(s: str) -> bool:
    """True se a string do EXE e (ou e parte de) uma string excluida.

    Aceita o trecho sem a 1a letra (hotkey) com len >= 6 para evitar falsos positivos.
    """
    k = _nospace(s)
    return any(p in k or (len(k) >= 6 and p.endswith(k)) for p in _EXCLUIDAS)


# Trecho "util" de uma string do EXE: o QB45 grava descritores de 1-2 bytes
# colados nos literais e mascaras de PRINT USING ("####.##", "\   \\"); por
# isso se compara o maior trecho de texto corrido, nao a string inteira.
_CORE_RE = re.compile(r"[A-Za-z0-9 .,:;/<>=*%+?!_\-]+")


def _collapse(s: str) -> str:
    return " ".join(s.split()).lower()


def core(s: str) -> str:
    """Maior trecho de texto corrido (por numero de letras), normalizado."""
    best, best_letters = "", -1
    for run in _CORE_RE.findall(s):
        n = sum(c.isalpha() for c in run)
        if n > best_letters:
            best, best_letters = run, n
    c = _collapse(best.strip(" .-"))
    # pontuacao residual de descritor nas pontas (",!erro ...", "... S/*N* ;")
    c = re.sub(r"^[a-z0-9]?[^a-z0-9 <]+ +", "", c)   # "h! termino ..."
    c = re.sub(r"^[^a-z0-9<]+", "", c)
    c = re.sub(r"[^a-z0-9.>)*]+$", "", c)
    # descritor de 1 byte colado antes do texto ("7 Confirme ..."): descarta;
    # inofensivo para textos legitimos ("A Somatoria" segue casando por substring)
    if len(c) > 2 and c[1] == " " and sum(ch.isalpha() for ch in c[2:]) >= MIN_LETTERS:
        c = c[2:]
    return c


def _is_noise(c: str) -> bool:
    """Lixo binario: poucas letras, sem vogal, ou tabela de modulos do QB (bmXXXX)."""
    if sum(ch.isalpha() for ch in c) < MIN_LETTERS:
        return True
    if not re.search(r"[aeiou]", c):
        return True
    return c.startswith("bm") and " " not in c


def exe_strings(data: bytes) -> list[str]:
    """Strings visiveis do EXE, sem runtime e sem lixo binario."""
    result = []
    for _, text in qbstrings.iter_strings(data, 4):
        s = text.strip()
        if not norm(s):
            continue
        if any(m.lower() in s.lower() for m in RUNTIME_MARKERS):
            continue
        if _is_noise(core(s)):
            continue
        result.append(s)
    return result


def _line_literals(line: str) -> list[str]:
    """Literais "..." de uma linha de codigo QBASIC, ignorando comentarios e REM."""
    out = []
    i, n = 0, len(line)
    stmt_start = True
    while i < n:
        c = line[i]
        if c == '"':
            j = line.find('"', i + 1)
            if j < 0:
                j = n
            out.append(line[i + 1:j])
            i = j + 1
            stmt_start = False
        elif c == "'":
            break
        elif c == ":":
            stmt_start = True
            i += 1
        elif c.isspace():
            i += 1
        else:
            j = i
            while j < n and (line[j].isalnum() or line[j] in "_$%!#&"):
                j += 1
            word = line[i:j] or c
            if stmt_start and word.upper() == "REM":
                break
            stmt_start = word.upper() in ("THEN", "ELSE")
            i = max(j, i + 1)
    return out


def bas_literals(text: str) -> list[str]:
    """Todos os literais de string de um fonte QBASIC (com comentarios removidos)."""
    lits = []
    for line in text.splitlines():
        lits.extend(_line_literals(line))
    return lits


def read_text(path: str) -> str:
    """Le o fonte como UTF-8 (com ou sem BOM); se nao for UTF-8 valido, usa CP437 (padrao do QB)."""
    with open(path, "rb") as f:
        raw = f.read()
    try:
        return raw.decode("utf-8-sig")
    except UnicodeDecodeError:
        return raw.decode("cp437")


@dataclass
class Report:
    total: int          # strings unicas do EXE, sem as excluidas
    covered: list[str]  # strings do EXE presentes no .BAS
    missing: list[str]  # strings do EXE ausentes no .BAS
    excluded: int       # strings unicas excluidas (fora do denominador)

    @property
    def pct(self) -> float | None:
        return None if self.total == 0 else 100.0 * len(self.covered) / self.total


def _casa(key: str, blob: str) -> bool:
    """O core casa se ele, ou ele sem ate 2 caracteres em cada ponta (descritor
    de 2 bytes do QB45 colado ao texto: "J4Modifico", "X;ARMADURA"), aparece
    no texto dos literais. Trechos com menos de MIN_LETTERS letras nao contam."""
    n = len(key)
    for a in range(3):
        for b in range(3):
            c = key[a:n - b].strip()
            if sum(ch.isalpha() for ch in c) >= MIN_LETTERS and c in blob:
                return True
    return False


def compare(exe_strs: list[str], bas_lits: list[str]) -> Report:
    """Cruza strings do EXE com literais do .BAS.

    Uma string do EXE conta como coberta se o seu trecho util (core) aparece
    dentro de algum literal do .BAS (ignorando caixa e espacos repetidos).
    Isso cobre a hotkey destacada (literal com a 1a letra a mais) e literais
    que juntam texto e mascara de formato.
    """
    blob = "\n".join(_collapse(x) for x in bas_lits)

    unique: dict[str, str] = {}
    for s in exe_strs:
        unique.setdefault(core(s), s)

    covered, missing, excluded = [], [], 0
    for key, raw in unique.items():
        if is_excluded(raw):
            excluded += 1
        elif key and _casa(key, blob):
            covered.append(raw)
        else:
            missing.append(raw)
    return Report(total=len(covered) + len(missing), covered=covered, missing=missing, excluded=excluded)


def companions(bas_path: str) -> list[str]:
    """O .BAS e os .BM de tela do mesmo modulo no mesmo diretorio (nome com
    os 7 primeiros caracteres do modulo, ex.: LAJEGEOM.BAS + LAJEGEOT.BM)."""
    d = os.path.dirname(bas_path)
    stem = os.path.splitext(os.path.basename(bas_path))[0].upper()
    out = [bas_path]
    for bm in sorted(glob.glob(os.path.join(d, "*.BM"))):
        if os.path.splitext(os.path.basename(bm))[0].upper().startswith(stem[:7]):
            out.append(bm)
    return out


def cover_files(exe_path: str, bas_path: str) -> Report:
    """Cobertura do EXE pelo .BAS e seus .BM de tela (ver companions)."""
    with open(exe_path, "rb") as f:
        exe_data = f.read()
    lits: list[str] = []
    for path in companions(bas_path):
        lits.extend(bas_literals(read_text(path)))
    return compare(exe_strings(exe_data), lits)


def find_sources(src_root: str) -> dict[str, list[str]]:
    """Mapa MODULO (maiusculo, sem extensao) -> caminhos de .BAS em src-reconstructed/."""
    found: dict[str, list[str]] = {}
    for path in glob.glob(os.path.join(src_root, "**", "*.BAS"), recursive=True):
        stem = os.path.splitext(os.path.basename(path))[0].upper()
        found.setdefault(stem, []).append(path)
    return found


def run_all() -> int:
    unpacked = sorted(glob.glob(os.path.join(DIST_DIR, "unpacked", "*.EXE")))
    sources = find_sources(os.path.join(DIST_DIR, "src-reconstructed"))
    rows, no_source = [], []
    for exe in unpacked:
        mod = os.path.splitext(os.path.basename(exe))[0].upper()
        bas = sources.get(mod)
        if not bas:
            no_source.append(mod)
            continue
        if len(bas) > 1:
            print(f"aviso: {mod} tem {len(bas)} fontes .BAS; usando {bas[0]}", file=sys.stderr)
        rep = cover_files(exe, bas[0])
        rows.append((mod, rep))

    print(f"{'MODULO':<12} {'COBERTURA':>10} {'COBERTOS/TOTAL':>16}")
    tot_a = tot_b = 0
    for mod, rep in rows:
        pct = "n/a" if rep.pct is None else f"{rep.pct:.1f}%"
        print(f"{mod:<12} {pct:>10} {len(rep.covered):>7}/{rep.total:<8}")
        tot_a += len(rep.covered)
        tot_b += rep.total
    total_pct = "n/a" if tot_b == 0 else f"{100.0 * tot_a / tot_b:.1f}%"
    print(f"{'TOTAL':<12} {total_pct:>10} {tot_a:>7}/{tot_b:<8}")
    if no_source:
        print("sem fonte .BAS: " + ", ".join(no_source))
    return 0


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("exe", nargs="?", help="EXE original (unpacked/<MOD>.EXE)")
    ap.add_argument("bas", nargs="?", help="fonte reconstruido (.BAS)")
    ap.add_argument("--show-missing", action="store_true", help="lista as strings do EXE ausentes no .BAS")
    ap.add_argument("--all", action="store_true", help="tabela sobre todos os pares unpacked/ x src-reconstructed/")
    ap.add_argument("--exclui", default=os.environ.get("STRCOVER_EXCLUI"),
                    help="arquivo com as strings que saem do denominador, uma por linha (padrao: $STRCOVER_EXCLUI)")
    args = ap.parse_args()
    le_exclusoes(args.exclui)
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")

    if args.all:
        return run_all()
    if not args.exe or not args.bas:
        ap.error("informe <ORIG.EXE> <RECONSTR.BAS>, ou use --all")

    rep = cover_files(args.exe, args.bas)
    pct = "n/a" if rep.pct is None else f"{rep.pct:.1f}%"
    print(f"cobertura: {pct} ({len(rep.covered)}/{rep.total})")
    if rep.excluded:
        print(f"(excluidas do denominador: {rep.excluded} string(s))")
    if args.show_missing:
        print("faltantes:")
        for s in rep.missing:
            print(f"  - {s}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
