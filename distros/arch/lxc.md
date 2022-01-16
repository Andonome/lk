---
title: "lxc"
tags: [ "Documentation", "distros" ]
---
# Distro Specifics

Arch dependencies: `arch-install-scripts` `dnsmasq`

# Basic Setup

Make and start a linux container called 'playtime':

> # lxc-create -n playtime -t download

> # lxc-ls --fancy

> # lxc-start playtime

Attach it:

> # lxc-attach playtime

# Networking

Place the following in /etc/default/lxc-net to configure the network:

---

         # Leave USE_LXC_BRIDGE as "true" if you want to use lx
cbr0 for your
         # containers.  Set to "false" if you'll use virbr0 or 
another existing
         # bridge, or mavlan to your host's NIC.
         USE_LXC_BRIDGE="true"

         # If you change the LXC_BRIDGE to something other than
 lxcbr0, then
         # you will also need to update your /etc/lxc/default.c
onf as well as the
         # configuration (/var/lib/lxc/<container>/config) for 
any containers
         # already created using the default config to reflect 
the new bridge
         # name.
         # If you have the dnsmasq daemon installed, you'll als
o have to update
         # /etc/dnsmasq.d/lxc and restart the system wide dnsma
sq daemon.
         LXC_BRIDGE="lxcbr0"
         LXC_ADDR="10.0.3.1"
         LXC_NETMASK="255.255.255.0"
         LXC_NETWORK="10.0.3.0/24"
         LXC_DHCP_RANGE="10.0.3.2,10.0.3.254"
         LXC_DHCP_MAX="253"
         # Uncomment the next line if you'd like to use a conf-
file for the lxcbr0
         # dnsmasq.  For instance, you can use 'dhcp-host=mail1
,10.0.3.100' to have
         # container 'mail1' always get ip address 10.0.3.100.
         #LXC_DHCP_CONFILE=/etc/lxc/dnsmasq.conf

         # Uncomment the next line if you want lxcbr0's dnsmasq
 to resolve the .lxc
         # domain.  You can then add "server=/lxc/10.0.3.1' (or
 your actual $LXC_ADDR)
         # to your system dnsmasq configuration file (normally 
/etc/dnsmasq.conf,
         # or /etc/NetworkManager/dnsmasq.d/lxc.conf on systems
 that use NetworkManager).
         # Once these changes are made, restart the lxc-net and
 network-manager services.
         # 'container1.lxc' will then resolve on your host.
         #LXC_DOMAIN="lxc"

---

Then start the lxc NAT:

> sudo systemctl restart lxc-net

> sudo systemctl restart NetworkManager

... and make sure the bridge's ip-range doesn't intefere withe local network.

> sudo arp-scan -I lxcbr0 -l

The lxc template is in /etc/lxc/default.conf.  You need to modify it so that it uses lxcbr0.

---

        /etc/lxc/default.conf
         lxc.net.0.type = veth
         lxc.net.0.link = lxcbr0
         lxc.net.0.flags = up
         lxc.net.0.hwaddr = 00:16:3e:xx:xx:xx

---

# Making machines

> sudo lxc-create -n roach -t download -- --dist archlinux --release current --arch amd64

Arch linux containers take up about 600 Megs.

To speed up the startup process, one can install haveged and start the haveged.service.  Haveged stops the wait-time for system entropy creation.

Machines are stored in /var/lib/lxc.

# Starting

> lxc-attach -n roach

