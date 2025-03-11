#!/bin/bash

if [ -z "$1" ]; then
  echo "usage: $0 <program_name_to_restart>"
  exit 1
fi

program="$1"
programs=$(tmux list-panes -a -F "#{pane_id} #{pane_current_command}" | grep "$program" | awk '{print$1}')

if [ -z "$programs" ]; then
  echo "no running $1 programs found in tmux sessions"
  exit 0
fi

pkill $program

for p in $programs; do
  tmux send-keys -t "$p" "$program" Enter
done

echo "finished restarting $program in tmux"
