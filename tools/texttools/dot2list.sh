#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

freq_file=$1
dot_file=$2

tmp_name_file=$(mktemp "/tmp/randomfile.XXXXXX")
cat $dot_file | grep -o '\[label="0x[0-9A-F]\{4\}" shape=box\]' | grep -o '0x[0-9A-F]\{4\}' > $tmp_name_file

python3 $SCRIPT_DIR/dot2list.py $freq_file $tmp_name_file
