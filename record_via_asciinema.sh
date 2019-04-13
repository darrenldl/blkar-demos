#!/bin/bash

if [[ $1 == "" ]]; then
  echo "Please specify a demo to run"
  exit 1
fi

demo=$1
cast_filename=$1.cast

title=$(grep "title" $demo | cut -d ' ' -f 4-)

if [ ! -f "$demo" ]; then
  echo "Demo \"$demo\" does not exist"
  exit 1
fi

asciinema rec -t "$title" $cast_filename --overwrite -c ./$demo

upload_yn=(read -p "Upload to asciinema?" -n 1 -r)

if [[ $upload_yn == "y" ]]; then
    asciinema upload $cast_filename
fi
