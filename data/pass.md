---
title: "pass"
tags: [ "Documentation", "data" ]
---
[Video instructions](https://www.hooktube.com/watch?v=hlRQTj1D9LA)

Setup [gpg](./gpg.md) keys.

Show your gpg secret it:

```bash
gpg --list-secret-keys
```

Then use the id number under `sec` to make a pass repo:

```bash
KEY="$(gpg --list-secret-keys  | grep -m 1 -A1 '^sec' | tail -n 1)"
```

```bash
pass init $KEY
```

To add a basic password, e.g. for `$WEBSITE`:

```bash
pass $WEBSITE
```

To insert a multiline password, e.g. with a login name:

```bash
pass add -m $WEBSITE
```

Remove a password:

```bash
pass rm $WEBSITE
```

