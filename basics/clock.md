---
title: "clock"
tags: [ "Documentation", "basics" ]
---

Show system time:

> date

Show hardware time:

> sudo hwclock -r

Change system time to match hardware time:

> sudo hwclock --hctosys

Change hardware time to match system time:

> sudo hwclock --systohc

Manually set the hardware time to a specified date:

> sudo hwclock --set --date="8/25/19 13:30:00"

## Normal Date

> date +%d/%m/%y

# Unix Time

Computers started counting time on January 1st, 1970, and added one second-per-second.  If your clock shows you're in the 70's, it's reset to the start.

Track the time in Unix-time:

> date +%s

# Network Time Providers

Servers which take their time from an observatory we call Stratum 1 servers.  Servers which takes their time from Stratum n servers are Stratum n+1 servers.

Install ntp with:

> sudo apt-get install -y ntp

The shell command for this is `ntpq`.  Monitor the service providers using:

> ntpq -p

