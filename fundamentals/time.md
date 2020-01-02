# systemd

Set time to synchronize with an ntp server:

> timedatectl set-ntp true

This info stays in /usr/share/zoneinfo

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

Enter the shell with:

> ntpq

Or just glimpse and overview with:

> ntpq -q

This clock can drift, which is then listed under /var/log/ntp.drift

The config is under /etc/ntp.conf.  If a line for the stats directory is listed, it'll log stats, e.g.:

`statsdir /var/log/ntpstats/`

This can show if clock drift occurs.

The config file also lets you specify servers to obtain time from.

