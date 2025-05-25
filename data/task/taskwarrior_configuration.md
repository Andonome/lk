---
title: "Taskwarrior Configuration"
tags: [ "data", "task" ]
requires: [ "Taskwarrior" ]
---

Show your current config:


```sh
task show
```

Use machine-readable output to make a config file with all configuration keys shown, then make it your configuration file.

```sh
task _show > ${file}
mv ${file} ~/.config/task/taskrc
```

