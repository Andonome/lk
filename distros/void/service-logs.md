---
title: Service logs on Void
tags: 
- services
- logs
- void
requires:
- distros/void/sv.md
---


```sh
xbps-install socklog-void

ln -s /etc/sv/socklog-unix/ /var/service/
ln -s /etc/sv/nanoklogd/ /var/service/

sv start nanoklogd socklog-unix

```

Logs are stored in categories.

```sh
cd /var/log/socklog
ls
svlogtail messages
svlogtail kernel | grep audio
svlogtail daemon messages | grep audio
watch -d du *

```
