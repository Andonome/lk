---
title: "git"
tags: [ "data" ]
---
# Starting

## New Machines

```bash
git config --global user.email "$YOUR_EMAIL"
```

```bash
git config --global user.name "$YOUR_NAME"
```

# New Git

Start a git in directory `$DIR`:

```bash
mkdir $DIR && cd $DIR
```

```bash
git init
```

Make a file explaining what the project does, and tell `git` to track it:

```bash
echo "I hereby solemnly swear never to commit a binary." > README.md
git add README.md
```

Then make the initial commit, explaining the change you just made:

```bash
git commit
```

# Working

Once you make a change to some file, add it and make a commit explaining it.

```bash
git add $FILE
```

```bash
git commit -m"change $FILE"
```

Check your history:

```bash
git log
```

# Remotes

If you want to keep a copy on a public site such as Gitlab, so others can see it, then go there and create a blank project (no readme, nothing).
Give it the same name as the `$DIR` directory, above.

Add this as a remote:

```bash
REMOTE=gitlab
git remote add $REMOTE  https://gitlab.com/$USERNAME/$DIR
```

Tell git you're pushing the branch "master" to the remote repo "origin": 

```bash
git push -u master origin
```

If someone makes a change on the remote, pull it down with:

```bash
git pull
```

# Branches

A branch is a full copy of the project to test additional ideas.
You can make a new branch called 'featurez' like this:

```bash
git branch $FEATURE_BRANCH
```

Have a look at all your branches:

```bash
git branch
```

Switch to your new branch:

```bash
git checkout $FEATURE_BRANCH
```

And if your changes are rubbish, checkout the "master" branch again, then delete "featurez":

```bash
git branch -D $FEATURE_BRANCH
```

Or if it's a good branch, push it to the remote:

```bash
remote=origin
git push $remote $FEATURE_BRANCH
```

## Merging

Once you like the feature, merge it into the main branch.  Switch to master then merge it:

```bash
git merge $FEATURE_BRANCH
```

And delete the branch, as you've already merged it:

```bash
git branch -d $FEATURE_BRANCH
```

# Subtree

## Pulling another git repo into a subtree

```bash
git subtree add -P config git@gitlab.com:bindrpg/config.git master
```

# Tricks

## Delete All History

```bash
git checkout --orphan temp
```

```bash
git add -A
```

```bash
git commit -am "release the commits!"
```

```bash
git branch -D master
```

```bash
git branch -m master
```

```bash
git push -f origin master
```

Gitlab requires more changes, such as going to `settings > repository` and switching the main branch, then stripping protection.

## Clean up Bloated Repo

```bash
git fsck --full
```

```bash
git gc --prune=now --aggressive
```

```bash
git repack
```

## Find Binary Blobs

```bash
git rev-list --objects --all \
| git cat-file --batch-check='%(objecttype) %(objectname) %(objectsize) %(rest)' \
| sed -n 's/^blob //p' \
| sort --numeric-sort --key=2 \
| cut -c 1-12,41- \
| $(command -v gnumfmt || echo numfmt) --field=2 --to=iec-i --suffix=B --padding=7 --round=nearest

```

# More

For big binary files (like images), see [git large-file-storage](git-lfs.md)
