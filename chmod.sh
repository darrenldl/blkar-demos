#!/bin/bash

if [[ $PWD != */blkar-demos ]]; then
    echo "Please run chmod.sh in the blkar-demos directory"
    exit 1
fi

chmod -R u+x .
