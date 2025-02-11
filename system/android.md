---
title: "android"
tags: [ "System", "phone" ]
---
# mtpfs

## Start

Install:

```bash
yay -S simple-mtpfs
```

List available phones:

```bash
simple-mtpfs -l
```

Make a mount point:

```bash
mkdir phone
```

Check your phone, and tell it to allow access to the USB.

```bash
simple-mtpfs --device 1 phone
```

## Stop

```bash
fusermount -u phone
rmdir phone
```


