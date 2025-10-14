---
title: "Arch Maintenance with yay"
tags: [ "arch" ]
requirements: [ "Arch Maintenance" ]
---

# Package Cache

Just like `pacman`

```sh
ls ~/.cache/yay/ | wc -l
yay -Sc
```

Use `-Yc` to remove old dependencies:

```sh
yay -Yc
ls ~/.cache/yay/ | wc -l
```

