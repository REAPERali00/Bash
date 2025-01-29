#!/bin/bash

cd $HOME/Downloads/
file="/home/alireza/Downloads/alireza18jadidi@gmail.com.ical.zip"

unzip "$file"
rm -rf "$file"

for cal in $(find "$HOME/Downloads" -name "*.ics"); do
  khal import -a private --batch "$cal"
  if [ $? -eq 0 ]; then
    rm -rf "$cal"
  fi
done

rm -rf "${file%.zip}"
