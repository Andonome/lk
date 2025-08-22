---
title: "mpd"
tags: [ "sound" ]
---
# Setup

## Configuration

This is a minimum configuration file for /etc/mpd.conf


> music_directory		"/var/lib/mpd/music"
> 
> playlist_directory "/var/lib/mpd/playlists"
> 
> db_file "/var/lib/mpd/mpd.db"
> 
> 
> pid_file "/run/mpd/mpd.pid"
> 
> state_file "/var/lib/mpd/mpdstate"
> 
> 
> user "mpd"
> 
> audio_output {
> 	type		"pulse"
> 	name		"My Pulse Output"
> }
> 
> audio_output {
>     type                    "fifo"
>     name                    "my_fifo"
>     path                    "/tmp/mpd.fifo"
>     format                  "44100:16:2"
> }


You can use alsa instead of pulse, but don't unless you're on a Pi.

Since this is run as the mpd user, you'll need to grant that user pulse acceess, often with the user-group `pulse` or `pulse-access`, but your distro may vary.

```sh
sudo usermod -aG pulse-access mpd
```

Working with mpd will be easier if you have access to its files, so maybe:

```sh
sudo usermod -aG mpd $USER
```



# Notifications (AUR)

Install `mpd-notification` and then start the service:

```sh
systemctl --user enable mpd-notification
```

