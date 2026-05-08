---
title: Slow the Terminal Down
tags: 
- fun
---

Slow the terminal to the old rates with a pipe and perl:

```sh
ff=/tmp/bashpipe
mkfifo $ff
( cat $ff | perl -We 'use Time::HiRes;$|++;while(read(STDIN,$c,1)){Time::HiRes::usleep(15000);print $c;}' ) & exec &> $ff

```

- Try running `dir` and `dir -F`!
- Don't run interactive commands like `vim` or `top`!

You can make it into a bash function by putting this into your `~/.bashrc`:


```bash
slow () 
{ 
    unset VISUAL;
    EDITOR=ed;
    alias ls='dir -F';
    export PS1='[$?] \W $ ';
    ff=/tmp/bashpipe_$(date +%s);
    mkfifo $ff 2> /dev/null;
    ( cat $ff | perl -We 'use Time::HiRes;$|++;while(read(STDIN,$c,1)){Time::HiRes::usleep(15000);print $c;}' ) & exec &> $ff;
}
```

Then type:

```bash
exec bash
slow
```
