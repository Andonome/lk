---
title: "pass"
tags: [ "data" ]
requires: "GPG Basics"
---

Setup [gpg](./gpg.md) keys.

Show your gpg secret it:

```sh
gpg --list-secret-keys
```

Then use the id number under `sec` to make a pass repo:

```sh
KEY="$(gpg --list-secret-keys  | grep -m 1 -A1 '^sec' | tail -n 1)"
```

```sh
pass init $KEY
```

To add a basic password, e.g. for `$WEBSITE`:

```sh
pass $WEBSITE
```

To insert a multiline password, e.g. with a login name:

```sh
pass add -m $WEBSITE
```

Remove a password:

```sh
pass rm $WEBSITE
```

