---
title: "gpg keys with ssh"
tags: [ "Documentation", "distros" ]
---

<!--
Source:
https://ryanlue.com/posts/2017-06-29-gpg-for-ssh-auth
-->

Install `gnupg`.

Generate a new gpg key just for authentication:

> gpg2 --expert --edit-key 024C6B1C84449BD1CB4DF7A152295D2377F4D70F

Toggle options `S`, `E`, and `A` until the following output:

```
Current allowed actions: Authenticate
```

Add ssh to the gpg key agent.

> echo enable-ssh-support >> ~/.gnupg/gpg-agent.conf

This won't take effect until you restart the gpg agent, so kill it:

> gpgconf --kill gpg-agent

> gpgconf --launch gpg-agent

Use 2048 (or whatever) bits, save, and exit.

Add this to your `~/.bash_profile`:

```
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
```

> source ~/.bash_profile

Find the ssh key's keygrip with:

> gpg -k --with-keygrip

It's the one with `[A]` next to it.
Add it to `~/.gnupg/sshcontrol`.

> echo 1P0P6SA7S07Q8198414P126OR0514R3R8Q1389SP > ~/.gnupg/sshcontrol

Confirm it's added:

> ssh-add -l
