---
title: "printers"
tags: [ "hardware" ]
---
# Cups: The Common Unix Printing System

Configure cups at /etc/cups/supsd.conf, or visit the local webpage at http://localhost:631 if you want to use the Apple interface, otherwise, it's the printing daemon.

# The Printing Daemon

The printing daemon automatically reads the cups configuration file.  It prints with:

> lp mytext.txt

Find a list of printers with:

> lpq

You can specify a printer with `-d`:

> lp -d DCP7060D article.pdf

Alternatively, if you see a printer number, cancel job 33 with:

> lprm 33

or just cancel all jobs:

> lprm -

See printers on network:

> lpstat -a

Block or accept all jobs with:

> cupsreject DCP7060D

> cupsaccept DCP7060D

