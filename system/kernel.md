---
title: "kernel"
tags: [ "System" ]
---
Check which kernet modules are loaded into memory

```bash
sudo /sbin/lsmod 
```

Check which virtual box modules are loaded into memory

```bash
sudo /sbin/lsmod | grep vbox 
```

Virtual box is using vboxpci, vboxnetadp, vboxnetflt, vboxdr.

Look at what's claiming wifi:

```bash
sudo lshw -C network
```

If this shows that the device is 'unclaimed' then it's time to add a module, e.g. ath9k.

```bash
sudo modprobe ath9k
```

Modules can also be 'restarted' by removing and adding them, e.g. the video module, 'uvcvideo':

```bash
sudo rmmod uvcvideo
```

```bash
sudo modprobe uvcvideo
```


