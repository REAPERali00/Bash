#!/bin/bash

if [ $# -lt 2 ]; then
  ehco "usage: script user repo-name"
  exit 1
fi

user=$1
repo=$2

curl -s "https://api.github.com/repos/$1/$2/git/trees/main?recursive=1" |
  jq -r '.tree[].path' |
  awk '
{
  n = split($0, parts, "/");
  indent = "";
  for (i = 1; i < n; i++) indent = indent "  ";
  print indent "├── " parts[n];
}'
