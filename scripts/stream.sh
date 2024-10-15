#!/bin/bash

if [ $# -lt 1 ]; then
  echo "Please provide a link"
  exit 1
fi

link=$1
shift

output_path="%(title)s.%(ext)s"

# If no tags provided, just download the video
if [ $# -eq 0 ]; then
  echo "Downloading video..."
  yt-dlp -o "$output_path" "$link"
  mv *.mp4 ~/Downloads/
  exit 0
fi

# Process the provided tags
for tag in "$@"; do
  case $tag in
  -b)
    echo "Streaming video with ffmpeg for best quality to VLC..."
    yt-dlp -f 'bestvideo+bestaudio/best' -o - "$link" | ffmpeg -i pipe:0 -c copy -f mpegts - | vlc --network-caching=1000 -
    exit 0
    ;;
  -v)
    echo "Streaming video directly to VLC..."
    yt-dlp -o - "$link" | vlc -
    exit 0
    ;;
  *)
    echo "Unknown tag: $tag"
    exit 1
    ;;
  esac
done
