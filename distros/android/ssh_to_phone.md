---
title: "ssh to phone"
tags: [ "networking", "ssh", "android" ]
---

1. Install fdroid on phone.
2. Install termux.
3. Open fdroid, and run:


```sh
pkg upgrade
pkg install busybox termux-services openssh openssh-sftp-server
source $PREFIX/etc/profile.d/start-services.sh
```

`openssh-sftp-server` will mount the phone's file-system, and show you some directories in `~/storage/`.

4. Copy your PC's ssh public key to the phone's downloads or somewhere, so you can see it in `~/storage/downloads`.
5. On the phone:
    * `yes | ssh-keygen`
    * `cat $pubkey.pub >> ~/.ssh/authorized_hosts`.
    * Check its ip address with `ifconfig | grep broadcast`
    * Check the phone's username with with `whoami`
    * `sshd -D`
6. On the PC:
    * `ssh -p 8022 -l $phone_username $phone_ip`

