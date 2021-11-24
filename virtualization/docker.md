
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

