# RAID5

You will need 4 disks and the `mdadm` package.
The total size will be equal to the disks x 3, because one will be used for redundancy.

> sudo mdadm --create --verbose /dev/*md127* --level=5 --raid-devices=*4* */dev/sdb /dev/sdc /dev/sdd /dev/sde*

Note the variable parts:

- The name of the device could be `/dev/md12` or whatever
- The number of devices could be larger, but must be at least 4 for raid 5
- We end by listing all devices in the new `md` device.

Now look at how the raid status:

> cat /proc/mdstat

This will increase until the entire thing is fine.

Check the health of your `mdadm` array:

> sudo mdadm --detail /dev/md127

You should see `State : clean`. If you see it is `degraded`, then a disk has broken.

## Replacing a Disk

First, prepare the disk with both a gpt partition table, and a partition:

> sudo parted --script /dev/sdb mklabel gpt mkpart primary 1MiB -2048s

Add the appropriate file system to it, e.g.:

> sudo mkfs.ext4 /dev/sdb1

Then finally, add the disk:

> sudo mdadm --add /dev/md127 /dev/sdb1


