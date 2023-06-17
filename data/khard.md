---
title: "khard"
tags: [ "Documentation", "Data" ]
---
Get the basic config:

```bash
mkdir ~/.config/khard
```

```bash
cp /usr/share/doc/khard/examples/khard/khard.conf.example ~/.config/khard.conf
```

Short list

```bash
khard list
```

Longer list

```bash
khard show
```

Show from addressbook 'work'

```bash
khard list -a work
```

Make a new contact in address book 'family'

```bash
khard new -a family
```

```bash
khard edit grampa
```

```bash
khard remove bob
```

Move contact 'nina' from 'work' to 'home' address book.

```bash
khard move -a home nina -A work
```

## Advanced

Merge:

```bash
khard merge [-a source_abook] [-u uid|search terms [search terms ...]] [-A target_abook] [-U target_uid|-t target_search_terms]
```

