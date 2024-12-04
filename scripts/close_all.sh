#!/bin/bash

# Get the list of window addresses
window_addresses=$(hyprctl clients | grep "pid:" | awk '{print $2}')

# Debug: Print all window addresses
echo "Window Addresses: $window_addresses"

# Loop through each window address and close it
for addr in $window_addresses; do
  hyprctl dispatch closewindow pid:"$addr"
done

echo "All windows closed."
