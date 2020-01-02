#!/bin/sh

ln -s /etc/sv/ntpd /var/service

sv start ntpd

sleep 3

ntpd -q

echo 'dtparam=audio=on' >> /boot/config.txt

xbps-install -Syuv

xbps-install -Sy xorg-minimal xf86-video-fbturbo

useradd -m -G wheel,audio,video ghost

xbps-install sc-im vim cowsay lolcat-c ranger lf  bash

