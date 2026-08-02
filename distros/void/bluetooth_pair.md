---
title: Pair Bluetooth Mouse on Void
tags: 
- bluetooth
- void
---

Install bluetooth.

```sh

sudo xbps-install bluez bluetui
sudo ln -s /etc/sv/bluetoothd/ /var/service/
sudo sv start bluetoothd
bluetui
```

- If this doesn't work, try a search for bluetooth firmware and such.
- Check the mouse is ready to pair.
- Remember bluetooth isn't secure.


Also, `bzmenu` is good:

```sh

bzmenu --launcher rofi
```
