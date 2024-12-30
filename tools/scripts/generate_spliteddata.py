#!/usr/bin/python3
# -*- coding: UTF-8 -*-

# split data

import os, sys, subprocess

rom = "FireEmblem7J.base.gba"
elf = "FireEmblem7J.elf"

"""
input format:
0x084090A4
0x08409464
0x084097C4
0x08409B1C
0x08409EF0
0x0841A6C4
0x0841A964
0x0841AB8C
"""

def generate_unsymboled_const_data(fpath):
    list = {}

    with open(fpath, 'r') as f:
        for line in f.readlines():
            ptr = eval(line)
            list[ptr] = f"gUnk_{ptr:08X}"

    return sorted(list.values())

def write_data(fs, fh, symbol, start, end):
    fh.write(f'// ??? {symbol}\n')

    fs.write(f'\n\t.global {symbol}\n')
    fs.write(f'{symbol}:\t@ 0x{symbol[5:5+8]}\n')
    fs.write(f'\t.incbin "FireEmblem7J.base.gba", 0x{start:06X}, 0x{end:06X} - 0x{start:06X}\n')

def main(args):
    try:
        in_f  = args[1]
        out_s = args[2]
        out_h = args[3]
    except IndexError:
        sys.exit(f"Usage: {args[0]} IN_FILE OUT_FILE_S OUT_FILE_H")

    symbols = generate_unsymboled_const_data(in_f)

    with open(out_s, 'w') as fs, open(out_h, 'w') as fh:
        for i in range(len(symbols)):
            symbol = symbols[i]
            off1 = eval(f'0x{symbol[7:7+6]}')

            if i == (len(symbols) - 1):
                off2 = 0
            else:
                symbol2 = symbols[i + 1]
                off2 = eval(f'0x{symbol2[7:7+6]}')

            print(symbol)

            write_data(fs, fh, symbol, off1, off2)

if __name__ == '__main__':
    main(sys.argv)
