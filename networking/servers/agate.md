---
title: "agate"
tags: [ "Documentation", "networking" ]
---
Make sure your dns is in order.
My domain name is `belgradecats.tk`, so put your own in there.

Install agate by placing the binary somewhere or (on Arch):

> yay -S agate

---

> sudo mkdir -p /usr/share/gemini/{certs,gemini}

> sudo useradd gemini -d /usr/share/gemini

> sudo chown -R gemini:gemini /usr/share/gemini

> sudo su gemini

> cd

> echo 'Hello Gemworld!' > gemini/index.gmi

Make a service file.

> sudo vim /etc/systemd/system/multi-user.target.wants/agate.service


```
[Unit]
Description=agate
After=network.target

[Service]
User=gemini
Type=simple
ExecStart=/usr/bin/agate -s --content /usr/share/gemini/gemini --key /usr/share/gemini/certs/key.pem --cert /usr/share/gemini/certs/cert.pem --hostname belgradecats.tk --lang en-GB

[Install]
WantedBy=default.target

```

> sudo systemctl daemon-reload

> sudo systemctl enable --now agate

