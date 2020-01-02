# Initial Setup
<!-- modified since testing
-->

Some of this needs executed as root, so it's probably easier to do the whole things as root.

> fdisk /dev/sdX

o,n,t,c

> mkfs.vfat /dev/sdX1
> mkdir boot
> mount /dev/sdX1 boot

Create and mount the ext4 filesystem:

> mkfs.ext4 /dev/sdX2
> mkdir root
> mount /dev/sdX2 root

Download and extract the root filesystem (as root, not via sudo):

> wget http://archlinuxarm.org/os/ArchLinuxARM-rpi-3-latest.tar.gz

> tar zxvf ArchLinuxARM-rpi-3-latest.tar.gz -C root

> sync

Move boot files to the first partition:

> mv root/boot/* boot
> Unmount the two partitions:
> umount boot root

echo belgradecats > /etc/hostname
echo "# /etc/hosts: static lookup table for host names


```

<ip-address>		<hostname.domain.org>	<hostname>
127.0.0.1		belgradecats.localdomain	belgradecats
::1			belgradecats.localdomain	belgradecats ip6-localhost

```

# End of file" > /etc/hosts

# Get audio on

echo dtparam=audio=on >> /boot/config.txt

pacman-key --init
pacman-key --populate archlinuxarm

pacman -Syyu base-devel git alsa-utils xf86-video-fbdev 

timedatectl set-timezone Europe/Belgrade

