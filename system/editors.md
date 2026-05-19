---
title: Setting an EDITOR
tags: 
- system
- defaults
---

Programs expect a default 'line EDITOR' and 'VISUAL editor' so they know how you want to edit text.

Add these lines to automatically set the variables in `bash`:

```sh
echo 'export EDITOR=vim' >> ~/.bashrc
echo 'export VISUAL=$EDITOR' >> ~/.bashrc
```

Make the change system-wide by adding them to `/etc/profile.d/custom.sh` instead, which is loaded at startup.

You can add a GUI editor as the `$VISUAL` editor:

```sh
VISUAL=gedit
```

To use a true line editor, as `$EDITOR`, see [ed](writing/ed.md).
