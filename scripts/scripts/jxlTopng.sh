#!/bin/bash

for file in *.jxl; do
  [ -e "$file" ] || continue  # skip if no .jxl files

  output="${file%.jxl}.png"

  echo "Converting $file → $output"
  djxl "$file" "$output"

done
