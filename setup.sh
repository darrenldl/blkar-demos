#!/bin/bash
function erun() {
  local word=$1
  echo -n '$ '
  for (( i=0; i < ${#word}; i++ )); do
    echo -n "${word:$i:1}"
    sleep 0.07
  done
  sleep 0.07
  echo ""
  eval "$1"
}

function set_up() {
  rm -rf demo/
  mkdir demo
  cd demo
}

function clean() {
  cd ..
  rm -rf demo/
}
