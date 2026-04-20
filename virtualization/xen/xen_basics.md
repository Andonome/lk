---
title: Xen Volume Management
tags: 
- xe
- virtualization
- volume
---
# Make a local iso repository


```sh
STORE_PATH=/var/opt/xen/ISO_Store
```

```sh
mkdir -p $STORE_PATH
```

```sh
xe sr-create name-label="$STORAGE_NAME" type=iso device-config:location=$STORE_PATH device-config:legacy_mode=true content-type=iso
```

This creates a UUID for the new directory:

> e94e25bb-bcdc-801b-b62a-b51b686a3bdc

# Main Console

```sh
xsconsole
```

# Volumes

List volumes:

```sh
lvs
```

List groups:

```sh
vgs
```

