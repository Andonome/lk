---
title: "time"
tags: [ "Documentation", "Basics" ]
---
# systemd

Set time to synchronize with an ntp server:

> timedatectl set-ntp true

This info stays in `/usr/share/zoneinfo`.

# Local Time

Local time is kept in /etc/localtime.

According to Dave's LPIC guide, you can set the local time by making asymboling link from your timezone to /etc/localtime, as so:

> sudo ln -sf /usr/share/zoneinfo/Europe/Belgrade /etc/localtime

...however this produced the wrong time for me.  Further, /etc/localtime produces an output with cat, while the zoneinfo files do not.

# Locale

See local time, language and character settings with:

> locale

List available locales with:

> locale -a

To see additional locales which are available (but not necessarily installed):

> cat /usr/share/i18n/SUPPORTED

Set a supported locale with:

> locale-gen pl_PL.UTF-8

Then set that language, with:

> LANG=pl_PL.UTF-8

... then reboot.

# Network Time Protocol

Glimpse an overview with:

> ntpq -p

Usually this is run as a service, so just start that service.

