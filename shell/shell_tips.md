---
title: Shell tips
tags: 
- shell
- comfy
---

# Done

`<C-d>`

- If you have a command, Control + d will execute the command.
- If you have nothing, `exit`.

# Search & Clear Highlights

You can search in many programs by using `/`.
Most programs let you clear the highlighting with `<Esc>+u`.


## Track Live Changes

Follow a file as new lines are added to it:

```sh
tail -f *somefile*
```

See changes in a directory, as it changes:

`watch -d ls *directory*`

Or use the `-g` flag to exit once the output changes.
This command will look at whether you're connected to the internet, and turn into a rainbow once the connection hits.

> watch -g ip address && clear && ip address | lolcat


# See Also

- [Bash tips](shell/bash_tips.md)
