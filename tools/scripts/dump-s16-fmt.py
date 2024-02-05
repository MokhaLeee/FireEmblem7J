#!/usr/bin/python3
# -*- coding: UTF-8 -*-

import sys, ctypes

rom = "FireEmblem7J.base.gba"
elf = "FireEmblem7J.elf"

def main(args):
    try:
        start = eval(args[1])
        end = eval(args[2])
    except IndexError:
        sys.exit(f"Usage: {args[0]} START END")

    off = start & 0x01FFFFFF
    off_end = end & 0x01FFFFFF

    with open(rom, 'rb') as f:
        rom_data = f.read()


        pre = data = ctypes.c_int16(int.from_bytes(rom_data[off:off + 2], 'little')).value
        prefix = f'    .SHORT {hex(data)}'
        off = off + 2

        while True:
            data = ctypes.c_int16(int.from_bytes(rom_data[off:off + 2], 'little')).value

            if pre == data:
                prefix = prefix + ', ' + f'{hex(data)}'
            else:
                print(prefix)

                pre = data
                prefix = f'    .SHORT {hex(data)}'



            off = off + 2
            if off_end <= off:
                break

        print(f"// End at: {off + 0x08000000:08X}")

if __name__ == '__main__':
    main(sys.argv)
