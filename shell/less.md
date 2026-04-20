---
title: Read and scroll
tags: [ "shell", "pager" ]
---

The output from `tree` is too long.
Turn on colours and read with less:

```sh
tree -C | less -R
```

- `j`: scroll down
- `k`: scroll up
- `g`: go-to top
- `G`: go-to bottom
- `q`: quit

# Search with less

- `/<word>` to search
- `<Escape>u` to undo search highlights

Make search case insensitive with `less -i`.

```sh
less -i README.md
```

The `man` pages often use `less`.
Make the `man` pages use `less` with case insensitive searching by using the `$MANPAGER` variable.

```sh
MANPAGER='less -i'
man column
/exampl
```

# Quick Commands

Execute a shell command inside `less` so you don't have to lose your place while reading `column`.
Just press `!`, e.g. `!ls`.


# Edit a File

While reading a file, press `v` to edit it ('v' stands of `vi`).

