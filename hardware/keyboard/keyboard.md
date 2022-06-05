---
title: "keyboard"
tags: [ "Documentation", "basics" ]
---
# Set Layout

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

