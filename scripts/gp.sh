#!/bin/bash

if [[ $# -lt 1 ]]; then
  echo "enter file argument"
  exit 1
fi

dir="$1"
pattern="*.sh"

for file in "$dir"/$pattern; do
  echo "$file"
  chmod +x "$file"
done
