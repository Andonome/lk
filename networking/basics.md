# You

Check how your computer connects to the net:

> ip address show


```

1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UP group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host 
       valid_lft forever preferred_lft forever
3: wlp3s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP group default qlen 1000
    link/ether 84:3a:4b:ca:5c:24 brd ff:ff:ff:ff:ff:ff
    inet 192.168.0.13/24 brd 192.168.0.255 scope global dynamic noprefixroute wlp3s0
       valid_lft 199143sec preferred_lft 172143sec
    inet6 fe80::22:5eb9:8a3a:95b2/64 scope link 
       valid_lft forever preferred_lft forever
4: wwp0s20u4i6: <BROADCAST,MULTICAST,NOARP,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether fa:cd:4d:28:ec:dc brd ff:ff:ff:ff:ff:ff
    inet 169.254.104.159/16 brd 169.254.255.255 scope global noprefixroute wwp0s20u4i6
       valid_lft forever preferred_lft forever
    inet6 fe80::e9d3:506c:c0a9:6679/64 scope link 
       valid_lft forever preferred_lft forever

```

That's too much output to read, so try:

> ip address show | grep inet

```

    inet 127.0.0.1/8 scope host lo
    inet6 ::1/128 scope host 
    inet 192.168.0.13/24 brd 192.168.0.255 scope global dynamic noprefixroute wlp3s0
    inet6 fe80::22:5eb9:8a3a:95b2/64 scope link 
    inet 169.254.104.159/16 brd 169.254.255.255 scope global noprefixroute wwp0s20u4i6
    inet6 fe80::e9d3:506c:c0a9:6679/64 scope link 

```

The starting numbers tell you about the address. You just have to memorize the meanings:

| Address Prefix | Meaning |
|:---:|:---:|
| 127.X | The computer's name for itself, for when you want to ssh into your own machine |
| ::1/128 | Same thing, with ipv6 |
| 192.168.X | A small network address, given by a DHCP server (possibly your router) |
| 169.X | The interface to the internet wasn't given an ip address, so it's made up its own |

# `arp-scan`

Look around your local network with `arp-scan`.

> sudo arp-scan -l

```

Interface: wlp3s0, type: EN10MB, MAC: 84:3a:4b:ca:5c:24, IPv4: 192.168.0.13
Starting arp-scan 1.9.7 with 256 hosts (https://github.com/royhills/arp-scan)
192.168.0.1	0c:02:27:bc:aa:a1	Technicolor CH USA Inc.
192.168.0.15	b8:27:eb:4a:cd:d9	Raspberry Pi Foundation
192.168.0.10	dc:0b:34:94:5c:c4	LG Electronics (Mobile Communications)

3 packets received by filter, 0 packets dropped by kernel
Ending arp-scan 1.9.7: 256 hosts scanned in 1.937 seconds (132.16 hosts/sec). 3 responded

```

The interface here was `wlp3s0`. It starts with 'w', so it's a wifi card.  Each internet adapter has a name, called a 'MAC address' in order to identify itself to outsiders.  The first three parts of a MAC address are given by the manufacturer (like a family name), and the rest are just for that one device.

The '192.168.0.1' address ends in '.1', so it's probably a router.  The manufacturer is 'Technicolor' (`arp-scan` has identified this from the first digits of the MAC: '0c:02:27').

Next is 192.168.0.15, which is labelled as a 'raspberry pi'. Finally, the '.10' address is a mobille phone.

Mac addresses are easy to fake, so don't trust this output to keep you safe.

# `nmap`

Look around your entire network from 192.168.0.1 to 192.168.0.255:

> sudo nmap -F 192.168.0.1/24

The `-F` means 'do this fast, by only scanning normal traffic' (ports below 1000).

```

Starting Nmap 7.80 ( https://nmap.org ) at 2020-01-09 13:52 CET
Nmap scan report for 192.168.0.1
Host is up (0.011s latency).
Not shown: 99 closed ports
PORT   STATE SERVICE
80/tcp open  http
MAC Address: 0C:02:27:BC:AA:A1 (Technicolor CH USA)

Nmap scan report for 192.168.0.10
Host is up (0.0040s latency).
All 100 scanned ports on 192.168.0.10 are closed
MAC Address: DC:0B:34:94:7C:C4 (LG Electronics (Mobile Communications))

Nmap scan report for belgradecats (192.168.0.15)
Host is up (0.0096s latency).
Not shown: 98 closed ports
PORT   STATE SERVICE
22/tcp open  ssh
53/tcp open  domain
MAC Address: B8:27:EB:4A:CD:D9 (Raspberry Pi Foundation)

Nmap scan report for 192.168.0.13
Host is up (0.0000080s latency).
Not shown: 99 closed ports
PORT   STATE SERVICE
22/tcp open  ssh

Nmap done: 256 IP addresses (4 hosts up) scanned in 5.34 seconds

```

Network traffic is split into different types of information.  Each one gets a number called a 'port'.  Most of this information is dead, so only a few ports are used nowadays.

The first one shows port 80, so you can visit it on a web browser.  The next shows 53 (so it's handing out names of local computers) and 22 (so you can access it via ssh).

You can scan outside addresses with:

> sudo nmap facebook.com

However, when you scan something, that machine will see you, and you may set off alerts, which then have to bother whoever's looking after that address.
So if you want to try out nmap from outside, find a place you have permission to scan (like your own external IP address), or try:

> sudo nmap hack.me

The hack.me website doesn't mind people scanning.

