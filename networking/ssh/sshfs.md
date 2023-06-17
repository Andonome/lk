---
title: "sshfs"
tags: [ "Documentation", "Networking" ]
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

