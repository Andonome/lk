---
title: deduplicate
tags: 
- system
- deduplicate
- maintenance
- storage
---

`rdfind`: find duplicate files, then delete them, or turn them into links.

Ask if a directory has duplicates (`rdfind` will not delete anything):

```sh
rdfind $dir
$EDITOR results.txt
```

Replace the duplicated files with [hard links](system/hard_links.md).

```sh
rdfind -makehardlinks true $dir
```
