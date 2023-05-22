#!/bin/bash
#Script to build buildroot configuration
#Author: Siddhant Jajoo

source shared.sh

EXTERNAL_REL_BUILDROOT=../base_external

git submodule init
git submodule sync
git submodule update

set -e 
cd `dirname $0`

if [ ! -e buildroot/.config ]
then
	echo "MISSING BUILDROOT CONFIGURATION FILE"

	if [ -e ${AESD_MODIFIED_DEFCONFIG} ]
	then
		echo "USING ${AESD_MODIFIED_DEFCONFIG}"
		make -C buildroot defconfig BR2_EXTERNAL=${EXTERNAL_REL_BUILDROOT} BR2_DEFCONFIG=${AESD_MODIFIED_DEFCONFIG_REL_BUILDROOT}
	else
		echo "Run ./save_config.sh to save this as the default configuration in ${AESD_MODIFIED_DEFCONFIG}"
		echo "Then add packages as needed to complete the installation, re-running ./save_config.sh as needed"
		echo "If this is your first time building for a harware platform you might want to consider using your"
		echo "qemu defconfig at ${QEMU_MODIFIED_DEFCONFIG} as a reference"
		make -C buildroot defconfig BR2_EXTERNAL=${EXTERNAL_REL_BUILDROOT} BR2_DEFCONFIG=${AESD_DEFAULT_DEFCONFIG}
	fi
else
	echo Building U-boot Boot Script
	base_external/uboot_scripts/build_boot_scr.sh
	echo Building Device Tree Overlays
	base_external/device_tree_overlays/build_dtbos.sh
	if [ ! -e buildroot/output/images ]
	then
		mkdir buildroot/output/images
	fi
	cp base_external/uboot_scripts/boot.scr buildroot/output/images/boot.scr
	find base_external/device_tree_overlays -type f -name "*.dtbo" | xargs cp -vt buildroot/output/images/
	echo "USING EXISTING BUILDROOT CONFIG"
	echo "To force update, delete .config or make changes using make menuconfig and build again."
	make -C buildroot BR2_EXTERNAL=${EXTERNAL_REL_BUILDROOT}

fi
