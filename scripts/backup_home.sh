#!/bin/bash

# Define source directories
files=(
  "$HOME/Documents"
  "$HOME/Downloads"
)

# Define destination
dest="$HOME/D/Arch_Home"

# Ensure the destination directory exists
if [[ ! -d "$dest" ]]; then
  echo "Destination directory not found: $dest"
  exit 1
fi

# Loop through each directory in the list
for file in "${files[@]}"; do
  if [[ ! -d "$file" ]]; then
    echo "Source directory not found: $file"
    continue # Skip to the next directory
  fi

  echo "Copying $file..."
  cp -r "$file" "$dest/"
  echo "Done!"
done

echo "All files copied over."
