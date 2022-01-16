---
title: "kernel"
tags: [ "Documentation", "system" ]
---
Check which kernet modules are loaded into memory

> sudo /sbin/lsmod 

Check which virtual box modules are loaded into memory

> sudo /sbin/lsmod | grep vbox 

Virtual box is using vboxpci, vboxnetadp, vboxnetflt, vboxdr.

Look at what's claiming wifi:

> sudo lshw -C network

If this shows that the device is 'unclaimed' then it's time to add a module, e.g. ath9k.

> sudo modprobe ath9k

Modules can also be 'restarted' by removing and adding them, e.g. the video module, 'uvcvideo':

> sudo rmmod uvcvideo

> sudo modprobe uvcvideo


