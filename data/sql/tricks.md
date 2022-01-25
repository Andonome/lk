---
title: "tricks"
tags: [ "Documentation", "data" ]
---

# Find data from any table

> pg_dump --data-only --inserts -U postgres your-db-name > a.tmp

> grep 'my string' a.tmp
