---
title: "Taskwarrior Contexts"
tags: [ "data", "task" ]
requires: [ "task" ]
---

# Contexts

Set three contexts by their tags:

```sh
task context define work +sa or +hr
```

```sh
task context define study +ed or +void or +rat
```

```sh
task context define home -sa -hr -ed -void -rat
```

Change to the first context.

```sh
task context work
```

Then stop.

```sh
task context none
```

