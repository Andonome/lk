---
title: "khard"
tags: [ "Documentation", "data" ]
---
Get the basic config:

> mkdir ~/.config/khard

> cp /usr/share/doc/khard/examples/khard/khard.conf.example ~/.config/khard.conf

Short list

> khard list

Longer list

> khard show

Show from addressbook 'work'

> khard list -a work

Make a new contact in address book 'family'

> khard new -a family

> khard edit grampa

> khard remove bob

Move contact 'nina' from 'work' to 'home' address book.

> khard move -a home nina -A work

## Advanced

Merge:

> khard merge [-a source_abook] [-u uid|search terms [search terms ...]] [-A target_abook] [-U target_uid|-t target_search_terms]

