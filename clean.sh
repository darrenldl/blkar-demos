#!/bin/bash

if [[ $PWD != */blkar-demos ]]; then
    echo "Please run clean.sh in the blkar-demos directory"
    exit 1
fi

rm -f *.cast

rm -f */*.cast
