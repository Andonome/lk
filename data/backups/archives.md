---
title: "Archives"
tags: [ "tar", "backups" ]
---
# `tar`

## Create

Combine many files and directories into a single t-archive file.

```bash
tar cf "$ARCHIVE".tar $DIR
```
You can remember this with the mnemonic '*C*reate *F*ile'.

Unfortunately, this stores the full file path, so making a tar archive of `/etc/nginx/` will store `etc/nginx` (without the leading `/`.

It's often better to tell tar which path to start from using the `-C` flag.

```bash
tar cf "$ARCHIVE".tar -C /etc/ nginx
```

Check the contents of your archive with:

```bash
tar tf "$ARCHIVE".tar
```

If you want to store 'everything in a directory', then using `*` will not work, because it will target everything in the *current* directory.

Instead, you can store the target in a variable:

```bash
files=$(ls /etc/nginx)
tar cf "$ARCHIVE".tar -C /etc/nginx/ $file
```

## Extract

Extract the tar archive with

> tar xf "$ARCHIVE".tar

You can remember this with the mnemonic 'e*X*tract *F*ile'.

## Compress

Create a zip-compressed archive with the `z` flag.

```bash
tar czf "$ARCHIVE".tgz -C /etc/nginx/ $file
```

You can use any file ending you want, but sane people like to use '.tgz' or '.tar.tgz'.

# 7zip

(also called 'p7zip' or '7z')

Make archive:

```bash
PASSWORD=my_password
```
```bash
7za a -tzip -p$PASSWORD -mem=AES256 $ARCHIVE.zip $FILE_1 $FILE_2
```
Note that people can still see every filename in your archive, and can change those files.
They just can't read the contents.

Unzip:

```bash
7za x archive.zip
```

7zip will open anything: zip-files, rar-files, a tin of beans, *anything*.
However, the extracted tgz files will just be tar files, so you will still need to use tar to extract them (see above).
