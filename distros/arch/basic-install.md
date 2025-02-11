---
title: "basic-install"
tags: [ "arch" ]
requires: [ "partitions", "time" ]
---
Keyboard layout changed.

```bash
ls /usr/share/kbd/keymaps/**/*.map.gz
```

```bash
loadkeys uk.map.gz
```

Check if boot mode is UEFI

```bash
ls /sys/firmware/efi/efivars
```

Without efivars, the system must boot with BIOS.

# Check network's up

```bash
ping archlinux.org
```

Set system clock properly

```bash
timedatectl set-ntp true
```

Check disks

```bash
lsblk
```

Make partition

```bash
parted -s /dev/sda mklabel gpt
```

```bash
parted -s /dev/sda mklabel msdos
```

```bash
parted  -s /dev/sda mkpart primary ext4 512 100%
```

```bash
parted -s /dev/sda set 1 boot on
```

```bash
mkfs.ext4 /dev/sda1
```

Use pacstrap to get the base install.

```bash
mount /dev/sda1 /mnt/
```

```bash
pacstrap /mnt base base-devel vim linux linux-firmware
```

Make fstab notes for new system.

```bash
genfstab -U /mnt >> /mnt/etc/fstab
```

```bash
arch-chroot /mnt
```

```bash
echo 'en_GB.UTF-8' > /etc/default/locale
```

```bash
pacman -Sy networkmanager grub
```

For legacy:

```bash
grub-install --target=i386-pc /dev/sda
```

For EFI:

```bash
sudo pacman -S efibootmgr
```

```bash
mkdir /boot/efi
```

```bash
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB --remmovable
```

```bash
grub-mkconfig -o /boot/grub/grub.cfg
```

set local time

```bash
ln -sf /usr/share/zoneinfo/Europe/Belgrade /etc/localtime
```

Find the desired locale's and uncomment them.

```bash
vi /etc/locale.gen
```

```bash
locale-gen
```

Make your keyboard changes permenent with:

```bash
vi /etc/vconsole.conf
```

Then set: `KEYMAP=uk.map.gz`
unsure about this bit - is this name just for the loadkeys function?

Make a hostname

```bash
echo pc > /etc/hostname
```

Set hostnames for network, or at least your own.

```bash
vi /etc/hosts
```

# This should have the following, at least:

127.0.0.1	localhost
::1		localhost
127.0.1.1	[hostname].localdomain [hostname]

If the system has a permanent IP address, it should be used instead of localhost.

Ping some sites to make sure the network's working

```bash
passwd
```

```bash
exit
```

```bash
umount -R /mnt
```

Remove that awful beep sound:

```bash
rmmod pcspkr
```

...and make the change permanent:

```bash
sudo echo "blacklist pcspkr" >> /etc/modprobe.d/nobeep.conf
```

