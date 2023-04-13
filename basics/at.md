---
title: "at"
tags: [ "Documentation", "Basics" ]
---
Install with:

> sudo apt install at

Enable the daemon service with:

> sudo systemctl enable --now atd

Then jobs can be specified with absolute time, such as:

> at 16:20

> at noon

> at midnight

> at teatime

Type in your command, e.g.:

> touch /tmp/myFile.txt

The jobs can also be specified relative to the current time:

> at now +15 minutes

Finally, accept the jobs with ^D.

# Managing `at` Jobs

Display a list of commands to run with:

> atq

`2	Sat Oct 20 16:00:00 2018 a roach-1`

This will print all pending IDs.  Remove a job by the ID with:

> atrm 2

Check /var/spool/atd/

## Automation

Automatically add a job for later, by setting the date, then using echo for the command.

> t="$(date -d "2 minutes" +%R)"

> echo "fortune > ~/file" | at "$t"

> watch cat file

The `$t` here outputs the day in minutes, but you could also do `t="$(date -d "2 days" +%m/%d/%Y)"`.
