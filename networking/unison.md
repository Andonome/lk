---
title: "unison"
tags: [ "Documentation", "networking" ]
---

# Local Sync

unison Dir_A Dir_B

Accept defaults with:

> unison -auto Dir_A Dir_B

Ask no questions with:

> unison -batch Dir_A Dir_B

# Remote Sync

Sync the folders ~/LK on pi and localhost with:

> unison LK ssh://pi@192.168.0.13/LK


#Back Script Example
Make backup script 'rat' by entering the configurations in ~/.unison/rat.prf

```{r}
# Where to synchronize from
root=/home/roach-1/

root=ssh://ubuntu@10.0.3.76/

auto = true
batch = true
## for ssh arguments, add as so:
#sshargs=-p 4792

## Directories to synchronize
## a path such as 'Album 1' will not work - don't use quotes.
path=box 1
path=box 2
path=house
path=.vimrc
path=.bashrc

ignore=Name temp.*
ignore=Name *.swp

## Merging
## This line handles the merge, but it's based on Emacs, which cannot run in a tty, but requires X.

diff = diff -u CURRENT2 CURRENT1 | perl -pe 's/^\+/>/; s/^\-/</'
```

# Scheduled Backups

A full backup can be run with:

> unison rat.prf 

And a crontab can be set with:

* */4 * * * /usr/bin/unison rat



