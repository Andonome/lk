---
title: "keyboard"
tags: [ "keyboard", "vim" ]
---

# System-Wide Capslock and Escape Swap

This works everywhere, including in a bare-ass tty.

Select a keymap, and create a new custom map.

```sh
su root
ls /usr/share/kbd/keymaps/i386/qwerty/

basemap=/usr/share/kbd/keymaps/i386/qwerty/pl1.map.gz
newmap=/usr/share/kbd/keymaps/custom.map.gz

gunzip -c $basemap | \
    sed 's/Caps_Lock/\n/g;s/Escape/Caps_Lock/g;s/\n/Escape/g' | \
    gzip > $newmap
```

Tell the system to use this keymap at startup by naming it in the `rc.conf` file:

```sh
echo "KEYMAP=$newmap" >> /etc/rc.conf

cat /etc/rc.conf
reboot
```

# Set Layout with X Display

Set layout to British English.

```sh
setxkbmap -layout gb
```

Or Polish with:

```sh
setxkbmap -layout pl
```

| Language | short |
|:---------|:------|
| Polish   | `pl`  |
| Serbian  | `rs`  |

Set 'alt + shift', as the command which cycles through the British English, Polish and Serbian keyboard layout.

```sh
setxkbmap -layout gb,pl,rs -option grp:alt_shift_toggle
```

## Alt_GR

Remap, e.g., the right Windows key, to Alt_Gr.

```
    key <RWIN> {[  ISO_Level3_Shift    ]};
```


