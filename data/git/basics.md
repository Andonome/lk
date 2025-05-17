---
title: "git"
tags: [ "data" ]
---
# Starting

## New Machines

```sh
git config --global user.email "$YOUR_EMAIL"
```

```sh
git config --global user.name "$YOUR_NAME"
```

# New Git

Decide on algorithm:

- If you're scared of insecure hash-sums, go with `hash=sha256`.
- If you don't know what a hash sum is, go with `hash=sha1`.

## Init the Git

Start a git in directory `${DIR}`:

```sh
git init --object-format=${hash} ${DIR}
cd ${DIR}
```

Make a file explaining what the project does, and tell `git` to track it:

```sh
echo "I hereby solemnly swear never to commit a binary file." > README.md
git add README.md
```

Then make the initial commit, explaining the change you just made:

```sh
git commit
```

# Working

Once you make a change to some file, add it and make a commit explaining it.

```sh
git add $FILE
```

```sh
git commit -m"change $FILE"
```

Check your history:

```sh
git log
```

# Remotes

If you want to keep a copy on a public site such as Gitlab, so others can see it, then go there and create a blank project (no readme, nothing).
Give it the same name as the `$DIR` directory, above.

Add this as a remote:

```sh
REMOTE=gitlab
git remote add $REMOTE  https://gitlab.com/$USERNAME/$DIR
```

Tell git you're pushing the branch "master" to the remote repo "origin": 

```sh
git push -u master origin
```

If someone makes a change on the remote, pull it down with:

```sh
git pull
```

# Branches

A branch is a full copy of the project to test additional ideas.
You can make a new branch called 'featurez' like this:

```sh
git branch $FEATURE_BRANCH
```

Have a look at all your branches:

```sh
git branch
```

Switch to your new branch:

```sh
git checkout $FEATURE_BRANCH
```

And if your changes are rubbish, checkout the "master" branch again, then delete "featurez":

```sh
git branch -D $FEATURE_BRANCH
```

Or if it's a good branch, push it to the remote:

```sh
remote=origin
git push $remote $FEATURE_BRANCH
```

## Merging

Once you like the feature, merge it into the main branch.  Switch to master then merge it:

```sh
git merge $FEATURE_BRANCH
```

And delete the branch, as you've already merged it:

```sh
git branch -d $FEATURE_BRANCH
```

# Subtree

## Pulling another git repo into a subtree

```sh
git subtree add -P config git@gitlab.com:bindrpg/config.git master
```

# Tricks

## Delete All History

```sh
git checkout --orphan temp
```

```sh
git add -A
```

```sh
git commit -am "release the commits!"
```

```sh
git branch -D master
```

```sh
git branch -m master
```

```sh
git push -f origin master
```

Gitlab requires more changes, such as going to `settings > repository` and switching the main branch, then stripping protection.

## Clean up Bloated Repo

```sh
git fsck --full
```

```sh
git gc --prune=now --aggressive
```

```sh
git repack
```

## Find Binary Blobs

```sh
git rev-list --objects --all \
| git cat-file --batch-check='%(objecttype) %(objectname) %(objectsize) %(rest)' \
| sed -n 's/^blob //p' \
| sort --numeric-sort --key=2 \
| cut -c 1-12,41- \
| $(command -v gnumfmt || echo numfmt) --field=2 --to=iec-i --suffix=B --padding=7 --round=nearest

```

# More

For big binary files (like images), see [git large-file-storage](git-lfs.md)
