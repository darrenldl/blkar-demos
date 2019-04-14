#!/bin/bash

# title : Blkar demo - rescue from disk image with range

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

erun '# since we know where the container sits roughly, we launch blkar rescue mode with specified range'

erun '# specifically we know it sits at roughly the 80MiB to 120MiB range'

erun ''

erun '# obviously for a 200MiB ish disk image, that does not matter too much'

erun '# but range is very helpful when your disk image is, say, a few TBs and you know range of where'

erun '# the container blocks sit is roughly only 100GiB in size from your knowledge of the partitioning'

erun ''

erun '# we also supply a log file location in case we need to interrupt blkar'

erun '# log files do work correctly with range parameters, but you need to stick with the same range parameters'

erun '# with the same log file in all runs'

erun ''

erun "# lastly, even if the numbers are a bit off (not multiple of block sizes) we don't have to worry too much"

erun '# as blkar rounds the starting number down to multiple of 128 automatically by default'

erun 'blkar rescue disk.img rescued_data rescue.log --from $[80 * 1024 * 1024] --to-exc $[120 * 1024 * 1024]'

erun 'ls -l rescued_data'

erun '# we can see the rescued container is stored using its UID as name'

erun '# we now check the metadata just to see what we rescued'

for f in rescued_data/*; do
    erun "blkar show $f"
done

clean
