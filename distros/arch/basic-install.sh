
Commands not preceded with # or $ are lines in config files.

Keyboard layout changed.

ls /usr/share/kbd/keymaps/**/*.map.gz

loadkeys uk.map.gz

Check if boot mode is UEFI

ls /sys/firmware/efi/efivars

Without efivars, the system must boot with BIOS.

Check network is up

> ping archlinux.org

Set system clock properly

> timedatectl set-ntp true

Check disks

> lsblk

Make partition

> fdisk -l

- Boot: 200M

- Swap: 12G???

- \/: 15G

- Home: The rest

parted alternative:

> mklabel gpt

> mkpart ESP fat32 1MiB 200MiB

> set 1 boot on

> name 1 efi

Use pacstrap to get the base install.

> mount /dev/sda3 /mnt/
> mkdir /mnt/home
> mkdir /mnt/boot
> mount /dev/sda3 /mnt/home
> mount /dev/sda1 /mnt/boot

> pacstrap /mnt base base-devel vim

Make fstab notes for new system.

> genfstab -U /mnt >> /mnt/etc/fstab

> arch-chroot /mnt

echo 'en_GB.UTF-8' > /etc/default/locale

pacman -Sy networkmanager grub

> grub-install --target=i386-pc /dev/sda

> grub-mkconfig -o /boot/grub/grub.cfg

set local time

> ln -sf /usr/share/zoneinfo/Europe/Belgrade /etc/localtime

Find the desired locale's and uncomment them.

> vi /etc/locale.gen

> locale-gen

Mkae your keyboard changes permenent with:

> vi /etc/vconsole.conf

then set: `KEYMAP=uk.map.gz`

Make a hostname

> vi /etc/hostname

This should have the following:

```

::1		localhost
127.0.1.1	[hostname].localdomain [hostname]

```

If the system has a permanent IP address, it should be used instead of localhost.
Ping some sites to make sure the network's working

> passwd

> exit

> umount -R /mnt

Remove retarded beep sound

> # echo "blacklist pcspkr" > /etc/modprobe.d/nobeep.conf

> rmmod pcspkr

## Fonts

> sudo pacman -S ttf-hack ttf-font-awesome ttf-fira-mono

