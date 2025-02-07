#!/bin/bash

error="error.log"

make 2>>"$error"
clear

if [ $? -eq 0 ]; then
  ./program 2>>"$error"
fi
