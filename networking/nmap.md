---
title: "nmap"
tags: [ "networking" ]
---

Example:

```bash
nmap 192.168.1.1/24
```

Flags:

| Flag | Meaning | Effect |
| :---| :---| :---|
| -F | Fast | First 100 ports only |

Look for a web server, which has ports 80 and 443 open:

```bash
nmap 192.168.1.1/24 -p 80,443 --open
```
