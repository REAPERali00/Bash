#!/bin/bash

SOURCE_FOLDER="$(wl-paste)"
if [ $# -gt 1 ]; then
  SOURCE_FOLDER=$1
fi

ANDROID_USER="alireza"
ANDROID_IP="192.168.0.31"
ANDROID_FOLDER="/"

echo "staring to transfer $SOURCE_FOLDER..."

scp -r -P 2222 "$SOURCE_FOLDER" "$ANDROID_USER@$ANDROID_IP:$ANDROID_FOLDER"

notify-send "Finished transfering $SOURCE_FOLDER"
