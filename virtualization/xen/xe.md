---
title: "XCP-ng Automation"
tags: [ "documentation", "virtualization", "xen" ]
---
# Basic VM Management

```sh
xe vm-list
```

Start, stop, et c. with `xe`:

```sh
xe vm-start vm=$TARGET_VM
```

```sh
xe vm-shutdown vm=$TARGET_VM
```

Destruction requires the uuid.

```sh
xe vm-destroy uuid=$TARGET_UUID
```

Autocompletion works well with all of these commands.

# Shut Down VM

List VMs.

```sh
xe host-list
```

```sh
xe vm-list resident-on=$HOST_UUID
```

```sh
xe vm-shutdown uuid=TARGET_VM force=true
```

If this doesn't work, try:

```sh
xe vm-reset-powerstate uuid=TARGET_VM force=true
```

Get the id:

```sh
list_domains
```

And destroy the domain:

```sh
/opt/xensource/debug/xenops destroy_domain -domid $DOM_ID
```

# Problem Solving

> Error: `Internal error:xenopsd internal error: Storage_interface.Illegal_transition` in XenServer

After a failed “Move VM”, “Copy VM”, or “Export VM” operation, the Virtual Machine (VM) being operated cannot start.

## Solution

To resolve this error, complete the following procedure:

Open the Console to the XenServer that is hosting the VM and run the following command:

```sh
list_domains
```

All the VMs running on that server are displayed.

Copy the UUID corresponding to id=0.

This is the UUID of the Control Domain. The Control Domain is a privileged Virtual Machine that handles all hyper calls received from running VMs to perform all virtual tasks.

Run the following command to obtain the UUID of the VBD (Virtual Block Device) object linking the Control Domain:

```sh
xe vbd-list vm-uuid=$CONTROL_DOMAIN_UUID
```

Run the following commands to unplug and destroy the VBD:

```sh
xe vbd-unplug uuid=$VBD_UUID
```

```sh
xe vbd-destroy uuid=$VBD_UUID
```

# Make a local iso repository

```sh
xe sr-create name-label=LocalISO type=iso device-config:location=/var/opt/xen/ISO_Store device-config:legacy_mode=true content-type=iso
```

This creates a UUID for the new directory, e.g.:

> e94e25bb-bcdc-801b-b62a-b51b686a3bdc

# Import

```sh
xe vm-import filename="$FILENAME".xva
```

# USB

## Attach

Put in the USB.

Get the USB's uuid.

```sh
xe pusb-list
```

Make the USB recognised as a device.

```sh
xe pusb-param-set uuid=*<uuid>*
```

For passthrough, use this:

```sh
xe pusb-param-set uuid=*<uuid>* passthrough-enabled=true
```

## Attach to host

(requires reboot of guest)

[link](https://github.com/xcp-ng/xcp/wiki/USB-Pass-Through)

# Storage Spaces - "SR"

```sh
xe sr-list
```

# Exporting and Exporting VMs

```sh
xe vm-export vm=$VM_NAME filename="$FULL_PATH".xva
```

```sh
xe vm-import vm=*<Name>* filename="$FULL_PATH".xva
```

