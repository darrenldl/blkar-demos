#!/bin/bash

# title : Blkar demo - repair dry run

source setup.sh

set_up

make_random_file_MiB test 1

blkar encode test &>/dev/null

rm test

erun 'ls -l'

erun '# we corrupt the archive first, then see if it is repairable, but not actually repair'

erun 'dd if=/dev/urandom of=test.ecsbx bs=123 seek=$((RANDOM % 100)) count=30 conv=notrunc'

erun 'blkar check -v test.ecsbx'

erun_y 'blkar repair -v test.ecsbx --dry-run'

erun 'blkar check -v test.ecsbx'

erun '# we can see the container is still corrupted - the repairs were indeed not written back to the container'

clean
