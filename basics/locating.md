---
title: "locating"
tags: [ "Basics" ]
---
# Type

`type` shows what kind of thing you're running, be it an alias, function, or binary program.

```bash
type cmus
```

# Whereis the Program

Ask where the `angband` program is, along with all its configuration files:

`whereis angband`

Also `which` shows where a binary file (the program) is, 

```bash
which cmus
```

# Search Instantly with `plocate`

You can search every file on the computer instantly by installing `plocate`.

Once installed, run `sudo updatedb` to create the database of (nearly) every file on the computer.

Check how big the database is:

```bash
du -h /var/lib/plocate/plocate.db
```

Once you have the database, you can find nearly any file instantly.

- Search for gifs: `locate .gif`
- Search for gifs in the `/usr/` directory: `locate /usr/ .gif`
- Search for jpg images with 'dog' or 'Dog' in the name: `locate -i dog jpg`
- Search for videos: `plocate --regex '.mp4$|.mkv$|.wmv$|.webm$|.mov$|.avi$'`

For best results, run `updatedb` regularly, perhaps in [crontab](../system/cron.md).

## Search More Places

`plocate` will not search `/tmp/`, because nobody cares about those files, and won't search inside `/mnt/`, because that's where USB sticks get mounted, so the files keep changing as USB sticks come and go.

Change where `plocate` searches by editing the configuration file at `/etc/updatedb.conf`.

By default, the `/mnt` directory is 'pruned' from the database.
So if you want to search `/mnt` for videos, remove the word `/mnt` from the configuration file.


```bash
cat /etc/updatedb.conf
sudo sed 's#/mnt/##' /etc/updatedb.conf
sudo updatedb
plocate --regex '.mp4$|.mkv$|.wmv$|.webm$|.mov$|.avi$'
```

