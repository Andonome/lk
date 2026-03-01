---
title: "gpg with vim"
tags: [ "vim", "data", "GPG" ]
requires: [ "GPG Basics", "vim basics" ]
---

The `vim-gnupg` plugin lets vim edit gpg-encrypted files as if they were unencrypted.

It's probably in your package manager.
If not, you'll need to endure the faff of following the [instructions](http://www.vim.org/scripts/script.php?script_id=3645).


## Prompt for password in terminal 

Check your current gpg-agent configuration:

```sh
gpgconf --list-options gpg-agent
```

Create file, if it doesnt exit `~/.gnupg/gpg-agent.conf`:

```
# Force terminal prompts for passwords
pinentry-mode loopback

# Optional: specify which pinentry program to use
pinentry-program /usr/bin/pinentry-tty
```

Then restart gpg-agent:
```sh
gpg-connect-agent reloadagent /bye
```

