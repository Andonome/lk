---
title: "Instantly cd anywhere in bash"
tags: [ "system", "bash" ]
---

Change locations quickly with the `bash` built-in variable: `$CDPATH`.

```bash
CDPATH=~
```

Now if you want to enter `~/docs/` you can type `cd docs`, even if you're not in your home directory.

Add multiple locations with a colon between them.

```bash
CDPATH=~/archives/$(date +%Y/%m/):~:~/projects/:/mnt/share/
```

The first one will let you enter any directory inside '2028/01/', or whatever the current date is.

