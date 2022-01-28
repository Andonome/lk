---
title: "protocols"
tags: [ "Documentation", "Networking" ]
---
# Protocols

| TCP | UDP | ICMP |
|:-----------------|:-----------------|:------------------|
|Transmission Control Protocol | User Datagram Protocol | Internet Control Message Protocol |
| Reliable and slow.  | Fast but unreliable, such as VOIP.  Provides checksums. | Dirty checks such as pings. |




# Networking Addressing

## IPv4

Three address ranges pertain only to private Networks, so no computer looks beyond the local router to resolve them:

10.0.0.0	to	10.255.255.255

172.16.0.0	to	172.31.255.255

192.168.0.0	to	192.168.255.255

In theory, Networks should fall within one of 3 ranges, depending upon their first octet:

Class A	1-127

Class B	128 to 191

Class C	192 to 223



# Service Ports

There are three types of port ranges:

1 to 1023:	Well-known and established ports.

1024 to 49151	ICANN registered ports, used by various products, with limited oversight.

49152 to 65535	Dynamic ports for ad hoc use.

View a more complete list of ports with:

> less /etc/services


# ip

Show all addresses with:

> ip a{dd{ress}} s{how}

If a link's not present, load it with:

sudo ip link set dev wlp3s0 up

Add an interface to a device as so:

> sudo ip a add 192.168.0.15/255.255.255.0 dev eth1

See Network interfaces available on Fedora with:

> less /etc/sysconfig/Network-scripts/ifcfg-enp2s0f0

or on Debian with:

> less /etc/Network/interfaces

Mostly, interfaces will receive automatic addresses from a DHCP server.  If this hasn't happened for you, you can request a dhcp address with:

> sudo dhclient eth1

View your current route to the internet with:

> route

... although on void this is:

> routel

If you don't have a route to the internet, you can manually specify the default gateway with:

> sudo route add default gw 192.168.0.1

... or ...

> sudo ip route add default via 192.168.0.1


