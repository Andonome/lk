---
title: "wireless"
tags: [ "Networking" ]
---

# Check wifi's working
```bash
lspci -k
```

Or for usb wifi: 

```bash
dmesg | grep usbcore
```

... and hopefully it'll say the new interface is registered.

# Check if a wifi interface has been created

```bash
ip link
```

or

```bash
iw dev
```

Assuming it's wlan0, bring it up with 

```bash
ip link set wlan0 up
```

Error messages probably means your wireless chipset requires a firmware to function.  In this case, check the kernel messages for firmware being loaded

```bash
dmesg | grep firmware
```

# Utilities

iw doesn't do wpa/wpa2.  wpa_supplicant does everything.  iwd does everything except WEXT encryption.

# Connecting

Get the link status:

```bash
iw dev wlan0 link
```

Scan for available points:

```bash
iw dev wlan0 scan
```

The connecting commands do not cover wpa2.

