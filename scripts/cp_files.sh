#!/bin/bash

msg=""
for arg in $@; do
  if [ -r "$arg" ]; then
    msg+="$arg\n"
    msg+="$(cat "$arg")\n"
  fi
done

echo -e "$msg" | wl-copy
