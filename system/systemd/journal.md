---
title: "journal"
tags: [ "Documentation", "systemd" ]
---
Find errors since November

```bash
journalctl --since=2018-11-01 --grep="EXT4-fs error"
```

Limit size to 2G.

```bash
journalctl --vacuum-size=2G
```

