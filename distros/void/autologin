# Automatic Login On TTY1

Create a new autologin service:

> cp -R /etc/sv/agetty-tty1 /etc/sv/agetty-autologin-tty1

Note: The name of the custom service file must end with -tty1 (or another valid port). Otherwise the run-script will not work.

> vim /etc/sv/agetty-autologin-tty1/conf:

```

 GETTY_ARGS="--autologin yourusernamehere --noclear"
 BAUD_RATE=38400
 TERM_NAME=linux

```

If you are logged in on tty1 right now, logout, switch to tty2 (with CTRL+ALT+F2) and re-login there.

Disable the regular tty1 service and enable autologin:

> rm /var/service/agetty-tty1

> ln -s /etc/sv/agetty-autologin-tty1 /var/service

Now switch to tty1 and you should already be logged in there automatically.

Autostart Graphical Environment on Login

Add the following to your shell's profile file to start X and lock the tty session:

# Autologin on tty1

In `bashrc`.

```

 if [ -z "$DISPLAY" ] && [ "$(fgconsole)" -eq 1 ]; then
 exec startx
 fi

```
