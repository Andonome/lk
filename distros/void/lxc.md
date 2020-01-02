# Intro

Taken from [this](https://r4nd0m6uy.ch/unpriviledged-containers-in-void-linux.html)
Void linux requires additional steps to set up, as Systemd is no present to automatically take care of everything.

> sudo xbps-install cgmanager dbus bridge-utils lxc

Next, startup services:

> sudo ln -s /etc/sv/dbus/ /var/service/

> sudo ln -s /etc/sv/cgmanager/ /var/service/

> sudo sv start dbus

> sudo sv start cgmanager

> sudo sv start dbus

> sudo sv start cgmanager

Maps your user account to the lxc g/u ids:

> sudo usermod --add-subuids 100000-165536 $USER

> sudo usermod --add-subgids 100000-165536 $USER

Then add a bridge interface to connect the container.

> sudo brctl addbr lxbr0

Then add an interface.  I have no idea how this is done or what it means, so I tried my wifi 'wlp3s0', and that was refused.  I tried the guide's one, which obviously didn't work as I didn't have the same interface as in the guide.  Finally, I tried `ip addr show` and noticed other devices 'lo' and 'wwp0s20u4i6'.  This gave me:

> sudo brctl addif lxbr0 wwp0s20u4i6

... which worked.

If you don't want to redo this each boot, you can make a runit service for it apparently - more research is required for this.  For now, I'm just copy-pasting the guide (almost) and sticking this in ~/.config/lxc/default.conf:

`lxc.network.type = veth`

`lxc.network.link = wwp0s20u4i6`

`lxc.network.flags = up`

`lxc.network.hwaddr = 00:16:3e:BB:CC:DD`

`lxc.id_map = u 0 100000 65536`

`lxc.id_map = g 0 100000 65536`

You can now configure a different bridge each boot to connect with the lxc containers, or ....

Next, do this at *every boot* (or script it):

> sudo cgm create all $USER

> sudo cgm chown all $USER $(id -u) $(id -g)

> cgm movepid all $USER $$


