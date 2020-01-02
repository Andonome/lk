#!/bin/bash

# This has been changed since testing.

yay -S pi-hole-ftl pi-hole-server

# Configuration in /etc/pihole/pihole-FTL.db
# You can change DBINTERVAL to 60 or more to limit writes to disk

sudo systemctl disable systemd-resolved
sudo systemctl stop systemd-resolved
sudo systemctl start pihole-FTL
pihole -g || echo '' ; echo 'Your pihole is gubbed' ; exit 1
pihole -c


