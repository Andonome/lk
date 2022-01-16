---
title: "journal"
tags: [ "Documentation", "system" ]
---

Find errors since November

> journalctl --since=2018-11-01 --grep="EXT4-fs error"

Limit size to 2G.

> journalctl --vacuum-size=2G
