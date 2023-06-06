#!/bin/sh

here=$(dirname "$(readlink -f "$0")")
echo $here
python3 $here/cvtdata2jis.py FireEmblem7J.base.gba $1
