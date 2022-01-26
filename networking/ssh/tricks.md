---
title: "tricks"
tags: [ "Documentation", "Networking" ]
---

Mount a remote filesystem locally with fuse-sshfs:

> sshfs ghost@192.168.0.10:/home/ghost /tmp/mnt

Unmount with:

> fusermount -u /tmp/mnt

Set it up on /etc/fstab with:

> sshfs#bkp@bkp.a-server.ninja:/media/store1/bkp /backup fuse defaults,allow_other,reconnect,delay_connect 0 0

Make image backup of sda1 and sda2 from one machine and pass it through ssh to another.

> for i in {1,2};do sudo dd if=/dev/sda$i | ssh -C ghost@192.168.0.10 "dd of=/mnt/Biggie/Backup/winback-oct-\"$i\".img" status=progress; done

