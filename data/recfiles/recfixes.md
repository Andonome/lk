---
title: "Recfixes"
tags: [ "data", "recfiles" ]
requires: [ "recfiles" ]
---

Sometimes `recsel` chokes on a large query, and you need to break the query into chunks with a pipe.

This Kickstarter file has 374,853 records.
Here's the chonky query:

```sh
recsel kick.rec -e "Category = 'Games'" -p "Subcategory,Avg(Goal)" -G Subcategory
```

It breaks down like this:

| Chunk                         | Meaning                                       |
|:-----------------------------:|:---------------------------------------------:|
| `recsel kick.rec`             | Select records from `kick.rec`                |
| `-e "Category = 'Games'"`     | Select only records where Category = 'Games'  |
| `-p "Subcategory,Avg(Goal)"`  | Print the Subcategory and average goal        |
| `-G "Subcategory"`            | Group by subcategory                          |

Two ways to break the query apart:

```sh
recsel kick.rec -e "Category = 'Games'" | recsel -p "Subcategory,Avg(Goal)" -G "Subcategory"

recsel kick.rec -e "Category = 'Games'" > games.rec
recsel games.rec -p "Subcategory" -G "Subcategory"
```

