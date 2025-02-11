---
title: "kernel"
tags: [ "Basics" ]
---
## Living Space

Kernel modules live in lib/modules/$(uname -r)

## Change

Load them with

```bash
sudo modprobe ath9k
```

Or remove one with

```bash
sudo modprove uvcvideo
```

The PC's irritating speaker beep can be really annoying. Disable it with:

```bash
sudo modprobe -r pcspeaker
```

Permanently disable a module by blacklisting it in `/etc/modprobe.d`:

```bash
echo 'blacklist pcspkr' > /etc/modprobe.d/*nobeep*.conf
```

