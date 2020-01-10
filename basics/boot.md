# Basic Startup

BIOS > MBR > GRUB > Kernel > Init > Run Level

- The BIOS identifies system hardware.

- The Master Boot Record contains partition and filesystem data.

- The Grand Unified Bootloader executes the kernel.

- The Init Executes designates run level (via SysVinit, Upstart, or Systemd).

- Run Level starts the user's session.

The Master Boot Record is a 512 byte file called boot.img which starts the first sectore of core.img into memory (GRUB Stage 1.5), which then executes /boot/grub.

# Access system

Ctrl+c at boot then add in

> rw init=bash

# Run Levels

	0: Half
	1: Single user mode
	2: Multi-user, without NFS
	3: Full multi-user mode
	4: Unused
	5: X11
	6: Reboot

None of this is used by humans anymore - it's all systemd.

# Boot Records

'File System Tab' under /etc/fstab keeps track of the partitions and boot order.

The logical voluem manager (LVM) can make non-hardware partitions.

The nomenclature is:

- PV = physical volume

- LV = logical volume

- VG = volume group

# Volume Groups

> sudo vgcreate work-volume /dev/sdb2 /dev/sdb4

This creates the volume group 'work-volume', consisting in sdb2 and sdb4.

Now you ahve a volume group, you can use it as part of a new logical volume.

> sudo lvcreate -n noob-lv work-volume

Then scan for all logical volumes on the system with lvscan.

> sudo lvscan

# GRUB

Install a grub with either:

> sudo grub-install /dev/sda

or

> sudo grub2-install /dev/sda

This takes all settings from /etc/fstab.

Then when done editing settings update the script in /boot/grub/grub.cfg (in Debian) or /boot/boot/grub/menu (in other systems).

There are default examples in /etc/grub.d/ (but not on Ubuntu).

Finalize your settings with grub-mkconfig (or grub2-mkconfig), or update-grub.

# Cowardice

If you can't do that, use boot-repair:

> help.ubuntu.com/community/Boot-Repair

