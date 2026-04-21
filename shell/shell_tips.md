---
title: Shell tips
tags: 
- shell
- comfy
---

# This & That

Refer to 'that last thing', and 'the first thing':

```sh
fortune -l > file1
cat !$  | tr -d u
diff !^ !$
```

**NB:** this can go wrong:

```sh
ls -l file1 file2
cat !^
```

# Done

`<C-d>`

- If you have a command, Control + d will execute the command.
- If you have nothing, `exit`.

# Clear Search Highlights

`<Esc>+u`

Works in most programs with search.

