-
title: Making Services
tags: 
- systemd
---

A service can consist of two files - the script to run (usually a shell
script), and the `.service` file which describes when it runs.

The service file goes into the memorably-named directory `/usr/lib/systemd/system/`, where `systemd` will not notice your new service file.
Try not to confuse this with `/usr/share/systemd/` or `/var/lib/systemd/`, but *do*

To make a formal introduction between `systemd` and your service file, reload the daemon and check the list of units.

```sh
sudo systemctl daemon-reload
sudo systemctl list-units | grep ${service}
```

Once you enable the service, `systemd` makes a symbolic link from `/usr/lib/systemd/system/` to `/etc/systemd/system/`.

# Example - tracker.service

```
[Unit]
Description=Tracker

[Service]
Type=simple
ExecStart=/path/to/script

[Install]
WantedBy=multi-user.target
```

## Types

* `simple` - the service runs forever.  Other services do not stop it.
* `oneshot` - the service executes once, then stops.

