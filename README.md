This is a list of quickstart guides for Linux programs.

# Purpose

1. Minimal theory, maximum practical.
2. The statements should go in order of how likely they are to be used: if `git add` has to be used by everyone, then it should go first.
3. The scripts should get someone up and running in the shortest possible time.
4. No explanations for the program.  This isn't an introduction or advert, it's a guide for someone who already wants to use a program but doesn't know how.
5. No presumed knowledge (except for information held in `basics.md`).
6. Easy reference.

As little knowledge as possible should be presumed, with required knowledge being internally linked.  If general knowledge is presumed, it should be placed into a file named 'basics'.

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

Systemd is taken as a default.  Non-systemd commands we relegate to their respective distros, e.g. runit for Void Linux.
