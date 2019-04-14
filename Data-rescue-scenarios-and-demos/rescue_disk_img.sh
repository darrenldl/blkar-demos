#!/bin/bash

# title : Blkar demo - rescue from disk image

source setup.sh

set_up

make_random_file_MiB test0 1
make_random_file_MiB test1 1
make_blank_file_MiB disk.img 100
make_blank_file_MiB blank 100

blkar encode test0 &>/dev/null
blkar encode test1 &>/dev/null

cat test0.ecsbx >> disk.img
cat blank >> disk.img
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

erun '# we also supply a log file location in case we need to interrupt blkar'

erun 'blkar rescue disk.img rescued_data rescue.log'

erun 'ls -l rescued_data'

erun '# we can see the rescued containers are stored using their UIDs as names'

erun '# we now check the metadata just to see what we rescued'

for f in rescued_data/*; do
    erun "blkar show $f"
done

clean
