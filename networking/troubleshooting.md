---
title: "troubleshooting"
tags: [ "networking" ]
---

# Do you have an IP?

If not, try checking out what your local networking interfaces are, then check if they have been picked up:

```sh
dmesg | grep eth0
```

# Display Active Ports

```sh
netstat -l
```

...or maybe narrow it down to http:

```sh
netstat -l | grep http
```

