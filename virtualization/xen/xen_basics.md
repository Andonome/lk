---
title: "Xen Volume Management"
tags: [ "Documentation", "xe", "virtualization", "volume" ]
---
# Make a local iso repository

```bash
mkdir -p */var/opt/xen/ISO_Store*
```

```bash
xe sr-create name-label=*LocalISO* type=iso device-config:location=*/var/opt/xen/ISO_Store* device-config:legacy_mode=true content-type=iso
```

This creates a UUID for the new directory:

`e94e25bb-bcdc-801b-b62a-b51b686a3bdc`

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

