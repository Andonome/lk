---
title: "Basic Sound"
tags: [ "sound" ]
---

# Pulse

If you have pulse, use pulse.
Check with `which pulseaudio`. No output means you need to use alsa (below).

# Volume Control

```sh
pactl set sink @DEFAULT_SINK@ +5%
```

Find working outputs:

```sh
aplay -l
```

#Sound Settings

Surround.5 seems best.


# Find what Sound settings exist

amixer scontrols

# Change a Sound setting

```sh
amixer set Master 5%-
```

# Restart everything

pulseaudio -k && sudo alsa force-reload

# Alsa

Toggle, mute, increase or decrase audio:

```sh
amixer sset Master toggle
```

```sh
amixer sset Master mute
```

```sh
amixer sset Master 5%+
```

```sh
amixer sset Master 5%-
```

# Finicky Sound Cards

Start with:

```sh
alsamixer
```

Then press `F6` to see available Sound cards.
If you find a Sound card called 'PinePhone', then you can select an audio source there, and adjust with:

```sh
amixer -c PinePhone set 'Headphone' 50%
```

