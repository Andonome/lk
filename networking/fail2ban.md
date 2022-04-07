---
title: "fail2ban"
tags: [ "Documentation", "Networking" ]
---
# SSH Daemon Jail

> sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.d/ssh.local

```
[sshd]
enabled = true

ignoreip = 127.0.0.1/8 ::1,192.168.0.0/16 ::1

```

> sudo systemctl restart fail2ban

> sudo fail2ban-client status

> sudo fail2ban-client status sshd



