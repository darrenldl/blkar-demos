#!/bin/bash

# title : Blkar demo - sort mode, adjust burst error resistance level

source setup.sh

set_up

make_blank_file_MB test 10

blkar encode test &>/dev/null

rm test

erun 'ls -l'

erun 'blkar sort test.ecsbx --dry-run'

erun 'ls -l'

clean
