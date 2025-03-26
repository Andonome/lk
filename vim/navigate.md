---
title: "vim navigation"
tags: [ "vim", "navigation" ]
---

| Move                    | Command      |
|:------------------------|:-------------|
| Down page               | Ctl-f        |
| Down half page          | Ctl-d        |
| Up page                 | Ctl-b        |
| Up half page            | Ctl-u        |
| Scroll down             | Ctl-e        |
| Scroll up               | Ctl-y        |
| Jump to previous place  | Ctl-i        |
| Jump to back            | Ctl-o        |
| Jump to last change     | g;           |
| Jump to next change     | g,           |
| Go to current filename  | gf           |

Go to a filename, and type `gf` (Go-to-File).
For example, if you put your cursor over the `~/.vimrc` in this line, you can edit your vim configuration file.

`source ~/.vimrc`

# Project Structure

Make a 20 character 'visual split' in the current working directory ('`.`').

`:20vs .`

Swap buffer positions:

`C-w x`


