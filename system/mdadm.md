---
title: "mdadm"
tags: [ "RAID" ]
---
# RAID5

You will need 4 disks and the `mdadm` package.
The total size will be equal to the disks x 3, because one will be used for redundancy.

```bash
sudo mdadm --create --verbose /dev/*md127* --level=5 --raid-devices=*4* */dev/sdb /dev/sdc /dev/sdd /dev/sde*
```

Note the variable parts:

- The name of the device could be `/dev/md12` or whatever
- The number of devices could be larger, but must be at least 4 for raid 5
- We end by listing all devices in the new `md` device.

Now look at how the raid status:

```bash
cat /proc/mdstat
```

This will increase until the entire thing is fine.

Check the health of your `mdadm` array:

```bash
sudo mdadm --detail /dev/md127
```

You should see `State : clean`. If you see it is `degraded`, then a disk has broken.

## Replacing a Disk

```bash
sudo mdadm --add /dev/md127 /dev/sdb1
```

