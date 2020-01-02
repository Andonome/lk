
# vkpurge

Old Void kernels are left on the boot partition.  List them with:

> vkpurge list

Remove one with:

> vkpurge 2.8.2_4

Remove all but the latest with:

> vkpurge rm all

# Troubleshooting

Filled up your /boot?  Try reconfiguring and installing the latest:

> xbps-reconfigure -f linux5.2
