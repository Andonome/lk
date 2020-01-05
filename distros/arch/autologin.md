# Automatic Login

Edit /etc/systemd/syste/getty@tty1.service.d/override.conf by typing:

> sudo systemctl edit getty@tty1

The put in the following, changing $USER to your username.

```

[Service]
ExecStart=
ExecStart=-/usr/bin/agetty --autologin $USER -s %I 115200,38400,9600 vt102

```

# Automatically Start X

In `bashrc`.

```

 if [ -z "$DISPLAY" ] && [ "$(fgconsole)" -eq 1 ]; then
 exec startx
 fi

```
