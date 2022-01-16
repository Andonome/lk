---
title: "troubleshooting"
tags: [ "Documentation", "networking" ]
---

# Do you have an IP?

If not, try checking out what your local networking interfaces are, then check if they have been picked up:

> dmesg | grep eth0

# Display Active Ports

> netstat -l

... or maybe narrow it down to http:

> netstat -l | grep http


