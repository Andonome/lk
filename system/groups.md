---
title: Managing Groups
tags: 
- system
---

Check which groups you are in, and which are available:

```sh
groups
cat /etc/group
column -ts: /etc/group
grep $USER !$
```

Remove yourself from all groups, and add yourself back to only `mail`, `audio`, and your own group:

```sh
sudo usermod --groups mail,audio,$LOGNAME
```

Add yourself to the `docker` group, if there is one:

```sh
grep docker /etc/group
sudo usermod --append --groups docker $LOGNAME
```

Add yourself to the `games` group:

```sh
sudo usermod -aG games $LOGNAME
```

You are now legally permitted to play [games](shell/games.md).

The changes have not taken effect, so log into your own account again with `su`:


```sh
groups
grep audio /etc/group

sudo usermod -aG audio $LOGNAME
groups
grep audio /etc/group

su $LOGNAME
groups
grep audio /etc/group
```

