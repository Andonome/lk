---
title: "at"
tags: [ "basics", "time" ]
---
Install with:

```sh
sudo apt install at
```

Enable the daemon service with:

```sh
sudo systemctl enable --now atd
```

Then jobs can be specified with absolute time, such as:

```sh
at 16:20
```

```sh
at noon
```

```sh
at midnight
```

```sh
at teatime
```

Type in your command, e.g.:

```sh
touch /tmp/$FILE.txt
```

The jobs can also be specified relative to the current time:

```sh
at now +15 minutes
```

Finally, accept the jobs with ^D.

# Managing `at` Jobs

Display a list of commands to run with:

```sh
atq
```

> 2	Sat Oct 20 16:00:00 2018 a roach-1

This will print all pending IDs.  Remove a job by the ID with:

```sh
atrm 2
```

Check `/var/spool/atd/` to see the jobs.

## Automation

Automatically add a job for later, by setting the date, then using echo for the command.

```sh
t="$(date -d "2 minutes" +%R)"
echo "fortune > ~/$FILE" | at "$t"
watch cat $FILE
```

The `$t` here outputs the day in minutes, but you could also do `t="$(date -d "2 days" +%m/%d/%Y)"`.
