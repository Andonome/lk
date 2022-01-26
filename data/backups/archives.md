---
title: "archives"
tags: [ "Documentation", "backups" ]
---
# GPG Archives

Create an encrypted archive with `gpg`:

> tar czvpf - file1.txt file2.pdf file3.jpg | gpg --symmetric --cipher-algo aes256 -o myarchive.tar.gz.gpg

And extract it with `gpg`:

> gpg -d myarchive.tar.gz.gpg | tar xzvf -

# 7zip

Make archive:

> 7za a -tzip -pPASSWORD -mem=AES256 archive.zip file1 file2

Note that people can still see every filename in your archive, and can change those files.

Unzip:

> 7za e archive.zip

