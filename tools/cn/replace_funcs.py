#!/usr/bin/env python3
"""Replace whole asm functions with the Chinese patch's machine code under .ifdef VERSION_CN.

usage: replace_funcs.py CN_BASEROM MAP FILE.s arm|thumb FUNC [FUNC...]
The patch's code is hand-written, so it is emitted as .4byte/.2byte words with the
disassembly as comments. Addresses do not move, so the bytes are position-exact.
"""
import re, subprocess, sys

base_path, map_path, path, mode, *funcs = sys.argv[1:]
rom = open(base_path, 'rb').read()

sym = {}
for line in open(map_path, errors='ignore'):
    m = re.match(r'\s+0x(08[0-9a-f]{6})\s+(\w+)\s*$', line)
    if m:
        sym.setdefault(m.group(2), int(m.group(1), 16))

def disasm(start, end):
    args = ['arm-none-eabi-objdump', '-D', '-b', 'binary', '-marm',
            f'--adjust-vma={0x08000000:#x}', f'--start-address={start:#x}', f'--stop-address={end:#x}']
    if mode == 'thumb':
        args.insert(2, '-Mforce-thumb')
    res = {}
    for line in subprocess.run(args + [base_path], capture_output=True, text=True).stdout.splitlines():
        m = re.match(r'\s*([0-9a-f]+):\s+([0-9a-f ]+?)\s{2,}(.*)$', line)
        if m:
            res[int(m.group(1), 16)] = m.group(3).replace('\t', ' ').strip()
    return res

lines = open(path).read().split('\n')
start_re = re.compile(r'\s*(arm|thumb|non_word_aligned_thumb)_func_start (\w+)')
starts = [(i, m.group(2)) for i, l in enumerate(lines) if (m := start_re.match(l))]

for func in funcs:
    k = next(n for n, (_, name) in enumerate(starts) if name == func)
    s_line = starts[k][0]
    e_line = starts[k + 1][0] if k + 1 < len(starts) else len(lines)
    next_name = starts[k + 1][1]
    lo, hi = sym[func], sym[next_name]
    # the original block may end with blank lines; keep them outside the .ifdef
    while lines[e_line - 1].strip() == '':
        e_line -= 1
    dis = disasm(lo, hi)
    # literal/branch labels of the original block may be referenced from outside
    labels = {}
    for l in lines[s_line:e_line]:
        m = re.match(r'(_([0-9A-F]{8})):', l)
        if m:
            labels.setdefault(int(m.group(2), 16), m.group(1))
    step = 4 if mode == 'arm' else 2
    cn = ['.ifdef VERSION_CN', '@ Chinese patch: hand-written replacement', lines[s_line], f'{func}: @ 0x{lo:08X}']
    for a in range(lo, hi, step):
        w = int.from_bytes(rom[a - 0x08000000:a - 0x08000000 + step], 'little')
        d = dis.get(a, '')
        if a in labels:
            cn.append(f'{labels.pop(a)}:')
        cn.append(f'\t.{"4" if step == 4 else "2"}byte 0x{w:0{step * 2}X}' + (f' @ {d}' if d else ''))
    for a, name in labels.items():  # labels not on a word boundary
        cn.append(f'{name} = 0x{a:08X}')
    cn.append('.else')
    lines[s_line:e_line] = cn + lines[s_line:e_line] + ['.endif']
    starts = [(i, m.group(2)) for i, l in enumerate(lines) if (m := start_re.match(l))]
    print(f'{func}: 0x{lo:08X}-0x{hi:08X}')

open(path, 'w').write('\n'.join(lines))
