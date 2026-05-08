---
title: Format Markdown Columns in Vim
tags: 
- writing
- vim
- markdown
---

Got a wonky markdown table?


```markdown

| Real Time | Game Time |
|:--|:-|
| 1 week | 1 month |
| 3 weeks | 3 months|
| 6 months | 2 years|
| 1 year | 4 years|

```

Vim can fix it without plugins.
Just use this snippet (type `:` to begin inputting a command):

```vim
:vmap <C-t> :!tr -s ' -' \|column -ts '\|' -o '\|'<Enter>j:s/ /-/g<Enter>k
```

Highlight the whole thing with `vap` then press `Control + t`.
Instantly, it is aligned:

```markdown

| Real Time | Game Time |
|:----------|:----------|
| 1 week    | 1 month   |
| 3 weeks   | 3 months  |
| 6 months  | 2 years   |
| 1 year    | 4 years   |
```

**NB:** This method has problems with centre-aligned columns (using `:---:`).

## Vim Run Commands

Put this in your `~/.vimrc` to make the mapping permanent:

```vim
vmap <C-t> :!tr -s ' -' \|column -ts '\|' -o '\|'<Enter>j:s/ /-/g<Enter>k
```

