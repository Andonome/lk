---
title: "users"
tags: [ "Documentation", "system" ]
---
# Automatic Login

> cp /usr/lib/systemd/system/getty@.service /etc/systemd/system/getty1@.service 

Modify the lines to look like these:

`ExecStart=-/sbin/agetty --autologin <username> --noclear %I 38400 linux`

`Type=oneshot`

`Restart=no`

In the `[Install]` section:

`Alias=getty.target.wants/getty@tty1.service`

Then enable the service:

> ln -sf /etc/systemd/system/getty1@.service /etc/systemd/system/getty.target.wants/getty@tty9.service

> systemctl start getty@tty9.service


