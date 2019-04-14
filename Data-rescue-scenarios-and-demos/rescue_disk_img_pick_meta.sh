#!/bin/bash

# title : Blkar demo - rescue from disk image pick only metadata blocks

source setup.sh

set_up

make_random_file_MiB test0 1
make_random_file_MiB test1 1
make_blank_file_MiB disk.img 100
make_blank_file_MiB blank 100

blkar encode --sbx-version 1 test0 &>/dev/null
blkar encode --sbx-version 1 test1 &>/dev/null

cat test0.sbx >> disk.img
cat blank >> disk.img
cat test1.sbx >> disk.img

rm test0
rm test1
rm blank

rm test0.sbx
rm test1.sbx

erun 'ls -l'

erun '# we make a folder to store the rescued data'

erun 'mkdir rescued_data'

erun '# sometimes you only want to collect the metadata blocks because they are often the most important and fragile'

erun '# part of the archive, as they contain all the parameters'

erun ''

erun '# we can do that by specifying --only-pick-block option in rescue mode'

erun '# we use a disk image here, but obviously you can extract the metadata block(s) from a container this way as well'

erun "blkar rescue --only-pick-block meta disk.img rescued_data"

erun 'ls -l rescued_data'

erun '# from the sizes, we can see they both contain only a single block'

erun '# we check to make sure to the metadata is actually there'

for f in rescued_data/*; do
    erun "blkar show $f"
done

clean
