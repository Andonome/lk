---
title: ssh
tags: 
- networking
---

# Basic `ssh`

Try out basic ssh by accessing `git.charm.sh`, without needing authentication:


```sh
ssh git.charm.sh
```

Start an ssh server to try it out.
The ssh server is sometimes in a package called `openssh`, and sometimes only in `openssh-server`.

Once it's installed, check it's working:

```sh
sudo systemctl status ssh
```

If that doesn't work, the service may be called `sshd`.

```sh
sudo systemctl status sshd
```

Then start that service:

```sh
sudo systemctl start sshd
```
Test it works by using ssh into your own system, from inside:


```sh
ssh ${user}@localhost
```

Access the computer from another computer on the same local network by finding your computer's IP address.


```sh
ip address | grep inet
```

Here is mine:


> inet 127.0.0.1/8 scope host lo
> 
> inet6 ::1/128 scope host noprefixroute
> 
> inet 192.168.0.12/24 brd 192.168.0.255 scope global dynamic noprefixroute en


The first one starts `127`, which means it returns back to that computer (like `localhost`).
The second is an ipv6 address, which is too angelic for this world, and has yet to descend.
The third will work from a remote computer.


```sh
ssh $USERNAME@IP_ADDRESS
```

Once you have that, generate some ssh keys:

```sh
ssh-keygen
```

Look at your keys:


```sh
ls ~/.ssh
```

You can share the one ending in `.pub` freely.
The other is secret.

Now send those keys to a remote computer:

```sh
ssh-copy-id ${username}@{ip_address}
```

Now you can log in without a password.
