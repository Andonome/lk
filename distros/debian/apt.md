---
title: "apt"
tags: [ "distros" ]
---
## apt

### Configurations?

Messed up a package's configuration files?

```sh
sudo apt-get purge [thing]
```

```sh
sudo apt autoremove 
```

Check if you still have related things:

```sh
apt search [thing]
```

```sh
sudo apt-get install [ thing ]
```

Still have problems?

```sh
sudo dpgk --force-confmiss -i /var/cache/apt/archives/[thing]
```

