#!/bin/bash

SOURCE_FOLDER="$(wl-paste)"
if [ $# -gt 1 ]; then
  SOURCE_FOLDER=$1
fi

KINDLE_USER="root"
KINDLE_IP="192.168.0.20"
KINDLE_FOLDER="/mnt/us/documents"

echo "staring to transfer $SOURCE_FOLDER..."

scp -r -P 2222 "$SOURCE_FOLDER" "$KINDLE_USER@$KINDLE_IP:$KINDLE_FOLDER"

notify-send "Finished transfering $SOURCE_FOLDER"
