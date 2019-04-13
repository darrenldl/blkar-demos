#!/bin/bash

# title : Blkar demo - encode, check, repair, decode

source setup.sh

set_up

truncate -s 10M test

erun 'ls -l'

erun '# we first encode the file'

erun 'blkar encode test'

erun 'ls -l'

erun '# we take a look the container metadata to make sure we used the right file etc'

erun 'blkar show test.ecsbx'

erun '# we check the container blocks'

erun 'blkar check test.ecsbx'

erun '# everything looks fine'

erun '# now we corrupt the archive randomly'

erun 'dd if=/dev/urandom of=test.ecsbx bs=123 seek=$((RANDOM % 100)) count=30 conv=notrunc'

erun 'blkar check -v test.ecsbx'

erun '# we noticed a number of blocks failed the check, so we try to repair'

erun_y 'blkar repair -v test.ecsbx'

erun '# repairs were successful, so we decode the archive'

erun 'blkar decode test.ecsbx test2'

erun 'cmp test test2'

erun '# everything checks out!'

clean
