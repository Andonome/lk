---
title: "XCP-ng Automation"
tags: [ "documentation", "virtualization", "xen" ]
---
# Basic VM Management

```bash
xe vm-list
```

Start, stop, et c. with `xe`:

```bash
xe vm-start vm=$TARGET_VM
```

```bash
xe vm-shutdown vm=$TARGET_VM
```

Destruction requires the uuid.

```bash
xe vm-destroy uuid=$TARGET_UUID
```

Autocompletion works well with all of these commands.

# Shut Down VM

List VMs.

```bash
xe host-list
```

```bash
xe vm-list resident-on=$HOST_UUID
```

```bash
xe vm-shutdown uuid=TARGET_VM force=true
```

If this doesn't work, try:

```bash
xe vm-reset-powerstate uuid=TARGET_VM force=true
```

Get the id:

```bash
list_domains
```

And destroy the domain:

```bash
/opt/xensource/debug/xenops destroy_domain -domid $DOM_ID
```

# Problem Solving

> Error: `Internal error:xenopsd internal error: Storage_interface.Illegal_transition` in XenServer

After a failed “Move VM”, “Copy VM”, or “Export VM” operation, the Virtual Machine (VM) being operated cannot start.

## Solution

To resolve this error, complete the following procedure:

Open the Console to the XenServer that is hosting the VM and run the following command:

```bash
list_domains
```

All the VMs running on that server are displayed.

Copy the UUID corresponding to id=0.

This is the UUID of the Control Domain. The Control Domain is a privileged Virtual Machine that handles all hyper calls received from running VMs to perform all virtual tasks.

Run the following command to obtain the UUID of the VBD (Virtual Block Device) object linking the Control Domain:

```bash
xe vbd-list vm-uuid=$CONTROL_DOMAIN_UUID
```

Run the following commands to unplug and destroy the VBD:

```bash
xe vbd-unplug uuid=$VBD_UUID
```

```bash
xe vbd-destroy uuid=$VBD_UUID
```

# Make a local iso repository

```bash
xe sr-create name-label=LocalISO type=iso device-config:location=/var/opt/xen/ISO_Store device-config:legacy_mode=true content-type=iso
```

This creates a UUID for the new directory, e.g.:

> e94e25bb-bcdc-801b-b62a-b51b686a3bdc

# Import

```bash
xe vm-import filename="$FILENAME".xva
```

# USB

## Attach

Put in the USB.

Get the USB's uuid.

```bash
xe pusb-list
```

Make the USB recognised as a device.

```bash
xe pusb-param-set uuid=*<uuid>*
```

For passthrough, use this:

```bash
xe pusb-param-set uuid=*<uuid>* passthrough-enabled=true
```

## Attach to host

(requires reboot of guest)

[link](https://github.com/xcp-ng/xcp/wiki/USB-Pass-Through)

# Storage Spaces - "SR"

```bash
xe sr-list
```

# Exporting and Exporting VMs

```bash
xe vm-export vm=$VM_NAME filename="$FULL_PATH".xva
```

```bash
xe vm-import vm=*<Name>* filename="$FULL_PATH".xva
```

