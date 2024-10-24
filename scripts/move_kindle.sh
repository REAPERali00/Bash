#!/bin/bash

# Set Kindle manga directory
kindle_dir="/mnt/kindle/documents/manga"

# Get the current working directory (where the script is running)
current_dir=$(pwd)

# Ensure the Kindle manga directory exists
if [ ! -d "$kindle_dir" ]; then
  echo "Kindle manga directory does not exist. Creating it..."
  sudo mkdir -p "$kindle_dir"
fi

# Loop through all zip files in the current directory
for zip_file in *.zip; do
  # Check if there are any zip files
  if [ ! -f "$zip_file" ]; then
    echo "No zip files found in the current directory."
    exit 1
  fi

  # Get the name of the zip file without the extension
  zip_name="${zip_file%.zip}"
  output_pdf="${zip_name}.pdf"

  echo "Processing $zip_file..."

  # Extract the zip file to a folder with the same name
  unzip "$zip_file" -d "$zip_name"

  # Navigate to the extracted folder
  cd "$zip_name" || exit 1

  # Combine the images (numerically sorted) into a single PDF
  # The `sort -n` command ensures numerical sorting
  magick $(ls -v *.jpg) "../${output_pdf}"

  # Move back to the parent directory
  cd ..

  # Check if the PDF was created successfully
  if [ -f "$output_pdf" ]; then
    echo "PDF ${output_pdf} created successfully."
  else
    echo "Failed to create PDF for ${zip_file}."
    continue
  fi

  # Copy the PDF to the Kindle manga folder
  sudo cp "$output_pdf" "$kindle_dir"

  # Check if the file was successfully copied to Kindle
  if [ -f "$kindle_dir/$output_pdf" ]; then
    echo "PDF successfully copied to Kindle for ${zip_name}."
  else
    echo "Failed to copy PDF for ${zip_name} to Kindle."
  fi

  # Move the PDF to the current directory where the script is running
  mv "$output_pdf" "$current_dir"

  # Check if the file was successfully moved to the current directory
  if [ -f "$current_dir/$output_pdf" ]; then
    echo "PDF successfully moved to $current_dir for ${zip_name}."
  else
    echo "Failed to move PDF to $current_dir for ${zip_name}."
  fi

  # Delete the original zip file
  rm "$zip_file"

  # Clean up by removing the extracted folder
  rm -rf "$zip_name"

  echo "Finished processing $zip_file. Original zip deleted and PDF created."
done

echo "All ZIP files processed. PDFs saved in the current directory and copied to Kindle."
