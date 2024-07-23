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

def dump_one_part(rom_data, off):
    while True:
        _type = rom_data[off + 0]

        data_ptr = int.from_bytes(rom_data[off + 4:off + 8], 'little')
        data = try_get_ptr_symbol(data_ptr)
        if data == None:
            data = f"0x{data_ptr:08X}"

        size = int.from_bytes(rom_data[off + 8:off + 10], 'little')
        if size == 0:
            size_s = "     0"
        else:
            size_s = f"0x{size:04X}"

        duration = rom_data[off + 10]

        match _type:
            case 0:
                print( "    {")
                print( "        .type = BMFX_CONFT_IMG,")
                print(f"        .data = {data},")
                print(f"        .size = {size_s},")
                print(f"        .duration = {duration},")
                print( "    },")
            case 1:
                print( "    {")
                print( "        .type = BMFX_CONFT_ZIMG,")
                print(f"        .data = {data},")
                print(f"        .size = {size_s},")
                print(f"        .duration = {duration},")
                print( "    },")
            case 2:
                print( "    {")
                print( "        .type = BMFX_CONFT_TSA,")
                print(f"        .data = {data},")
                print(f"        .size = {size_s},")
                print(f"        .duration = {duration},")
                print( "    },")
            case 3:
                print( "    {")
                print( "        .type = BMFX_CONFT_PAL,")
                print(f"        .data = {data},")
                print(f"        .size = {size_s},")
                print(f"        .duration = {duration},")
                print( "    },")
            case 4:
                print( "    {")
                print( "        .type = BMFX_CONFT_LOOP_START,")
                print( "    },")
            case 5:
                print( "    {")
                print( "        .type = BMFX_CONFT_LOOP,")
                print(f"        .duration = {duration},")
                print( "    },")
            case 6:
                print( "    {")
                print( "        .type = BMFX_CONFT_BLOCKING,")
                print(f"        .data = {data},")
                print(f"        .size = {size_s},")
                print(f"        .duration = {duration},")
                print( "    },")
            case 7:
                print( "    {")
                print( "        .type = BMFX_CONFT_7,")
                print(f"        .data = {data},")
                print(f"        .size = {size_s},")
                print(f"        .duration = {duration},")
                print( "    },")
            case 8:
                print( "    {")
                print( "        .type = BMFX_CONFT_CALL_IDLE,")
                print(f"        .data = {data},")
                print(f"        .size = {size_s},")
                print(f"        .duration = {duration},")
                print( "    },")
            case 9:
                print( "    {")
                print( "        .type = BMFX_CONFT_BREAK,")
                print( "    },")
                print("    { BMFX_CONFT_BREAK },")
                break
            case 10:
                print( "    {")
                print( "        .type = BMFX_CONFT_END,")
                print( "    },")
                break

            case _:
                print(f"// [ERROR] at {off:06X}")
                break

        off = off + 0xC

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
            name = try_get_ptr_symbol(off | 0x08000000)
            if name == None:
                name = f"gUnknown_08{off:06X}"

            print(f"// 0x08{off:06X}")
            print(f"struct BmBgxConf CONST_DATA {name}[] = " + "{")
            off = dump_one_part(rom_data, off)
            print("};")

            if off_end <= off:
                break

        print(f"// End at: {off + 0x08000000:08X}")

if __name__ == '__main__':
    main(sys.argv)
