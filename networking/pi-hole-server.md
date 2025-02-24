---
title: "pi-hole-server"
tags: [ "distros" ]
---
# Installation

## Arch

```bash
yay -S pi-hole-server
```

```bash
sudo systemctl enable --now pihole-FTL
```

```bash
sudo systemctl disable --now systemd-resolved
```

```bash
sudo rm -f /dev/shm/FTL-\*
```

## Debian

Debian has a long, boring setup.

```bash
sudo apt-get install wget curl net-tools gamin lighttpd lighttpd-mod-deflate
curl -sSL https://install.pi-hole.net | PIHOLE_SKIP_OS_CHECK=true sudo -E bash
```

# Setup

```bash
sudo usermod -aG pihole $USER
```

Remove that google dns server.

```bash
pihole -a setdns 9.9.9.9 1.0.0.1
```

Disable pihole password by setting a blank password.

```bash
pihole -a -p
```

Get a new list of blocked domains, then reload:

```bash
pihole -g -r
```

Every so often, run `pihole -g` again (perhaps put it in crontab).

## Check the Pihole

Observe the pihole's output while you ask it a question:

```bash
pihole -t
```

Then ask the question from another computer:

```bash
dig @[ pihole ip ] archlinux.org
```

## System-Wide Setup

To make the pihole work for the entire Network, enter your router and set the DNS server as nothing but your pihole.

