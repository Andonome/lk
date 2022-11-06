---
title: "wpa_supplicant"
tags: [ "Documentation", "Networking" ]
---

wpa_supplicant configurations are stored in /etc/wpa_supplicant/wpa_supplicant-wlan0 (or equivalent).

## WiFi Connection

> wpa_cli

Once in, scan the network, add an empty place to store credentials, then input them.

> scan

> scan_results

> add_network

This outputs a network number, e.g. '3'.  This is the new network you'll work with.

> set_network *3* ssid *"Kosachok Cafe"*

> set_network 3 psk *"Kosachok2019"*

OR (for no password)

> set_network *3* key_mgmt NONE

> enable_network 3

> save_config

This takes a while to connect, so to speed things up, restart the service:

> sudo sv restart wpa_supplicant

# Scripts

You can script like this:

> wpa_cli add_network

That returns an ID, so you can say:

> newNetwork="$(wpa_cli add_network)"

Then `$newNetwork` would equal that number, and you can add/ remove networks with scripts.

But remember to escape the quotes, so adding a network would be:

> wpa_cli set_network *3* psk *\""passphrase"\"*

## Generating Keys Manually

> wpa_passphrase [ssid] [password]

For example:

> wpa_passphrase 'Cafe Kosachok' 'Kosachok2019'

This then spills the relevant psk and such to be entered into the wpa_supplicant configuration file.

If you encounter problems, you will probably need to delete the old device pid in (e.g.) /run/wlan0/

Next up, start wpa_supplicant:

> wpa_supplicant -B -iwlan0 -c /etc/wpa_supplicant/wpa_supplicant-wlan0

The -B flag runs this as a background process.  Remove this to see real-time output in order to solve problems.  The -i flag denotes the physical device used for the wifi.  The -c flag points to the configuration file for use.
