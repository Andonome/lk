---
title: "git hooks"
tags: [ "data", "git" ]
---

Check out the sample hooks:

```sh
cd ${git_repo}
ls .git/hooks
head .git/hooks/pre-commit.sample
```

Add a hook to check the shell scripts in `$GIT_REPO` before making a commit:

```sh
echo '#!/bin/sh
shellcheck *.sh' > .git/hooks/commit-msg
chmod u+x .git/hooks/commit-msg
```

## Committing

The `git hooks` will not work on other people who use the repository, but you
can commit them to a repository, then request others add these git hooks to
their own branch, by putting a note in the project's `README.md`.

```markdown
The project comes with recommended git hooks.
You can activate the hooks with `git config core.hooksPath hooks`.
```
