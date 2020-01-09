#!/bin/bash
[ -z $1 ] && X=a || X=$1
ls /dev/sd"$X"2 || exit 1
mount /dev/sd"X"1 /mnt 
mkdir /mnt/boot

for dir in dev proc sys; do
	mkdir /mnt/$dir
	mount --rbind /$dir /mnt/$dir
done

xbps-install -Sy -r /mnt base-system grub vim

