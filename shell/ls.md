---
title: ls
tags: 
- basics
---

Firstly, your `ls` is probably aliased to something.

Check it with:


```sh
alias ls
```
If the prompt shows some alias, then start by removing it:


```sh
unalias ls
```

Now we can begin.

Check the most recently modified file:


```sh
ls -t
```

Reverse this with `tac` to see the file which has been unmodified the longest:


```sh
ls -t | tac
```
Group files by extension:

```sh
ls -X
```
Sort largest files first:

```sh
ls -X
```

