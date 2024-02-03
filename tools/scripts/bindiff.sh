#!/bin/sh

xxd FireEmblem7J.base.gba > FireEmblem7J.base.hex
xxd FireEmblem7J.gba > FireEmblem7J.hex
diff FireEmblem7J.hex FireEmblem7J.base.hex
rm FireEmblem7J.hex FireEmblem7J.base.hex
