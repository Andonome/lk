---
title: "Monitoring"
tags: [ "system", "CPU", "memory" ]
---

Print the average CPU load over 1 minute, 5 minutes, and 15 minutes:

```bash
watch -d cat /proc/loadavg
stress="$(cat /proc/loadavg | awk '{print "Usage:" $2"%"}')"
```

Show memory usage in Gibitytes.

```bash
free -g
```

Show low and high gigibtye usage on a *l*ine, and repeat the measurement every 5 seconds:

```bash
REP=5
free --lohi -g -s $REP | lolcat
```

Check the next thing cron will do:

```bash
cronnext /var/spool/cron/$USER -l
```
