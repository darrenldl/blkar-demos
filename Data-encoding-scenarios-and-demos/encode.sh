#!/bin/bash

# title : Blkar demo - encode

source setup.sh

set_up

truncate -s 10M test

erun 'ls -l'

erun '# blkar by default adds FEC already, so encoding with default options is normally good enough'

erun 'blkar encode test'

erun 'ls -l'

clean
