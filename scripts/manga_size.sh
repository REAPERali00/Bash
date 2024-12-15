#!/bin/bash

# Check if required tools are installed
for cmd in pdfimages mogrify img2pdf; do
  if ! command -v $cmd &>/dev/null; then
    echo "Error: $cmd is not installed. Please install it first."
    exit 1
  fi
done

# Check if input PDF is provided
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 input.pdf output.pdf"
  exit 1
fi

INPUT_PDF=$1
OUTPUT_PDF=$2
TEMP_DIR="temp_images"

# Create a temporary directory
mkdir -p $TEMP_DIR

echo "Extracting images from $INPUT_PDF..."
pdfimages -all "$INPUT_PDF" "$TEMP_DIR/image"

echo "Downscaling images for Kindle..."
# Resize all images in the temporary directory
find $TEMP_DIR -type f \( -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" \) -exec mogrify -resize 1440x1080 -quality 75 {} +

echo "Recombining images into $OUTPUT_PDF..."
# Combine all images into a single optimized PDF
img2pdf $TEMP_DIR/* -o "$OUTPUT_PDF"

# Cleanup temporary files
rm -rf $TEMP_DIR

echo "Optimization complete. Output saved as $OUTPUT_PDF."
