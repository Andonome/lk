---
title: "git"
tags: [ "data", "git", "subtree" ]
---

## Pulling a Subtree from an existing git

The project has subdirectories `sub-1`, `sub-2`, `sub-3`.
The first should be its own repository, but should also retain its own history.

First, we extract its history as an independent item, and make that into a seprate branch.

```bash
git subtree split --prefix=sub-1 -b sub
```

If you want something a few directories deep, you can use `--prefix=sub-1/dir-2/dir-3

Then go and create a new git somewhere else:

```bash
cd ..;mkdir sub-1;cd sub-1;git init --bare
```

Then go back to your initial git repo, and do the following:

git push ../subtest sub:master

Finally, you can clone this repo from your original.

```bash
git clone ../subtest
```

