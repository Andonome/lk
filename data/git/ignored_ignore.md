---
title: Git's Other Ignore File
tags: 
- data
- git
requires:
- data/git.md
---

Everyone uses `.gitignore`, nobody pays attention to `.git/info/exclude`.

As usual, you echo the name of a file which should be ignored:


```sh
touch ${file}
git status -s
echo ${file} > .git/info/exclude
git status -s
```

Unlike the regular `.gitignore`, it's not checked into the repository, which
means it stays there, even after switching branches.

This other ignore file pairs well with make for when you need to dynamically
generate ignore rules.


```make
ignored += $(wildcard *.pdf)
ignored += $(wildcard */*.aux)
ignored += $(wildcard */*.log)

.git/info/exclude: | $(ignored)
	echo $| | tr ' ' '\n' > $@
    
```

