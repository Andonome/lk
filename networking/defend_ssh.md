---
title: Block Automatic SSH Attacks
tags: 
- networking
- system
- Setup
- ssh
- security
requires: 
- networking/ssh.md
---

Install `fail2ban`.

Copy a jail configuration file to make your SSH jail.[^1]

[^1]: Check out `man jail.conf` for more info.

```sh
sudo fail2ban-client status
cd /etc/fail2ban/
less jail.conf
cat << EOF > jail.d/ssh.local
[sshd]
enabled = true

ignoreip = 127.0.0.1/8 ::1,192.168.0.0/16 ::1
EOF

sudo systemctl enable --now fail2ban
sudo fail2ban-client status
```

Check the status:

```sh
sudo fail2ban-client status
```

Watch attacks live:

```sh
fail2ban-client status sshd
```


