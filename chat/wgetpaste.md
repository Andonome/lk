---
title: "wgetpaste"
tags: [ "Chat" ]
---

See available pastebins:

```sh
wgetpaste -S
```

Upload script.sh to bpaste:

```sh
wgetpaste -s bpaste script.sh
```

Input clipboard to dpaste with the heading "Title"

```sh
wgetpaste -s dpaste -d Title -x
```

Paste in the file then load the result to the right-hand clipboard:

```sh
wgetpaste -s dpaste -X
```

