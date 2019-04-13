#!/bin/bash

# title : Blkar demo - show

source setup.sh

set_up

make_blank_file_MB test 10

erun 'ls -l'

erun 'blkar encode test'

erun 'blkar show test.ecsbx'

clean
