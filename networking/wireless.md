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

# Fucking Hell

I really need to script this.  Something like:

1. Auto-check wireless device.

2. Auto-check scan for devices and grab names

3. Display names

4. Prompt for name selection (e.g. '1').

5. Auto-connect to wireless associated with selection n.

6. Prompt for password.

7. Try to connect.

8. Ask if user wants a password copy stored in /tmp/.


# Connection
This is a shitshow.  Focus: netctl is the Arch project to get this going.

Okay - can't be fucked.  Most of this is systemd based.	
