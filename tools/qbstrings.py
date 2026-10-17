"""Extract printable strings from SISTRUT executables (unpacked EXEs).

Usage:
    python -I tools/qbstrings.py <EXE> [--min N] [--offsets]

QuickBASIC 4.5 stores string literals as plain bytes in the data segment, so a
printable-run scan recovers menu labels, prompts, file names and messages.
Bytes 0x80-0xFF are decoded as CP437 (box-drawing characters used by the UI).
"""
import argparse
import sys

PRINTABLE = set(range(0x20, 0x7F)) | set(range(0x80, 0x100))


def looks_like_text(run: bytes, min_len: int) -> bool:
    """Reject x86 code fragments: require mostly ASCII and a run of letters/digits.

    Box-drawing-only runs (UI frames) pass if they are long enough.
    """
    ascii_count = sum(1 for c in run if 0x20 <= c < 0x7F)
    if ascii_count == 0:
        return len(run) >= 8 and all(0xB0 <= c <= 0xDF for c in run)
    if ascii_count * 10 < len(run) * 8:
        return False
    longest = cur = 0
    for c in run:
        cur = cur + 1 if (chr(c).isalnum() or c == 0x20) else 0
        longest = max(longest, cur)
    return longest >= min_len


def iter_strings(data: bytes, min_len: int = 4):
    """Yield (offset, text) for each run of printable bytes of at least min_len."""
    start = None
    for i, b in enumerate(data):
        if b in PRINTABLE:
            if start is None:
                start = i
        else:
            if start is not None and i - start >= min_len:
                run = data[start:i]
                if looks_like_text(run, min_len):
                    yield start, run.decode("cp437")
            start = None
    if start is not None and len(data) - start >= min_len:
        yield start, data[start:].decode("cp437")


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("exe")
    ap.add_argument("--min", type=int, default=4)
    ap.add_argument("--offsets", action="store_true", help="prefix each line with hex file offset")
    args = ap.parse_args()
    with open(args.exe, "rb") as f:
        data = f.read()
    out = sys.stdout
    out.reconfigure(encoding="utf-8")
    for off, text in iter_strings(data, args.min):
        out.write(f"{off:06x}  {text}\n" if args.offsets else text + "\n")
    return 0


if __name__ == "__main__":
    sys.exit(main())
