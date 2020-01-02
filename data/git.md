# Basic Git

Move to the directory containing the project.

> git status

Add this folder (or just any dir)

> git add .

History:

> git log

# Commits

Add current changes to current config.

> git add .

Make a comment:

> git commit -m "Created service"

Type out a message:

> git commit

Push your stuff out:

> git push

Add a single line: 

> git log --oneline

Get recent changes:

> git pull

# New Project

> git init

# New Machines

> git config --global user.email "malinfreeborn@tutamail.com" 

> git config --global user.name "Malin Freeborn" 

# Branches

To make a new branch, make sure you're up to date, then:

> git checkout -b [branchname]

Check otu all branches with

> git branch -a 

Add the new branch to a git:

> git push origin [branchname]


# Tricks

## Delete All History

> git checkout --orphan temp

> git add -A

> git commit -am "release the commits!"

> git branch -D master

> git branch -m master

> git push -f origin master

Gitlab requires more changes, such as going to `settings > repository` and switching the main branch, then stripping protection.

# Subtree

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


