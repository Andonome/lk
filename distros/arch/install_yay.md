---
title: "Install yay"
tags: [ "distros", "arch" ]
requirements: [ "pacman" ]
---

```sh
pacman --sync --noconfirm --needed base-devel gcc git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

The flags are mostly the same as in `pacman`.
But running `yay` without flags will do the update like `yay -Syu` and with package name it will search packages in the AUR and `pacman` repos, and let you choose which to install.

```sh
yay <search_term>
``` 

Building the package can usually take some time, and after the build it will ask for the `sudo` password.
If you leave, the installation will fail.
To avoid this, you can use the flag `--sudoloop` and enter the sudo password initially and it will loop it until the installation is finished.

```sh 
yay -S --noconfirm --sudoloop <package_name>
```

