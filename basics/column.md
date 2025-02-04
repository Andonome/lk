---
title: "column"
tags: [ "basics", "format", "json" ]
---

Put output into column.

```bash
du -h /etc/* | column
```

Reformat file with an explicit separator (`-s`):

```bash
column -ts: /etc/passwd
```

Give columns names (`-N`), so you can hide some (`-H`):

```bash
column -ts: -N User,PW,UID,GID,Description,Home,shell -H PW,GID /etc/passwd
```

Reorder with `-O` (unspecified items remain):


```bash
column -ts: -N User,PW,UID,GID,Description,Home,shell -H PW,GID -O User,Description,shell /etc/passwd 
```

Output to json format with `-J`:

```bash
column -J -ts: -H PW,GID,shell -N User,PW,UID,GID,Description,Home,shell /etc/passwd
```

