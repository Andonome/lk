#!/bin/bash

# https://www.unixmen.com/install-arch-linux-raspberry-pi/

pacman-key --init || echo init fail >> log
pacman-key --populate archlinuxarm || echo update fail >> log
pacman -Syyuu || echo update fail  >> log

sed -i s/#en_GB.UTF-8 UTF-8/en_GB.UTF-8 UTF-8/ /etc/locale.gen

echo 'LANG=en_GB.UTF-8' >> /etc/locale.conf

locale-gen

pacman -S base-devel htop ranger tmux lolcat fortune-mod git figlet rxvt-unicode task timew calcurse fail2ban
# texlive-most 
if [[ $2 == all || $1 == all ]]; then
	pacman -S nnn feh dmenu rofi xf86-video-fbdev xorg xorg-xinit xorg-server xorg-server-utils xterm
fi

# Audio
echo 'dtparam=audio=on' >> /boot/config.txt

if [[ $1 == audio ]]; then
	pacman -S alsa-utils alsa-firmware alsa-lib alsa-plugins 
fi

echo 'device_tree_param=spi=on' >> /boot/config.txt

# for a vnc viewer
if [[ $1 == vnc ]]; then
	tigervnc gcc geany i3 i3status compton feh sxiv rxvt-unicode 
fi

# Swap

cd /var/cache/swap

dd if=/dev/zero of=swapfile bs=1K count=2M

chmod 600 swapfile

mkswap swapfile

swapon swapfile

echo "/var/cache/swap/swapfile none swap sw 0 0" > /etc/fstab

# fail2ban

[ -e sshd.local ] && \
pacman -S fail2ban && \
mv sshd.local /etc/fail2ban/jail.d && \
systemctl start fail2ban
