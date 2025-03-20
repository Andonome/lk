---
title: "Mapping the Net"
tags: [ "networking", "graph", "fun" ]
---

Find the path to a domain:

```sh
domain=bad.horse
max_hops=50

tracepath -m $maximum_hops $domain
```

If you're on Debian, you can use `graph-easy` and `dothost` to make an instant diagram:

```sh
domain=dice.camp
dothost $domain | graph-easy --boxart
```
