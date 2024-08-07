---
title: "hard links"
tags: [ "basics", "links" ]
---

A hard link is one file which exists in multiple locations.

Each file has an ID, which is kept on the hard disk's partition.
Each hard link has the same ID, because they are the same file.
This ID is called the 'inode'.

Create a file, and a hard link:

```bash
fortune > $file_1
mkdir -p x/y/z/
ln $file_1 x/y/z/$file_2
```
Have a long look at the file with the `-l` flag, and check the inode with `-i`:

```bash
ls -li $file_1 x/y/z/$file_2
```

Since they are the same file, you can make a change to one, and it changes both:

```bash
fortune | tee x/y/z/$file_2
cat $file_1
cat x/y/z/$file_2
```

# Danger Zone

- hard links will not work on directories, only standard files and fifos.
- `git` will destroy and remake files, so it will not respect hard links.
- Files cannot have a hard link on another disk partition, because the inode is stored on each partition.

