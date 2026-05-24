---
title: fail2ban for ssh
tags: 
- networking
- system
- Setup
requires: 
- networking/ssh.md
---
# SSH Daemon Jail

```sh
sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.d/ssh.local
```

```
[sshd]
enabled = true

ignoreip = 127.0.0.1/8 ::1,192.168.0.0/16 ::1

```

```sh
sudo systemctl restart fail2ban
```

```sh
sudo fail2ban-client status
```

```sh
sudo fail2ban-client status sshd
```



