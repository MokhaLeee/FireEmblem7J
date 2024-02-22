#!/usr/bin/python3
# -*- coding: UTF-8 -*-

import sys, ctypes

rom = "FireEmblem7J.base.gba"

def main(args):
    try:
        start = eval(args[1])
    except IndexError:
        sys.exit(f"Usage: {args[0]} START")

    off = start & 0x01FFFFFF

    with open(rom, 'rb') as f:
        rom_data = f.read()

        print("{")

        while True:
            frame = int.from_bytes(rom_data[off + 0:off + 2], 'little')
            durat = int.from_bytes(rom_data[off + 2:off + 4], 'little')

            if frame == 0xFFFF:
                print("    -1\n}")
                break

            print(f"    {hex(frame)}, {durat},")
            off = off + 4

        print(f"// End at: {off + 0x08000000:08X}")

if __name__ == '__main__':
    main(sys.argv)
