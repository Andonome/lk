---
title: "dns"
tags: [ "Documentation", "networking" ]
---
# Designate DNS

On Debian, a file might gain DNS services by adding the following to /etc/network/interfaces:

```

auto eth0
iface eth0 inet static 
   address 10.0.0.23
   netmast 255.255.255.0
   gateway 10.0.0.1
   dns-nameservers 208.67.222.222 208.67.220.220
   dns-search example.com

```

# URL Aliases

To change where hosts go, edit /etc/hostnames.  You can enter, e.g.:

`54.239.25.200 www.amazon.com a`

... which then means simply the letter 'a' will lead you to amazon.com.
