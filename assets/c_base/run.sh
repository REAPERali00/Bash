#!/bin/bash
make
clear

if [ $? -eq 0 ]; then
  ./http &>output.txt
fi
