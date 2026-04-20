---
title: "dns"
tags: [ "networking", "host" ]
---

| Record      |  Type               | Example                                |
|:-----------:|:--------------------|:---------------------------------------|
| A Record    | IPv4 Address        | "$domain".com                          |
| AAAA Record | IPv4 Address        | "$domain".com                          |
| CNAME       | Alternative Address | "$domain".rs, "$subdomain.$domain".com |
| NS          | Nameserver          | ns1.fastname.com                       |
| MX          | Email server        | "$domain".com                          |
| TXT         | Literally anything,including ownership of a domain |         |
|             |                     |                                        |

Query a host with the `host` command.

```sh
host $domain.$tld
```


```sh
host $domain.$tld 9.9.9.9
```

> dmz.rs has address 77.105.27.232
> dmz.rs mail is handled by 10 kralizec.dmz.rs.
> dmz.rs mail is handled by 20 splint.rs.

This shows the MX record has a secondary handler, called splint.rs.

You can also add a specific nameserver:

Request a specific record type (`CNAME`, `TXT`, et c.):

```sh
torsocks host -T -t $RECORD_TYPE $domain
```

## Troubleshooting

The `host` command uses UDP.
You can change to TCP by using `host -T`.
