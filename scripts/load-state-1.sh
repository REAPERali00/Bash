#!/bin/bash

close_wk.sh 1
# Switch to the third workspace and launch kitty with btop
hyprctl dispatch workspace 1

# kitty btop & # Launch kitty with btop
# kitty htop & # Launch kitty with btop
# kitty cava & # Launch kitty with btop
hyprctl dispatch exec "[workspace 1; float; size 48% 22%; move 25% 5%] kitty -e htop"
hyprctl dispatch exec "[workspace 1; float; size 48% 51%; move 25% 28%] kitty -e btop"
hyprctl dispatch exec "[workspace 1; float; size 87% 16%; move 7% 81%] kitty -e cava"
hyprctl dispatch exec "[workspace 1; float; size 18.5% 15%; move 73.5% 63%;] kitty"
sleep 4 # Give it time to launch

clear
