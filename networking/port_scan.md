---
title: Port Scan
tags: 
- networking
repo: 'https://github.com/mrjackwills/havn/'
---

`havn` scans ports.
It's not in many repos, but if you can `cargo install havn`.


```sh
havn -h
havn -a
domain=splint.rs
havn -p 19-90 ${domain}
```

That last command doesn't work reliably, so increase the number of retries (`-r`), or decrease concurrent requests (`-c`).


```sh
havn -p 19-443 -r 6 ${domain}
havn -p 1-1000 -c 500 -r 5 ${domain}
```

