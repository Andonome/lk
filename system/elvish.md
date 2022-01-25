---
title: "elvish"
tags: [ "Documentation", "system" ]
---
# Setup
To run a shell as non-root, the shell must be listed in /etc/shells.

# Basics
Elvish has an inbuilt calculator.

Basic commands include: *, ^, +.  E.g.:

> 2*4+2


#Lists

li = [orcs hobbits elves]

Then either

> echo $li

> echo $@li

> echo $path


# Environmental Variables
Summon with E:, e.g.

> echo $E:USER

# Commands

C-n - File manager

C-l - Recent locations

C-r - Recent commands

See all binding with:

> pprint $edit:insert:binding

