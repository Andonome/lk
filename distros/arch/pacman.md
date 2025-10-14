---
title: "pacman"
tags: [ "distros" ]
requirements: [ "Install Arch" ]
---

Packages are kept in /var/cache/pacman/pkg.

Delete unused old packages with:

```sh
sudo pacman -Sc
```

Signatures are handled by the pacman-key, initially set up with:

```sh
sudo pacman-key --populate archlinux
```

And refreshed with:

```sh 
sudo pacman-key --refresh-keys
 ```

If you have usigned keys, you can refresh with:

```sh
sudo pacman -Sc
```

or 

```sh
sudo pacman -Scc
```

Reset all keys with:

```sh
sudo rm -r /etc/pacmand.d/gnupg/ && sudo pacman-key --init
```

If you're constantly getting 'everything corrupted, nothing upgraded', try running:

```sh
sudo pacman -S archlinux-keyring
```

List all orphaned packages:

```sh
sudo pacman -Qtdq
```

Removing a package:

```sh
sudo pacman -Rn <package_name>
```

## Cleaning Config Files

Arch does not overwrite your changes to configuration files.
Instead, it updates them by adding the `.pacnew` suffix.

So when `/etc/pacman.conf` receives an update, this will be placed in `/etc/pacman.conf.pacnew`.
These changes must be merge manually.

Install the `pacdiff` tool to make this easier, from the `pacman-contrib` package, then simply run `sudo pacdiff` to sort through the various mergers.


