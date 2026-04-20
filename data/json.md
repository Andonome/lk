---
title: ijq
tags: 
- data
- json
- TUI
---

Analyse `json` easier with `ijq`.

```sh
column -J -ts: -H PW,GID,shell -N User,PW,UID,GID,Description,Home,shell /etc/passwd > host.json
ijq !$
```

If you get stuck, try adding `.[]`.
