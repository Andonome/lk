---
title: Mount a Windows Fileshare
tags: 
- networking
- windows
- share
requires:
- data/pass.md
---

# Share the Directory on Windows

1. Open File Explorer.
1. Right click on the directory you want to share.
1. Click 'Show more options'.
1. Click 'Give access to' -> 'Specific people...'
1. On the drop-down menu, find 'Everyone'.
1. (Optional) change 'Read' to 'Read/Write'.
1. Click 'Share'.

Check the IP address on Windows by opening CMD and running


```cmd
ipconfig
```

# Mount the Shared Windows Directory on Linux

Install `cifs-utils` and `smbclient`.

Add the windows password to [`pass`](data/pass.md), then check the output.


```sh
pass windows
```

Create a mount directory:


```bash
windir=/mnt/windows
sudo mkdir ${windir}
sudo chown $USER ${windir}
```

Specify the username and IP address, then mount that directory:

```bash
winuser=Alice
windows_ip=192.168.0.13

sudo mount -t cifs -o username=${winuser},uid=$UID,password="$(pass windows)" //${windows_ip}/Users ${windir}

ls ${windir}
```

Check it works, then unmount:


```bash
sudo fusermount3 -u ${windir}
```

## Alias

Make an alias for easy mounting and unmounting.

```bash
alias mwin='sudo mount -t cifs -o username=${winuser},uid=$UID,password="$(pass windows)" //${windows_ip}/Users ${windir}'
alias mwinrm='sudo fusermount3 -u ${windir}'
```
