#!/bin/bash

if [ $# -lt 1 ]; then
  ehco "pleasse give the path and name of the directory: $0 ./name"
  exit 1
fi

cp -r "/home/alireza/Documents/Bash/assets/java_base" $1
