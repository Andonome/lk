---
title: "ssh tricks"
tags: [ "Documentation", "Networking", "ssh", "tricks" ]
---

Mount a remote filesystem locally with fuse-sshfs:

```bash
sshfs *user*@192.168.0.10:/home/*user* /tmp/mnt
```

Unmount with:

```bash
fusermount -u /tmp/mnt
```

Set it up on /etc/fstab with:

```bash
sshfs#bkp@bkp.a-server.ninja:/media/store1/bkp /backup fuse defaults,allow_other,reconnect,delay_connect 0 0
```

Make image backup of sda1 and sda2 from one machine and pass it through ssh to another.

```bash
for i in {1,2};do sudo dd if=/dev/sda$i | ssh -C *user*@192.168.0.10 "dd of=/mnt/Backup/winback-oct-\"$i\".img" status=progress; done
```

