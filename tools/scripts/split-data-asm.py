#!/usr/bin/python3
# -*- coding: UTF-8 -*-

import symbols
import os, sys, subprocess

rom = "FireEmblem7J.base.gba"
elf = "FireEmblem7J.elf"

# ========================================================================
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

def main(args):
    for fpath, dirs, files in os.walk('asm1/'):
        for file in files:
            with open(os.path.join(fpath, file), 'r') as f, open(os.path.join('asm/', file), 'w+') as fo:
                for line in f.readlines():

                    ptr_str = None
                    if ".4byte 0x08" in line:
                        ptr_str = line[18:18+10]
                    if "@ =0x08" in line:
                        ptr_str = line[22:22+10]

                    if ptr_str != None:
                        ptr = eval(ptr_str)

                        name = try_get_ptr_symbol(ptr)
                        if name == None:
                            name = f"0x{ptr:08X}"

                        line = line.replace(ptr_str, name)

                    fo.write(line)

if __name__ == '__main__':
    main(sys.argv)
