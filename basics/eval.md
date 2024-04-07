---
title: "eval"
tags: [ "basics" ]
---

Compose a statement for execution.

```bash
x='echo $y'
echo $x
y=dragon
eval "$x"
```

The results remain in the current shell, unlike sub-shells.

```bash
b=basilisk
sh -c 'echo $b'
eval "g=goblin"
echo $g
```
