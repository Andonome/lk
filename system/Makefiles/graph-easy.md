---
title: "Makefile Graphs"
tags: [ "system", "make", "graph" ]
---

If you have `graph-easy` (often in the package `perl-graph-easy` or similar), you can make a graph from the makefile with `make2graph` (the package is often called `makefile2graph`).

Start with the command to 'make all targets' (`-B`), and 'do a dummy run' (`-n`) with debug into (`-d`):

```bash
make -Bnd
make -Bnd | make2graph
make -Bnd | make2graph | graph-easy --boxart
```

