---
title: Arch Maintenance
tags: 
- arch
requirements: [ "pacman" ]
---

# Package Cache

Clean the cache of old packages in `/var/cachepacman/pkg/`:

```sh
ls /var/cache/pacman/pkg/ | wc -l
sudo pacman -Sc
ls /var/cache/pacman/pkg/ | wc -l
```
# New Configs

If you chance a configuration file, such as `/etc/environment`, and `pacman` wants to update the file, it will place `/etc/environment.pacnew`.

Check the new files, then look at the difference between the `pacman` version, and your version.

```sh
sudo find /etc/ /var/ /usr/ -name "*.pacnew" 
diff /etc/pacman.d/mirrorlist*
```

Either,

- Update the files manually,

```sh
sudo -e /etc/pacman.d/mirrorlist
sudo rm /etc/pacman.d/mirrorlist.pacnew
```

Or use a tool like `pacdiff` to view the changes next to each other, and select them with `vim`.

```sh
sudo pacman -S pacman-contrib
sudo pacdiff
```

