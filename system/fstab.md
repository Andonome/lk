---
title: "fstab"
tags: [ "Documentation", "System" ]
---
# Basics

The ordering of `/etc/fstab` is

1. disk
2. mount point
3. filesystem type
4. options
5. dump
6. pass


*Example:*

```
UUID=877f14e8-4738-46b0-884f-ba330dad1a7d       /mnt/biggie                     ext4        nofail,rw,relatime      0 2

UUID=B21648C416488AF5 /mnt/share ntfs       nofail,rw,nosuid,nodev,user_id=0,group_id=0,allow_other,blksize=4096 0 0
```

## 5: Dump

Ignore this obsolete option.

## 6: Pass

| Number | Meaning               |
|        |                       |
|   0    | Swap (or not mounted) |
|   1    | Mount at /            |
|   2    | Mount somewhere else  |

## Options

- `nofail` means the computer will not fail to boot, even if the drive fails, or is unplugged. It's a good option for everything except `/`.
- noauto means 'don't mount on boot' (but you can still mount with `mount -a`).

