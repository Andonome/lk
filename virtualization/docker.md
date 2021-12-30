
> sudo pacman -S docker

> sudo usermod -aG docker $USER

> sudo systemctl start docker

You need to either log out and back in again to be in the docker group, or run everything as root.

> # docker info

This should show you things are working.

Search for a distro you want

> docker search debian

If you get a hit, pull it.

> docker pull debian

Then run a live image:

> docker run -it debian

# Delete

Check currently running containers with

> docker ps

Check all containers with

> docker ps -a

Now we can get a list of all containers.

To delete one, take the id, e.g. '97796727e883', and run:

> docker rm 97796727e883

# Networking

Get a list of docker container ips

> docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' *container_name_or_id*

