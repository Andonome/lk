# Volume Control

> pactl set sink @DEFAULT_SINK@ +5%

Find working outputs:

> aplay -l

#Sound Settings

Surround.5 seems best.


# Find what sound settings exist

amixer scontrols

# Change a sound setting

> amixer set Master 5%-

# Restart everything

pulseaudio -k && sudo alsa force-reload

