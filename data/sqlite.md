---
title: "sqlite"
tags: [ "data" ]
---

Work with a database:

```sh
sqlite3 "$FILE".sqlite3
```
Compress the database:

```sqlite
pragma vacuum;
```
Optimize the database:

```sqlite
pragma optimize;
```

