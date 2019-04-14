#!/bin/bash

# title : Blkar demo - decode multi-pass

source setup.sh

set_up

make_random_file_MiB test 1

erun 'ls -l'

erun '# we first encode the file, and duplicate the archive'

erun '# we then corrupt archives at different spots, and merge output file using deode --multi-pass'

erun '# finally we check that the output file is same as the original one'

erun 'blkar encode --sbx-version 1 test'

erun 'cp test.sbx test.sbx.0'
erun 'cp test.sbx test.sbx.1'
erun 'rm test.sbx'

erun '# corrupt first archive'

erun 'dd if=/dev/urandom of=test.sbx.0 bs=512 seek=1 count=10 conv=notrunc'

erun 'blkar check test.sbx.0'

erun '# corrupt second archive'

erun 'dd if=/dev/urandom of=test.sbx.1 bs=512 seek=11 count=10 conv=notrunc'

erun 'blkar check test.sbx.1'

erun '# we could see that both copies of the archive are corrupted'
erun '# now we begin decoding and merge'

erun 'blkar decode --multi-pass test.sbx.0 test2'

erun 'blkar decode --multi-pass test.sbx.1 test2'

erun 'cmp test test2'

clean
