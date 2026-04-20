---
title: pipewire
tags: 
- sound
---

Install `wireplumber` and `pipewire`, then add your user to any `pipewire` group.

```sh
sudo ln -s /usr/share/examples/pipewire/20-pipewire-pulse.conf /etc/pipewire/pipewire.conf.d/20-pipewire-pulse.conf

sudo ln -s /usr/share/examples/wireplumber/10-wireplumber.conf /etc/pipewire/pipewire.conf.d/10-wireplumber.conf
```
