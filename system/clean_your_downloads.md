---
title: Clean Your Downloads
tags: 
- system
- tmpfs
---

'Downloads` directory always too full of crap?
Make it a temporary filesystem!
Everything will be deleted whenever you reboot.


```sh
rm -rf ~/Downloads # Be brave!
mkdir Downloads
cp /etc/fstab /tmp/
echo "tmpfs $HOME/Downloads tmpfs defaults,size=1G 0 0" | sudo tee -a /etc/fstab
sudo systemctl daemon-reload # Ignore this if you don't use systemd
sudo mount -a
mount | tail -1
```

