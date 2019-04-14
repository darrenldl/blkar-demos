#!/bin/bash

# title : Blkar demo - rescue from disk image with interruption

source setup.sh

set_up

make_random_file_MiB test0 1
make_random_file_MiB test1 1
make_blank_file_MiB disk.img 100
make_blank_file_MiB blank 100

blkar encode test0 &>/dev/null
blkar encode test1 &>/dev/null

cat test0.ecsbx >> disk.img
truncate -s 10G disk.img
cat test1.ecsbx >> disk.img

rm test0
rm test1
rm blank

rm test0.ecsbx
rm test1.ecsbx

erun 'ls -l'

erun '# we make a folder to store the rescued data'

erun 'mkdir rescued_data'

erun '# we now launch blkar rescue mode'

erun '# we also supply a log file location so we can interrupt blkar and resume'

erun '# we interrupt blkar by pressing Ctrl-C after a few seconds, then resume,'

erun '# then interrupt and resume again'

res_cmd='blkar rescue disk.img rescued_data rescue.log'

print_command "$res_cmd"

sleep 2.5 && pkill -INT blkar &

eval "$res_cmd"

erun '# resume run, you should see the progress bar continues from its position from last run'

print_command "$res_cmd"

sleep 2.5 && pkill -INT blkar &

eval "$res_cmd"

erun '# resume run again'

erun "$res_cmd"

erun 'ls -l rescued_data'

clean
