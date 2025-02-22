#!/bin/bash

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

# Switch to the first workspace and launch ghostty with tmux, then restore tmux session using tmux-resurrect
hyprctl dispatch workspace 2
ghostty -e tmux new-session -A -s main & # Launch ghostty with tmux (auto-attach to the main session)
sleep 2                                  # Give it time to launch

# Automatically restore tmux session
tmux run-shell ~/.tmux/plugins/tmux-resurrect/scripts/restore.sh
sleep 1

# Run commands on specific panes
tmux send-keys -t work:1.2 "clear;neofetch" C-m
tmux send-keys -t work:1.3 "sudo pacman -Syu --noconfirm" C-m # Replace '0.2' with the appropriate window and pane index
tmux send-keys -t work:1.4 "nvim --headless '+Lazy! sync' +qa && clear" C-m

sleep 2

# Switch to the second workspace and launch Firefox
hyprctl dispatch workspace 3
firefox & # Launch Firefox
sleep 5   # Give it time to launch

hyprctl dispatch workspace special
sleep 2 # Give it time to launch
flatpak run org.telegram.desktop &
sleep 2 # Give it time to launch
hyprctl dispatch togglespecialworkspace

# Switch to 4th workspace and open yazi
hyprctl dispatch workspace 4
ghostty yazi &
sleep 2 # Give it time to launch
