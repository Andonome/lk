---
title: "at"
tags: [ "Documentation", "basics" ]
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
