---
title: transmission
tags: 
- networking
- torrenting
---

Search for a torrent, e.g. 'sita sings the blues'.

Copy the magnet link.
It looks like this:

> magnet:?xt=urn:btih:05547db7c0c5fbbe50f00212ee43e9cec5b006fa&dn=Sita+Sings+the+Blues+%281080P+official+release%29&tr=udp%3A%2F%2Ftracker.leechers-paradise.org%3A6969&tr=udp%3A%2F%2Ftracker.openbittorrent.com%3A80&tr=udp%3A%2F%2Fopen.demonii.com%3A1337&tr=udp%3A%2F%2Ftracker.coppersurfer.tk%3A6969&tr=udp%3A%2F%2Fexodus.desync.com%3A6969

But you only need this bit (up until the `&` character):

> magnet:?xt=urn:btih:05547db7c0c5fbbe50f00212ee43e9cec5b006fa

# Transmission

The package is often called `transmission-cli`.
Install it then start the service.

Arch Linux:

```sh
sudo systemctl start transmission
```

Debian:

```sh
sudo systemctl start transmission-daemon
```

Add a torrent by the .torrent file, or a magnet link, like this:

```sh
transmission-remote -a 'magnet:?xt=urn:btih:05547db7c0c5fbbe50f00212ee43e9cec5b006fa&dn=Sita+Sings+the+Blues+%281080P+official+release%29&tr=udp%3A%2F%2Ftracker.leechers-paradise.org%3A6969&tr=udp%3A%2F%2Ftracker.openbittorrent.com%3A80&tr=udp%3A%2F%2Fopen.demonii.com%3A1337&tr=udp%3A%2F%2Ftracker.coppersurfer.tk%3A6969&tr=udp%3A%2F%2Fexodus.desync.com%3A6969'
```

```sh
transmission-remote -a sita.torrent
```

Now let's check that the torrent's been added successfully.

```sh
transmission-remote -l
```

To see the torrents, go to /var/lib/transmission/Downloads

If you don't have permission, either add the directory to the group made for your username, or add yourself to the `:transmission` group, or otherwise make sure that you can read that directory, and the user `transmission` can read, write and execute.
E.g.:

```sh
sudo usermod -aG transmission $USER
```

Log in again for the changes to take effect (or open a new TTY with `Ctrl+Alt+F2`).

## Removing Torrents

If you don't want to have a file active as a torrent, get it's number with `transmission-remote -l`, then, if it were number '4', do:

```sh
transmission-remote -t 4 -r
```

You can now move the file, and the torrent will not be confused.

To both **r**emove **a**nd **d**elete a file, use `-rad`:

```sh
transmission-remote -t 4 -rad
```

# Moving Torrents

First, make sure that the user 'transmission' has permission to move the file.
If the file is in your home - `~` - but `transmission` is not allowed in your home, the file will not move there.

Next, find the torrent's number.  You can use multiple numbers, separated with a comma:

```sh
transmission-remote -t 3,5,8 --move $HOME/music
```

## Change Default Location

The `transmission` user has a home configuration file, like any other user, with all the transmission settings.

```sh
cd /var/lib/transmission/.config/transmission-daemon/

$EDITOR settings.json
```

Change the `download-dir` value to wherever you want the torrents to go.

# Creating Torrents

Transmission always needs the full path to every file, and the daemon will need permission to view the file.
When it doubt, just place the files in `transmission`'s home directory.

Create a torrent of file or directory `Memes` with:

```sh
sudo chown -R :transmission Memes
transmission-create $(pwd)/Memes
```

Add a tracker to the torrent, to make sure others can find you easily:

```sh
transmission-create --comment 'My Memes collection' -t 'udp://tracker.publicbt.com:80' -t 'udp://tracker.openbittorrent.com:80' --anonymize Memes
```

Without the `--anonymize` flag, the torrent file output will have a 'created by' and 'created date'.

## Open Trackers

- udp://tracker.opentrackr.org:1337/announce
- udp://opentracker.i2p.rocks:6969/announce
- https://opentracker.i2p.rocks:443/announce
- udp://tracker.openbittorrent.com:6969/announce
- http://tracker.openbittorrent.com:80/announce
- udp://9.rarbg.com:2810/announce
- udp://open.demonii.com:1337/announce
- udp://exodus.desync.com:6969/announce
- udp://tracker.moeking.me:6969/announce
- https://tracker.tamersunion.org:443/announce
- udp://tracker1.bt.moack.co.kr:80/announce
- udp://tracker.bitsearch.to:1337/announce
- udp://p4p.arenabg.com:1337/announce
- udp://explodie.org:6969/announce
- https://tracker.gbitt.info:443/announce
- http://tracker.gbitt.info:80/announce

## Verify

Add your torrent and notes its number:

```sh
transmission-remote -a "$file".torrent
transmission-remote -l
transmission-remote -t "$number" -i
```

The information in the last command shows that it's not verified, so you can verify with `-v`.

```sh
transmission-remote -t "$number" -v
```

If transmission cannot find it, then tell it where to find the torrent:

```sh
transmission-remote -t "$number" --find "$(pwd)"
```
...and of course, make sure the permissions allow transmission to see the target.


```sh
ls -ld "$file"
```

