# blkar-demos

This repository contains the scripts used to construct the demo recordings for the blockyarchive project

## Example usage

`record_via_asciinema.sh encode_check_repair_decode.sh`

This runs the `encode_check_repair_decode.sh` demo script via asciinema `-c` option. The recording is stored as `encode_check_repair_decode.sh.cast`.

## Index

- `setup.sh`
  
  - Contains the definition of helper functions

- `record_via_asciinema.sh`
  
  - This invokes a given demo and records via asciinema

- `encode_check_repair_decode.sh`
  
  - Main demo displayed on blockyarchive's README

## License

All files are distributed under the Unlicense license as stated in the LICENSE file.

This means you are free to use these scripts to build demos for your software or for whatever other purposes. Acknowledgement would be nice, but not required in any form.
