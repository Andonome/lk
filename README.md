# Linux Knowledgebase

This is a list of quickstart guides for Linux programs, designed to get the user up and running as fast as possible.

# Style

1. Minimal theory, maximum practical.
2. The statements should go in order of how likely they are to be used: if `git add` has to be used by everyone, then it should go first.
3. Documents should be similar to well-documented scripts.
4. No explanations for the program.  This isn't an introduction or advert, it's a guide for someone who already wants to use a program but doesn't know how.
5. It's better explain how to set something up three times than to link or reference a setup.
6. If general knowledge must be presumed, it should be placed into a file named 'basics'.

### Example

```
How to see which websites you're actively accessing:

> ss -tr dst :443

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

Systemd is taken as a default.  Non-systemd commands we relegate to their respective distros, e.g. runit for Void Linux.
