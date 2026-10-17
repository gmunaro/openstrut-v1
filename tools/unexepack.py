#!/usr/bin/env python3
"""
Standalone Microsoft EXEPACK unpacker.

Takes an EXEPACK-compressed 16-bit MS-DOS MZ executable and writes an
equivalent *unpacked* MZ executable that DOS loads and runs directly
(no in-memory decompression at startup). This lets us analyse and patch
the real runtime code, because file offsets then map linearly to the
addresses a disassembler sees.

Usage: python -I unexepack.py <packed.exe> <unpacked.exe>

The format handled is the classic 16-byte-header EXEPACK variant:
  real_ip, real_cs, mem_start, exepack_size, real_sp, real_ss,
  dest_len(paragraphs), signature 'RB'
Decompression commands (read from the high end of the packed image
downward): 0xB0 = run-length fill, 0xB2 = verbatim copy; bit0 = stop.
"""
import struct
import sys


def u16(b, o):
    return b[o] | (b[o + 1] << 8)


def unpack(data):
    if data[:2] != b"MZ":
        raise SystemExit("not an MZ executable")
    e_cblp = u16(data, 2)
    e_cp = u16(data, 4)
    e_cparhdr = u16(data, 8)
    hdr = e_cparhdr * 16
    e_ip = u16(data, 20)
    e_cs = u16(data, 22)

    ep = hdr + e_cs * 16  # EXEPACK header offset
    real_ip = u16(data, ep + 0)
    real_cs = u16(data, ep + 2)
    exepack_size = u16(data, ep + 6)
    real_sp = u16(data, ep + 8)
    real_ss = u16(data, ep + 10)
    dest_len = u16(data, ep + 12)  # paragraphs
    sig = data[ep + 14:ep + 16]
    if sig != b"RB":
        raise SystemExit("missing 'RB' EXEPACK signature (got %r)" % sig)

    packed = bytearray(data[hdr:ep])          # compressed load image
    dest_bytes = dest_len * 16
    dest = bytearray(dest_bytes)

    # --- decompress (reverse direction) ---
    si = len(packed) - 1
    while si >= 0 and packed[si] == 0xFF:     # skip alignment filler
        si -= 1
    di = dest_bytes - 1
    while True:
        cmd = packed[si]; si -= 1
        count = packed[si - 1] | (packed[si] << 8); si -= 2
        op = cmd & 0xFE
        if op == 0xB0:                        # fill
            fill = packed[si]; si -= 1
            for _ in range(count):
                dest[di] = fill; di -= 1
        elif op == 0xB2:                      # copy verbatim
            for _ in range(count):
                dest[di] = packed[si]; di -= 1; si -= 1
        else:
            raise SystemExit("bad EXEPACK command 0x%02X at si=%d" % (cmd, si + 1))
        if cmd & 1:                           # stop bit
            break
    bytes_written = dest_bytes - 1 - di
    # EXEPACK leaves the low part of the image uncompressed in place; the
    # command stream only rebuilds the high part. At the stop point si and di
    # meet, and dest[:di+1] is the verbatim low region from the packed image.
    if di != si:
        raise SystemExit("decode mismatch: di=0x%X si=0x%X" % (di, si))
    dest[:di + 1] = packed[:di + 1]
    leftover = 0

    # --- parse the packed relocation table (tail of the exepack block) ---
    # Layout: 16 groups, one per 0x1000-segment. Each group is a word count
    # followed by that many word offsets. We locate the start by requiring the
    # 16 groups to consume exactly up to the end of the exepack block.
    block_end = ep + exepack_size
    if block_end > len(data):
        block_end = len(data)
    reloc = None
    for start in range(ep + 16, block_end):
        p = start
        relocs = []
        ok = True
        for grp in range(16):
            if p + 2 > block_end:
                ok = False; break
            cnt = u16(data, p); p += 2
            base = grp * 0x1000
            for _ in range(cnt):
                if p + 2 > block_end:
                    ok = False; break
                off = u16(data, p); p += 2
                relocs.append((base, off))
            if not ok:
                break
        if ok and p == block_end:
            reloc = relocs
            break
    if reloc is None:
        raise SystemExit("could not locate EXEPACK relocation table")

    info = dict(real_cs=real_cs, real_ip=real_ip, real_ss=real_ss,
                real_sp=real_sp, dest_bytes=dest_bytes,
                bytes_written=bytes_written, leftover=leftover,
                nrelocs=len(reloc))

    # --- build an unpacked MZ ---
    nrel = len(reloc)
    reloc_tbl_off = 0x1C
    hdr_size = reloc_tbl_off + nrel * 4
    hdr_paras = (hdr_size + 15) // 16
    hdr_size = hdr_paras * 16
    total = hdr_size + dest_bytes
    out = bytearray(hdr_size)
    out[0:2] = b"MZ"
    pages = (total + 511) // 512
    last = total % 512
    struct.pack_into("<H", out, 2, last)
    struct.pack_into("<H", out, 4, pages)
    struct.pack_into("<H", out, 6, nrel)
    struct.pack_into("<H", out, 8, hdr_paras)
    struct.pack_into("<H", out, 10, 0x0010)         # minalloc (paragraphs)
    struct.pack_into("<H", out, 12, 0xFFFF)         # maxalloc
    struct.pack_into("<H", out, 14, real_ss)
    struct.pack_into("<H", out, 16, real_sp)
    struct.pack_into("<H", out, 20, real_ip)
    struct.pack_into("<H", out, 22, real_cs)
    struct.pack_into("<H", out, 24, reloc_tbl_off)
    p = reloc_tbl_off
    for base, off in reloc:
        struct.pack_into("<H", out, p, off); struct.pack_into("<H", out, p + 2, base); p += 4
    out += dest
    return bytes(out), info


def main():
    if len(sys.argv) != 3:
        raise SystemExit("usage: unexepack.py <packed.exe> <unpacked.exe>")
    data = open(sys.argv[1], "rb").read()
    out, info = unpack(data)
    open(sys.argv[2], "wb").write(out)
    for k, v in info.items():
        print("%-14s %s" % (k, hex(v) if isinstance(v, int) else v))
    print("wrote %d bytes -> %s" % (len(out), sys.argv[2]))


if __name__ == "__main__":
    main()
