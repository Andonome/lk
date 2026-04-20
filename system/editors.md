---
title: $EDITOR
tags: 
- system
---
The System's default text editor can be defined within /etc/profile.  It's given the variable `EDITOR`.

Add these lines to `/etc/profile.d/custom.sh`:

```sh
echo 'export EDITOR=vim' >> /etc/profile.d/custom.sh
echo 'export VISUAL=$EDITOR' >> /etc/profile.d/custom.sh
```

Then reload that profile with:

```sh
source /etc/profile
```

If you want to ensure `nano` never appears again:

```sh
sudo ln -sf $(which vim) $(which nano)
```
