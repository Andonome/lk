---
title: Setup Virtualbox
tags: 
- system
- setup
- virtualization
requires: 
- system/groups.md
---

Load the modules (or just reboot):

```sh
su root
modprobe vboxdrv
vboxreload
```

Make dd image into vdi

```sh
VBoxManage convertdd base.dd output.vdi --format VDI
```

If this doesn't work, try to make a new bite size with just

```sh
sudo dd if=image.dd of=image2.dd bs=512 conv=sync
```

## Arch Linux

```sh
pacman -S virtualbox-host-modules-arch virtualbox-guest-iso
```

# CLI Management

List boxes:

```sh
VBoxManage list vms
```

Start a headless instance

```sh
VBoxManage startvm "rata" --type headless
```

To pause the machine:

```sh
VBoxManage controlvm "rata" pause --type headless
```

You can do a number of things to the 'virtual boxes' this way:

- `startvm`
- `pause`
- `resume`
- `poweroff`

## Creating Disks

Creating a VM requires registering it:

```sh
VBoxManage createvm --name Ubuntu19.04 --register --ostype Ubuntu
```

```sh
VBoxManage modifyvm Ubuntu19.04 --memory 1042
```

```sh
VBoxManage storagectl Ubuntu19.04 -name IDE --add ide --controller PIIX4  --bootable on
```

Create just a disk with:

```sh
VBoxManage createhd --filename "$diskname" --size 5120
```

