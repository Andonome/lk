---
title: "sshfs"
tags: [ "Documentation", "Networking" ]
requires: [ "ssh" ]
---
# Mount 

```bash
sshfs $USER@$IP_ADDRESS:$DIR
```

Various flags:

- Encryption: -C
- Map between local and remote user UIDs: -o idmap-user

# Unmount

```bash
fusermount3 -u $DIR
```

