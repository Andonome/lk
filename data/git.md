---
title: Setup git
tags: 
- data
- setup
---


```sh
git config --global user.email "${email}"
```

```sh
git config --global user.name "${name}"
```

Decide on algorithm:

- If you're scared of insecure hash-sums, go with `hash=sha256`.
- If you don't know what a hash sum is, go with `hash=sha1`.

## Init the Git

Start a git in directory `${DIR}`:

```sh
git init --object-format=${hash} ${DIR}
cd ${dir}/
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
git add ${file}
```

```sh
git commit -m"change ${file}"
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
remote=gitlab
git remote add ${remote}  https://gitlab.com/${username}/${dir}
```

Tell git you're pushing the branch 'master' to the remote repo 'origin': 

```sh
git push -u master origin
```

Pull down changes that others have made:

```sh
git pull
```

# Branches

A branch is a full copy of the project to test additional ideas.
You can make a new branch called 'featurez' like this:

```sh
git branch ${feature_branch}
```

Have a look at all your branches:

```sh
git branch
```

Switch to your new branch:

```sh
git checkout ${feature_branch}
```

And if your changes are rubbish, checkout the "master" branch again, then delete "featurez":

```sh
git branch -D ${feature_branch}
```

Or if it's a good branch, push it to the remote:

```sh
remote=origin
git push $remote ${feature_branch}
```

# Merging

Once you like the feature, merge it into the main branch.  Switch to master then merge it:

```sh
git merge ${feature_branch}
```

And delete the branch, as you've already merged it:

```sh
git branch -d ${feature_branch}
```

