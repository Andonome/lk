---
title: "Basic Sound"
tags: [ "Sound" ]
---
# Pulse

If you have pulse, use pulse.
Check with `which pulseaudio`. No output means you need to use alsa (below).

# Volume Control

```bash
pactl set sink @DEFAULT_SINK@ +5%
```

Find working outputs:

```bash
aplay -l
```

#Sound Settings

Surround.5 seems best.


# Find what Sound settings exist

amixer scontrols

# Change a Sound setting

```bash
amixer set Master 5%-
```

# Restart everything

pulseaudio -k && sudo alsa force-reload

# Alsa

Toggle, mute, increase or decrase audio:

```bash
amixer sset Master toggle
```

```bash
amixer sset Master mute
```

```bash
amixer sset Master 5%+
```

```bash
amixer sset Master 5%-
```

# Finicky Sound Cards

Start with:

```bash
alsamixer
```

Then press `F6` to see available Sound cards.
If you find a Sound card called 'PinePhone', then you can select an audio source there, and adjust with:

```bash
amixer -c PinePhone set 'Headphone' 50%
```

