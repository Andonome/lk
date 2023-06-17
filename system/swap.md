---
title: "swap"
tags: [ "Documentation", "basics" ]
---
# Making a Swap File

```bash
cd /var/cache/
```

```bash
sudo dd if=/dev/zero of=swapfile bs=1K count=4M
```

This creates a swapfile of (1k x 4M) 4 Gigs.
Change 4M to XM for an XGig swap.

```bash
sudo chmod 600 swapfile
```

```bash
sudo mkswap swapfile
```

```bash
sudo swapon swapfile
```

Test it's working with top

```bash
top -bn1 | grep -i swap
```

or:

```bash
echo "/var/cache/swapfile none swap sw 0 0" | sudo tee -a /etc/fstab
```

Test it'll work at boot with:

```bash
sudo swapoff swapfile
```

```bash
sudo swapon -va
```

# Partition Swaps

Put this in /etc/fstab:

> UUID=blah-blah none swap sw 0 0

Then test it works with:

```bash
sudo swapon -va
```

Test other partitions in fstab with:

```bash
sudo mount -a
```

