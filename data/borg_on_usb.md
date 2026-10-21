---
title: Borg on USB
tags: 
- backup
- maintance
requires:
- data/pass.md
- hardware/mount_disk.md
---

Mount the USB stick and create a password in `pass`.

```sh
usbpath=/mnt/usb
backup_directory="${usbpath}/borg"
```


```sh
export BORG_PASSCOMMAND="pass ${borgpass}"
```



```sh
targets='~/dl ~/img ~/pro' # Select directories to back up

borg init --encryption=repokey ${backup_directory}

borg create --filter AME --verbose --stats  \
${backup_directory}::'{hostname}-{now}' ${targets}

borg prune ${backup_directory} --list --glob-archives '{hostname}-*' \
--keep-daily 7 --keep-weekly 4 --keep-monthly 6

```

Your key is in `${backup_directory}/config`.

```sh
more ${backup_directory}/config
```

Check the backups:


```sh
borg list ${backup_directory}

```
