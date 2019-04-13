#!/bin/bash

# title : Blkar demo - sort mode, adjust burst error resistance level

source setup.sh

set_up

make_blank_file_MB test 10

blkar encode test &>/dev/null

rm test

erun 'ls -l'

erun 'blkar show --guess-burst --pv 0 test.ecsbx 2>&1 | grep "Best guess"'

erun '# we see the current burst error resistance level is 10, and we want to adjust it to 20'

erun 'blkar sort test.ecsbx test.ecsbx.new --burst 20'

erun 'blkar show --guess-burst --pv 0 test.ecsbx.new 2>&1 | grep "Best guess"'

clean
