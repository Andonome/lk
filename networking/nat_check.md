---
title: Check if NAT-blocked
tags: 
- networking
- nat
---

Trace the route to any domain name.

```sh
traceroute to splint.rs (89.216.117.22), 30 hops max, 60 byte packets
 1  _gateway (192.168.0.1)  0.265 ms  0.209 ms  0.193 ms
 2  100.64.0.1 (100.64.0.1)  56.974 ms  60.893 ms  60.911 ms
 3  172.31.254.2 (172.31.254.2)  61.795 ms  61.610 ms  70.443 ms
 4  172.31.254.2 (172.31.254.2)  69.929 ms  69.948 ms  71.265 ms
 5  bg-tp-m-0-be4-100.sbb.rs (89.216.12.0)  72.890 ms  73.268 ms *
 6  bg-ne-m-10-be3.sbb.rs (89.216.6.76)  78.474 ms  77.306 ms  77.821 ms
 7  * bg-tp-m-11-be1.sbb.rs (89.216.6.75)  35.022 ms bg-tp-m-12-be1.sbb.rs (89.216.6.77)  63.808 ms
 8  89.216.4.63 (89.216.4.63)  63.753 ms 89.216.4.61 (89.216.4.61)  65.546 ms  67.876 ms
 9  * * *
10  * * *
11  * * *
12  * * *
13  * * *
1
```

The first hop goes to a router (`192.`...).
The second hop looks like an internal address, so I'm going to double-check.

```sh
address=100.64.0.1
curl -s http://api.db-ip.com/v2/free/$address
    {
        "ipAddress": "100.64.0.1",
        "countryCode": "ZZ"
    }
```

That's not a real country code, so the second hop passes through something with an [internal address][internalIPs] after the router.
It looks like this connection has a [NAT layer][natIPs].

[internalIPs]: https://en.wikipedia.org/wiki/List_of_reserved_IP_addresses
[natIPs]: https://en.wikipedia.org/wiki/Carrier-grade_NAT
