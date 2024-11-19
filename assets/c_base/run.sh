#!/bin/bash
make
clear

if [ $? -eq 0 ]; then
  ./program &>output.txt
fi
