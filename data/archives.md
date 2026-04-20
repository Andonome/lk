---
title: "Archives"
tags: [ "archives", "backups" ]
---

# Create

Combine many files and directories into a single t-archive file.

```sh
tar cf "$ARCHIVE".tar $DIR
```
You can remember this with the mnemonic '*C*reate *F*ile'.

Unfortunately, this stores the full file path, so making a tar archive of `/etc/nginx/` will store `etc/nginx` (without the leading `/`).
It's often better to tell tar which path to start from using the `-C` flag.

```sh
tar cf "$ARCHIVE".tar -C /etc/ nginx
```

Check the contents of your archive with:

```sh
tar tf "$ARCHIVE".tar
```

If you want to store 'everything in a directory', then using `*` will not work, because it will target everything in the *current* directory.

Instead, you can store the target in a variable:

```sh
files=$(ls /etc/nginx)
tar cf "$ARCHIVE".tar -C /etc/nginx/ $file
```

# Extract

Extract the tar archive with

```sh
tar xf "$ARCHIVE".tar
```

You can remember this with the mnemonic 'e*X*tract *F*ile'.

# Compress

Create a zip-compressed archive with the `z` flag.

```sh
tar czf "$ARCHIVE".tgz -C /etc/nginx/ $file
```

You can use any file ending you want, but sane people like to use '.tgz' or '.tar.tgz'.

