#!/bin/bash
# run as root
[ -z $1 ] && echo set a disk && exit 1
parted /dev/sd$1 --script -- mklabel msdos
parted /dev/sd$1 --script -- mkpart primary 0 300M
parted /dev/sd$1 --script -- mkpart primary 300M 100%

mkfs.vfat /dev/sd"$1"1
mkfs.ext4 /dev/sd"$1"2
