---
title: Setup Git Annex
tags: 
- data
- git
required: data/git.md
---


```bash
cd ${repo}
git annex init $HOSTNAME
```

NB: This seems to work with 256 hashsums, but I've had some funny error 
messages, so it might cause problems.


```sh
git annex list

url='https://en.wikipedia.org/api/rest_v1/page/pdf/Belgrade_Pride'
name=$(basename "$url").pdf

git annex addurl "${url}" --file "${name}"
git annex list
```

Add a remote which has `git annex` installed (most do) then copy the file to 
it.


```sh
remote=gitlab
url="ssh://gitlab.com/${username}/${repo}"
git remote add ${remote} ${url}

git annex copy ${name} --to ${remote}

git annex list
```



- [Official Walkthrough](https://git-annex.branchable.com/walkthrough/#index19h2)
