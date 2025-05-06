---
title: "Interactive String Substitution"
tags: [ "data", "vim", "substitution" ]
---

Want to find and replace, but also confirm each instance?

```sh
vim -c "%s/${pattern}/${replacement}/gc" -c 'wq' ${file}
```

Notice that double-quotes (`"`) in the first command (`-c`).

Alternatively, check with an example string:


```sh
sed "s/${pattern}/ARGLEBARGLE/g" ${file} | grep 'ARGLEBARGLE'
```
