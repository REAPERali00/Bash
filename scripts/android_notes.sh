#!/bin/bash

SOURCE_FOLDER="/home/alireza/Documents/notes/Notes_Obsidian/"
ANDROID_USER="alireza"
ANDROID_IP="192.168.0.31"
ANDROID_FOLDER="/"
scp -r -P 2222 "$SOURCE_FOLDER" "$ANDROID_USER@$ANDROID_IP:$ANDROID_FOLDER"
