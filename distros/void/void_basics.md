---
title: Void Linux Basics
tags: 
- void
---
# Updates

Update all packages with

```sh
sudo xbps-install -Su
```

See [xbps](xbps.md) for more.

# Remove old packages

Void keeps *every* version of everything you install, so you can roll back to them.
Remove old packages with:

```sh
sudo xbps-remove -O
```

# vkpurge

Old Void kernels are left on the boot partition.  List them with:

```sh
vkpurge list
```

Remove one with:

```sh
vkpurge 2.8.2_4
```

Remove all but the latest with:

```sh
vkpurge rm all
```

# Brightness

Look in `/sys/class/backlight/*/brightness`.
You can change this number to change the screen brightness.

For an easy utility, install `brightnessctl`.

```sh
brightnessctl s 10%-
brightnessctl s 10%+
```

# Other Tricks

- [autologin](autologin.md)
- [services](sv.md)
- [wifi](../../networking/wpa_supplicant.md)

