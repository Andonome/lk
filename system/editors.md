---
title: "$EDITOR"
tags: [ "System" ]
---
The System's default text editor can be defined within /etc/profile.  It's given the variable `EDITOR`.

Add these lines to `/etc/profile.d/local.sh`:

```

export EDITOR=vim

export VISUAL=$EDITOR

```

Then reload that profile with:

```bash
source /etc/profile
```

If you want to ensure `nano` never appears again:

```bash
sudo ln -sf $(which vim) $(which nano)
```
