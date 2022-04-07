---
title: "locating"
tags: [ "Documentation", "Basics" ]
---
# Type

`type` shows what kind of thing you're running, be it an alias, function, or binary program.

> type cmus

# Whereis the Program

Ask where the `angband` program is, along with all its configuration files:

`whereis angband`

Also `which` shows where a binary file (the program) is, 

> which cmus

# Quick Search for Files

You'll need to set up `locate` for this by installing `mlocate`.
`mlocate` needs a list of all files on the machine, so run:

> sudo updatedb

Then to find a file called 'my-cats.jpg', run:

> locate cats

For best results, run `updatedb` regularly, perhaps in crontab.

