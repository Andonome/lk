---
title: "cron"
tags: [ "Documentation", "Basics" ]
---
# Cron

The crontab program might have various names, like `cronie` or `crond`.

> sudo apt search -n ^cron

Once installed, search for the service name, and start it.

> sudo systemctl list-unit-files | grep cron

> sudo systemctl enable --now cron

You can *e*dit your crontab with:

> crontab -e


```

39 */3 * * * /usr/bin/updatedb

```
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

### Full Paths

Executing something requires the full path to where it is, so you cannot simply use `apt update -y`, because cron does not know where `apt` is.
Instead, find out where it is:

> type -P apt

`/usr/bin/apt`

Then put that into the crontab:

> sudo crontab -e

`40 */3 * * * /usr/bin/apt update -y`

This will run `apt update -y` as root every 3 hours, at 40 minutes past the hour, e.g. 00:40, 03:40, 06:40.

## Directories

You can execute a script as root by putting it into a directory, instead of in the tab.
Look at the available cron directories:

> ls /etc/cron.\*

### Testing with runparts

Run-parts runs all executable scripts in a directory.

> run-parts /etc/cron.hourly

## Tips

### Variables

Add your `$HOME` to crontab to use scripts.
First add `HOME=/home/user`, then you can use syntax like this:

0 * * * * $HOME/.scripts/myScript.sh

*Remember to test the script by executing that line first*:

> $HOME/.scripts/myScript.sh

You can also add your regular path to your crontab as a variable (see example below).
If you're using vim as the editor, just run this at the top of your crontab:

> :r!echo PATH=$PATH

### `date` Commands

Cron doesn't understand the `%` sign, so if you want to use `date +%R`, then it should be escaped with a backslash: `date +\%R`.

### File Location

The crontab files are in `/var/spool/cron/`, so you can backup or restore them.

# Example

```
HOME=/home/user
PATH=/usr/condabin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/user/.local/bin:/home/user/.scripts/:/home/user/.local/bin:/home/user/.scripts/

1 0 1 * *    /usr/bin/mkdir -p $HOME/arc/$(date +\%Y/\%m)

18 0 1 */3 * $HOME/.scripts/mail-clean.sh

* * * * * ping -c 1 home || mail-pull.sh

50 18 * * * /usr/bin/timeout 30m /usr/bin/syncthing

```


