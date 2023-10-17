---
title: "tree"
tags: [ "basics" ]
---

The `tree` utility outputs a full listing of everything in your current directory, and those below.

- Just directories: `tree -d`
- Output colour to `less`: `tree -C --info | less -re`
- Ignore files in the `.gitignore` file: `tree --gitignore`

You can place information about the files in a directory to use with the `tree --info` option, like this:

```
config
	Config files.
	This is a git submodule.
README.md
	Summary of the git.
*.jpg
	Little picture, does not display
	words well.
```

Each description-line starts with a tab.
