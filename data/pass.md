---
title: "pass"
tags: [ "Documentation", "data" ]
---
[Video instructions](https://www.hooktube.com/watch?v=hlRQTj1D9LA)

Setup [gpg](./gpg.md) keys.

Show your gpg secret it:

> gpg --list-secret-keys

Then use the id number under `sec` to make a pass repo:

> pass init 187233O300300814PQ793NSSS539SQ1O6O184532

To add a basic password, e.g. for an encrypted tarball, use:

> pass add my-tar-gar.gz

To insert a multiline password, e.g. with a login name:

> pass add -m linuxrocks.online

Remove a password:

> pass rm linuxrocks.online

