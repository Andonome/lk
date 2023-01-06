---
title: "Aeroplane Mode in Void"
tags: [ "Documentation", "Void" ]
---
Put your device in 'aeroplane' mode (e.g. where no trace of signal leaves it) by turning off Wi-Fi and blue-tooth.

> sudo sv stop wpa_supplicant bluetoothd

Find your device's name with `ip a`.
If unsure, try this:

> name=$(ip a | grep -Eo 'wlp\w{3}')

> echo $name

Then set that device down:

> sudo ip link set $name down
