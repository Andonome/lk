---
title: "Linux Knowledge Base"
---

The Linux Knowledge-Base provides quick-start guides for working with terminal programs.

If you like this style of short articles with a miniature database, then join me in my quest to remove the nausea of poorly-written documentation.

# Setup

Install `make`, `recutils`, and any fuzzy-finder (i.e. `sk`, `fzy`, or `fzf`).

## Usage

Set up the database and try a few queries:

```sh
make
make database

recsel db.rec -m 3
recsel db.rec -q database
recsel db.rec -e "title = 'ssh'"
recsel db.rec -e "title ~ 'ssh'"
recsel db.rec -e "title ~ 'bash'" -R title,wordcount

recsel db.rec -t guide -j provides -G title \
    -e "title = 'ssh'" \
    -p 'sum(provides_wordcount)'
```

# Style

## No History, No Context

- Nobody cares about how the project started.
- Nobody wants to read what `ffmpeg` is, because anyone who wants to use it already knows what it is.

## State Knowledge Dependencies

Articles should state what you need to understand in order to read them *at the start*.
They should not assume the reader knows much beyond common terminal commands, and should not provide a link to some other resource half-way through an article.

People should be able to read an article from the beginning, then keep going until the end, and then stop.
Articles should not take a detour through a chain of other articles of unknown size.

[Do not Jaquays documentation](https://splint.rs/posts/no_links)

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

## Assume People Follow the Instructions

Articles should say what to type, not the output.
If the command is `ls`, users will see files once they try the command, but the article does not need to provide an example list of files unless an important point has to be made about output.

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

