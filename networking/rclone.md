---
title: "rclone"
tags: [ "Networking" ]
---
The manpage's 'Synopsis' provides a fast reference.
```

We'll assume a folder in Google Drive called 'test', and local folder called 'foo'.

Generate a config file with:

```bash
rclone config
```

Look at the contents of Google Drive:

```bash
rclone ls gd:/
```

If rclone loses authorization:

```bash
rclone authorization
```

List only directories:

```bash
rclone lsf -dirs-only google:/
```

Mount the remote location on /tmp/google with:

```bash
rclone mount google /tmp/google
```

Copy the contents of 'foo' to 'test'.

```bash
rclone copy foo/ google:test
```

Sync contents of foo and test with a progress bar (will delete Google items):

```bash
rclone sync foo google:test -P
```

Remove all duplicates

```bash
rclone dedupe google:test
```

Delete contets of a remote file:

```bash
rclone delete n:test
```

Or delete the folder and contents as well:

```bash
rclone purge n:test
```

Copy to and from with:

```bash
rclone copyto google:test foo
```

or

```bash
rclone copyto foo google:test
