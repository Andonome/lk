
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
