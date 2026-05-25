---
title: Store passwords
tags: 
- data
- Setup
- credentials
- secrets
requires: 
- data/gpg.md
---

Setup [gpg](data/gpg.md) keys.

Show your gpg secret it:

```sh
gpg --list-secret-keys
```

Then use the id number under `sec` to make a pass repo:

```sh
key="$(gpg --list-secret-keys  | grep -m 1 -A1 '^sec' | tail -n 1)"
```

```sh
pass init $key
cat .password-store/.gpg-id
```

To add a basic password, e.g. for `${website}`:

```sh
pass ${website}
```

To insert a multi-line password, e.g. with a login name:

```sh
pass add -m ${website}
```

Remove a password:

```sh
pass rm ${website}
```

You can generate passwords with `xkcdpass`.

Automatically insert a password with `pass insert`:


```sh
xkcdpass | pass insert --echo ${website}
```
