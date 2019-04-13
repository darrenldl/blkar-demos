#!/bin/bash

# title : Blkar demo - show all, disk image

source setup.sh

set_up

make_random_file_MB test0 1
make_random_file_MB test1 1
make_random_file_MB test2 1
make_random_file_MB test3 1

blkar encode test0 --sbx-version 1 &>/dev/null
blkar encode test1 --sbx-version 2 &>/dev/null
blkar encode test2 --sbx-version 3 &>/dev/null

cat test0.sbx >> test0
cat test1.sbx >> test0
cat test2.sbx >> test0

rm test1
rm test2
rm test3

rm test0.sbx
rm test1.sbx
rm test2.sbx

mv test0 disk.img

erun 'ls -l'

erun '# we use a simulated disk image in this demo, but you can use an actual disk/block device as well'

erun 'blkar show disk.img --show-all'

clean
