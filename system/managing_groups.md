---
title: "Managing Groups"
tags: [ "system" ]
---

Check which groups you are in, and which are available:

```sh
cat /etc/group
groups
cat /etc/group | grep $USER
```

Remove yourself from all groups, and add yourself back to only `wheel`, `audio`, and your own group:

```sh
sudo usermod --groups wheel,audio,$USER
```

Add yourself to the `wheel` group:

```sh
su root -c "usermod --append --groups wheel $USER"
```
Add yourself to the `network` group:

```sh
sudo usermod -aG network $USER
```

The changes will not take effect until you log in again, so reboot or log into `localhost` with [ssh](../networking/ssh.md).

