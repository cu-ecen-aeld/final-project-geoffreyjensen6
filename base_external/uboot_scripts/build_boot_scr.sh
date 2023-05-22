#!/bin/bash
CUR_DIR="$(dirname $0)"
echo $CUR_DIR

mkimage -A arm -O linux -T script -C none -a 0 -e 0 -n "BBB Smart Spice Rack Boot Script" -d $CUR_DIR/boot.cmd $CUR_DIR/boot.scr
