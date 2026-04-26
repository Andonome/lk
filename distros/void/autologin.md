---
title: Void Autologin
tags: 
- void
- autologin
---

The virtual terminals are run as services.
Make a new service by making symbolic links to the generic one.

```sh
login=agetty-autologin
sudo cp -rs /etc/sv/agetty-generic/ /etc/sv/${login}/

```

Copy the configuration file for the `agetty-tty1` service, and add the `--autologin` argument.

```sh
sed "s/--noclear/--autologin ${USER} &/" /etc/sv/agetty-tty1/conf | sudo tee /etc/sv/${login}/conf

```

It should look like this:


```
if [ -x /sbin/agetty -o -x /bin/agetty ]; then
	# util-linux specific settings
	if [ "${tty}" = "tty1" ]; then
		GETTY_ARGS="--autologin ${your_username} --noclear"
	fi
fi
```

If you see the actual variable `${USER}` then you probably used the wrong quotes.

Disable the `tty1` service (because the login takes its place).


```sh
sudo touch /etc/sv/agetty-tty1/down
```

Enable your `${login}` service:


```sh
sudo ln -s /etc/sv/${login} /var/service/
```

Reboot.

Pizza party for one.
