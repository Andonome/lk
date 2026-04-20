---
title: "Ansible with Docker"
tags: [ "system", "ansible", "docker" ]
requires: [ "docker", "ansible" ]
---

'Docker module', you say?
No need for that fancy stuff.
We're just going to set up a couple of docker containers and connect to them like any other machine.

Set up two containers: `deb` and `arch`, add them to an `ansible` hosts file, then do a 'ping' to see if they respond.

## Required Packages

- `ansible`
- `jq`
- `docker`

## Debian Container

```sh
docker run -di --rm --name deb --hostname deb debian
docker exec -it deb sh -c 'apt update && apt -y install openssh-server python3 sudo'
```

Generate the host's ssh keys, then start the ssh daemon:

```sh
docker exec -it deb sh -c 'ssh-keygen -A'
docker exec -d deb /usr/sbin/sshd -D
```

## Arch Linux Container

```sh
docker run -di --rm --name arch --hostname arch archlinux
docker exec -it arch sh -c 'pacman -Syu --noconfirm python sudo openssh'
docker exec -it arch sh -c 'ssh-keygen -A'
docker exec -d arch /usr/sbin/sshd -D
```

## `ssh` Keys

Copy across your public ssh key to the container's `authorized_keys` file:

```sh
pubkey=~/.ssh/id_rsa.pub
for hostname in arch deb; do
    docker cp $pubkey $hostname:/root/.ssh/authorized_keys
    docker exec -it $hostname sh -c "chown -R root:root /root/.ssh/"
    docker exec -it $hostname sh -c "chmod -R 700 /root/.ssh/"
done
```

## Hosts File

Find name of containers' IPv4 addresses.

```sh
docker network inspect bridge
```

The output is awful.
Use `jq` to parse the `json`:

```sh
docker network inspect bridge  | jq -r '.[].Containers | .[].IPv4Address'
```

Now put those into a host file:

```sh
docker_hosts=hosts.txt
echo '[containers]' > $docker_hosts

docker network inspect bridge  | \
    jq -r '.[].Containers | .[] | "root@" + .IPv4Address' | \
    cut -d/ -f1 >> $docker_hosts
```

You may need to add those host keys to your known hosts file.
Either connect interactively, or (for scripts):

```sh
hosts="$(docker network inspect bridge  | jq -r '.[].Containers | .[] | .Name + " " + .IPv4Address' | \
    cut -d/ -f1)"

echo "$hosts"

echo "$hosts" | while read hostname ip; do
    printf "%s" "$ip"
    key="$(docker exec $hostname cat /etc/ssh/ssh_host_ed25519_key.pub)"
    echo "$ip $key" >> ~/.ssh/known_hosts
done
```

Check if they ping:

```sh
ansible -i $docker_hosts all -m ping
```

This command produces an irritating warning about the python interpreter (i.e., `python3`).

Make the warning shut-up:

```sh
echo '
[containers:vars]
ansible_python_interpreter=/usr/bin/python3.13' >> $docker_hosts
```

Now the ping is cleaner:

```sh
ansible -i $docker_hosts all -m ping
```

