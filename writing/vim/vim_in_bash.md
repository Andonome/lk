---
title: "vim in bash"
tags: [ "vim", "bash", "inputrc", "TUI" ]
requires: [ "vim basics" ]
---

Put bash in vim mode!

Place the following in your `~/.inputrc`:

```
set editing-mode vi
set show-mode-in-prompt on
set vi-ins-mode-string \1\e[33;32m\2[>]=\1\e[0m\2
set vi-cmd-mode-string \1\e[33;1m\2[?]=\1\e[0m\2

set keymap vi-insert
RETURN: "\e\n"
```

