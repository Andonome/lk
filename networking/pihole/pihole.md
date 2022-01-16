---
title: "pihole"
tags: [ "Documentation", "networking" ]
---
View DNS traffic

> pihole -t

Change password 

> pihole -a -p

Get new list of cancer

> pihole -g

Change upstream DNS

> sudo vim /etc/dnsmasq/01-pihole.conf

## Troubleshooting

> sudo usermod -aG pihole $USER

> sudo systemctl stop systemd-resolved

> sudo rm -f /dev/shm/FTL-*

> pihole -g -r

