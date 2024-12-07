#!/bin/bash

if [ $# -lt 1 ]; then
  echo "Usage: $0 <workspace num>"
  exit 1
fi

# Get the list of window addresses
workspace_number=$1
window_addresses=$(hyprctl clients | grep -A8 "workspace: $workspace_number" | grep "pid:" | awk '{print $2}')

# Debug: Print all window addresses
echo "Window Addresses: $window_addresses"

# Loop through each window address and close it
for addr in $window_addresses; do
  hyprctl dispatch closewindow pid:"$addr"
done

echo "All windows closed."
