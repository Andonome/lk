---
title: "Knowledge Base"
---

# Linux Knowledgebase

This is a list of quickstart guides for Linux programs, designed to get the user up and running as fast as possible.

# Style

## Praxis Only

We leave theory alone as much as possible.
The documentation should be of the form 'if you want *X*, type *Y*'.

We don't need to explain what a program does - anyone looking up 'how to X', already knows what they want to do.
We don't even need to explain which program to use - if someone wants to combine an mp4 and webm video into a single video file, they only care about that result, not about learning `ffmpeg`.

Any interest in these tools only comes after we can use them.

## Chronological

Entries should read like scripts - everything in the right order, with small notes on what this does.

The chronology should never branch.
If `gitea` can use three different types of database, the documentation should simply pick one and continue instructions from there.
Repetition works better than a reference - if a database requires three commands to set up, it's better to repeat those three commands for every program that requires a database than to just link to another file which discusses databases.

### Closing

Introductory documents should show anything required to cleanly uninstall a program, without leaving bulky configuration files behind.

## Three Input Types

There are three types of examples:

Fixed input:

```bash
ls
```

Anything with arbitrary input should be shown as a variable.

```bash
ls $FILE
```

Non-commands (e.g. output) should be shown as quoted text:

> LK           img
> Mail         kn
> Projects     music

# Example

```
How to see which websites you're actively accessing:

` ` `bash
ss -tr dst :$PORT
` ` `   

> State  Recv-Q  Send-Q   Local Address:Port                                    Peer Address:Port   Process  
> ESTAB  0       0         192.168.0.14:42476                                 149.154.167.91:https           
> ESTAB  0       0         192.168.0.14:43644                                  104.17.90.199:https           

```

# What's wrong with everything else?

## Man pages

- Orders items by the alphabet rather than by relevance.
- Often presumes you know everything except that one program.
- Often written in the 80's, and it shows.
- Zero respect for your time.

## curl cheat.sh/

- Doesn't have the programs I like.
- Too short to get you started on many programs.
- Poor understanding of priority (`git stash` is covered before `git commit`).

# Current State

This started as a few personal notes, and will probably continue to look like that for some time.
It's a bit of a mess.

Systemd is taken as a default.
Non-systemd commands are mentioned when required for a distro, e.g. runit for Void Linux.

