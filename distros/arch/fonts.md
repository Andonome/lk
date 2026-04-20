---
title: fonts
tags: 
- distros
---
# Basics

Update font-cache:

```sh
su root
fc-cache
```

List fonts:

```sh
fc-list
```

Grab the part of the font name you need for Xresources:

```sh
fc-list | cut -d: -f2
```

Add field 3 for styles.
