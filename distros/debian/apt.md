---
title: "apt troubleshooting"
tags: [ "debian" ]
---

Messed up a package's configuration files?

```sh
sudo apt-get purge ${package}
```

```sh
sudo apt autoremove 
```

Check if you still have related things:

```sh
apt search ${package}
```

```sh
sudo apt-get install ${package}
```

Still have problems?

```sh
sudo dpgk --force-confmiss -i /var/cache/apt/archives/${package}
```

