#!/usr/bin/python3
# -*- coding: UTF-8 -*-

import symbols
import os, sys, subprocess

rom = "FireEmblem7J.base.gba"
elf = "FireEmblem7J.elf"

def main(args):
    for fpath, dirs, files in os.walk('asm1/'):
        for file in files:
            with open(os.path.join(fpath, file), 'r') as f, open(os.path.join('asm/', file), 'w+') as fo:
                for line in f.readlines():

                    ptr_str = None
                    if ".4byte 0x0202" in line:
                        ptr_str = line[18:18+10]
                    if "@ =0x0202" in line:
                        ptr_str = line[22:22+10]

                    if ptr_str != None:
                        ptr = eval(ptr_str)

                        # gBuf
                        if ptr > 0x02020140 and ptr < 0x02022240:
                            name = f"gBuf + {hex(ptr - 0x02020140)}"
                            line = line.replace(ptr_str, name)

                        # gPal
                        if ptr > 0x02022860 and ptr < 0x02022c60:
                            name = f"gPal + {hex(ptr - 0x02022860)}"
                            line = line.replace(ptr_str, name)

                        # gBg0Tm
                        if ptr > 0x02022c60 and ptr < 0x02023460:
                            name = f"gBg0Tm + {hex(ptr - 0x02022c60)}"
                            line = line.replace(ptr_str, name)

                        # gBg1Tm
                        if ptr > 0x02023460 and ptr < 0x02023c60:
                            name = f"gBg1Tm + {hex(ptr - 0x02023460)}"
                            line = line.replace(ptr_str, name)

                        # gBg2Tm
                        if ptr > 0x02023c60 and ptr < 0x02024460:
                            name = f"gBg2Tm + {hex(ptr - 0x02023c60)}"
                            line = line.replace(ptr_str, name)

                        # gBg3Tm
                        if ptr > 0x02024460 and ptr < 0x02024c60:
                            name = f"gBg3Tm + {hex(ptr - 0x02024460)}"
                            line = line.replace(ptr_str, name)

                    fo.write(line)

if __name__ == '__main__':
    main(sys.argv)
