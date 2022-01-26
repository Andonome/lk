---
title: "kill"
tags: [ "Documentation", "Basics" ]
---

If you want to kill a program in a graphical environment, open a terminal and type:

# Graphical Programs

> xkill

Then click on the application which you want to kill.

# All Programs

To kill a program, find it with:

> pgrep discord

This will give you the UUID, e.g. `19643`.

Kill the program with:

> kill 19643

# Types of Kill

To see an ordered list of termination signals:

> kill -l

 1) SIGHUP   2) SIGINT   3) SIGQUIT  4) SIGILL   5) SIGTRAP
 6) SIGABRT  7) SIGBUS   8) SIGFPE   9) SIGKILL 10) SIGUSR1
11) SIGSEGV 12) SIGUSR2 13) SIGPIPE 14) SIGALRM 15) SIGTERM


You can select these levels with a '- number'.
Higher numbers are roughly equivalent to insistence.

For example:

> kill -1 3498

This roughly means 'maybe stop the program, if you can, maybe reload'.

Or the famous:

> kill -9 3298

This means 'kill the program dead, now, no questions, dead'.

**Beware** - if Firefox starts another program to connect to the internet, and you `kill -9 firefox`, this will leave all of Firefox's internet connection programs ("children") still there, but dead and useless.

- A dead program which sits there doing nothing is known as a 'zombie'.
- A program which is run by another program is called a 'child program'.
- A child whose parent program is dead is called an 'orphan'.
- A child who remains running despite being useless because the parent is dead is called an 'orphan zombie'.

