---
title: "android"
tags: [ "Documentation", "System" ]
---
# mtpfs

## Start

Install:

> yay -S simple-mtpfs

List available phones:

> simple-mtpfs -l

Make a mount point:

> mkdir phone

Check your phone, and tell it to allow access to the USB.

> simple-mtpfs --device 1 phone

## Stop

> fusermount -u phone

rmdir phone


