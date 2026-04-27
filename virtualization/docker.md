---
title: Setup Docker
tags: 
- documentation
- setup
- containers
requires: 
- system/groups.md
---

Install docker, add your user to the docker group, and start the service.

```sh
sudo pacman -S docker
sudo usermod -aG docker $USER
sudo su $USER
sudo systemctl start docker
```

You need to either log out and back in again to be in the docker group, or run everything as root.

```sh
docker info | less -Ri
```

This should show you things are working.

Search for a distro you want

```sh
docker search debian
```

If you get a hit, pull it.

```sh
docker pull debian
```

Then run a live image:

```sh
docker run -it debian
```

# Delete

Check currently running containers with

```sh
docker ps
```

Check all containers with

```sh
docker ps -a
```

Now we can get a list of all containers.

To delete one, take the id, e.g. '97796727e883', and run:

```sh
docker rm 97796727e883
```

# Networking

Get a list of docker container IPs

```sh
docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' ${name}
```

