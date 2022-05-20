---
title: "wifi"
tags: [ "Documentation", "void" ]
---
# wpa_supplicant

> scan

> scan_results

> add_network

> set_network 0 ssid "MYSSID"

> set_network 0 psk "passphrase"

OR > set_network 0 key_mgmt NONE

> enable_network 0

> save_config

might want to 'sudo sv restart dhcpcd'

## CLI

You can use all commands non-interactively, from the cli, e.g.:

> wpa_cli scan

> wpa_cli scan_results

But remember to escape the quotes, so adding a network would be:

> wpa_cli set_network 3 psk \""passphrase"\"

