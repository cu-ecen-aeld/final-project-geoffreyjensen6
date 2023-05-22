#!/bin/sh
BOARD_DIR="$(dirname $0)"
UBOOT_SCR_PATH="${BOARD_DIR}/../../base_external/uboot_scripts/build_boot_scr.sh"
UBOOT_SCR_OUT="${BOARD_DIR}/../../base_external/uboot_scripts/boot.scr"
DTBO_SCR_PATH="${BOARD_DIR}/../../base_external/device_tree_overlays/build_dtbos.sh"
DTBO_DIR="${BOARD_DIR}/../../base_external/device_tree_overlays"

#Build uboot.scr
/bin/bash $UBOOT_SCR_PATH
#Build Device Tree Overlays
/bin/bash $DTBO_SCR_PATH

#Copy both files to destination
cp $UBOOT_SCR_OUT $BINARIES_DIR/boot.scr
find $DTBO_DIR -type f -name "*.dtbo" | xargs cp -vt $BINARIES_DIR

