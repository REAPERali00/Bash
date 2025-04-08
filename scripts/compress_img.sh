#!/bin/bash

# Set working directory
manga_dir="./manga_downloads/test"
output_pdf="$manga_dir/test.pdf"
temp_dir="$manga_dir/temp_compressed"

mkdir -p "$temp_dir"

echo "Compressing images in $manga_dir..."

# Sort numerically and compress
find "$manga_dir" -maxdepth 1 -type f -iname '*.jpg' | sort -V | while read -r img; do
  filename=$(basename "$img")
  magick "$img" -resize 60% -quality 50 "$temp_dir/$filename"
done

echo "Creating ordered PDF: $output_pdf"
# Use sorted order again to create PDF
convert $(find "$temp_dir" -maxdepth 1 -type f -iname '*.jpg' | sort -V) "$output_pdf"

echo "Cleaning up..."
rm -rf "$temp_dir"

echo "✅ Done: Compressed and ordered PDF saved as $output_pdf"
