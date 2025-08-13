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

Add yourself to the `docker` group:

```sh
su root -c "usermod --append --groups docker $USER"
```
Add yourself to the `network` group:

```sh
sudo usermod -aG network $USER
```

The changes have not taken effect, so log into your own account again with `su`:


```sh
groups
sudo su $USER
groups
```
