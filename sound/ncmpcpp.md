---
title: "ncmpcpp"
tags: [ "sound" ]
---

# Music Player Daemon

Install, then run as user with all configuration files in ~/.config/mpd/.

Go down config list, copied from /usr/share/docs/mpd/ or something.

mpd-configure

# Problem solving

I couldn't change volume, so in mpd.conf I uncommented the pulse audio lines and restarted mpd.  This allowed pulse audio output, which allows volume change via mpc.

Also, make sure the user mpd is part of the group pulse:

```bash
sudo adduser mpd pulse
```

In the audio_output section, try setting the mix_type to "software", not "hardware".


If you're using alsa, check if the mpd user is part of the group 'audio'.
