#!/usr/bin/python3
# -*- coding: UTF-8 -*-

# split data

import os, sys, subprocess

rom = "FireEmblem7J.base.gba"
elf = "FireEmblem7J.elf"

def generate_unsymboled_const_data(pstart, pend):
    list = {}

    # list_dir = "asm/"
    # identifier = ".4byte 0x08"

    list_dir = "test/"
    identifier = ".word 0x08"

    files = os.listdir(list_dir)
    for fpath, dirs, files in os.walk(list_dir):
        for file in files:
            with open(os.path.join(fpath, file), 'r') as f:
                for line in f.readlines():
                    if identifier in line:
                        ptr = eval(line[18:18+10])

                        if ptr < pstart or ptr > pend:
                            continue

                        list[ptr] = f"gUnk_{ptr:08X}"

    return sorted(list.values())

def write_data(fs, fh, symbol, start, end):
    fh.write(f'// ??? {symbol}\n')

    fs.write(f'\n\t.global {symbol}\n')
    fs.write(f'{symbol}:\t@ 0x{symbol[5:5+8]}\n')
    fs.write(f'\t.incbin "FireEmblem7J.base.gba", 0x{start:06X}, 0x{end:06X} - 0x{start:06X}\n')

def main(args):
    try:
        out_s = args[1]
        out_h = args[2]
        start = eval(args[3])
        end   = eval(args[4])
    except IndexError:
        sys.exit(f"Usage: {args[0]} OUT_FILE_S OUT_FILE_H START END")

    pstart = start | 0x08000000
    pend   = end   | 0x08000000

    symbols = generate_unsymboled_const_data(pstart, pend)

    with open(out_s, 'w') as fs, open(out_h, 'w') as fh:
        for i in range(len(symbols)):
            symbol = symbols[i]
            off1 = eval(f'0x{symbol[7:7+6]}')

            if i == (len(symbols) - 1):
                off2 = pend & 0x01FFFFFF
            else:
                symbol2 = symbols[i + 1]
                off2 = eval(f'0x{symbol2[7:7+6]}')

            print(symbol)

            write_data(fs, fh, symbol, off1, off2)

if __name__ == '__main__':
    main(sys.argv)
