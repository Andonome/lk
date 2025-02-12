---
title: "time"
tags: [ "Basics", "time" ]
---
# systemd

Set time to synchronize with an ntp server:

```bash
timedatectl set-ntp true
```

This info stays in `/usr/share/zoneinfo`.

# Local Time

Local time is kept in /etc/localtime.

According to Dave's LPIC guide, you can set the local time by making asymboling link from your timezone to /etc/localtime, as so:

```bash
sudo ln -sf /usr/share/zoneinfo/Europe/Belgrade /etc/localtime
```

...however this produced the wrong time for me.  Further, /etc/localtime produces an output with cat, while the zoneinfo files do not.

# Locale

See local time, language and character settings with:

```bash
locale
```

List available locales with:

```bash
locale -a
```

To see additional locales which are available (but not necessarily installed):

```bash
cat /usr/share/i18n/SUPPORTED
```

Set a supported locale with:

```bash
locale-gen pl_PL.UTF-8
```

Then set that language, with:

```bash
LANG=pl_PL.UTF-8
```

... then reboot.

# Network Time Protocol

Glimpse an overview with:

```bash
ntpq -p
```

Usually this is run as a service, so just start that service.

# Force Reset

If your clock drifts too far from the right time, it will not reset happily.
For it to reset like this:

```bash
sudo ntpd -q -g -x -n
```
