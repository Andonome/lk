---
title: "Joyous ASCII"
tags: [ "fun" ]
---

- `asciiquarium`
- `cbonsai -lim "$(fortune)"`

```bash
cow=$(cowsay -l | sort -R | head  -1)
fortune -s | figlet | cowsay -nf $cow | lolcat
```
