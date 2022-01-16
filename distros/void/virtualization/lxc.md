---
title: "lxc"
tags: [ "Documentation", "distros" ]
---

LXC creates miniature virtual machines to play with.

# Configuration

## Templates

On Void you can install this with:

> # xbps-install -S jq skopeo umoci

After you've installed a whopping 46 Megabytes, you can configure it in /etc/lxc/default.conf if you want to change global configs, otherwhise, it's the usual ~/.config/lxc/dfault.conf.

## Networking

Make a virtual network:

> # ip link add dev BRIDGE type bridge
> # ip link set dev BRIDGE up
> # ip link set dev NIC master BRIDGE

Things in caps can be renamed.

#Create a machine

> lxc-create -n roach-1

This makes a machine with the name 'roach-1'.  We can also apply a preconfigured theme with '-t', such as 'ubuntu'.

> lxc-create -n roach-2 -t ubuntu

Additionally, there we can examine, destroy and freeze containers.

> lxc-ls -n roach-1

> lxc-destroy -n roach-1
	* Add '-k' to kill a process without mercy.

> lxc-freeze -n roach-2

> lxc-unfreeze -n roach-1

#Example

> for r in $(lxc-ls -1); do

>	lxc-info -n $r

> done

# Monitor

You can monitor a set of containeers.

> lxc-monitor -n "roach-1|roach-2"

Or monitor all containers.

> lxc-monitor -n ".*"

# LXD

Setup by starting the lxd service, and adding your user to the group "lxd", then:

> sudo lxd init

Default port is 8443.

