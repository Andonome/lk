---
title: "Install Arch"
tags: [ "arch" ]
requires: [ "partitions", "time" ]
---
Keyboard layout changed.

```sh
ls /usr/share/kbd/keymaps/**/*.map.gz
```

```sh
loadkeys uk.map.gz
```

Check if boot mode is UEFI

```sh
ls /sys/firmware/efi/efivars
```

Without efivars, the system must boot with BIOS.

# Check network's up

```sh
ping archlinux.org
```

Set system clock properly

```sh
timedatectl set-ntp true
```

Check disks

```sh
lsblk
```

Make partition

```sh
parted -s /dev/sda mklabel gpt
```

```sh
parted -s /dev/sda mklabel msdos
```

```sh
parted  -s /dev/sda mkpart primary ext4 512 100%
```

```sh
parted -s /dev/sda set 1 boot on
```

```sh
mkfs.ext4 /dev/sda1
```

Use pacstrap to get the base install.

```sh
mount /dev/sda1 /mnt/
```

```sh
pacstrap /mnt base base-devel vim linux linux-firmware
```

Make fstab notes for new system.

```sh
genfstab -U /mnt >> /mnt/etc/fstab
```

```sh
arch-chroot /mnt
```

```sh
echo 'en_GB.UTF-8' > /etc/default/locale
```

```sh
pacman -Sy networkmanager grub
```

For legacy:

```sh
grub-install --target=i386-pc /dev/sda
```

For EFI:

```sh
sudo pacman -S efibootmgr
```

```sh
mkdir /boot/efi
```

```sh
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB --remmovable
```

```sh
grub-mkconfig -o /boot/grub/grub.cfg
```

set local time

```sh
ln -sf /usr/share/zoneinfo/Europe/Belgrade /etc/localtime
```

Find the desired locale's and uncomment them.

```sh
vi /etc/locale.gen
```

```sh
locale-gen
```

Make your keyboard changes permanent with:

```sh
vi /etc/vconsole.conf
```

Then set: `KEYMAP=uk.map.gz`
unsure about this bit - is this name just for the loadkeys function?

Make a hostname

```sh
echo pc > /etc/hostname
```

Set hostnames for network, or at least your own.

```sh
vi /etc/hosts
```

# This should have the following, at least:

127.0.0.1	localhost
::1		localhost
127.0.1.1	[hostname].localdomain [hostname]

If the system has a permanent IP address, it should be used instead of localhost.

Ping some sites to make sure the network's working

```sh
passwd
```

```sh
exit
```

```sh
umount -R /mnt
```

Remove that awful beep sound:

```sh
rmmod pcspkr
```

...and make the change permanent:

```sh
sudo echo "blacklist pcspkr" >> /etc/modprobe.d/nobeep.conf
```

