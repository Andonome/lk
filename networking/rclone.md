---
title: "rclone"
tags: [ "Documentation", "networking" ]
---
The manpage's 'Synopsis' provides a fast reference.

We'll assume a folder in Google Drive called 'test', and local folder called 'foo'.

Generate a config file with:

> rclone config

Look at the contents of Google Drive:

> rclone ls gd:/

If rclone loses authorization:

> rclone authorization

List only directories:

> rclone lsf -dirs-only google:/

Mount the remote location on /tmp/google with:

> rclone mount google /tmp/google

Copy the contents of 'foo' to 'test'.

> rclone copy foo/ google:test

Sync contents of foo and test with a progress bar (will delete Google items):

> rclone sync foo google:test -P

Remove all duplicates

> rclone dedupe google:test

Delete contets of a remote file:

> rclone delete n:test

Or delete the folder and contents as well:

> rclone purge n:test

Copy to and from with:

> rclone copyto google:test foo

or

> rclone copyto foo google:test
