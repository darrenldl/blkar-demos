#!/bin/bash

# title : Blkar demo - decode multi-pass

source setup.sh

set_up

truncate -s 10M test

erun 'ls -l'

erun '# we first encode the file, and duplicate archive three times'

erun '# we then corrupt archives at different spots, and merge output file using deode --multi-pass output'

erun '# finally we check that the output file is same as the original one'

erun 'blkar encode test'

erun 'cp test.ecsbx test.ecsbx.0'
erun 'cp test.ecsbx test.ecsbx.1'
erun 'cp test.ecsbx test.ecsbx.2'
erun 'rm test.ecsbx'

erun '# corrupt first archive'

erun 'dd if=/dev/urandom of=test.ecsbx.0 bs=512 seek=1 count=10'

erun 'blkar check test.ecsbx.0'

erun '# corrupt second archive'

erun 'dd if=/dev/urandom of=test.ecsbx.1 bs=512 seek=10 count=10'

erun 'blkar check test.ecsbx.1'

erun '# corrupt third archive'

erun 'dd if=/dev/urandom of=test.ecsbx.2 bs=512 seek=20 count=10'

erun 'blkar check test.ecsbx.2'

clean
