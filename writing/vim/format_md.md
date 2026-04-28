---
title: Reformat a Markdown Table
tags: 
- writing
- vim
- markdown
requires:
- writing/vim.md
---

This markdown table is badly messed up:

```markdown
| File  | Category |
|:------|:---------|
| calendar.md           | tex|
| tex_packages.md           | tex|
| completion.md           | vim|
| csv_to_md.md           | vim|
| format_md.md           | vim|

```

Highight from the top with `V6j`, then run `column` to fix the output:

```vim
:!column -ts'|' -o '|'
```

It displays like this:

```vim
:'<,'>!column -ts'|' -o '|'
```

```markdown
| File                      | Category |
|:------                    |:---------|
| calendar.md               | tex      |
| tex_packages.md           | tex      |
| completion.md             | vim      |
| csv_to_md.md              | vim      |
| format_md.md              | vim      |

```


That's better, but the header is broken.
Fix is by replacing spaces with dashes.

```vim
:s/ /-/g
```

The lines have too much whitespace.
You can fix this with the 'truncate' command, to squeeze repeating spaces or dashes.


```vim
tr -s ' -' |column -ts '|' -o '|'
```

```markdown
| File            | Category |
|:----------------|:---------|
| calendar.md     | tex      |
| tex_packages.md | tex      |
| completion.md   | vim      |
| csv_to_md.md    | vim      |
| format_md.md    | vim      |

```

# Keyboard Shortcut

Put this in your `~/.vimrc` to map 'Control + t' to reformat markdown tables in visual mode.


```vim
vmap <C-t> :!tr -s ' -' \|column -ts '\|' -o '\|'<Enter>j:s/ /-/g<Enter>k
```

