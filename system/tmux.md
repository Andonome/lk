---
title: "tmux"
tags: [ "Documentation", "System" ]
---
Start with:

> tmux

Input a command with C-b

In addition to Windows, there are panes.

|Commands | Key |
| ---- | ---- |
| New Window | c |
| Previous Window | p |
| next window | n |
| list windows | w |
| vertical split | % |
| horizontal split | " |
| name a command | : |
| kill pane | x |
| kill session | d |


|Name Commands|
| --------|
| split-window |
| rename-window |

# Sessions

Crate a new session with the name 'backup'.

> tmux new -s backup

List sessions:

> tmux list-sessions

> tmux kill-session -t 2

> tmux attach -t backup


# Control

Resize Panes with ^b then Esc+[direction].

