---
title: "task"
tags: [ "organization" ]
---

Set up the configuration file:

```sh
task
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
task add pro:house.paint buy red paint
task add pro:house.paint buy black paint
task add pro:house.paint buy brushes
```

## Summary

```sh
task pro:house sum
```

```sh
task burndown.daily pro:house
```

The summaries will show how fast a project is being completed, and when you can expect it to finish at the present rate.

# Tags

```sh
task add +buy toothbrush
```

You can then see only tasks which involve buying something with:

```sh
task +buy
```

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

# Review

View list of tasks completed in the last week:

```sh
task end.after:today-1wk completed
```

# User Defined Attributes

Make a UDA 'size'.

```sh
task config uda.size.type string
```

```sh
task config uda.size.label Size
```

```sh
task config uda.size.values large,medium,small
```

```sh
uda.size.default=medium
```

# Tricks

This command shows tasks I'm most interested in:

```sh
task next +ACTIVE or +OVERDUE or due:today or scheduled:today or pri:H
```

The command is long, so `alias` is your friend.

