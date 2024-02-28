---
title: "journal"
tags: [ "Documentation", "systemd" ]
---

See a running log of all system messages:


```bash
journalctl -f
```

Or just one unit (`sshd`):

```bash
journalctl -f -u sshd
```

Find errors since November

```bash
journalctl --since=2018-11-01 --grep="EXT4-fs error"
```

Limit size to 2G.

```bash
journalctl --vacuum-size=2G
```

Log the fact that you've installed your own `dnsmasq` on your system to `journalctl`, so that you can notice why your system's broken:


```bash
logger "Installed new dnsmasq"
sudo journalctl -f
```

