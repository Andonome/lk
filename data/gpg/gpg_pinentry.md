---
title: "GPG Password Entry"
tags: [ "vim", "secrets", "TUI" ]
requires: [ "GPG Basics", "vim basics" ]
---


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

