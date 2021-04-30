# Pulse
If you have pulse, use pulse.
Check with `which pulseaudio`. No output means you need to use alsa (below).

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

# Alsa

Toggle, mute, increase or decrase audio:

> amixer sset Master toggle

> amixer sset Master mute

> amixer sset Master 5%+

> amixer sset Master 5%-

# Finicky Sound Cards

Start with:

> alsamixer

Then press `F6` to see available sound cards.
If you find a sound card called 'PinePhone', then you can select an audio source there, and adjust with:

> amixer -c PinePhone set 'Headphone' 50%

