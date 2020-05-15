
# Make a local iso repository

> mkdir -p /var/opt/xen/ISO_Store

> xe sr-create name-label=LocalISO type=iso device-config:location=/var/opt/xen/ISO_Store device-config:legacy_mode=true content-type=iso

This creates a UUID for the new directory:

`e94e25bb-bcdc-801b-b62a-b51b686a3bdc`

# Main Console

> xsconsole

# Volumes

List volumes:

> lvs

List groups:

> vgs


