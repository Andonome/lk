---
title: "wireless"
tags: [ "networking" ]
---

Check wifi's working

```sh
lspci -k
```

Or for usb wifi: 

```sh
dmesg | grep usbcore
```

...and hopefully it'll say the new interface is registered.

Check if a wifi interface has been created

```sh
ip link
```

...or

```sh
iw dev
```

Assuming it's wlan0, bring it up with 

```sh
ip link set wlan0 up
```

Error messages probably means your wireless chipset requires a firmware to function.  In this case, check the kernel messages for firmware being loaded

```sh
dmesg | grep firmware
```

# Utilities

- `iw` doesn't do wpa/wpa2.
- `iwd` does everything except WEXT encryption.
- `wpa_supplicant` does everything.

# Connecting

Get the link status:

```sh
iw dev wlan0 link
```

Scan for available points:

```sh
iw dev wlan0 scan
```

The connecting commands do not cover wpa2.

