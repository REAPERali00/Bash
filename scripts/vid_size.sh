#!/bin/bash

# Check if at least one argument is provided
if [ $# -lt 1 ]; then
  echo "Not enough arguments"
  exit 1
fi

# Input file
input_file="$1"

# Temporary output file
output_file="${input_file%.*}_temp.${input_file##*.}"

# Compress the video using ffmpeg without overwriting the original
ffmpeg -i "$input_file" -vcodec libx265 -crf 28 "$output_file"

# If compression was successful, replace the original file
if [ $? -eq 0 ]; then
  mv "$output_file" "$input_file"
  echo "Video compression complete and original file replaced."
else
  echo "Compression failed."
fi
