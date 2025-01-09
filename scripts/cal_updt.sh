#!/bin/bash

file="/home/alireza/Downloads/alireza18jadidi@gmail.com.ical.zip"

unzip "$file"
rm -rf "$file"

for cal in /home/alireza/Downloads/*.ics; do
  khal import -a private --batch "$cal"
  if [ $? -eq 0 ]; then
    rm -rf "$cal"
  fi
done
