#!/bin/bash

CUR_DIR="$(dirname $0)"
echo $CUR_DIR
cpp -nostdinc -I include -I arch -undef -x assembler-with-cpp $CUR_DIR/hx711-beaglebone-black.dts $CUR_DIR/hx711-beaglebone-black.dts.preprocessed
dtc -I dts -O dtb -o $CUR_DIR/hx711-beaglebone-black.dtbo $CUR_DIR/hx711-beaglebone-black.dts.preprocessed 
cpp -nostdinc -I include -I arch -undef -x assembler-with-cpp $CUR_DIR/fsr-beaglebone-black.dts $CUR_DIR/fsr-beaglebone-black.dts.preprocessed
dtc -I dts -O dtb -o $CUR_DIR/fsr-beaglebone-black.dtbo $CUR_DIR/fsr-beaglebone-black.dts.preprocessed 
