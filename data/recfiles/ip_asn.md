---
title: IP Addresses with Recfiles
tags: 
- data
- recfiles
- games
requires: recfiles
---

## Download the Database

Download the csv data, and separate the ipv4 data from the ipv6.

```sh
curl -Lo ips.zip 'https://www.kaggle.com/api/v1/datasets/download/ipinfo/ipinfo-country-asn'
unzip -p ips.zip country_asn.csv | csv2rec | recsel -e "start_ip ~ '\.'"  > ipv4.rec
unzip -p ips.zip country_asn.csv | csv2rec | recsel -e "start_ip ~ '::'"  > ipv6.rec
```

