---
title: "ls"
tags: [ "basics" ]
---

Firstly, your `ls` is probably aliased to something.

Check it with:


```bash
alias ls
```
If the prompt shows some alias, then start by removing it:


```bash
unalias ls
```

Now we can begin.

Check the most recently modified file:


```bash
ls -t
```

Reverse this with `tac` to see the file which has been unmodified the longest:


```bash
ls -t | tac
```
Group files by extension:

```bash
ls -X
```
Sort largest files first:

```bash
ls -X
```

