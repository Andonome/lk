---
title: "Soft Serve Maintenance"
tags: [ "data", "git server", "maintenance" ]
required: [ "git", "nginx" ]
---

Over time git repositories become bloated with old data, but never get cleaned.
I can't find an official way to clean up the crud, so I did this:

```sh
usermod -aG soft-serve $USER
# Log out and back in for this to take effect.

cd /var/lib/soft-serve/data/repos
sudo chmod -R g+w *
git config --global --add safe.directory '*'
du -sh *.git
for repo in *.git; do
    git -C "$repo" gc
done
du -sh *.git
$EDITOR ~/.gitconfig
# You should remove having everything marked 'safe'.
```
