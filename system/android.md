---
title: android
tags: 
- system
- phone
---
# mtpfs

## Start

Install:

```sh
yay -S simple-mtpfs
```

List available phones:

```sh
simple-mtpfs -l
```

Make a mount point:

```sh
mkdir phone
```

Check your phone, and tell it to allow access to the USB.

```sh
simple-mtpfs --device 1 phone
```

## Stop

```sh
fusermount -u phone
rmdir phone
```


