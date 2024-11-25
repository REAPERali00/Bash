#!/bin/bash

savedFile="$HOME/.local/lastplayed.txt"
currentVideo=""
queuefile="$HOME/.local/vid_queue.txt"
path=""

function usage() {
  echo " Usage: $0 [-p]"
  echo "   -p change the directory path"
  echo "   -c clear the cached queue"
  echo "  default will play videos in vid_queue "
}
function loop() {
  load
  while [ -f "$queuefile" ]; do
    nextVideo
    play
  done
  echo "All videos played!"
}

function menu() {
  if [ $# -eq 0 ]; then
    loop
    return
  fi
  while getopts "p:c" opt; do
    case $opt in
    p)
      path="$OPTARG"
      save "$path"
      ;;
    c) clean ;;
    ?)
      echo "Invalid option: -$OPTARG"
      usage
      exit 1
      ;;

    esac
  done
}

function save() {
  local path=$1
  if [ ! -d "$path" ]; then
    echo "not a valid directory $path"
    exit 1
  fi

  initializeQueue
  echo -e "path=$path" >"$savedFile"
  echo "Saved path: $path to $savedFile"
}

function load() {
  if [ ! -f "$savedFile" ]; then
    echo "file not saved, could not load"
    exit 1
  fi

  while IFS='=' read -r key value; do
    case "$key" in
    path) path="$value" ;;
    # currentVideo) currentVideo="$value" ;;
    *) echo "Unkown key: $key" ;;
    esac
  done <"$savedFile"
  echo "Loaded path: $path"
}

function initializeQueue() {
  if [ ! -f "$queuefile" ]; then
    if [ ! -d "$path" ]; then
      echo "Not a valid directory: $path "
      exit 1
    fi
    find "$path" -type f \( -iname "*.mp4" -o -iname "*.MP4" \) | sort >"$queuefile"
    if [ ! -s "$queuefile" ]; then
      echo "No videos found in the directory."
      rm -f "$queuefile"
      exit 1
    fi
    echo "video queue initialized form $path in $queuefile"
  fi
}

function nextVideo() {
  if [ ! -f "$queuefile" ]; then
    initializeQueue
  fi
  local video=$(head -n 1 "$queuefile")
  if [ -z "$video" ]; then
    echo "No more videos left to play."
    rm -f "$queuefile"
    exit 0
  fi

  echo "Now playing: $video"
  sed -i '1d' "$queuefile"
  currentVideo="$video"

}
function play() {
  if [ ! -f "$currentVideo" ]; then
    echo "Video not found"
    exit 1
  fi

  vlc --play-and-exit --fullscreen "$currentVideo"
}

function clean() {
  if [[ -f "$queuefile" ]]; then
    echo "Deleted $queuefile"
    rm -rf "$queuefile"
  fi

  if [[ -f "$savedFile" ]]; then
    echo "Deleted $savedFile"
    rm -rf "$savedFile"
  fi
}

menu $@
