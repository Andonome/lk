---
title: "wpa_supplicant"
tags: [ "Documentation", "networking" ]
---
# Intro

wpa_supplicant configurations are stored in /etc/wpa_supplicant/wpa_supplicant-wlan0 (or equivalent).

# Generating Keys Manually

> wpa_passphrase [ssid] [password]

For example:

> wpa_passphrase 'Cafe Kosachok' 'Kosachok2019'

This then spills the relevant psk and such to be entered into the wpa_supplicant configuration file.

If you encounter problems, you will probably need to delete the old device pid in (e.g.) /run/wlan0/

Next up, start wpa_supplicant:

> wpa_supplicant -B -iwlan0 -c /etc/wpa_supplicant/wpa_supplicant-wlan0

The -B flag runs this as a background process.  Remove this to see real-time output in order to solve problems.  The -i flag denotes the physical device used for the wifi.  The -c flag points to the configuration file for use.

# Automatic WiFi Connection

> wpa_cli

This has a number of commands to input.  In order:

> scan

> scan_results

> add_network

This outputs a network number, e.g. '3'.  This is the new network you'll work with.

> set_network 3 ssid "Kosachok Cafe"

> set_network 3 psk "Kosachok2019"

OR

> set_network 3 key_mgmt NONE

> enable_network 3

> save_config

... and possibly:

> sudo sv restart dhcpcd 

or maybe:

> dhcpd wlp3s0 


