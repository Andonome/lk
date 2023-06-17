---
title: "fonts"
tags: [ "Documentation", "distros" ]
---
# Basics

Update font-cache:

```bash
fc-cache
```

List fonts:

```bash
fc-list
```

Grab the part of the font name you need for Xresources:

```bash
fc-list | cut -d: -f2
```

Add field 3 for styles.
