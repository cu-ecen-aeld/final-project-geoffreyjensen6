setenv bootargs console=ttyS0,115200 root=/dev/mmcblk0p2 rw rootfstype=ext4 rootwait
load mmc 0:1 0x82000000 zImage
load mmc 0:1 0x88000000 am335x-boneblack.dtb
fdt addr 0x88000000
fdt resize 8192
load mmc 0:1 0x90000000 hx711-beaglebone-black.dtbo
fdt apply 0x90000000
bootz 0x82000000 - 0x88000000
