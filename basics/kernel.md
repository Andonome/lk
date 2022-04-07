---
title: "kernel"
tags: [ "Documentation", "Basics" ]
---
## Living Space

Kernel modules live in lib/modules/$(uname -r)

## Change

Load them with

> sudo modprobe ath9k

Or remove one with

> sudo modprove uvcvideo

The PC's irritating speaker beep can be really annoying. Disable it with:

> sudo modprobe -r pcspeaker

Permanently disable a module by blacklisting it in `/etc/modprobe.d`:

> echo 'blacklist pcspkr' > /etc/modprobe.d/*nobeep*.conf

