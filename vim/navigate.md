---
title: "vim navigation"
tags: [ "Documentation", "vim" ]
---

| Move | Command      |
|:-----|:-------------|
|Down page | C-f      |
| Down half page | C-d |
| Up page | C-b |
| Up half page | C-u |

## Scroll

> C-e

> C-y

## Jumps

Go through your last jumps:

> C-I

> C-O

Go to the last and previous places you've changed:

> g;

> g,

Go to a filename, and type `gf` (Go-to-File).
For example, if you put your cursor over the `~/.vimrc` in this line, you can edit your vim configuration file.

`source ~/.vimrc`

# Project Structure

Make a 20 character 'visual split' in the current working directory ('`.`').

> :20vs .

Change the view for this:

> C-w x


