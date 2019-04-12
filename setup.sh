#!/bin/bash
function print_command() {
  local word=$1
  echo -n '$ '
  for (( i=0; i < ${#word}; i++ )); do
    echo -n "${word:$i:1}"
    sleep 0.07
  done
  sleep 0.07
  echo ""
}

function erun() {
  print_command "$1"
  eval "$1"
}

function erun_y() {
  print_command "$1"
  eval "yes | $1"
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
