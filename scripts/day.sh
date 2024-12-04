#!/bin/bash

daily_dir="$HOME/Documents/notes/Notes_Obsidian/Daily"
daily_template="$HOME/Documents/notes/Notes_Obsidian/Templates/daily.md"
daily="$daily_dir/$(date +'%Y-%m-%d').md"

mkdir -p "$daily_dir"

if [ ! -f "$daily" ]; then
  touch "$daily"
  cat "$daily_template" >"$daily"
fi
