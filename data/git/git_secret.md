---
title: "git secret"
tags: [ "data", "git" ]
---

This utility is largely useless, as it can only identify people by their email.
So if someone has multiple GPG keys associated with one email, the tool will not work.

Worse than not working, it may 'suddenly' stop working as you try to transfer a secret to someone, who then discovers that `git-secret` requires them to mess about with their GPG keyring in order to use the repository.
