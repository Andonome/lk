---
title: "encrypted"
tags: [ "Documentation", "distros" ]
---
> # taken from https://0x00sec.org/t/arch-linux-with-lvm-on-luks-dm-crypt-disk-encryption-installation-guide-legacy-bios-system/1479
 
> # if you need wifi
 
> wifi-menu
 
> timedatectl set-ntp true
 
> fdisk -l
 
> parted /dev/sda
 
> (parted) mklabel msdos
 
> (parted)  mkpart primary ext2 1MB 512MB
 
> (parted) mkpart primary ext4 512MB 100%
 
> (parted) print
 
> (parted) set 1 boot on
 
> (parted) quit
 
> fdisk -l
 
> cryptsetup luksFormat /dev/sda2
 
> # make a name.  Here I use "crypt".

 cryptsetup open /dev/sda2 crypt
 
> pvcreate /dev/mapper/crypt

> # now a group name - "usb"

> vgcreate usb /dev/mapper/crypt
 
 
> lvcreate -L 8GB usb -n swap
> lvcreaate -L 30G usb -n root
> lvcreate -l 100%FREE usb -n home
 
> mkfs.ext4 /dev/mapper/usb-home
 mkfs.ext4 /dev/mapper/usb-root
> mkswap /dev/mapper/usb-swap
 
> mkfs.ext2 /dev/sda1
 
> mount /dev/mapper/usb-root /mnt
 mkdir /mnt/home
> mount /dev/mapper/usb-home /mnt/home
 mkdir /mnt/boot
> mount /dev/sda1 /mnt/boot
 swapon /dev/mapper/usb-swap

pacstrap -i /mnt base base-devel efibootmgr grub
 
genfstab -U /mnt >> /mnt/etc/fstab
 
arch-chroot /mnt
 
 ############ new root #############
 
 ln -sf /usr/share/zoneinfo/Europe/Belgrade /etc/localtime
 
 # uncomment en_GT.UTF-8
> vi /etc/locale.gen
 
> locale-gen
 
> # add `LANG=en_GB.UTF-8` to /etc/locale.conf
 
> vi /etc/locale.conf
 
> echo crypt > /etc/hostname
 
> # make sure keyboard encrypt lvm2 are on the list of HOOKS
 
> vi /etc/mkinitcpio.conf
 
> grub-install /dev/sda
 
> vi /etc/default/grub
edit the GRUB_CMDLINE_LINUX=""
 
`GRUB_CMDLINE_LINUX="cryptdevice=/dev/sda2:usb root=/dev/mapper/usb-root"`
 
> grub-mkconfig -o /boot/grub/grub.cfg
 
> mkinitcpio -p linux
 
> pacman -S wpa_supplicant dialog

