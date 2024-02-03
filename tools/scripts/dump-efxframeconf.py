#!/usr/bin/python3
# -*- coding: UTF-8 -*-

import sys, ctypes

rom = "FireEmblem7J.base.gba"
elf = "FireEmblem7J.elf"

def dump_one_part(rom_data, off):
    while True:
        off = dump_one_word(rom_data, off)

        if try_get_ptr_symbol(off | 0x08000000) != None:
            print("")
            break

    return off

def main(args):
    try:
        start = eval(args[1])
    except IndexError:
        sys.exit(f"Usage: {args[0]} START")

    off = start & 0x01FFFFFF

    with open(rom, 'rb') as f:
        rom_data = f.read()

        while True:
            index = int.from_bytes(rom_data[off:off + 2], 'little')
            index = ctypes.c_int16(index).value
            off = off + 2

            if index == -2 or index == -1:
                print(f"    .SHORT {index}")
                break

            duration = int.from_bytes(rom_data[off:off + 2], 'little')
            off = off + 2

            print(f"    .SHORT {index}, {duration}")

        print(f"@ End at: {off + 0x08000000:08X}")

if __name__ == '__main__':
    main(sys.argv)
