---
title: "wireless"
tags: [ "Documentation", "networking" ]
---

# Check wifi's working
> lspci -k

Or for usb wifi: 

> dmesg | grep usbcore

... and hopefully it'll say the new interface is registered.

# Check if a wifi interface has been created

> ip link

or

> iw dev

Assuming it's wlan0, bring it up with 

> ip link set wlan0 up

Error messages probably means your wireless chipset requires a firmware to function.  In this case, check the kernel messages for firmware being loaded

> dmesg | grep firmware

# Utilities

iw doesn't do wpa/wpa2.  wpa_supplicant does everything.  iwd does everything except WEXT encryption.

# Connecting

Get the link status:

> iw dev wlan0 link

Scan for available points:

> iw dev wlan0 scan

The connecting commands do not cover wpa2.

