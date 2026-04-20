---
title: rclone
tags: 
- networking
- synch
---
The manpage's 'Synopsis' provides a fast reference.
```

We'll assume a folder in Google Drive called 'test', and local folder called 'foo'.

Generate a config file with:

```sh
rclone config
```

Look at the contents of Google Drive:

```sh
rclone ls gd:/
```

If rclone loses authorization:

```sh
rclone authorization
```

List only directories:

```sh
rclone lsf -dirs-only google:/
```

Mount the remote location on /tmp/google with:

```sh
rclone mount google /tmp/google
```

Copy the contents of 'foo' to 'test'.

```sh
rclone copy foo/ google:test
```

Sync contents of foo and test with a progress bar (will delete Google items):

```sh
rclone sync foo google:test -P
```

Remove all duplicates

```sh
rclone dedupe google:test
```

Delete contets of a remote file:

```sh
rclone delete n:test
```

Or delete the folder and contents as well:

```sh
rclone purge n:test
```

Copy to and from with:

```sh
rclone copyto google:test foo
```

or

```sh
rclone copyto foo google:test
