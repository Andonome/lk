---
title: "keyboard"
tags: [ "Documentation", "keyboard" ]
---
# Set Layout with X Display

Set layout to British English.

> setxkbmap -layout gb

Or Polish with:

> setxkbmap -layout pl

| Language | short |
|:--------|:------|
| Polish  | pl |
| Serbian | rs |

Set 'alt + shift', as the command which cycles through the British English, Polish and Serbian keyboard layout.

> setxkbmap -layout gb,pl,rs -option grp:alt_shift_toggle

## Alt_GR

Remap, e.g., the right Windows key, to Alt_Gr.

```
    key <RWIN> {[  ISO_Level3_Shift    ]};
```

# Set TTY Keymap

Copy your keymap, e.g. if it's polish-1, then:

> cp /usr/share/kbd/keymaps/i386/qwerty/pl1.map.gz /usr/share/kbd/keymaps/*custom*.map.gz

Then change that map:

> sudo vim /usr/share/kbd/keymaps/custom.map.gz

---

You can switch Escape and Caps Lock with a single line:

> sudo sh -c "gunzip -c /usr/share/kbd/keymaps/i386/qwerty/pl1.map.gz   | sed 's/ Escape/ PLACEHOLDER/ ; s/Caps_Lock/Escape/g ; s/PLACEHOLDER/Caps_Lock/' | gzip > /usr/share/kbd/keymaps/custom.map.gz"

---

Change the default keyboard mapping to the custom map:

> echo 'KEYMAP="/usr/share/kbd/keymaps/*custom*.map.gz"'  | sudo tee /etc/vconsole.conf

Reboot to have changes take effect.
