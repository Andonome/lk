---
title: soft links
tags: 
- basics
- links
---
A soft link is a file which says how to go to another file.
When a program encounters a soft link, it will make a  guess at whether it should ignore it, or try to get to that file.

To make a soft link to a file in the current directory, linking is easy:

```sh
fortune > $file_1
ln -s $file_1 $link_1
```

Now imagine your directory looks like this:

```
dir_0/
├── dir_1
│   └── file_1
├── dir_2
│   └── file_1
├── file_1
└── link_1

```

Inside `dir_1`, making a soft link to `dir_0/file_1` would mean putting the directions to that file:

```sh
cd dir_1
ln -s ../file_1 link_1
```

The real content of the file is just '`../file_1`, so making it from another directory would mean writing exactly the same address to that file:

```sh
ln -s ../file_1 dir_2/link_2
```

Both symlinks are identical, except for the name.

```
dir_0/
├── dir_1
│   ├── file_1
│   └── link_1   <-- This one points to ../file_1
├── dir_2
│   ├── file_1
│   └── link_2   <-- This one points to ../file_1 as well.
└── file_2

```

Since it's just an address, you can delete the original file, then make another.

```sh
rm file_1
ls -l dir_1/
fortune > file_1
cat dir_2/link_2
fortune | tee -a file_1
cat dir_1/link_1
```

Last, let's make a link from `dir_2/link_2` to `dir_1/file_1` (this will delete the old link):

```sh
ln -s -f ../dir_1/file_1 dir_2/link_2
cat dir_2/link_2
```

