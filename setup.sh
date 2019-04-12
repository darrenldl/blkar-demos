#!/bin/bash
function echo_and_run() {
  local word=$1
  echo -n '$ '
  for (( i=0; i < ${#word}; i++ )); do
    echo -n "${word:$i:1}"
    sleep 0.05
  done
  sleep 0.1
  echo ""
  $1
}

function set_scene() {
  rm -rf blkar-demo/
  mkdir blkar-demo
}
