#!/bin/bash

# title : Blkar demo - encode multiple files

source setup.sh

set_up

truncate -s 5M test0
truncate -s 5M test1
truncate -s 5M test2

erun 'ls -l'

erun '# blkar does not support encoding multiple files at once natively, as both SeqBox and EC-SeqBox are'

erun '# single-file archive formats'

erun ''

erun '# however, blkar encode mode can accept input from stdin'

erun '# so you can bundle the files together first before passing to blkar if you want to encode multiple files'

erun '# we use tar in this demo'

erun 'tar cf - test0 test1 test2 | blkar encode - container.ecsbx'

erun 'ls -l'

clean
