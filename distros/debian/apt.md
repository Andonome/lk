---
title: "apt"
tags: [ "distros" ]
---
## apt

### Configurations?

Messed up a package's configuration files?

```bash
sudo apt-get purge [thing]
```

```bash
sudo apt autoremove 
```

Check if you still have related things:

```bash
apt search [thing]
```

```bash
sudo apt-get install [ thing ]
```

Still have problems?

```bash
sudo dpgk --force-confmiss -i /var/cache/apt/archives/[thing]
```

