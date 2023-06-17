---
title: "Docker"
tags: [ "documentation", "Virtualization" ]
---
```bash
sudo pacman -S docker
```

```bash
sudo usermod -aG docker $USER
```

```bash
sudo systemctl start docker
```

You need to either log out and back in again to be in the docker group, or run everything as root.

```bash
# docker info
```

This should show you things are working.

Search for a distro you want

```bash
docker search debian
```

If you get a hit, pull it.

```bash
docker pull debian
```

Then run a live image:

```bash
docker run -it debian
```

# Delete

Check currently running containers with

```bash
docker ps
```

Check all containers with

```bash
docker ps -a
```

Now we can get a list of all containers.

To delete one, take the id, e.g. '97796727e883', and run:

```bash
docker rm 97796727e883
```

# Networking

Get a list of docker container ips

```bash
docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' *container_name_or_id*
```

