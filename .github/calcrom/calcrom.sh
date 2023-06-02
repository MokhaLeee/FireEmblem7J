#!/bin/bash

build_name=$1
map_file=$build_name.map
if [ ! -f $map_file ]; then
  echo "$map_file does not exist!"
  exit 1
fi

perl $(dirname "$0")/calcrom.pl $build_name.map
