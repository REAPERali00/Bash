#!/bin/bash

if [ $# -lt 1 ]; then
  echo "please provide a link"
  exit 1
fi

link=$1
shift

output_path="%(title)s.%(ext)s"
if [ $# -eq 0 ]; then
  echo "Downloading video..."
  yt-dlp -o "$output_path" "$link"
  mv *.mp4 ~/Downloads/
  exit 0
fi

for tag in $@; do
  case $tag in
  -v)
    yt-dlp -o - "$1" | vlc -
    ;;
  *)
    echo "unkown tag: $tag"
    ;;
  esac
done
