#!/bin/bash

# title : Blkar demo - sort mode dry run

source setup.sh

set_up

make_blank_file_MiB test 10

blkar encode test &>/dev/null

rm test

erun 'ls -l'

erun 'blkar sort test.ecsbx --dry-run'

erun 'ls -l'

clean
