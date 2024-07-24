#!/usr/bin/python3
# -*- coding: UTF-8 -*-

import sys, ctypes

MU_LUT = {
    0x00: "MOVE_CMD_MOVE_LEFT",
    0x01: "MOVE_CMD_MOVE_RIGHT",
    0x02: "MOVE_CMD_MOVE_DOWN",
    0x03: "MOVE_CMD_MOVE_UP",
    0x04: "MOVE_CMD_HALT",
    0x05: "MOVE_CMD_FACE_LEFT",
    0x06: "MOVE_CMD_FACE_RIGHT",
    0x07: "MOVE_CMD_FACE_DOWN",
    0x08: "MOVE_CMD_FACE_UP",
    0x09: "MOVE_CMD_SLEEP",
    0x0A: "MOVE_CMD_BUMP",
    0x0B: "MOVE_CMD_UNK11",
    0x0C: "MOVE_CMD_SET_SPEED",
    0x0D: "MOVE_CMD_CAMERA_ON",
    0x0E: "MOVE_CMD_CAMERA_OFF",
}

def dump_one_part(rom_data, off):
    data = rom_data[off]
    off = off + 1

    if data == 0x0C:
        speed = rom_data[off]
        off = off + 1
        print(f"    {MU_LUT[data]}, {speed},")
    else:
        print(f"    {MU_LUT[data]},")

    return off

def main(args):
    rom = "FireEmblem7J.base.gba"

    try:
        start = eval(args[1])
    except IndexError:
        sys.exit(f"Usage: {args[0]} START")

    off = start & 0x01FFFFFF

    with open(rom, 'rb') as f:
        rom_data = f.read()

        print(f"CONST_DATA u8 MoveScr_08{off:06X}[] = " + "{")
        while True:
            off = dump_one_part(rom_data, off)

            if rom_data[off - 1] == 4: # MOVE_CMD_HALT
                break

        print("};")
        print(f"// End at: 0x{off + 0x08000000:08X}")

if __name__ == '__main__':
    main(sys.argv)
