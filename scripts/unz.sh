#!/bin/bash

# Function to create a directory and extract files
extract_to_folder() {
  archive_name="$1"
  extension="$2"

  # Remove the extension from the archive name to create a folder
  folder_name="${archive_name%.$extension}"

  # Create a directory with the name of the archive
  mkdir -p "$folder_name"

  # Extract files into the directory based on the extension type
  if [[ "$extension" == "zip" ]]; then
    unzip -o "$archive_name" -d "$folder_name"
  elif [[ "$extension" == "rar" ]]; then
    unrar x "$archive_name" "$folder_name"
  fi
}

# Find and unzip .zip files
for zip_file in *.zip; do
  if [[ -f "$zip_file" ]]; then
    echo "Extracting $zip_file..."
    extract_to_folder "$zip_file" "zip" && rm -f "$zip_file"
  else
    echo "No zip files found in the current directory."
  fi
done

# Find and unrar .rar files
for rar_file in *.rar; do
  if [[ -f "$rar_file" ]]; then
    echo "Extracting $rar_file..."
    extract_to_folder "$rar_file" "rar" && rm -f "$rar_file"
  else
    echo "No rar files found in the current directory."
  fi
done

echo "Done!"
