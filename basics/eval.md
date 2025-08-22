---
title: "eval"
tags: [ "basics" ]
---

Compose a statement for execution.

```sh
x='echo $y'
echo $x
y=dragon
eval "$x"
```

The results remain in the current shell, unlike sub-shells.

```sh
b=basilisk
sh -c 'echo $b'
eval "g=goblin"
echo $g
```
