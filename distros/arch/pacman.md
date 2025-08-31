---
title: "pacman"
tags: [ "distros" ]
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

```sh
sudo pacman -Rn <package_name> #removing the package
```

## Cleaning Config Files

Arch does not overwrite your changes to configuration files.
Instead, it updates them by adding the `.pacnew` suffix.

So when `/etc/pacman.conf` receives an update, this will be placed in `/etc/pacman.conf.pacnew`.
These changes must be merge manually.

Install the `pacdiff` tool to make this easier, from the `pacman-contrib` package, then simply run `sudo pacdiff` to sort through the various mergers.


# AUR helpers (yay, paru,..)

Installing helper can be done by cloning and building that package from AUR repository, to avoid doing that manually and to automate updating, we use helpers.

Building Yay:
```sh
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

Flags are mostly the same as in pacman
But running yay without flags will do the update like `yay -Syu` and with package name it will search packages in aur and pacman repos, and let you choose which to install

```sh
yay <search_term>
``` 


Building the package can usually take some time, and after the build it will ask for sudo password, if afk installation will fail, to avoid this you can use the flag `--sudoloop` and enter the sudo password initially and it will loop it untill finishing the installation, to avoid answering all of the installation question `--noconfirm` can be used 
```sh 
yay -S --noconfirm --sudoloop <package_name>
```



## Pacman and yay text coloring

Getting the colors is done by editing the `/etc/pacman.conf` and uncommenting the line `Color`
By adding the line `ILoveCandy` you will unlock soem terminal animations, like one pacman eating the dots while installing some package

