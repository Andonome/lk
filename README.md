---
title: "Linux Knowledge Base"
---

The Linux Knowledge-Base provides quick-start guides for working with terminal programs.

# Setup

Install `make`, `recutils`, and any fuzzy-finder (i.e. `sk`, `fzy`, or `fzf`).

Usage: `make`

# Style

## No History, No Context

- Nobody cares about how the project started.
- Nobody wants to read what `ffmpeg` is, because anyone who wants to use it already knows what it is.

## Be Opinionated

- Guides should not ask the reader to select options half-way through.
- Options for different filesystems, databases, et c., should be written as separate guides.

## Repetition Beats Reference

If a database requires three commands to set up, it's better to repeat those three commands for every program that requires a database than to just link to another file which discusses databases.

## Show Arguments as Variables

Look at this line:

```sh
grep ls --color=always  $HISTFILE | less -R
```

What else can go in place of `always`?
Can you say `--color=red`?
Can you put anything?
The answer is not obvious.

What about this line:

```sh
git branch new
git checkout new
```

Do you always use `new`?
Can you use another word here?
The answer is not obvious.

It's better to make all arbitrary values variables.

```sh
git branch $branch_name
git checkout $branch_name
PAGER='less -R'
grep ls --color=always $HISTFILE | $PAGER
```

Now we can see what can be changed.

# What's Wrong with Everything Else?

## Man pages

- Orders items by the alphabet rather than by relevance.
- Often presumes you know everything except that one program.
- Often written in the 80's, and it shows.
- Zero respect for your time.
- Often references `info` pages (yuck).

## `curl cheat.sh`

- Doesn't have the programs I like.
- Too short to get you started on many programs.
- Poor understanding of priority (`git stash` is covered before `git commit`).
- Repetitive

# Current State

This started as a few personal notes, and will probably continue to look like that for some time.
It's a bit of a mess.

Systemd is taken as a default.
Non-systemd commands are mentioned when required for a distro, e.g. runit for Void Linux.

