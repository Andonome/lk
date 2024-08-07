---
title: "deduplicate"
tags: [ "system", "deduplicate", "duplicates", "maintenance" ]
---

`rdfind`: find duplicate files, then delete them, or turn them into links.

Ask if a directory has duplicates (`rdfind` will not delete anything):

```bash
rdfind $dir
$EDITOR results.txt
```

Replace the duplicated files with [hard links](../basics/hard_links.md).

```bash
rdfind -makehardlinks true $dir
```
