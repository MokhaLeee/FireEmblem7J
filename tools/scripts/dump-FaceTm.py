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

        data0 = rom_data[off + 0]
        data1 = rom_data[off + 1]
        print("{\n    " + f"{data0}, {data1},")
        off = off + 2

        i = 0
        data = []

        while True:
            data.append(f"0x{rom_data[off]:02X}")
            i = i + 1

            if i == 6:
                i = 0
                print(data)
                data = []

            off = off + 1
            if off_end <= off:
                print(data)
                break

        print(f"// End at: {off + 0x08000000:08X}")

if __name__ == '__main__':
    main(sys.argv)
