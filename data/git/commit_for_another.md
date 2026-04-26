---
title: Commit for Another
tags: 
- data
- git
requires: 
- data/git.md
---

You can make Alice the author, while you are still the commiter:

```sh
name="Alice Bobinson"
email="alice@email.com"

git add ${file}
git commit --author="${name} <${email}>"
```

Or, make Alice both the committer and the author:


```sh
git -c user.name="${name}" -c user.email="${email}" commit -m "${message}"
```

