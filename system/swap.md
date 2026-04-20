---
title: swap
tags: 
- system
---
# Making a Swap File

```sh
su root
cd /var/cache/
dd if=/dev/zero of=swapfile bs=1K count=4M
```

This creates a swapfile of (1k x 4M) 4 Gigs.
Change 4M to XM for an XGig swap.

```sh
chmod 600 swapfile
```

```sh
mkswap swapfile
```

```sh
swapon swapfile
```

Test it's working with top

```sh
top -bn1 | grep -i swap
```

or:

```sh
echo "/var/cache/swapfile none swap sw 0 0" | tee -a /etc/fstab
```

Test it'll work at boot with:

```sh
swapoff swapfile
```

```sh
swapon -va
```

# Partition Swaps

Put this in /etc/fstab:

> UUID=blah-blah none swap sw 0 0

Then test it works with:

```sh
swapon -va
```

Test other partitions in fstab with:

```sh
mount -a
```

