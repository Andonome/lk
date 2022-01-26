---
title: "wgetpaste"
tags: [ "Documentation", "Chat" ]
---

See available pastebins:

> wgetpaste -S

Upload script.sh to bpaste:

> wgetpaste -s bpaste script.sh

Input clipboard to dpaste with the heading "Title"

> wgetpaste -s dpaste -d Title -x

Paste in the file then load the result to the right-hand clipboard:

> wgetpaste -s dpaste -X

