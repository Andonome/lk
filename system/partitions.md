---
title: "partitions"
tags: [ "Documentation", "System" ]
---
# FDisk Basics

```bash
sudo fdisk /dev/sda
```

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

Now that we have a partition, we can make it into a fileSystem.  Most will use:

```bash
sudo mkfs -t ext4 /dev/sdc1
```

or if you're making a swap partition, you can use:

```bash
sudo mkswap /dev/sdb2
```

or for the reiser fileSystem, we can use:

```bash
sudo mkreiserfs /dev/sdc2
```

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

```bash
sudo parted /dev/sdb
```


# Monitoring
Look at physical and virtual partitions:

```bash
df -h
```

or  divide things by inode - the thing which records where files are?

```bash
df -i
```

Examine a fileSystem with:

```bash
sudo dumpe2fs /dev/sda1 | less
```

# Prevention
There are multiple programs which work mostly the same way.

```bash
sudo tune2fs -c 30 /dev/sda1
```

This will check sda1 every 30 boots.  It can also be checked every month.

```bash
sudo tune2fs -i 1m /dev/sda1
```

This thing can also make a new label for the System:

```bash
sudo tune2fs -L new_name /dev/sdb3
```

# Repair
Start by unmounting the fileSystem.

```bash
sudo umount /dev/sdc1
```

Then it's time to check. 

```bash
sudo fsck /dev/sdc1
```

And possibly repair damage:

```bash
e2fsck -p /dev/sdc1
```


or the same with:

```bash
sudo debugfs /dev/sdc1
```

# Mounting
You can mount with a specified filetype with:

```bash
sudo mount -t ext3 /dev/sdc2 /mnt/stick
```

or if you don't know the type, just try the lot:

```bash
sudo mount -a /dev/sdc1 /mnt/stick
```

# File Systems
xfs and zfs can only be expanded.

# Shrink FileSystem

NB: When I followed these instructions, the process destroyed my data. Seemed fine on the YouTube video.

Check the fileSystem's health:

```bash
sudo e2fsck -f /dev/sdb1
```

Resize the file System to something smaller than what you want, so here I want 500G and so I resize to 450 G.

```bash
resize2fs /dev/sdb1 450G
```

Then delete the partition with either gdisk or fdisk, depending upon the layout.

```bash
sudo fdisk /dev/sdb
```

```bash
d
```

Then make a new fileSystem of the desired type with:

```bash
n
```

And finally resize to the full size you want:

sudo resize2fs /dev/sdb1

And then check your disk again with e2fsck.

(The e2fsck saved my disk in the end, YMMV)


# Logical Volume

Let's start with names.  PV = 'Physical Volume', VG = 'Volume Group', and LV = 'Logical Volume'.

Now we can create a volume group out of sdb2 and sdc3:

```bash
sudo vgcreate my-new-vg /dev/sdb2 /dev/sdc3
```

Then make a new logical volume out of the volume group:

```bash
sudo lvcreate -n my-new-lv my-new-vg
```

Then have a look at all logical volumes:

```bash
sudo lvscan
```


