---
title: "autologin"
tags: [ "Documentation", "distros" ]
---

Make the autologin service:

> cp -R /etc/sv/agetty-tty1 /etc/sv/agetty-autologin-tty1

```

if [ -x /sbin/agetty -o -x /bin/agetty ]; then
        # util-linux specific settings
        if [ "${tty}" = "tty1" ]; then
                GETTY_ARGS="--noclear"
        fi  
fi

GETTY_ARGS="--autologin [ your username ] --noclear"
BAUD_RATE=38400
TERM_NAME=linux

```

Then stick this at the end of the bashrc:

```
# autologin on tty1
 if [ -z "$DISPLAY" ] && [ "$(fgconsole)" -eq 1 ]; then
 exec startx
 fi

```
