---
title: "systemd"
tags: [ "systemd" ]
---
```sh
systemctl list-units
```

```sh
sudo systemctl status mpd
```

```sh
sudo systemctl daemon-reload
```

```sh
sudo systemctl taskd.service start
```

```sh
sudo systemctl status taskd.service
```

# Startup

```sh
sudo systemd-analyze
```

```sh
sudo systemd-analyze blame
```

