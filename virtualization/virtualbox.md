---
title: "virtualbox"
tags: [ "System" ]
---
# Setup

## Arch Linux

```bash
sudo pacman -S virtualbox-host-modules-arch virtualbox-guest-iso
```

```bash
sudo modprobe vboxdrv
```

```bash
# vboxreload
```

Make dd image into vdi

```bash
VBoxManage convertdd base.dd output.vdi --format VDI
```

If this doesn't work, try to make a new bite size with just

```bash
sudo dd if=image.dd of=image2.dd bs=512 conv=sync
```

## CLI Management

List boxes:

```bash
VBoxManage list vms
```

Start a headless instance

```bash
VBoxManage startvm "rata" --type headless
```

To pause the machine:

```bash
VBoxManage controlvm "rata" pause --type headless
```

You can do a number of things to virtualboxes this way:

- startvm

- pause

- resume

- poweroff

## Creating Disks

Creating a VM requires registering it:

```bash
VBoxManage createvm --name Ubuntu19.04 --register  --ostype Ubuntu
```

```bash
VBoxManage modifyvm Ubuntu19.04 --memory 1042
```

```bash
VBoxManage storagectl Ubuntu19.04 -name IDE --add ide --controller PIIX4  --bootable on
```

Create just a disk with:

VBoxManageg createhd --filename Ubuntu16.04 --size 5120


