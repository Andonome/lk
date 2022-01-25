---
title: "xe"
tags: [ "Documentation", "system" ]
---
# Basic VM Management

> xe vm-list

Start, stop, et c. all done with `xe`:

> xe vm-start vm=TTS

> xe vm-shutdown vm=Bob

Destruction requires the uuid.

> xe vm-destroy uuid=243b1165-14aa-37f6-496f-44879d05b3f2

# Shut Down VM

List VMs.

> xe host-list

> xe vm-list resident-on=<uuid_of_host>

> xe vm-shutdown uuid=<UUID from step 3> force=true

If this doesn't work, try:

> xe vm-reset-powerstate uuid=<UUID from step 3> force=true

Get the id:

> list_domains

And destroy the domain:

> /opt/xensource/debug/xenops destroy_domain -domid <DOMID from step 7>

# Error: `Internal error:xenopsd internal error: Storage_interface.Illegal_transition` in XenServer

## Symptoms or Error

After a failed “Move VM”, “Copy VM”, or “Export VM” operation, the Virtual Machine (VM) being operated cannot start. Following is the error message displayed:

`User-added image`

## Solution

To resolve this error, complete the following procedure:

Open the Console to the XenServer that is hosting the VM and run the following command:

> list_domains

All the VMs running on that server are displayed.

Copy the UUID corresponding to id=0.

This is the UUID of the Control Domain. The Control Domain is a privileged Virtual Machine that handles all hyper calls received from running VMs to perform all virtual tasks.

Run the following command to obtain the UUID of the VBD (Virtual Block Device) object linking the Control Domain:

> xe vbd-list vm-uuid=<uuid of the Control Domain>

Run the following commands to unplug and destroy the VBD:

> xe vbd-unplug uuid=<uuid of the vbd>

> xe vbd-destroy uuid=<uuid of the vbd>

## Make a local iso repository

> xe sr-create name-label=LocalISO type=iso device-config:location=/var/opt/xen/ISO_Store device-config:legacy_mode=true content-type=iso

This creates a UUID for the new directory:

`e94e25bb-bcdc-801b-b62a-b51b686a3bdc`

# Import

xe vm-import filename=/mnt/blah.xva

# USB

## Attach

Put in the USB.

Get the USB's uuid.

> xe pusb-list

Make the USB recognised as a device.

> xe pusb-param-set uuid=<uuid>

For passthrough, use this:

> xe pusb-param-set uuid=<uuid> passthrough-enabled=true

## Attach to host

(requires reboot of guest)

[link](https://github.com/xcp-ng/xcp/wiki/USB-Pass-Through)

# Storage Spaces - "SR"

> xe sr-list

# Exporting and Exporting VMs

> xe vm-export vm=<Name> filename=/full/path.xva

> xe vm-import vm=<Name> filename=/full/path.xva


