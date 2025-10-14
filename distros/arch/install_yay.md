---
title: "Install yay"
tags: [ "distros", "arch" ]
requirements: [ "pacman" ]
---

```sh
pacman --sync --noconfirm --needed base-devel gcc git
git clone https://aur.archlinux.org/yay.git /tmp/yay
makepkg -C !$ -si
```
