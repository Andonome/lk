---
title: "Aeroplane Mode in Void"
tags: [ "Void" ]
---
Put your device in 'aeroplane' mode (e.g. where no trace of signal leaves it) by turning off Wi-Fi and blue-tooth.

```sh
su root
sv stop wpa_supplicant bluetoothd
```

Find your device's name with `ip a`.
If unsure, try this:

```sh
name=$(ip a | grep -Eo 'wlp\w{3}')
echo $name
```

Then set that device down:

```sh
ip link set $name down
```
