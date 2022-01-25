---
title: "apt"
tags: [ "Documentation", "distros" ]
---
## apt

### Configurations?

Messed up a package's configuration files?

> sudo apt-get purge [thing]

> sudo apt autoremove 

Check if you still have related things:

> apt search [thing]

> sudo apt-get install [ thing ]

Still have problems?

> sudo dpgk --force-confmiss -i /var/cache/apt/archives/[thing]

