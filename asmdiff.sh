#!/bin/bash

OBJDUMP="$DEVKITARM/bin/arm-none-eabi-objdump -D -bbinary -marmv4t -Mforce-thumb"
OPTIONS="--start-address=$(($1)) --stop-address=$(($1 + $2))"
$OBJDUMP $OPTIONS FireEmblem7J.base.gba > FireEmblem7J.base.dump
$OBJDUMP $OPTIONS FireEmblem7J.gba > FireEmblem7J.dump
diff -y FireEmblem7J.base.dump FireEmblem7J.dump
rm FireEmblem7J.base.dump FireEmblem7J.dump
