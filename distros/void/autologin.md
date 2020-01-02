
Make the autologin service:

> cp -R /etc/sv/agetty-tty1 /etc/sv/agetty-autologin-tty1

> echo "GETTY_ARGS="--autologin yourusernamehere --noclear"
> BAUD_RATE=38400
> TERM_NAME=linux" > /etc/sv/agetty-autologin-tty1/conf

> rm /var/service/agetty-tty1
> ln -s /etc/sv/agetty-autologin-tty1 /var/service

Then stick this at the end of the bashrc:

```
# autologin on tty1
 if [ -z "$DISPLAY" ] && [ "$(fgconsole)" -eq 1 ]; then
 exec startx
 fi

```
