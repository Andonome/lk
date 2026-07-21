---
title: autologin
tags: 
- distros
- arch
---

# Automatic Login

Edit `/etc/systemd/system/getty@tty1.service.d/override.conf` by typing:

```sh
sudo systemctl edit getty@tty1
```

The put in the following, changing `[ USER ]` to your username.

```
[Service]
ExecStart=
ExecStart=-/usr/bin/agetty --autologin [ USER ] -s %I 115200,38400,9600 vt102

```

# Automatically Start X

In `.bashrc`.

```sh
 if [ -z "$DISPLAY" ] && [ "$(fgconsole)" -eq 1 ]; then
 exec startx
 fi

```

# Faillock reset

After failing 3 times to enter the password, archlinux would ussualy lock entering the password for 10 minutes, not all apps and guis display this message, so sometimes it can be a bit confusing. To reset this lockdown, you can login as root and restart it manually with command

``` sh
failock --reset

```




