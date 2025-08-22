---
title: "nmap"
tags: [ "networking" ]
---

Example:

```sh
nmap 192.168.1.1/24
```

Flags:

| Flag | Meaning | Effect |
| :---| :---| :---|
| -F | Fast | First 100 ports only |

Look for a web server, which has ports 80 and 443 open:

```sh
nmap 192.168.1.1/24 -p 80,443 --open
```
