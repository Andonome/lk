---
title: "git"
tags: [ "Documentation", "data" ]
---
# Starting

## New Machines

> git config --global user.email "malinfreeborn@tutamail.com" 

> git config --global user.name "Malin Freeborn" 

# New Git

Start a git:

> git init

Add whatever's in the folder.

> git add .

Then make the initial commit:

> git commit

# Working

Once you make a change to some file ("file.sh"), add it and make a commit explaining it.

> git add file.sh

> git commit -m"change file.sh"

Check your history:

> git log

# Remotes

Get the url of your git remote and add it, with the name "origin":

> git remote add origin git@gitlab.com:bindrpg/core

Tell git you're pushing the branch "master" to the remote repo "origin": 

> git push -u master origin

If someone makes a change on the remote, pull it down with:

> git pull

# Branches

A branch is a full copy of the project to test additional ideas.
You can make a new branch called 'featurez' like this:

> git branch featurez

Have a look at all your branches:

> git branch

Switch to your new branch:

> git checkout featurez

And if your changes are rubbish, checkout the "master" branch again, then delete "featurez":

> git branch -D featurez

Or if it's a good branch, push it to the remote:

> git push origin featurez

## Merging

Once you like the feature, merge it into the main branch.  Switch to master then merge it:

> git merge featurez

and delete featurez as you've already merged it:

> git branch -d featurez

# Subtree

## Pulling another git repo into a subtree

> git subtree add -P config git@gitlab.com:bindrpg/config.git master

## Pulling a Subtree from an existing git

The project has subdirectories sub-1,sub-2,sub-3.  The first should be its own repository, but should also retain its own history.

First, we extract its history as an independent item, and make that into a seprate branch.

> git subtree split --prefix=sub-1 -b sub

If you want something a few directories deep, you can use `--prefix=sub-1/dir-2/dir-3

Then go and create a new git somewhere else:

> cd ..;mkdir sub-1;cd sub-1;git init --bare

Then go back to your initial git repo, and do the following:

git push ../subtest sub:master

Finally, you can clone this repo from your original.

> git clone ../subtest

# Tricks

## Delete All History

> git checkout --orphan temp

> git add -A

> git commit -am "release the commits!"

> git branch -D master

> git branch -m master

> git push -f origin master

Gitlab requires more changes, such as going to `settings > repository` and switching the main branch, then stripping protection.

## Clean up Bloated Repo

> git fsck --full

> git gc --prune=now --aggressive

> git repack

## Find Binary Blobs

```

git rev-list --objects --all \
| git cat-file --batch-check='%(objecttype) %(objectname) %(objectsize) %(rest)' \
| sed -n 's/^blob //p' \
| sort --numeric-sort --key=2 \
| cut -c 1-12,41- \
| $(command -v gnumfmt || echo numfmt) --field=2 --to=iec-i --suffix=B --padding=7 --round=nearest

```

