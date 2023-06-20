---
title: "Xen Volume Management"
tags: [ "Documentation", "xe", "virtualization", "volume" ]
---
# Make a local iso repository


```bash
STORE_PATH=/var/opt/xen/ISO_Store
```

```bash
mkdir -p $STORE_PATH
```

```bash
xe sr-create name-label="$STORAGE_NAME" type=iso device-config:location=$STORE_PATH device-config:legacy_mode=true content-type=iso
```

This creates a UUID for the new directory:

> e94e25bb-bcdc-801b-b62a-b51b686a3bdc

# Main Console

```bash
xsconsole
```

# Volumes

List volumes:

```bash
lvs
```

List groups:

```bash
vgs
```

