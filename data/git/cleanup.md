---
title: Clean up a bloated git repo
tags: 
- data
- setup
requires: 
- data/git.md
---


```sh
git fsck --full
```

```sh
git gc --prune=now --aggressive
```

```sh
git repack
```

