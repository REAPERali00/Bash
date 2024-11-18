#!/bin/bash

cd ~/Downloads

# create the direcoteis, takea in the directory name
function create_dir() {
  local name = "$1"
  if [ ! -d "$name" ]; then
    mkdir "$name"
    echo "create $name directory"
  else
    echo "directory $name already exists"
  fi
}

# take directory name and file types, find file types and move them
function sort() {
  local dir="$1"
  local types=$2

}
