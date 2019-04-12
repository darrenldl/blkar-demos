#!/bin/bash

source setup.sh

set_up

truncate -s 10M test

erun 'ls -l'

erun 'blkar encode test'

erun 'ls -l'

erun 'blkar show test.ecsbx'

erun 'blkar check test.ecsbx'

erun 'dd if=/dev/urandom of=test.ecsbx bs=123 seek=$((RANDOM % 100)) count=30 conv=notrunc'

erun 'blkar check -v test.ecsbx'

erun '# we noticed a number of blocks failed the check, so we try to repair'

erun 'blkar repair -y -v test.ecsbx'

erun 'blkar check -v test.ecsbx'

erun '# repairs were successful, so we decode the archive'

erun 'blkar decode test.ecsbx test2'

erun 'cmp test test2'

clean
