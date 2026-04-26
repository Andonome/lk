---
title: Arch maintenance with yay
tags: 
- arch
- maintenance
requires: 
- distros/arch/maintenance.md
---

# Package Cache

Just like `[pacman](distros/arch/pacman.md)` with a couple of extras.

```sh
ls ~/.cache/yay/ | wc -l
yay -Sc
```

Use `-Yc` to remove old dependencies:

```sh
yay -Yc
ls ~/.cache/yay/ | wc -l
```

