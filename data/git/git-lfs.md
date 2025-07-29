---
title: "git-lfs"
tags: [ "data", "git" ]
requires: [ "git" ]
---

Git Large File Storage ('LFS') needs to change your `~/.gitconfig` to check out those binary files:

```sh
cat ~/.gitconfig
git lfs install
cat ~/.gitconfig
```

Then track some filetypes with:

```sh
cd $git_repository
ext=ttf
git lfs track "*.$ext"
```

Or a directory with:

```sh
git lfs track "images/"
```

Track the changes to `.gitattributes`:

```sh
git status
git add .gitattributes
git commit -m "add $ext to lfs"
```

## Bash Completion

If bash completion does not work, you'll have to add it:

```sh
git lfs completion bash |  sudo tee /usr/share/bash-completion/completions/git-lfs 
```

## Trouble Shooting

You have some file "$FILE".png, which has some problem.

Check the filetype:

```sh
file "$FILE".png
```

This should say the type is 'image'.
If it says the type is 'text', then this file is really just a reminder to `git-lfs` to check out that file.

Check `git-lfs` is expecting that file:

```sh
git lfs status
git lfs ls-files
```

...then try these commands, and check the filetype again:

```sh
git lfs fetch --all
git lfs fsck
git lfs checkout
git lfs status
```

