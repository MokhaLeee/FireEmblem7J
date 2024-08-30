#!/bin/python3

import os, contextlib

ROOT_NODE = 3282
HUFFMAN_TREE = 0xF300C

log_settings = {
    'DEBUG': False,
    'INFO': False,
    'WARNING': True,
    'ERROR': True,
    'CRITICAL': True
}

def logprint(level, *args, **kwargs):
    if log_settings.get(level, False):
        print(f"[{level}]\t", *args, **kwargs)
 
def is_leaf(node_data):
    return (node_data & 0xFFFF0000) == 0xFFFF0000

def build_huffman_table(rom_data, off):
    huffman_table = []

    for i in range(ROOT_NODE + 1):
        node_data = int.from_bytes(rom_data[off + 0:off + 4], 'little')

        logprint('DEBUG', f"node:0x{i:03X}=0x{node_data:08X} ")
        if is_leaf(node_data):
            logprint('DEBUG', f"leaf:0x{(node_data & 0xFFFF):04X}")
        else:
            logprint('DEBUG', f"left:0x{(node_data & 0xFFFF):04X}, right:0x{((node_data >> 16) & 0xFFFF):04X}")

        huffman_table.append(node_data)
        off = off + 4

    return huffman_table

def decode_string(rom_data, huffman_table, off):
    output = ""
    decode_data = []
    bit_pos = -1
    cur_node = ROOT_NODE

    while True:
        if bit_pos < 0:
            current_byte = rom_data[off]
            off = off + 1
            bit_pos = 7

        bit = current_byte & 1
        current_byte = current_byte >> 1
        bit_pos = bit_pos - 1

        logprint('DEBUG', bit)

        if bit == 0:
            cur_node = huffman_table[cur_node] & 0xFFFF # left
        else:
            cur_node = (huffman_table[cur_node] >> 16) & 0xFFFF

        # check for leaf
        if is_leaf(huffman_table[cur_node]):
            data = huffman_table[cur_node] & 0xFFFF

            logprint('INFO', f"get leaf: 0x{cur_node:04X}=0x{data:X}")

            decode_data.append(data)
            if data == 0:
                break

            cur_node = ROOT_NODE

    for data in decode_data:
        decoded_ch = data.to_bytes(2, byteorder='little').decode('cp932', errors='strict')
        if decoded_ch.isprintable():
            output = output + decoded_ch
        elif data == 0:
            output = output + "[X]"
        elif data == 1:
            output = output + "[NL]\n"
        elif data == 3:
            output = output + "[A]"
        else:
            while True:
                _data = data & 0xFF
                if _data == 0:
                    break

                output = output + f"\\x{_data:X}"
                data = data >> 8


    return output

ROM = "fe6-base.gba"
with open(ROM, 'rb') as f:
    rom_data = f.read()

    huffman_table = build_huffman_table(rom_data, HUFFMAN_TREE)
    decoded_string = decode_string(rom_data, huffman_table, 0x9FF29)
    print(decoded_string)
