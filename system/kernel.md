---
title: kernel modules
tags: 
- system
---

Kernel modules live in lib/modules/$(uname -r)

## Change

Load them with

```sh
modprobe ath9k
```

Or remove one with

```sh
modprove uvcvideo
```

The PC's irritating speaker beep can be really annoying. Disable it with:

```sh
modprobe -r pcspeaker
```

Permanently disable a module by blacklisting it in `/etc/modprobe.d`:

```sh
echo 'blacklist pcspkr' > /etc/modprobe.d/*nobeep*.conf
```

Check which kernel modules are loaded into memory:

```sh
su root
/sbin/lsmod 
```

Check which virtual box modules are loaded into memory

```sh
/sbin/lsmod | grep vbox 
```

Virtual box is using vboxpci, vboxnetadp, vboxnetflt, vboxdr.

Look at what's claiming wifi:

```sh
lshw -C network
```

If this shows that the device is 'unclaimed' then it's time to add a module, e.g. ath9k.

```sh
modprobe ath9k
```

Modules can also be 'restarted' by removing and adding them, e.g. the video module, 'uvcvideo':

```sh
rmmod uvcvideo
```

```sh
modprobe uvcvideo
```
