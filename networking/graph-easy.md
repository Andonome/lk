---
title: "graph-easy"
tags: [ "Documentation" ]
---
Set up a file like this, called `troubleshooting.txt`.

```
[ Is there an IP address? ] -- no --> [ Check NIC driver, dmesg ]

[ Is there an IP address? ] -- yes --> [ Can you ping the router? ]

[ Can you ping the router? ] -- no --> [ Check cables, router, and switches ]

[ Can you ping the router? ] -- yes --> [ Can you ping a DNS address? ]

[ Can you ping a DNS address? ] -- no --> [ Trying pinging 8.8.8.8 ]

[ Can you ping a DNS address? ] -- yes --> [ Traceroute ]

```
Then translate it with:

> graph-easy troubleshooting.txt --as boxart

```

┌────────────┐     ┌─────────────────────────┐  yes   ┌────────────────────────────────────┐  yes   ┌─────────────────────────────┐  yes   ┌────────────┐
│ no Network │ ──> │ Is there an IP address? │ ─────> │      Can you ping the router?      │ ─────> │ Can you ping a DNS address? │ ─────> │ Traceroute │
└────────────┘     └─────────────────────────┘        └────────────────────────────────────┘        └─────────────────────────────┘        └────────────┘
                     │                                  │                                             │
                     │ no                               │ no                                          │ no
                     ∨                                  ∨                                             ∨
                   ┌─────────────────────────┐        ┌────────────────────────────────────┐        ┌─────────────────────────────┐
                   │ Check NIC driver, dmesg │        │ Check cables, router, and switches │        │   Trying pinging 8.8.8.8    │
                   └─────────────────────────┘        └────────────────────────────────────┘        └─────────────────────────────┘
```
Many options allow different displays.
Try placing this in a file:

```
[ One ] { fill: seagreen; color: white; } -- label --> [ Two ] { shape: triangle; }
[ One ] => { arrow-style: closed; } [ Three ]
[ Five ] { fill: maroon; color: yellow; } <=> [ Three ]
[ One ] .. Test\n label ..> [ Four ]
[ Three ] { border-style: dashed; }
.. Test\n label ..> { arrow-style: closed; } [ Six ] { label: Sixty\n Six\nand\nsix; }
[ Three ] <-- Test label --> { arrow-style: closed; } [ Six ]
[ Eight ] .. [ None ] { shape: none; fill: red; color: brown; }
[ no Network ] --> [ Is there an IP address? ]
```
