---
title: GPG Password Entry
tags: 
- vim
- secrets
- TUI
requires: 
- data/gpg.md
- writing/vim.md
---


Check your current gpg-agent configuration:

```sh
gpgconf --list-options gpg-agent
```

Create file, if it doesn't exit `~/.gnupg/gpg-agent.conf`:

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

