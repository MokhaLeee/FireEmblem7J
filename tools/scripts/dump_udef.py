#!/usr/bin/python3
# -*- coding: UTF-8 -*-

import sys, ctypes
import symbols

# ========================================================================
rom = "FireEmblem7J.base.gba"
elf = "FireEmblem7J.elf"

with open(elf, 'rb') as f:
    _symbols = { addr: name for addr, name in symbols.from_elf(f) }

def try_get_ptr_symbol(val):
    is_symbol = False

    ptr = val

    if ptr > 0x08000000 and ptr < 0x09000000:
        is_symbol = True
    if ptr > 0x02000000 and ptr < 0x02040000:
        is_symbol = True
    if ptr > 0x03000000 and ptr < 0x03008000:
        is_symbol = True

    if ptr not in _symbols:
        is_symbol = False

    if is_symbol == True:
        return _symbols[ptr]
    else:
        return None
# ========================================================================

def dump_one_udef(rom_data, off):
    return off + 0x10

def dump_udef_group(rom_data, off):
    ptr = 0x08000000 | off
    if ptr not in _symbols:
        udef_name = f"UnitDef_{off + 0x08000000:08X}"
    else:
        udef_name = _symbols[ptr]

    print(f"// 0x{off + 0x08000000:07X}")
    print(f"CONST_DATA struct UnitDefinition {udef_name}[] = " + "{")
    while True:
        pid = dump_one_udef(rom_data, off)

        off = off + 0x14

        if pid == 0:
            break

    print("};\n")
    return off

def main(args):
    try:
        start = eval(args[1])
    except IndexError:
        sys.exit(f"Usage: {args[0]} START [END]")

    try:
        end = eval(args[2])
    except IndexError:
        end = 0

    off = start & 0x01FFFFFF
    off_end = end & 0x01FFFFFF

    with open(rom, 'rb') as f:
        rom_data = f.read()

        while True:
            off = dump_udef_group(rom_data, off)

            if off_end <= off:
                break

        print(f"// End at: {off + 0x08000000:08X}")

if __name__ == '__main__':
    main(sys.argv)
