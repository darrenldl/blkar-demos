#!/bin/bash

if [[ $1 == "" ]]; then
  echo "Please specify a demo to run"
  exit 1
fi

demo=$1
cast_filename=$1.cast

if [ ! -f "$demo" ]; then
  echo "Demo \"$demo\" does not exist"
  exit 1
fi

asciinema rec $cast_filename --overwrite -c ./$demo
