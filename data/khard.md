---
title: "khard"
tags: [ "Data" ]
---
Get the basic config:

```sh
mkdir ~/.config/khard
```

```sh
cp /usr/share/doc/khard/examples/khard/khard.conf.example ~/.config/khard.conf
```

Short list

```sh
khard list
```

Longer list

```sh
khard show
```

Show from addressbook 'work'

```sh
khard list -a work
```

Make a new contact in address book 'family'

```sh
khard new -a family
```

```sh
khard edit grampa
```

```sh
khard remove bob
```

Move contact 'nina' from 'work' to 'home' address book.

```sh
khard move -a home nina -A work
```

