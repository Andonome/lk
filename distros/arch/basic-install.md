---
title: "basic-install"
tags: [ "Documentation", "distros" ]
---
Keyboard layout changed.

> ls /usr/share/kbd/keymaps/**/*.map.gz

> loadkeys uk.map.gz

Check if boot mode is UEFI

> ls /sys/firmware/efi/efivars

Without efivars, the system must boot with BIOS.

# Check network's up

> ping archlinux.org

Set system clock properly

> timedatectl set-ntp true

Check disks

> lsblk

Make partition

> parted -s /dev/sda mklabel gpt

> parted -s /dev/sda mklabel msdos

> parted  -s /dev/sda mkpart primary ext4 512 100%

> parted -s /dev/sda set 1 boot on

> mkfs.ext4 /dev/sda1

Use pacstrap to get the base install.

> mount /dev/sda1 /mnt/

> pacstrap /mnt base base-devel vim linux linux-firmware

Make fstab notes for new system.

> genfstab -U /mnt >> /mnt/etc/fstab

> arch-chroot /mnt

> echo 'en_GB.UTF-8' > /etc/default/locale

> pacman -Sy networkmanager grub

For legacy:

> grub-install --target=i386-pc /dev/sda

For EFI:

> sudo pacman -S efibootmgr

> mkdir /boot/efi

> grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB --remmovable

> grub-mkconfig -o /boot/grub/grub.cfg

set local time

> ln -sf /usr/share/zoneinfo/Europe/Belgrade /etc/localtime

Find the desired locale's and uncomment them.

> vi /etc/locale.gen

> locale-gen

Make your keyboard changes permenent with:

> vi /etc/vconsole.conf

Then set: `KEYMAP=uk.map.gz`
unsure about this bit - is this name just for the loadkeys function?

Make a hostname

> echo pc > /etc/hostname

Set hostnames for network, or at least your own.

> vi /etc/hosts

# This should have the following, at least:

127.0.0.1	localhost
::1		localhost
127.0.1.1	[hostname].localdomain [hostname]

If the system has a permanent IP address, it should be used instead of localhost.

Ping some sites to make sure the network's working

> passwd

> exit

> umount -R /mnt

Remove retarded beep sound:

> sudo echo "blacklist pcspkr" >> /etc/modprobe.d/nobeep.conf

> rmmod pcspkr

# Fonts

sudo pacman -S ttf-hack ttf-font-awesome ttf-fira-mono
