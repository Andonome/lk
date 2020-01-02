# Bridged adapters

Virtual machines can use a bridge to connect to the internet.  Access the manual with 

> man brctl

You can add a new bridge with:

> brctl addbr <name>

... and delete a bridge by pulling it down, then

> brctl delbr <name>

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

