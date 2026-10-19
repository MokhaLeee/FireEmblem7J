#!/usr/bin/env python3
"""Rewrite C string literals the Chinese patch overwrote in place as TEXT_CN(orig, cn).

usage: inplace_strings.py BUILT_CN_ROM CN_BASEROM MAP src/file.c [...]
The cn side keeps the full original length (patched bytes, terminator and any
leftover original bytes) so .rodata layout is unchanged.
"""
import re, sys

built_path, base_path, map_path, *c_files = sys.argv[1:]
a = open(built_path, 'rb').read()
b = open(base_path, 'rb').read()

ranges = {}
for line in open(map_path, errors='ignore'):
    m = re.match(r'\s*\.rodata\S*\s+0x(08[0-9a-f]{6})\s+0x([0-9a-f]+)\s+(\S+)', line)
    if m:
        start = int(m.group(1), 16) - 0x08000000
        ranges.setdefault(m.group(3), []).append((start, start + int(m.group(2), 16)))

lit_re = re.compile(r'(?<![\w)])((?:JTEXT\()?)"((?:[^"\\\n]|\\.)*)"(\)?)')

def esc(bs):
    return ''.join(f'\\x{x:02x}' for x in bs)

for path in c_files:
    obj = 'src/' + path.split('/')[-1][:-2] + '.o'
    spans = ranges.get(obj, [])
    src = open(path).read()
    used = set()
    out, pos, n = [], 0, 0
    for m in lit_re.finditer(src):
        if src[max(0, m.start() - 8):m.start()].rstrip().endswith('TEXT_CN('):
            continue  # already converted
        text = m.group(2)
        if '\\' in text:
            continue
        jp = text.encode('cp932') + b'\0'
        hit = None
        for s, e in spans:
            o = s
            while True:
                o = a.find(jp, o, e)
                if o < 0:
                    break
                if o % 4 == 0 and o not in used:
                    hit = o
                    break
                o += 1
            if hit is not None:
                break
        if hit is None:
            continue
        used.add(hit)
        cn = b[hit:hit + len(jp)]
        if cn == jp:
            continue
        cn_body = cn[:-1] if cn.endswith(b'\0') else cn
        lit = m.group(0)
        if m.group(1) and m.group(3):
            repl = f'TEXT_CN({lit}, "{esc(cn_body)}")'
        else:
            repl = f'TEXT_CN("{text}", "{esc(cn_body)}")' + (m.group(3) or '')
            if m.group(1):
                repl = m.group(1) + repl
        out.append(src[pos:m.start()]); out.append(repl); pos = m.end(); n += 1
    out.append(src[pos:])
    if n:
        open(path, 'w').write(''.join(out))
    print(f'{path}: {n} strings')
