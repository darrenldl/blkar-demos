#!/bin/bash

source setup.sh

set_up

truncate -s 10M test

erun 'ls -l'

erun '# sometimes the file already has FEC, so we go with SeqBox instead of EC-SeqBox'

erun '# we can do this by picking version 1, 2, or 3, depending on the block size we want'

erun '# we look at the table from help message first'

erun '# grep is used so only the table is shown'

erun 'blkar encode -h | grep -A 20 -- --sbx-version'

erun '# we pick version 1 as we deem 512 to be a reasonable block size'

erun 'blkar encode --sbx-version 1 test'

erun 'ls -l'

clean
