---
title: New Sway Remote Desktop
tags: 
- networking
requires: 
- networking/remote_sway.md
---

Check the host is using only one display:

```sh
test "$WAYLAND_DISPLAY" = "wayland-1"
```

Start a new sway session, and a `wayvnc` session:

```sh
WLR_BACKENDS=headless WLR_LIBINPUT_NO_DEVICES=1 sway &
WAYLAND_DISPLAY=wayland-2 wayvnc
```

On the client, [connect as usual](networking/remote_sway.md).
