---
title: "git stash"
tags: [ "data", "git" ]
requires: [ "git" ]
---

Save file-changes without committing anything.

Change a file:

```sh
file=README.md
fortune >> ${file}
git diff
git stash save
```

List which stashes you have:


```sh
git stash list

    stash@{1}: WIP on master: c21f102 init git
```

Make a new file, then stash it:


```sh
otherfile=file.log
fortune > ${otherfile}
git add ${otherfile}
stashname=logfile
git stash save ${stashname}
```

Now you can see two stashed changes, and the most recent has a name:

```sh
git stash list

    stash@{0}: On master: logfile
    stash@{1}: WIP on master: c21f102 init git
```

You can delete a stash by referring to its index number, or name (if it has one).

```sh
choice=1
git stash drop ${choice}

choice=${stashname}
git stash drop ${choice}
```

Or just run `git stash drop` to remove the most recent (labelled `{0}`).

Return stashed changes with an index number (or the most recent).

```sh
git stash pop ${choice}
```

Delete all stashes:

```sh
git stash clear
```
