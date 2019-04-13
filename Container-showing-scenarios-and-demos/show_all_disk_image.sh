#!/bin/bash

# title : Blkar demo - show all, disk image

source setup.sh

set_up

make_blank_file_MB test0 1
make_blank_file_MB test1 1
make_blank_file_MB test2 1
make_blank_file_MB test3 1

blkar encode test0 &>/dev/null
blkar encode test1 &>/dev/null
blkar encode test2 &>/dev/null
blkar encode test3 &>/dev/null

cat test0.ecsbx >> test0
cat test1.ecsbx >> test0
cat test2.ecsbx >> test0
cat test3.ecsbx >> test0

rm test1
rm test2
rm test3

rm test0.ecsbx
rm test1.ecsbx
rm test2.ecsbx
rm test3.ecsbx

mv test0 disk.img

erun 'ls -l'

erun '# we use a simulated disk image in this demo, but you can use an actual disk/block device as well'

erun 'blkar show disk.img --show-all'

clean
