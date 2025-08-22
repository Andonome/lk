---
title: "Making Services"
tags: [ "systemd" ]
---
# Basics

A service can consist of two files - the .sh script to run, and the .service file which describes its run conditions.

The .service file goes in /etc/systemd/system.  The scripts themselves might be best placed in $HOME/.local/bin.

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

After making the new service, systemd requires reloading:

```sh
sudo systemctl daemon-reload
```

# Types

* simple - the service cannot be called on by others.  It runs on repeat.
* oneshot - the service executes once, then stops.

