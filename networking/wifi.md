---
title: "wifi"
tags: [ "Networking" ]
---
# Netstat Stuff

Stats on local net usage within domain.

```bash
iftop -p -n
```

```bash
whois domain.com
```

Info on domain, whether it's taken, et c.:

```bash
dig domain.com
```

```bash
ifconfig
```

Versatile wifi tool:

```bash
nmcli
```

# Examples

You want to connect to the internet.

```bash
sudo iwconfig
```

Get knowledge of wireless state.  The output might be: 

> wlp3s0    IEEE 802.11  ESSID:"Gandalf WajFaj"

> Mode:Managed  Frequency:2.412 GHz  Access Point: 10:05:01:90:AC:1A

> Bit Rate=144.4 Mb/s   Tx-Power=15 dBm

> Retry short limit:7   RTS thr:off   Fragment thr:off

> Encryption key:off

>          Power Management:on

>          Link Quality=64/70  Signal level=-46 dBm

>          Rx invalid nwid:0  Rx invalid crypt:0  Rx invalid frag

>          Tx excessive retries:0  Invalid misc:363   Missed beacon

This tells you that your ESSID is 'Gandalf WajFaj', and the access point name is 10:05:......

```bash
nmcli radio
```

You get an overview of your radio devices.
You're told that eth0 deals with your ethernet and `wlan0` deals with wifi.
`wlan0` is a file which represents your wifi device.

```bash
nmcli wlan0 wifi rescan
```

```bash
nmcli device wifi list
```

Now to connect.

```bash
nmcli device wifi connect [SSID] [your password] [wifi password]
```

Alternatively, you can use

```bash
nmcli -ask device wifi connect [SSID]
```

And it'll ask for your password, so you're not typing it in in full view.

