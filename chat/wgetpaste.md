---
title: "wgetpaste"
tags: [ "Chat" ]
---

See available pastebins:

```bash
wgetpaste -S
```

Upload script.sh to bpaste:

```bash
wgetpaste -s bpaste script.sh
```

Input clipboard to dpaste with the heading "Title"

```bash
wgetpaste -s dpaste -d Title -x
```

Paste in the file then load the result to the right-hand clipboard:

```bash
wgetpaste -s dpaste -X
```

