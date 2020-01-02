# FDisk Basics

> sudo fdisk /dev/sda

- m for help.

- n to make a partition.

- t to mark the partition type (see IDs below).

- w to write the changes to the disk.

Note the asterisk marking the boot partition.


# IDs

| ID | Meaning |
|----|:--------|
|83  |Linux    |
| 5  |Extended |
| 82 |Swap     |

fdisk will not help with a GPT formatted drive.  For this, use gdisk, which is mostly the same.

Now that we have a partition, we can make it into a filesystem.  Most will use:

> sudo mkfs -t ext4 /dev/sdc1

or if you're making a swap partition, you can use:

> sudo mkswap /dev/sdb2

or for the reiser filesystem, we can use:

> sudo mkreiserfs /dev/sdc2

# File System Types

| Type | Advantages | Disadvantages |
|------|:-----------|:--------------|
|ext2  |            |No journaling means that the file offers no crash recovery.
|ext3  | Journaling | 
|ext4  | Journaling and handles files of up to 16TB.| 
|reiserfs| Journalin and stable.|
|btrfs |Reliable and stable| 
|XFS   |Journaling, great for large files.| 
|VFAT  |Comptable with Windows, like FAT32| 

# Parted

> sudo parted /dev/sdb


# Monitoring
Look at physical and virtual partitions:

> df -h

or  divide things by inode - the thing which records where files are?

> df -i

Examine a filesystem with:

> sudo dumpe2fs /dev/sda1 | less

# Prevention
There are multiple programs which work mostly the same way.

> sudo tune2fs -c 30 /dev/sda1

This will check sda1 every 30 boots.  It can also be checked every month.

> sudo tune2fs -i 1m /dev/sda1

This thing can also make a new label for the system:

> sudo tune2fs -L new_name /dev/sdb3

# Repair
Start by unmounting the filesystem.

> sudo umount /dev/sdc1

Then it's time to check. 

> sudo fsck /dev/sdc1

And possibly repair damage:

> e2fsck -p /dev/sdc1


or the same with:

> sudo debugfs /dev/sdc1

# Mounting
You can mount with a specified filetype with:

> sudo mount -t ext3 /dev/sdc2 /mnt/stick

or if you don't know the type, just try the lot:

> sudo mount -a /dev/sdc1 /mnt/stick

# File Systems
xfs and zfs can only be expanded.

# Shrink Filesystem

NB: When I followed these instructions, the process destroyed my data. Seemed fine on the YouTube video.

Check the filesystem's health:

> sudo e2fsck -f /dev/sdb1

Resize the file system to something smaller than what you want, so here I want 500G and so I resize to 450 G.

> resize2fs /dev/sdb1 450G

Then delete the partition with either gdisk or fdisk, depending upon the layout.

> sudo fdisk /dev/sdb

> d

Then make a new filesystem of the desired type with:

> n

And finally resize to the full size you want:

sudo resize2fs /dev/sdb1

And then check your disk again with e2fsck.

(The e2fsck saved my disk in the end, YMMV)


# Logical Volume

Let's start with names.  PV = 'Physical Volume', VG = 'Volume Group', and LV = 'Logical Volume'.

Now we can create a volume group out of sdb2 and sdc3:

> sudo vgcreate my-new-vg /dev/sdb2 /dev/sdc3

Then make a new logical volume out of the volume group:

> sudo lvcreate -n my-new-lv my-new-vg

Then have a look at all logical volumes:

> sudo lvscan


