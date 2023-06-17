---
title: "wpa_supplicant"
tags: [ "Documentation", "Networking" ]
---

wpa_supplicant configurations are stored in /etc/wpa_supplicant/wpa_supplicant-wlan0 (or equivalent).

## WiFi Connection

```bash
wpa_cli
```

Once in, scan the network, add an empty place to store credentials, then input them.

```bash
scan
```

```bash
scan_results
```

```bash
add_network
```

This outputs a network number, e.g. '3'.  This is the new network you'll work with.

```bash
set_network *3* ssid *"Kosachok Cafe"*
```

```bash
set_network 3 psk *"Kosachok2019"*
```

OR (for no password)

```bash
set_network *3* key_mgmt NONE
```

```bash
enable_network 3
```

```bash
save_config
```

This takes a while to connect, so to speed things up, restart the service:

```bash
sudo sv restart wpa_supplicant
```

# Scripts

You can script like this:

```bash
wpa_cli add_network
```

That returns an ID, so you can say:

```bash
newNetwork="$(wpa_cli add_network)"
```

Then `$newNetwork` would equal that number, and you can add/ remove networks with scripts.

But remember to escape the quotes, so adding a network would be:

```bash
wpa_cli set_network *3* psk *\""passphrase"\"*
```

## Generating Keys Manually

```bash
wpa_passphrase [ssid] [password]
```

For example:

```bash
wpa_passphrase 'Cafe Kosachok' 'Kosachok2019'
```

This then spills the relevant psk and such to be entered into the wpa_supplicant configuration file.

If you encounter problems, you will probably need to delete the old device pid in (e.g.) /run/wlan0/

Next up, start wpa_supplicant:

```bash
wpa_supplicant -B -iwlan0 -c /etc/wpa_supplicant/wpa_supplicant-wlan0
```

The -B flag runs this as a background process.  Remove this to see real-time output in order to solve problems.  The -i flag denotes the physical device used for the wifi.  The -c flag points to the configuration file for use.
