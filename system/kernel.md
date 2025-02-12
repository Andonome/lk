---
title: "kernel"
tags: [ "system" ]
---

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
