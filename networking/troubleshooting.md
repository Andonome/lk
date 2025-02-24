---
title: "troubleshooting"
tags: [ "networking" ]
---

# Do you have an IP?

If not, try checking out what your local networking interfaces are, then check if they have been picked up:

```bash
dmesg | grep eth0
```

# Display Active Ports

```bash
netstat -l
```

...or maybe narrow it down to http:

```bash
netstat -l | grep http
```

