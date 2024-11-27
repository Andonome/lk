---
title: "cron"
tags: [ "Documentation", "Basics" ]
---
# Cronie

The `cronie` program is also known as `crond`.

## Install

```bash
sudo apt search -n ^cron
```

Once installed, search for the service name, and start it.

```bash
sudo systemctl list-unit-files | grep cron
sudo systemctl enable --now $NAME
```

## Usage

Show your current crontab:

```bash
crontab -l
```

You can put this in a file and edit it:

```bash
crontab -l > $filename
echo '39 3 */3 * * /bin/tar czf /tmp/etc_backup.tgz /etc/' >> $filename
```

Then apply that crontab:

```bash
crontab $filename
rm $filename
```

The `cron` program will check your syntax before adding the tab.

Your crontab file sits somewhere in `/var/spool/`.
Probably in `/var/spool/cron`.

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

### Variables

`cronie` doesn't know where you live, so to put something in your `$HOME` directory, you have to tell it:


```bash
echo "HOME=$HOME" > $filename
crontab -l >> $filename
crontab $filename
```

`cronie` doesn't know where anything lives, including programs.
You can give it your usual `$PATH` variable like this:


```bash
echo $PATH > $filename
crontab -l >> $filename
crontab $filename
```

Now instead of doing this

`40 */3 * * * /usr/bin/du -sh $HOME/* | sort -h > $HOME/sum.txt`

You can simply do this: 

`40 */3 * * * du -sh $HOME/* | sort -h > $HOME/sum.txt`

## Run as Root

You can execute a script as root by putting it into a directory, instead of in the tab.
Look at the available cron directories:

```bash
ls -d /etc/cron.*
```

Make a script which runs daily:

```bash
f=apt_update.sh
echo '#!/bin/bash' > $f
echo 'apt update --yes' >> $f
chmod +x $f
sudo mv $f /etc/cron.daily/
```

### Testing with runparts

Run-parts runs all executable scripts in a directory.

```bash
run-parts /etc/cron.hourly
```

# Troubleshooting

### `date` Commands

Cron doesn't understand the `%` sign, so if you want to use `date +%R`, then it should be escaped with a backslash: `date +\%R`.

