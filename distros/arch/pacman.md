---
title: "pacman"
tags: [ "Documentation", "distros" ]
---

Packages are kept in /var/cache/pacman/pkg.

Delete unused old packages with:

> sudo pacman -Sc

Signatures are handled by the pacman-key, initially set up with:

> sudo pacman-key --populate archlinux

And refreshed with:

sudo pacman-key --refresh-keys

If you have usigned keys, you can refresh with:

> sudo pacman -Sc

or 

> sudo pacman -Scc

Reset all keys with:

> sudo rm -r /etc/pacmand.d/gnupg/ && sudo pacman-key --init

If you're constantly getting 'everything corrupted, nothing upgraded', try running:

> sudo pacman -S archlinux-keyring

List all orphaned packages:

> sudo pacman -Qtdq

## Cleaning Config Files

Arch does not overwrite your changes to configuration files.
Instead, it updates them by adding the `.pacnew` suffix.

So when `/etc/pacman.conf` receives an update, this will be placed in `/etc/pacman.conf.pacnew`.
These changes must be merge manually.

Install the `pacdiff` tool to make this easier, from the `pacman-contrib` package, then simply run `sudo pacdiff` to sort through the various mergers.

