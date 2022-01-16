---
title: "cron"
tags: [ "Documentation", "basics" ]
---
# Cron

Various services from cron exist, e.g.

> sudo apt -y install cron

Start the cronie with

> sudo systemctl enable --now cron

Specify a cron job with:

> cron -e

You can run a script with:

*/10 * * * * /home/pi/script.sh

... which would run every 10 minutes.

To run something as root, do:

> sudo crontab -e

For example, you can update the database, meaning searches with 'locate' command will be faster.

> */30 * * * * /usr/bin/updatedb

## Syntax

`* * * * *`

These five points refer to:

`minute hour day month weekday`

So '3pm every Sunday' would be:

`0 15 * * 7`

Here 'Sunday' is indicated by "7", and '3pm' is 'the 15th hour'.
The minute is '0' (i.e. '0 minutes past three pm').

Doing the same thing, but only in February, would be:

`0 15 * 2 7`

# Testing with runparts

Run-parts runs all executable scripts in a directory.

> run-parts /etc/cron.hourly

