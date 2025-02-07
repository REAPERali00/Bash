#!/bin/bash

error="error.log"
if [ -f "$error" ]; then
  rm -rf "$error"
fi

make 2>>"$error"
clear

if [ $? -eq 0 ]; then
  ./program 2>>"$error"
fi
