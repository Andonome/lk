---
title: "tor"
tags: [ "networking" ]
---

# Get a Hostname

 [onion hidden service guide](https://community.torproject.org/onion-services/setup/)

```sh
sudo vim /etc/tor/torrc
```

Uncomment the lines about `/var/lib/tor/hidden_services`, including port 22 (or whatever); restart tor, then go to that directory, and cat the hostname.


# SSH over tor

install package `torsocks`, and add it before `ssh` command, for easier use, add it to `.ssh/config`

`torsocks ssh user@{someonionhash}.onion`
