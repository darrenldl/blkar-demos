#!/bin/bash

# title : Blkar demo - rescue from disk image pick UID

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

erun '# we scan the disk image first to check there are multiple containers'

erun 'blkar show --pv 0 --show-all disk.img'

uid=$(blkar show disk.img --json | jq -r .blocks[0].fileUID)

erun '# so we see there are two containers'

erun "# but we only want to rescue the container storing test0, with UID : $uid"

erun '# we can use the --only-pick-uid option to do that'

erun "blkar rescue --only-pick-uid $uid disk.img rescued_data"

erun 'ls -l rescued_data'

erun '# we can see only the picked container is in the rescued_data folder'

erun '# we check metadata just to confirm'

erun "blkar show rescued_data/$uid"

clean
