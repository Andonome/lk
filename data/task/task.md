---
title: "Taskwarrior"
tags: [ "data", "organization" ]
---

Set up the configuration file:

```sh
task
```

Taskwarrior published a new feature to synchronize tasks others, but the feature was not ready.
The server's default installation instructions assume that users pay for hosting services.
All listed providers run proprietary software and actively support genocide.


To ignore the synchronization, tell the configuration file to use a local synchronization file.

```sh
task config sync.local.server_dir
task config data.location ~/.local/state/
```

Add a task:

```sh
task add update linux
```

See which task is next:

```sh
task next
```

Note the id number.

Mark a task as started:

```sh
task start 1
```

Once finished:

```sh
task 1 done
```

# Projects

Add a project:

```sh
task add project:house buy potted plant
task add proj:house.repair buy screwdriver
task add proj:house.repair buy shelf brackets
task add pro:house.paint buy white paint

for t in "buy red paint" "buy black paint" "buy brushes" ; do
  task add pro:house.paint $t
done
```

## Summary

```sh
task pro:house sum
task burndown.daily pro:house
```

The summaries will show how fast a project is being completed, and when you can expect it to finish at the present rate.

# Tags


```sh
task add +buy toothbrush
task +buy
```

# Review

View list of tasks completed in the last week:

```sh
task end.after:today-1wk completed
```

# User Defined Attributes

Define a new attribute for tasks called 'size'.
The 'user defined attribute' (UDA) needs a `type` and `label`.

```sh
task config uda.size.type string
task config uda.size.label Size
```
You can also ensure task tasks can only be `large`, `medium`, or `small`, then set a default.

```sh
task config uda.size.values large,medium,small
uda.size.default=medium
```

# Tricks

This command shows tasks I'm most interested in:

```sh
task next +ACTIVE or +OVERDUE or due:today or scheduled:today or pri:H
```

The command is long, so `alias` is your friend.

