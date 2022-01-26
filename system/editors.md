---
title: "editors"
tags: [ "Documentation", "System" ]
---
The System's default text editor can be defined within /etc/profile.  It's given the variable `EDITOR`.

Add these lines to /etc/profile:

```

export EDITOR=vim

export VISUAL=$EDITOR

```

Then reload that profile with:

> source /etc/profile

If nano still pops up:

> sudo ln -sf $(which vim) $(which nano)

