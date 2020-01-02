# Basics

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

# Network Time Providers

Servers which take their time from an observatory we call Stratum 1 servers.  Servers which takes their time from Stratum n servers are Stratum n+1 servers.

Install ntp with:

> sudo apt-get install -y ntp

The shell command for this is `ntpq`.  Monitor the service providers using:

> ntpq -p

