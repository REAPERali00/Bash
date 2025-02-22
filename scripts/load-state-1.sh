#!/bin/bash

close_wk.sh 1
# Switch to the third workspace and launch ghostty with btop
hyprctl dispatch workspace 1

# ghostty btop & # Launch ghostty with btop
# ghostty htop & # Launch ghostty with btop
# ghostty cava & # Launch ghostty with btop
hyprctl dispatch exec "[workspace 1; float; size 48% 22%; move 25% 5%] ghostty -e htop"
hyprctl dispatch exec "[workspace 1; float; size 48% 51%; move 25% 28%] ghostty -e btop"
hyprctl dispatch exec "[workspace 1; float; size 87% 16%; move 7% 81%] ghostty -e cava"
hyprctl dispatch exec "[workspace 1; float; size 18.5% 15%; move 73.5% 63%;] ghostty"
sleep 4 # Give it time to launch

clear
