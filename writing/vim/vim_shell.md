---
title: Writing Shell Scripts in Vim
tags: 
- writing
- vim
required: writing/vim/windows.md
---

Make an empty script:


```sh echo '#!/bin/sh' > ${file}.sh chmod u+x !$ vim !$ ```

Open a terminal in Vim:

```vim :vert term ```

Inside that terminal, run the script on repeat:

```sh watch -d ./${file}.sh ```

Switch back to editing the script with `Control+w h`.

Try out a command like `ls`, then look up the manual for `ls` by putting the
cursor over the word and pressing `K`.
