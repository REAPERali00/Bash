#!/bin/bash

# Kill all existing tmux sessions
tmux kill-server

# Ensure tmux has fully exited before proceeding
sleep 1

# Start a new tmux session
tmux new-session -d -s work

# Wait for tmux to initialize
sleep 1

# Restore session using tmux-resurrect
tmux send-keys -t work "tmux run-shell ~/.tmux/plugins/tmux-resurrect/scripts/restore.sh" C-m

# Wait for the restore process to complete
sleep 2

# Send `clear` and `neofetch` to the first pane
tmux send-keys -t work:1.2 "clear; neofetch" C-m

# Attach to the new session
tmux attach -t work
