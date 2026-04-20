---
title: logs
tags: 
- system
---

# Basic
Keeping track of health problems.  Mostly under /var/log/.

These logs are created by syslogd (or syslog in earlier distros).

# Rundown

`alternatives.log' has a bunch about other programs installing things around 5 times a day.  This includes x-www-browser, which sets the default browser (supposedly - this doesn't work on i3).

It also seems to update cursor themes, man files and `montage'.

`apport.log' is empty.

`auth.log' shows keyring prompot times, `Gcr' prompter and a lot about CRON, the `power button'.


