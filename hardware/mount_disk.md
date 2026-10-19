---
title: Mount Disk
tags: 
- hardware
- basics
---

Watch the disks.

The partition with the `MOUNTPOINT` which is just `/` holds the entire 
operating system you're on, so don't mess with it.  It's probably called 
`sda3`.

```sh
watch -n 5 -d lsblk -f
```

Put the USB stick in, and it will show up with a highlight for 5 seconds 
(adjust that `-n 5` to `-n 10` if your USB ports are difficult to reach).

If disk's `FSTYPE` is `ntfs` then the USB stick was created on Windows.
You can't write to it without installing the `ntfs` package (probably called 
`ntfs-3g` or similar).

Mount the disk somewhere in `/mnt`:

```sh

target=`${/mnt/1}`
disk=/dev/sdb1

sudo mkdir "${target}"

sudo mount "${disk}" "${target}"

ls "${target}"

```

Once you're done, leave the directory where the disk is mounted, and close any 
files you have opened from the disk.

Unmount the disk:


```sh
sudo umount "${target}"
```

Once you unmount the disk, it's not actually unmounted - it's just says it has 
because it's about to.  Check that it's *really* unmounted:


```sh
sync
```

If this all goes wrong,  you can force the disk to umount early.  This might 
destroy some files on the USB stick, so best to wait a while to see if any 
problems fix themselves.


```sh
sudo umount -l "${disk}"
```


