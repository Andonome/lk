---
title: transmission
tags: 
- networking
- torrent
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

