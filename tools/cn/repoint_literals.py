#!/usr/bin/env python3
"""Wrap asm literal-pool pointers that the Chinese patch repointed in .ifdef VERSION_CN.

usage: repoint_literals.py BUILT_CN_ROM CN_BASEROM MAP SYMS_OUT
Only touches `_XXXXXXXX: .4byte sym` literal lines under asm/ and src/*.s.
New pointer targets without a symbol are written to SYMS_OUT as gCn_XXXXXXXX.
"""
import bisect, glob, re, sys

built_path, base_path, map_path, syms_out = sys.argv[1:5]
a = open(built_path, 'rb').read()
b = open(base_path, 'rb').read()

addr2sym = {}
for line in open(map_path, errors='ignore'):
    m = re.match(r'\s+0x(08[0-9a-f]{6})\s+(\w+)\s*$', line)
    if m:
        addr2sym.setdefault(int(m.group(1), 16), m.group(2))

def u32(d, o):
    return int.from_bytes(d[o:o + 4], 'little')

# aligned words that differ and hold ROM pointers on both sides
words = {}
for o in range(0, min(len(a), len(b)), 4):
    wa, wb = u32(a, o), u32(b, o)
    if wa != wb and 0x08000000 <= wa < 0x0A000000 and 0x08000000 <= wb < 0x0A000000:
        words[0x08000000 + o] = wb

files = glob.glob('asm/**/*.s', recursive=True) + glob.glob('src/*.s')
new_syms = {}
done = set()
for path in files:
    lines = open(path).read().split('\n')
    changed = False
    out = []
    for line in lines:
        m = re.match(r'^(_([0-9A-F]{8}):\s*\.4byte\s+)(\S+)(.*)$', line)
        if m and int(m.group(2), 16) in words and not line.startswith('.ifdef'):
            addr = int(m.group(2), 16)
            target = words[addr]
            name = addr2sym.get(target)
            if name is None:
                name = f'gCn_{target:08X}'
                new_syms[name] = target
            out += ['.ifdef VERSION_CN', f'{m.group(1)}{name}{m.group(4)}', '.else', line, '.endif']
            done.add(addr)
            changed = True
        else:
            out.append(line)
    if changed:
        open(path, 'w').write('\n'.join(out))
        print('patched', path)

# keep symbols that are already defined (the file is also edited by hand)
try:
    for line in open(syms_out):
        m = re.match(r'(\w+) = 0x([0-9A-Fa-f]+);', line)
        if m:
            new_syms.setdefault(m.group(1), int(m.group(2), 16))
except FileNotFoundError:
    pass

with open(syms_out, 'w') as f:
    f.write('/* Addresses of data the Chinese patch added or moved (VERSION=cn only) */\n')
    for name, addr in sorted(new_syms.items(), key=lambda kv: kv[1]):
        f.write(f'{name} = 0x{addr:08X};\n')

missing = sorted(set(words) - done)
print('wrapped', len(done), 'literals; unresolved:', ', '.join(f'{x:#x}' for x in missing))
