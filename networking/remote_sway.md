---
title: Remote Desktop between Sway
tags: 
- networking
requires: 
- networking/ssh.md
---

# On the Host

Install and run `wayvnc`.

```sh
export WAYLAND_DISPLAY=wayland-1
wayvnc
```

Only the `localhost` can access this (highly insecure) desktop sharing, at port 5900.

# On the Client

You'll need to disable your main modifier key on the client while accessing the host.
Edit `~/.config/sway/config`, and create a new `passthrough` mode where the modifier key does nothing.

```config
mode passthrough {
    bindsym $mod+c mode default
}
bindsym $mod+c mode passthrough
```

Reload sway to make the changes take effect.

```sh
swaymsg reload
```

Use `ssh` to grab the host's port 5900.

```sh
ssh -L 5900:localhost:5900 ${remote_username}@${remote_ip}
```

Leave that session running, and connect with `vncviewer`:

```sh
vncviewer localhost:5900
```

