# Setup

## Arch Linux

> sudo pacman -S virtualbox-host-modules-arch virtualbox-guest-iso

> sudo modprobe vboxdrv

> # vboxreload

# Make dd image into vdi

> VBoxManage convertdd base.dd output.vdi --format VDI

If this doesn't work, try to make a new bite size with just

> sudo dd if=image.dd of=image2.dd bs=512 conv=sync

# CLI Management

List boxes:

> VBoxManage list vms

Start a headless instance

> VBoxManage startvm "rata" --type headless

To pause the machine:

> VBoxManage controlvm "rata" pause --type headless

You can do a number of things to virtualboxes this way:

- startvm

- pause

- resume

- poweroff

# Creating Disks

Creating a VM requires registering it:

> VBoxManage createvm --name Ubuntu19.04 --register  --ostype Ubuntu

> VBoxManage modifyvm Ubuntu19.04 --memory 1042

> VBoxManage storagectl Ubuntu19.04 -name IDE --add ide --controller PIIX4  --bootable on

Create just a disk with:

VBoxManageg createhd --filename Ubuntu16.04 --size 5120


