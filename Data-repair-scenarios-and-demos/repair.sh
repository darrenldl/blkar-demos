#!/bin/bash

# title : Blkar demo - basic repair

source setup.sh

set_up

make_random_file_MiB test 1

blkar encode test &>/dev/null

rm test

erun 'ls -l'

erun '# we corrupt the archive first, then try to repair'

erun 'dd if=/dev/urandom of=test.ecsbx bs=123 seek=$((RANDOM % 100)) count=30 conv=notrunc'

erun 'blkar check -v test.ecsbx'

erun_y 'blkar repair -v test.ecsbx'

erun 'blkar check -v test.ecsbx'

clean
