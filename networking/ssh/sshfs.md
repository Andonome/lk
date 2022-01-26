---
title: "sshfs"
tags: [ "Documentation", "Networking" ]
---
# Mount 

> sshfs alfred@192.168.0.14:Sync/Alfred

Various flags:

- Encryption: -C
- Map between local and remote user UIDs: -o idmap-user

# Unmount

> fusermount3 -u Sync/Alfred

