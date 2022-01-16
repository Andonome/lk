---
title: "logs"
tags: [ "Documentation", "basics" ]
---
## Syslog Management Protocols

Let's look at the programs filling in things on our /var/log/ directory.

* rsyslog (common)

* syslog (old)

* syslog-ng (lots of content-based filtering)

* klogd (kernel-focussed)

# `rsyslog`

The config rests in /etc/rsyslog.conf, which then references /etc/rsyslog.d/.

# Systemd
This thing makes its own logs with journald, and the journal's own logging system writes to /var/log/journal/ directory, which is then filled with nonsense.

You can obtain nonsense in systemd's own format by entering:

journalctl -e

This thing generates so much nonsense it can crash your system, but can at least be checked with:

> journalctl --disk-usage

... in case you can't remember the `du` command.

You can limit the nonsense by editing the /etc/systemd/journald.conf file, and finding `#SystemMaxFileSize=`

# Logger

You can log things at any time with the logger:

> logger Server is being a dick!

Put things into a specific log with `-p`.  They can enter into, e.g., lpr (printer) log file with a priority of "critical", with:

> logger -p lpr.crit Help!

Logfiles rotate around and eventually get deleted.  Rotation means they get compressed.

Edit the config in /etc/logrotate.conf.

A few apps have their own special log rotation rules, kept in /etc/logrotate.d/.

The major variables to change are `weekly`, which compresses log files weekly, and `rotate 4`, which keeps 4 weeks worth of backlogs before deletion.

# Force Log Rotation

> sudo systemctl kill --kill-who=main --signal=SIGUSR2 systemd-journald.service

or just

> sudo systemctl restart systemd-journald.service

