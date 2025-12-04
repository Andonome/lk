---
title: "mpd"
tags: [ "sound", "pipewire" ]
requirements: [ "pipewire" ]
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

## Set Pulseaudio to Run System-Wide


```bash
sudo mkdir -p /etc/pipewire/pipewire-pulse.conf.d

cat > /etc/pipewire/pipewire-pulse.conf.d/pulse-server.conf << "EOF"
pulse.properties = {
    server.address = [
        "unix:native"
        "tcp:4713"                         # IPv4 and IPv6 on all addresses
    ]
}
EOF


```

Give `mpd` access to pulse:

```sh
grep pulse /etc/group | cut -d: -f1

grep pulse /etc/group | cut -d: -f1 | while read g; do
    sudo usermod -aG $g mpd
done
```

Working with mpd will be easier if you have access to its files, so maybe:

```sh
sudo usermod -aG mpd $USER
```

Remember to reboot.

# Troubleshooting

Check pulse is working.

```sh
ss | grep 4713
```

# Notifications (AUR)

Install `mpd-notification` and then start the service:

```sh
systemctl --user enable mpd-notification
```

