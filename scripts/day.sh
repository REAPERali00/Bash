#!/bin/bash

daily_dir="$HOME/Documents/notes/Notes_Obsidian/Daily"
daily_template="$HOME/Documents/notes/Notes_Obsidian/Templates/daily.md"
today_date=$(date +'%Y-%m-%d')
daily="$daily_dir/$today_date.md"
prev_daily="$daily_dir/$(date -d 'yesterday' +'%Y-%m-%d').md"

# Create the new daily log if it doesn't exist
if [ ! -f "$daily" ]; then
  touch "$daily"
  cp "$daily_template" "$daily"

  sed -i "s/{{date}}/$today_date/" "$daily"

  # Check if the previous day's file exists
  if [ -f "$prev_daily" ]; then
    # Extract the Tasks section between the two '---' lines after '## Tasks'
    tasks_section=$(awk '
      /^## Tasks$/ { in_tasks=1; next }
      in_tasks==1 && /^---$/ { in_tasks=2; next }
      in_tasks==2 && /^---$/ { exit }
      in_tasks==2 { print }
    ' "$prev_daily")

    # Remove completed tasks (- [x]) and preserve the rest
    cleaned_tasks=$(echo "$tasks_section" | grep -Ev '^\s*- \[x\]')
    echo "$cleaned_tasks"

    # Ensure tasks are inserted into the right location under the ## Tasks section
    if [ -n "$cleaned_tasks" ]; then

      awk -v tasks="$cleaned_tasks" '
        BEGIN { inserted = 0 }
        /^## Tasks$/ && !inserted {
          print
          print "---"
          print tasks
          print "---"
          inserted = 1
          next
        }
        { print }
      ' "$daily" >"${daily}.tmp" && mv "${daily}.tmp" "$daily"
    fi
  fi
fi
