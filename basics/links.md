---
title: "links"
tags: [ "Documentation", "Basics" ]
---
Link from X to Y.

```bash
ln -s X ../otherdir/Y
```

If you want a hard link, this will make a single file exist in two locations.
If it is deleted in one location, it continues to exist in the other.

```bash
ln *X* *Y*
```

Both files must be on the same hard drive, as they have the same inode (check this with `ls -i file`).

