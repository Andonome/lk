---
title: pacman - Extras
tags: 
- distros
requires: 
- distros/arch/pacman.md
---

## Unattended Actions

```sh
pacman -Syu --noconfirm
```

## `pacman` and `yay` Text Colouring

Getting the colors is done by editing the `/etc/pacman.conf` and uncommenting the line `Color`.

By adding the line `ILoveCandy` you will unlock some terminal animations, like pacman eating dots while installing some package.

## Timid Installations

Want to try out software, but not sure if you want to keep it?
You can tell `pacman` that this is a dependency for another package:


```sh
pacman -S --noconfirm --asdeps ${weird_music_player}
```

When you [remove orphaned packages](pacman.md), the package will be automatically uninstalled.
